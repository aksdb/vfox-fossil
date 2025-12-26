local http = require("http")

-- map vfox OS / arch to Fossil file suffix
local FILE = {
    ["linux|amd64"]   = "fossil-linux-x64-%s.tar.gz",
    ["darwin|arm64"] = "fossil-mac-arm-%s.tar.gz",
    ["darwin|amd64"]  = "fossil-mac-x64-%s.tar.gz",
    ["windows|amd64"] = "fossil-w64-%s.zip",
    ["windows|x86"]   = "fossil-w32-%s.zip",
}

function PLUGIN:PreInstall(ctx)
    local version = ctx.version
    local key = RUNTIME.osType .. "|" .. RUNTIME.archType
    local name = FILE[key]
    if not name then
        error("no Fossil binary for " .. key)
    end
    name = string.format(name, version)

    local base = "https://fossil-scm.org/home/uv/" .. name
    return {
        version = version,
        url     = base,
    }
end
