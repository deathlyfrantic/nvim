local v = vim.api
local z = require("z")

local packager_initialized = false
local packages = {}
local lazy = {
  ft = {},
  on_cmd = {},
  on_map = {}
}

local function expand(path)
  return v.nvim_call_function("expand", {path})
end

local function isdirectory(path)
  return v.nvim_call_function("isdirectory", {path})
end

local function add_package(bang, path, opts)
  opts = opts or {}
  if bang == "!" then
    packager_initialized = false
  end
  local name = v.nvim_call_function("fnamemodify", {path, ":t"})
  if opts["for"] ~= nil then
    opts.type = "opt"
    for _, ft in pairs(z.to_array(opts["for"])) do
      if lazy.ft[ft] == nil then
        lazy.ft[ft] = {}
      end
      table.insert(lazy.ft[ft], name)
    end
  end
  if opts.on ~= nil then
    opts.type = "opt"
    for _, on in pairs(z.to_array(opts.on)) do
      if on:match("^<Plug>") ~= nil then
        lazy.on_map[on] = name
      else
        lazy.on_cmd[on] = name
      end
    end
  end
  table.insert(packages, {path, opts})
end

local function _pkg_cmd(cmd, name, bang, args)
  v.nvim_command("silent! delcommand " .. cmd)
  v.nvim_command("packadd " .. name)
  v.nvim_command(cmd .. bang .. " " .. args)
end

local function _pkg_map(map, name, visual)
  v.nvim_del_keymap("n", map)
  v.nvim_del_keymap("x", map)
  v.nvim_command("packadd " .. name)
  if visual then
    v.nvim_feedkeys("gv", "n")
  end
  v.nvim_feedkeys(v.nvim_replace_termcodes(map, true, false, true))
end

local function packager_init()
  if packager_initialized then
    return
  end
  packager_initialized = true
  v.nvim_command("packadd vim-packager")
  v.nvim_call_function("packager#init", {})
  for _, p in pairs(packages) do
    local name, opts = p[1], p[2]
    if next(opts) == nil then
      opts = {type = "start"}
    end
    local fn = "add"
    if isdirectory(expand(name)) then
      fn = "local"
    end
    v.nvim_call_function("packager#" .. fn, {name, opts})
  end
end

local function _from_viml_add_pkg(args)
  local bang, name, opts = args[1], args[2], {}
  if #args > 2 then
    if type(args[3]) ~= "table" then
      return v.nvim_err_writeln("Second argument must be a table.")
    else
      opts = args[3]
    end
  end
  return add_package(bang, name, opts)
end

local function _packager_cmd(fn)
  packager_init()
  v.nvim_call_function("packager#" .. fn, {})
end

local function init()
  v.nvim_command(
    [[command! -bang -nargs=+ Package call luaeval('require("packages")._from_viml_add_pkg(_A)', [<q-bang>, <args>])]]
  )
  for _, name in pairs({"clean", "install", "status", "update"}) do
    local cmd = "Pack" .. name:sub(1, 1):upper() .. name:sub(2)
    v.nvim_command(
      string.format(
        [[command! %s lua require("packages")._packager_cmd("%s")]],
        cmd,
        name
      )
    )
  end
  v.nvim_command("source $VIMHOME/packages.vim")
  v.nvim_command("augroup packager-filetypes")
  v.nvim_command("autocmd!")
  for ft, pkgs in pairs(lazy.ft) do
    for _, pkg in pairs(pkgs) do
      v.nvim_command("autocmd FileType " .. ft .. " ++once packadd" .. pkg)
    end
    v.nvim_command(
      "autocmd FileType " .. ft .. " ++once ++nested doautocmd FileType"
    )
  end
  v.nvim_command("augroup END")
  for cmd, pkg in pairs(lazy.on_cmd) do
    v.nvim_command(
      string.format(
        [[command! -bang -bar -nargs=* %s lua require("packages")._pkg_cmd("%s", "%s", <q-bang>, <q-args>)]],
        cmd,
        cmd,
        pkg
      )
    )
  end
  for map, pkg in pairs(lazy.on_map) do
    v.nvim_set_keymap(
      "n",
      map,
      string.format(
        [[:call luaeval('require("packages")._pkg_map("%s", "%s", false)')<CR>]],
        map,
        pkg
      ),
      {silent = true}
    )
    v.nvim_set_keymap(
      "x",
      map,
      string.format(
        [[:call luaeval('require("packages")._pkg_map("%s", "%s", true)')<CR>]],
        map,
        pkg
      ),
      {silent = true}
    )
  end
end

return {
  _from_viml_add_pkg = _from_viml_add_pkg,
  add_package = add_package,
  init = init,
  _pkg_cmd = _pkg_cmd,
  _pkg_map = _pkg_map,
  _packager_cmd = _packager_cmd
}