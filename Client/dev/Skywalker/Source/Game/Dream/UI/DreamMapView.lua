-------------------------------------------------------------------
---文件: Client\Skywalker\Game\Dream\UI\DreamMapView.lua
---作者: shyfan
---日期: 2025/06/27 11:29:13
---功能: 梦境地图视图
-------------------------------------------------------------------
local pairs = pairs

---@type GUI
local GUI = GUI

local skyModule = SKYC_Module
local game = GameC

local selectDreamId = 0

local logObject = Skywalker.Logger:GetLogObject("Game.Dream.UI.DreamMapView")

---@class DreamMapView
local DreamMapView = {}

DreamMapView.__cname = "DreamMapView"
DreamMapView.__path = "dream/dream_map_view"

function DreamMapView:main()
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)
    GUI:LoadExport(parent, self.__path)
    self.__parent = parent
    self.__ui = GUI:ui_delegate(parent)

    -- 设置可拖动
    GUI:Win_SetDrag(parent, self.__ui.Layout_Main)

    -- * 点击背景关闭界面
    GUI:addOnClickEvent(self.__ui.Layout_ClickClose, function()
        GUI:Win_Close(self.__parent)
    end)

    -- * 点击关闭按钮
    GUI:addOnClickEvent(self.__ui.Button_Close, function()
        GUI:Win_Close(self.__parent)
    end)

    -- * 点击进入按钮
    GUI:addOnClickEvent(self.__ui.Button_Enter, function()
        game.dreamMgr:ReqEnterDream(selectDreamId)
        GUI:Win_Close(self.__parent)
    end)

    GUI:setVisible(self.__ui.Button_MapListTemp, false)

    self:OnShow()
end

function DreamMapView:OnShow()
    local listView_Map = self.__ui.ListView_Map
    GUI:removeAllChildren(listView_Map)
    for i, config in pairs(skyModule.config.allTables.TbCDreamBase.AllTables) do
        local listButton = GUI:Clone(self.__ui.Button_MapListTemp)
        GUI:setVisible(listButton, true)
        GUI:ListView_pushBackCustomItem(listView_Map, listButton)
        GUI:setName(listButton, "Button_MapList_" .. i)
        GUI:addOnClickEvent(listButton, function()
            selectDreamId = config.Id
        end)

        GUI:Button_setTitleText(listButton, skyModule.text:GetText(config.Name) or "未知梦境")
    end
end

return DreamMapView
