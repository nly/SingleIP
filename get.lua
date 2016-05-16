local conf = require "config"
local cjson = require "cjson"

local args = ngx.req.get_uri_args()

local ip_str = args.ip

if ip_str == nil or ip_str == "" then
    ngx.say(cjson.encode({
        code = 400,
        msg = "empty ip"
    }))
    ngx.exit(ngx.HTTP_OK)
end


local ip_table = conf.lua_string_split(",", ip_str);
local geodb = conf.geodb
local res = {}

for _, v in pairs(ip_table) do
    res[v] = geodb:search_ipv4(v)
end

ngx.say(cjson.encode({
    code = 200,
    msg = "ok",
    data = res
}))
