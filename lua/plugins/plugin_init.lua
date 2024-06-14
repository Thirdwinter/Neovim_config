-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  { import = "plugins.Nvim_UI" },
  { import = "plugins.Astro_Default" },
  { import = "plugins.utils" },
}
--
-- 定义一个函数来加载目录下的所有模块
-- local function loadModulesFromDirectory(dir)
--     -- 获取目录下的所有文件
--     local files = {}
--     for file in io.popen('ls ' .. dir):lines() do
--         table.insert(files, file)
--     end

--     -- 加载每个文件作为模块
--     for _, file in ipairs(files) do
--         local moduleName = file:gsub("%.lua", "")  -- 移除.lua扩展名
--         local success, result = pcall(require, moduleName)
--         -- if success then
--             -- print("Loaded module: " .. moduleName)
--         -- else
--             -- print("Failed to load module: " .. moduleName)
--         -- end
--     end
-- end

-- -- 使用函数加载plugins目录下的所有模块
-- loadModulesFromDirectory("plugins")

