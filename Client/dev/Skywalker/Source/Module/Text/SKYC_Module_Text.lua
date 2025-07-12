-------------------------------------------------------------------
---文件: Client\Skywalker\Module\Text\SKYC_Module_Text.lua
---作者: shyfan
---日期: 2025/06/16 10:15:23
---功能: Skywalker 客户端文本模块
-------------------------------------------------------------------
local skyModule = SKYC_Module
local logObject = Skywalker.Logger:GetLogObject("Module.Text")

local _DEBUG = Skywalker.DEBUG and true

---@class SKYC_Module_Text
local SKYC_Module_Text = {}

local emptyText = "文本不存在"

-- * 获取文本
---@param textID integer 文本ID
---@return string 文本内容
function SKYC_Module_Text:GetText(textID)
    local languageCfg = skyModule.config.allTables.TbCLanguage:GetData(textID)
    if languageCfg == nil then
        logObject:Error("找不到 " .. textID .. " 文本配置")
        return emptyText
    end

    -- TODO Shyfan 需要根据客户端语言设置返回对应的文本
    -- 目前直接返回默认文本
    return languageCfg.DefaultText
end

return SKYC_Module_Text
