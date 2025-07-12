local ui = {}
function ui.init(parent)
	-- Create Root
	local Root = GUI:Node_Create(parent, "Root", 0.00, 0.00)
	GUI:setChineseName(Root, "梦境地图界面")
	GUI:setTag(Root, -1)

	-- Create Layout_ClickClose
	local Layout_ClickClose = GUI:Layout_Create(Root, "Layout_ClickClose", 0.00, 0.00, 1136.00, 640.00, false)
	GUI:Layout_setBackGroundColorType(Layout_ClickClose, 1)
	GUI:Layout_setBackGroundColor(Layout_ClickClose, "#000000")
	GUI:Layout_setBackGroundColorOpacity(Layout_ClickClose, 127)
	GUI:setChineseName(Layout_ClickClose, "梦境地图界面_点击关闭")
	GUI:setTouchEnabled(Layout_ClickClose, true)
	GUI:setTag(Layout_ClickClose, -1)

	-- Create Layout_Main
	local Layout_Main = GUI:Layout_Create(Root, "Layout_Main", 285.00, 111.00, 600.00, 400.00, false)
	GUI:Layout_setBackGroundImage(Layout_Main, "res/public/1900000601.png")
	GUI:Layout_setBackGroundColorType(Layout_Main, 1)
	GUI:Layout_setBackGroundColor(Layout_Main, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(Layout_Main, 140)
	GUI:Layout_setBackGroundImageScale9Slice(Layout_Main, 0, 256, 0, 359)
	GUI:setChineseName(Layout_Main, "界面")
	GUI:setTouchEnabled(Layout_Main, true)
	GUI:setTag(Layout_Main, -1)
	GUI:setSwallowTouches(Layout_Main, false)

	-- Create Button_Close
	local Button_Close = GUI:Button_Create(Layout_Main, "Button_Close", 600.00, 358.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(Button_Close, "res/public/1900000511.png")
	GUI:Button_setTitleText(Button_Close, "")
	GUI:Button_setTitleColor(Button_Close, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Close, 14)
	GUI:Button_titleEnableOutline(Button_Close, "#000000", 1)
	GUI:setChineseName(Button_Close, "关闭按钮")
	GUI:setTouchEnabled(Button_Close, true)
	GUI:setTag(Button_Close, -1)

	-- Create ListView_Map
	local ListView_Map = GUI:ListView_Create(Layout_Main, "ListView_Map", 15.00, 15.00, 150.00, 370.00, 1)
	GUI:ListView_setGravity(ListView_Map, 5)
	GUI:ListView_setItemsMargin(ListView_Map, 3)
	GUI:setChineseName(ListView_Map, "地图列表")
	GUI:setTouchEnabled(ListView_Map, true)
	GUI:setTag(ListView_Map, -1)

	-- Create Button_Enter
	local Button_Enter = GUI:Button_Create(Layout_Main, "Button_Enter", 475.00, 19.00, "res/public/1900000680.png")
	GUI:Button_loadTexturePressed(Button_Enter, "res/public/1900000680_1.png")
	GUI:Button_loadTextureDisabled(Button_Enter, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(Button_Enter, "开始挑战")
	GUI:Button_setTitleColor(Button_Enter, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Enter, 20)
	GUI:Button_titleEnableOutline(Button_Enter, "#000000", 1)
	GUI:setChineseName(Button_Enter, "进入地图")
	GUI:setTouchEnabled(Button_Enter, true)
	GUI:setTag(Button_Enter, -1)

	-- Create Button_MapListTemp
	local Button_MapListTemp = GUI:Button_Create(Root, "Button_MapListTemp", 0.00, 0.00, "res/public/1900000662.png")
	GUI:Button_loadTexturePressed(Button_MapListTemp, "res/public/1900000663.png")
	GUI:Button_setTitleText(Button_MapListTemp, "地图名称")
	GUI:Button_setTitleColor(Button_MapListTemp, "#ffffff")
	GUI:Button_setTitleFontSize(Button_MapListTemp, 14)
	GUI:Button_titleEnableOutline(Button_MapListTemp, "#000000", 1)
	GUI:setChineseName(Button_MapListTemp, "地图列表按钮模板")
	GUI:setTouchEnabled(Button_MapListTemp, true)
	GUI:setTag(Button_MapListTemp, -1)
end
return ui