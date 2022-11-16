local config_string = ngx.config.nginx_configure()

local _M = {}
_M.NGX_THREADS = config_string:find("--with-threads") ~= nil
_M.NGX_COMPAT = config_string:find("--with-compat") ~= nil
_M.NGX_HAVE_FILE_AIO = config_string:find("--with-file-aio") ~= nil
return _M