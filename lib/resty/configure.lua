local config_string = ngx.config.nginx_configure()

local function has_config(name)
    return config_string:find(name, 1, true) ~= nil
end

local _M = {}
_M.NGX_THREADS = has_config("--with-threads")
_M.NGX_COMPAT = has_config("--with-compat")
_M.NGX_HAVE_FILE_AIO = has_config("--with-file-aio")
if jit.os == 'Windows' then
else
    _M.NGX_HAVE_FD_CLOEXEC = true
    _M.HAVE_SOCKET_CLOEXEC_PATCH = true
end
_M.NGX_HAVE_KQUEUE = jit.os == 'OSX' or jit.os == 'BSD'
return _M
