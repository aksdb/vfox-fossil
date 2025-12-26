function PLUGIN:Available(ctx)
    local http = require("http")

    -- scrape the official download page
    local resp, err = http.get({
      url = "https://fossil-scm.org/home/uv/download.js"
    })
    if not resp or resp.status_code ~= 200 then
        error("cannot fetch Fossil download page: " .. (err or "network"))
    end

    local versions = {}
    -- very small parser: grab every “Version X.Y” line
    for v in resp.body:gmatch("\"Version ([%d%.]+)") do
        -- keep only unique versions
        versions[v] = true
     end

    local result = {}
    for v in pairs(versions) do
        table.insert(result, { version = v })
    end
    table.sort(result, function(a, b) return a.version > b.version end)
    return result
end
