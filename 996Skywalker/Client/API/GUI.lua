---@meta GUI

---@class GUI
GUI = {}

---打开面板
---*  filename : 面板文件名
---@param filename 	string
---@nodiscard
function GUI:Win_Open(filename) end

---创建窗口控件
---*  ID : 控件ID
---*  PosX : 控件位置的横坐标
---*  PosY : 控件位置的纵坐标
---*  Width : 控件的宽
---*  Height : 控件的高
---*  Main : 是否隐藏主界面
---*  Last : 是否隐藏上一个界面
---*  NeedVoice : 是否点击时有音效
---*  EscClose : 是否esc关闭(客户端)
---*  isRevmsg : 是否pc鼠标经过吞噬，默认true
---*  npcID : 绑定npcid
---@param ID string
---@param PosX integer
---@param PosY integer
---@param Width integer
---@param Height integer
---@param Main? boolean
---@param Last? boolean
---@param NeedVoice? boolean
---@param EscClose? boolean
---@param isRevmsg? boolean
---@param npcID? integer
---@param param? integer
---@return userdata
function GUI:Win_Create(ID,PosX,PosY,Width,Height,Main,Last,NeedVoice,EscClose,isRevmsg,npcID,param) end

---关闭面板
---*  parent : 控件对象
---@param parent string
function GUI:Win_Close(parent) end

---通过界面ID关闭界面
---*  ID : 控件ID
---@param ID string
function GUI:Win_CloseByID(ID) end

---通过NPCID关闭界面
---*  NPCID : 绑定npcid
---@param NPCID integer
function GUI:Win_CloseByNPCID(NPCID) end

---通过键盘的Esc键关闭界面
---*  NPCID : 绑定npcid
---*  parent : 控件对象
---*  isClose : 是否关闭

---@param parent string
---@param isClose boolean
function GUI:Win_SetESCClose(parent,isClose) end

---获取控件对象
---*  parent : 父控件对象
---*  ID :控件ID
---@param parent userdata|nil
---@param ID string
---@return userdata
---@nodiscard
function GUI:GetWindow(parent, ID) end

---设置控件自定义参数
---*  widget : 控件对象
---*  param : 	自定义参数
---@param widget userdata
---@param param integer
function GUI:Win_SetParam(widget, param) end

---获取控件自定义参数
---*  widget : 父控件对象
---@param widget userdata
---@return integer
---@nodiscard
function GUI:Win_GetParam(widget) end

---设置界面拖动
---*  widget : 界面对象
---*  dragLayer : 点击控件对象
---@param widget userdata
---@param dragLayer userdata
function GUI:Win_SetDrag(widget, dragLayer) end

---设置主界面隐藏
---*  widget : 界面对象
---*  value : 	是否隐藏主界面 
---@param widget userdata
---@param value boolean
function GUI:Win_SetMainHide(widget, value) end

---设置主界面隐藏
---*  widget : 界面对象
---*  value : 	能否关闭, 普通面板生效 
---@param widget userdata
---@param value boolean
function GUI:Win_SetESCClose(widget, value) end

---设置控件绑定npc
---*  widget : 界面对象
---*  npcID : npcid
---@param widget userdata
---@param npcID integer
function GUI:Win_BindNPC(widget, npcID) end

---设置界面浮起
---*  widget : 界面对象
---*  zPanel : 控件对象
---@param widget userdata
---@param zPanel integer
function GUI:Win_SetZPanel(widget, zPanel) end

---设置界面绑定事件
---*  widget : 界面对象
---*  zPanel : 控件对象
---@param widget userdata
---@param eventID integer
---@param eventTag string
function GUI:Win_SetZPanel(widget, eventID, eventTag) end

---设置界面内鼠标右键吞噬
---*  widget : 界面对象
---*  value : 	是否吞噬
---@param widget userdata
---@param value boolean
function GUI:Win_SetSwallowRightMouseTouch(widget, value) end

---加载 GUIExport文件
---*  widget : 控件对象
---*  filename : Ctrl+f9 界面编辑器导出的lua文件(用法参考系统界面)
---@param widget userdata
---@param filename string
function GUI:LoadExport(widget,filename) end

---获取父节点的快捷子控件组
---*  widget : 父节点对象
---@param widget userdata
---@return table
---@nodiscard
function GUI:ui_delegate(widget) end

---设置控件位置
---*  widget : 控件对象
---*  x : 	控件x坐标
---*  y : 	控件y坐标
---@param widget userdata
---@param x integer
---@param y integer
function GUI:setPosition( widget, x, y) end

---获取控件位置
---*  widget : 控件对象
---@param widget userdata
---@return table
---@nodiscard
function GUI:getPosition( widget) end

---设置控件X坐标
---*  widget : 控件对象
---*  x : 	控件x坐标
---@param widget userdata
---@param x integer
function GUI:setPositionX( widget, x) end

---获取控件X坐标
---*  widget : 控件对象
---@param widget userdata
---@return integer
---@nodiscard
function GUI:getPositionX( widget) end

---设置控件Y坐标
---*  widget : 控件对象
---*  y : 	控件x坐标
---@param widget userdata
---@param y integer
function GUI:setPositionY( widget, y) end

---获取控件Y坐标
---*  widget : 控件对象
---@param widget userdata
---@return integer
---@nodiscard
function GUI:getPositionY( widget) end

---设置控件锚点
---*  widget : 控件对象
---*  x : 	控件横向锚点
---*  y : 	控件纵向锚点
---@param widget userdata
---@param x integer
---@param y integer
function GUI:setAnchorPoint(widget, x, y) end

---获取控件锚点
---*  widget : 控件对象
---@param widget userdata
---@return table
---@nodiscard
function GUI:getAnchorPoint(widget) end

---设置控件尺寸大小
---*  widget : 控件对象
---*  sizeW : 	宽度
---*  sizeH : 	长度
---@param widget userdata
---@param sizeW integer
---@param sizeH integer
function GUI:setContentSize(widget, sizeW, sizeH) end

---获取控件尺寸大小(纹理大小 不考虑缩放)
---*  widget : 控件对象
---@param widget userdata
---@return table
---@nodiscard
function GUI:getContentSize(widget) end

---获取控件尺寸大小(考虑缩放的真实大小)
---*  widget : 控件对象
---@param widget userdata
---@return table
---@nodiscard
function GUI:getBoundingBox(widget) end

---设置控件标签
---*  widget : 控件对象
---@param widget userdata
---@param tag integer
function GUI:setTag(widget,tag) end

---获取控件标签
---*  widget : 控件对象
---@param widget userdata
---@return integer
function GUI:getTag(widget) end

---设置控件名字
---*  widget : 控件对象
---@param widget userdata
---@param name string
function GUI:setName(widget,name) end

---设置控件置灰
---*  widget : 控件对象
---@param widget userdata
---@param isGrey boolean
function GUI:setGrey(widget,isGrey) end

---设置控件旋转角度
---*  widget : 控件对象
---*  value : 旋转角度（0 - 360）
---@param widget userdata
---@param value integer
function GUI:setRotation(widget,value) end

---获取控件旋转
---*  widget : 控件对象
---@param widget userdata
---@return integer
---@nodiscard
function GUI:getRotation(widget) end


---设置控件X轴倾斜角度
---*  widget : 控件对象
---*  value : 旋转角度（0 - 360）
---@param widget userdata
---@param value integer
function GUI:setRotationSkewX(widget,value) end

---设置控件Y轴倾斜角度
---*  widget : 控件对象
---*  value : 旋转角度（0 - 360）
---@param widget userdata
---@param value integer
function GUI:setRotationSkewY(widget,value) end

---设置控件是否隐藏
---*  widget : 控件对象
---*  value : 	是否隐藏
---@param widget userdata
---@param value boolean
function GUI:setVisible(widget, value) end

---获取控件是否隐藏
---*  widget : 控件对象
---@param widget userdata
---@return boolean
---@nodiscard
function GUI:getVisible(widget) end

---设置控件不透明度
---*  widget : 控件对象
---*  value : 	不透明度(0-255), 默认255
---@param widget userdata
---@param value integer
function GUI:setOpacity(widget, value) end

---获取控件不透明度
---*  widget : 控件对象
---@param widget userdata
---@return integer
---@nodiscard
function GUI:getOpacity(widget) end

---设置控件不透明度
---*  widget : 控件对象
---*  value : 	不透明度(0-255), 默认255
---@param widget userdata
---@param value integer
function GUI:setOpacity(widget, value) end

---设置控件缩放
---*  widget : 控件对象
---@param widget userdata
---@param value integer
function GUI:setScale(widget, value) end

---设置控件X轴方向缩放
---*  widget : 控件对象
---@param widget userdata
---@param value integer
function GUI:setScaleX(widget, value) end

---设置控件Y轴方向缩放
---*  widget : 控件对象
---@param widget userdata
---@param value integer
function GUI:setScaleY(widget, value) end

---获取控件缩放
---*  widget : 控件对象
---@param widget userdata
---@return integer
---@nodiscard
function GUI:getScale(widget) end

---设置控件X轴方向缩放
---*  widget : 控件对象
---@param widget userdata
---@return integer
---@nodiscard
function GUI:getScaleX(widget) end

---设置控件Y轴方向缩放
---*  widget : 控件对象
---@param widget userdata
---@return integer
---@nodiscard
function GUI:getScaleY(widget) end

---设置水平X轴方向翻转
---*  widget : 控件对象
---*  value : 	是否翻转
---@param widget userdata
---@param value boolean
function GUI:setFlippedX(widget, value) end

---获取是否水平X轴方向翻转
---*  widget : 控件对象
---@param widget userdata
---@return boolean
---@nodiscard
function GUI:getFlippedX(widget) end

---设置水平Y轴方向翻转
---*  widget : 控件对象
---*  value : 	是否翻转
---@param widget userdata
---@param value boolean
function GUI:setFlippedY(widget, value) end

---获取是否水平Y轴方向翻转
---*  widget : 控件对象
---@param widget userdata
---@return boolean
---@nodiscard
function GUI:getFlippedY(widget) end

---设置控件渲染层级
---*  widget : 控件对象
---*  value : 	渲染层级, 值越大显示越靠前
---@param widget userdata
---@param value integer
function GUI:setLocalZOrder(widget, value) end

---设置子控件是否跟随父控件变化
---*  widget : 父控件对象
---*  value : 是否跟随
---@param widget userdata
---@param value boolean
function GUI:setCascadeOpacityEnabled(widget, value) end

---设置控件的所有子控件是否跟随变化透明度
---*  widget : 控件对象
---*  value : 是否跟随
---@param widget userdata
---@param value boolean
function GUI:setChildrenCascadeOpacityEnabled(widget, value) end

---获取控件触摸起始位置
---*  widget : 控件对象
---@param widget userdata
function GUI:getWorldPosition(widget) end

---添加控件到父控件中
---*  widget : 父控件对象
---*  child : 子控件对象
---@param widget userdata
---@param child userdata
function GUI:addChild(widget, child) end

---克隆控件
---*  widget : 控件对象
---@param widget userdata
---@return userdata
---@nodiscard
function GUI:Clone(widget) end

---设置控件是否可以点击
---*  widget : 控件对象
---*  value : 是否可点击
---@param widget userdata
---@param value boolean
function GUI:setTouchEnabled(widget, value) end

---获取控件是否可以点击
---*  widget : 控件对象
---@param widget userdata
---@return boolean
---@nodiscard
function GUI:getTouchEnabled(widget) end

---获取父控件对象
---*  widget : 控件对象
---@param widget userdata
---@return userdata
---@nodiscard
function GUI:getParent(widget) end

---获取该控件的所有子控件对象
---*  widget : 控件对象
---@param widget userdata
---@return table
---@nodiscard
function GUI:getChildren(widget) end

---获取控件id
---*  widget : 控件对象
---@param widget userdata
---@return string
---@nodiscard
function GUI:getName(widget) end

---通过控件名字获取子节点对象
---*  widget : 控件对象
---@param widget userdata
---@param name string
---@return userdata
---@nodiscard
function GUI:getChildByName(widget,name) end

---通过控件名字获取子节点对象
---*  widget : 控件对象
---@param widget userdata
---@param tag integer
---@return userdata
---@nodiscard
function GUI:getChildByTag(widget,tag) end

---移除其下所有子控件
---*  widget : 控件对象
---@param widget userdata
function GUI:removeAllChildren(widget) end

---将传入控件从父节点上移除
---*  widget : 控件对象
---@param widget userdata
function GUI:removeFromParent(widget) end

---通过名字删除子节点
---*  widget : 控件对象
---*  name : 控件名字
---@param widget userdata
---@param name integer
function GUI:removeChildByName(widget,name) end

---设置控件点击事件
---*  widget : 控件对象
---*  func : 回调函数
---@param widget userdata
---@param func function
function GUI:addOnClickEvent(widget, func) end

---设置控件触摸事件
---*  widget : 控件对象
---*  func : 回调函数
---@param widget userdata
---@param func function
function GUI:addOnTouchEvent(widget, func) end

---设置控件长按事件
---*  widget : 控件对象
---*  func : 回调函数 
---@param widget userdata
---@param func function
function GUI:addOnLongTouchEvent(widget, func) end

---设置控件鼠标进入/移出事件
---*  widget : 控件对象
---*  func : 回调函数 
---@param widget userdata
---@param func function
function GUI:addMouseMoveEvent(widget, func) end

---设置鼠标经过tips
---*  widget : 控件对象
---*  str : tips文本
---*  pos : 位置
---*  anr : 锚点
---*  param : 检查接触点是否能展示
---@param widget userdata
---@param str string
---@param pos table
---@param anr table
---@param param? table
function GUI:addMouseOverTips(widget,str,pos,anr,param) end

---获取点击吞噬
---*  widget : 控件对象
---@param widget userdata
---@return boolean
---@nodiscard
function GUI:getSwallowTouches(widget) end

---开启定时器
---*  widget : 控件对象
---*  func : 回调函数 
---*  delay : 时间间隔 
---@param widget userdata
---@param func function
function GUI:schedule(widget, func, delay) end

---停止定时器
---*  widget : 控件对象
---@param widget userdata
function GUI:unSchedule(widget) end

---键盘监听事件
---*  codeKeys : 要监听的键盘键key
---*  funcA : 按下回调 
---*  funcB : 松开回调 
---@param codeKeys string|table
---@param funcA function
---@param funcB function
function GUI:addKeyboardEvent(codeKeys, funcA, funcB) end

---移除键盘监听
---*  codeKeys : 要监听的键盘键key
---@param codeKeys string|table
function GUI:removeKeyboardEvent(codeKeys) end

---创建图片控件
---*  Parent : 父控件对象
---*  ID : 控件ID
---*  PosX :控件位置的横坐标
---*  PosY : 控件位置的纵坐标
---*  nimg : 图片路径
---@param Parent userdata
---@param ID string
---@param PosX integer
---@param PosY integer
---@param nimg string
---@return userdata
function GUI:Image_Create( Parent, ID, PosX, PosY, nimg) end

---设置图片控件图片路径
---*  widget : 图片控件对象
---*  filepath : 图片路径
---@param widget userdata
---@param filepath string
function GUI:Image_loadTexture(widget, filepath) end

---设置图片控件九宫格参数
---*  widget : 图片控件对象
---*  scale9l : 左边比例
---*  scale9r : 右边比例
---*  scale9t : 上边比例
---*  scale9b : 下边比例
---@param widget userdata
---@param scale9l integer
---@param scale9r integer
---@param scale9t integer
---@param scale9b integer
function GUI:Image_setScale9Slice(widget, scale9l, scale9r, scale9t, scale9b) end

---设置图片是否变灰
---*  widget : 图片控件对象
---*  isGrey : 是否变灰
---@param widget userdata
---@param isGrey boolean
function GUI:Image_setGrey( widget, isGrey ) end

---创建按钮控件
---*  Parent : 父控件对象
---*  ID : 控件ID
---*  PosX :控件位置的横坐标
---*  PosY : 控件位置的纵坐标
---*  nimg : 图片路径
---@param Parent userdata
---@param ID string
---@param PosX integer
---@param PosY integer
---@param nimg string
---@return userdata
function GUI:Button_Create( Parent, ID, PosX, PosY, nimg) end

---设置按钮状态图片
---*  widget : 按钮控件对象
---*  filepath : 图片路径
---@param widget userdata
---@param filepath string
function GUI:Button_loadTextures(widget, filepath) end

---设置按钮正常状态图片
---*  widget : 按钮控件对象
---*  filepath : 图片路径
---@param widget userdata
---@param filepath string
function GUI:Button_loadTextureNormal(widget, filepath) end

---设置按钮按下状态图片
---*  widget : 按钮控件对象
---*  filepath : 图片路径
---@param widget userdata
---@param filepath string
function GUI:Button_loadTexturePressed(widget, filepath) end

---设置按钮禁用状态图片
---*  widget : 按钮控件对象
---*  filepath : 图片路径
---@param widget userdata
---@param filepath string
function GUI:Button_loadTextureDisabled(widget, filepath) end

---设置按钮文字
---*  widget : 按钮控件对象
---*  value : 按钮显示文本
---@param widget userdata
---@param value string
function GUI:Button_setTitleText(widget, value) end

---设置按钮文字颜色
---*  widget : 按钮控件对象
---*  value : 色值（#000000）
---@param widget userdata
---@param value string
function GUI:Button_setTitleColor(widget, value) end

---设置按钮文字大小
---*  widget : 按钮控件对象
---*  value : 字体大小
---@param widget userdata
---@param value string
function GUI:Button_setTitleFontSize(widget, value) end

---设置按钮文字样式
---*  widget : 按钮控件对象
---*  value : 字体样式
---@param widget userdata
---@param value string
function GUI:Button_setTitleFontName(widget, value) end

---设置按钮文本最大宽度
---*  widget : 按钮控件对象
---*  value : 文本最大宽度
---@param widget userdata
---@param value integer
function GUI:Button_setMaxLineWidth(widget, value) end

---设置按钮文本最大宽度
---*  widget : 按钮控件对象
---*  color : 描边色值
---*  outline : 描边大小
---@param widget userdata
---@param color string
---@param outline integer
function GUI:Button_titleEnableOutline(widget, color,outline) end

---取消按钮文本描边
---*  widget : 按钮控件对象
---@param widget userdata
function GUI:Button_titleDisableOutLine(widget) end

---设置按钮是否禁用
---*  widget : 按钮控件对象
---*  value : 是否禁用（可触摸）
---@param widget userdata
---@param value boolean
function GUI:Button_setBright(widget, value) end

---设置按钮是否禁用
---*  widget : 按钮控件对象
---*  value : 是否禁用（不可触摸）
---@param widget userdata
---@param value boolean
function GUI:Button_setBrightEx(widget, value) end

---设置按钮状态
---*  widget : 按钮控件对象
---*  value : 状态（0正常 1按下）
---@param widget userdata
---@param value integer
function GUI:Button_setBrightStyle(widget, value) end

---设置按钮是否灰态
---*  widget : 按钮控件对象
---*  value : 是否灰态
---@param widget userdata
---@param value boolean
function GUI:Button_setGrey(widget, value) end

---设置按钮九宫格
---*  widget : 按钮控件对象
---*  scale9l : 	左边比例
---*  scale9r : 	右边比例
---*  scale9t : 	上边比例
---*  scale9b : 	下边比例
---@param widget userdata
---@param scale9l integer
---@param scale9r integer
---@param scale9t integer
---@param scale9b integer
function GUI:Button_setScale9Slice(widget, scale9l, scale9r, scale9t, scale9b) end

---创建文本控件
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  fontSize : 字体大小
---*  fontColor : 	颜色
---*  str : 文本内容
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param fontSize integer
---@param fontColor string
---@param str string
---@return userdata
function GUI:Text_Create(parent, ID, x, y, fontSize, fontColor, str) end

---设置文本控件的文本
---*  widget : 控件对象
---*  value : 	文本
---@param widget userdata
---@param value string
function GUI:Text_setString(widget, value) end

---获取文本控件的文本
---*  widget : 控件对象
---@param widget userdata
---@return string
---@nodiscard
function GUI:Text_getString(widget) end

---设置文本控件的文本颜色
---*  widget : 控件对象
---*  value : 色值(“#000000”)
---@param widget userdata
---@param value string
function GUI:Text_setTextColor(widget, value) end

---设置文本控件的字体大小
---*  widget : 父控件对象
---*  value : 字体大小
---@param widget userdata
---@param value integer
function GUI:Text_setFontSize(widget, value) end

---设置字体路径
---*  widget : 父控件对象
---*  value : 字体文件路径例: 'fonts/font.ttf'
---@param widget userdata
---@param value string
function GUI:Text_setFontName(widget, value) end

---设置文本控件的文本描边
---*  widget : 控件对象
---*  color : 色值('#000000')
---*  size : 描边大小
---@param widget userdata
---@param color string
---@param size integer
function GUI:Text_enableOutline(widget, color, size) end

---设置文本下划线
---*  widget : 控件对象
---@param widget userdata
function GUI:Text_enableUnderline(widget) end

---设置文本最大长度
---*  widget : 控件对象
---*  width : 文本最大长度(达到最大会自动换行)
---@param widget userdata
---@param width integer
function GUI:Text_setMaxLineWidth(widget, width) end

---设置文本垂直对齐
---*  widget : 控件对象
---*  value : 0:顶对齐 1:垂直居中 2:底对齐
---@param widget userdata
---@param value integer
function GUI:Text_setTextVerticalAlignment(widget, value) end

---设置文本水平对齐
---*  widget : 控件对象
---*  value : 0:顶对齐 1:垂直居中 2:底对齐
---@param widget userdata
---@param value integer
function GUI:Text_setTextHorizontalAlignment(widget, value) end

---设置文本尺寸
---*  widget : 控件对象
---*  value : {width = 0, height = 0}
---@param widget userdata
---@param value table
function GUI:Text_setTextAreaSize(widget, value) end

---将文本控件设置为倒计时
---*  widget : 控件对象
---*  time : 	倒计时时间, 单位:秒
---*  callback : 每秒触发回调, 传入参数: 剩余时间
---@param widget userdata
---@param time integer
---@param callback function
function GUI:Text_COUNTDOWN(widget, time, callback) end

---创建Bmp文本
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  fontColor : 	颜色
---*  str : 文本内容
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param fontColor string
---@param str string
---@return userdata
function GUI:BmpText_Create(parent, ID, x, y, fontColor, str) end

---创建艺术字文本
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  stringValue : 文本内容
---*  charMapFile : 艺术字路径
---*  itemWidth : 艺术字路径
---*  itemWidth : 单个字体宽度
---*  itemHeight : 单个字体高度
---*  startCharMap : 起始字符设置(“/“)
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param stringValue string
---@param charMapFile string
---@param itemWidth integer
---@param itemHeight integer
---@param startCharMap string
---@return userdata
function GUI:TextAtlas_Create(parent, ID, x, y, stringValue, charMapFile, itemWidth, itemHeight, startCharMap) end

---设置艺术字配置
---*  widget : 艺术字对象
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  stringValue : 文本内容
---*  charMapFile : 艺术字路径
---*  itemWidth : 艺术字路径
---*  itemWidth : 单个字体宽度
---*  itemHeight : 单个字体高度
---*  startCharMap : 起始字符设置(“/“)
---@param widget userdata
---@param stringValue string
---@param charMapFile string
---@param itemWidth integer
---@param itemHeight integer
---@param startCharMap string
function GUI:TextAtlas_setProperty(widget,  stringValue, charMapFile, itemWidth, itemHeight, startCharMap) end

---设置艺术字文本
---*  widget : 艺术字对象
---*  stringValue : 文本内容
---@param widget userdata
---@param stringValue string
function GUI:TextAtlas_setString(widget,  stringValue) end

---创建富文本控件
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  str : 文本内容
---*  width : 富文本控件宽度
---*  Size : 字体大小
---*  Color : 颜色
---*  vspace : 富文本行间距
---*  hyperlinkCB : 超链回调函数
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param str string
---@param width integer
---@param Size integer
---@param Color string
---@param vspace integer
---@param hyperlinkCB function
---@return userdata
function GUI:RichText_Create(parent, ID, x, y, str, width, Size, Color, vspace, hyperlinkCB) end

---创建原始富文本
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  str : 文本内容
---*  width : 富文本控件宽度
---*  Size : 字体大小
---*  Color : 颜色
---*  vspace : 富文本行间距
---*  hyperlinkCB : 超链回调函数
---*  fontPath : 字体文件路径
---*  outlineParam : 描边参数 outline: 描边大小 outlineColor: 描边颜色
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param str string
---@param width integer
---@param Size integer
---@param Color string
---@param vspace integer
---@param hyperlinkCB function
---@param fontPath string
---@param outlineParam table
---@return userdata
function GUI:RichTextFCOLOR_Create(parent, ID, x, y, str, width, Size, Color, vspace, hyperlinkCB,fontPath,outlineParam) end

---创建滚动文本控件
---*  parent : 父控件对象
---*  ID :控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  width :滚动的宽度
---*  fontSize :字体大小
---*  fontColor : 颜色
---*  str : 文本内容
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param width integer
---@param fontSize integer
---@param fontColor string
---@param str string
---@return userdata
function GUI:ScrollText_Create(parent, ID, x, y, width, fontSize, fontColor, str) end

---设置滚动文本控件的文本
---*  widget : 控件对象
---*  value : 文本 
---@param widget userdata
---@param value string
function GUI:ScrollText_setString(widget, value) end

---获取滚动文本控件的文本
---*  widget : 控件对象
---@param widget userdata
function GUI:ScrollText_getString(widget) end

---设置滚动文本描边
---*  widget : 控件对象
---*  color : 描边色值(“#000000”)
---*  size : 描边大小
---@param widget userdata
---@param color string
---@param size integer
function GUI:ScrollText_enableOutline(widget,color,size) end

---设置滚动文本水平居中方式
---*  widget : 控件对象
---*  value : 	1:左对齐2:居中3:右对齐 
---@param widget userdata
---@param value integer
function GUI:ScrollText_setHorizontalAlignment(widget, value) end

---设置滚动文本字体颜色
---*  widget : 控件对象
---*  color : 描边色值(“#000000”)
---@param widget userdata
---@param color string
function GUI:ScrollText_setTextColor(widget, color) end

---创建节点控件
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@return userdata
function GUI:Node_Create(parent, ID, x, y) end

---创建Widget
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@return userdata
function GUI:Node_Create(parent, ID, x, y ,width ,height) end

---创建物品框控件
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  itemData : 道具信息
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param itemData table
function GUI:ItemShow_Create(parent, ID, x, y, itemData) end

---设置物品框点击事件
---*  widget : 控件对象
---*  eventCB : 事件函数
---@param widget userdata
---@param eventCB function
function GUI:ItemShow_addReplaceClickEvent(widget, eventCB) end

---设置物品框双击事件
---*  widget : 控件对象
---*  eventCB : 事件函数
---@param widget userdata
---@param eventCB function
function GUI:ItemShow_addDoubleEvent(widget, eventCB) end

---设置物品框长按事件
---*  widget : 控件对象
---*  eventCB : 事件函数
---@param widget userdata
---@param eventCB function
function GUI:ItemShow_addPressEvent(widget, eventCB) end

---设置物品框是否变灰
---*  widget : 物品框对象
---*  isGrey : 是否变灰
---@param widget userdata
---@param isGrey boolean
function GUI:ItemShow_setIconGrey( widget, isGrey) end

---设置物品框是否勾选
---*  itemShow : 物品框对象
---*  bool : 是否勾选
---@param itemShow userdata
---@param bool boolean
function GUI:ItemShow_setItemShowChooseState(itemShow, bool) end

---设置物品框是否拖动
---*  itemShow : 物品框对象
---*  bool : 是否拖动
---@param itemShow userdata
---@param bool boolean
function GUI:ItemShow_setMoveEable(itemShow, bool) end

---更新物品框是内容
---*  itemShow : 物品框对象
---*  itemData : 物品数据
---@param itemShow userdata
---@param itemData table
function GUI:ItemShow_setMoveEable(itemShow, itemData) end

---调用GUILayout/Item.lua中的函数
---*  itemShow : 物品框对象
---*  funcname : GUILayout/Item.lua中的函数名字
---*  … : 可变参数
---@param itemShow userdata
---@param funcname string
---@param ... any
function GUI:ItemShow_OnRunFunc(itemShow, funcname, ...) end

---创建复选框控件
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  nimg : 正常图片路径
---*  pimg : 选中图片路径
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param nimg string
---@param pimg string
function GUI:CheckBox_Create(parent, ID, x, y, nimg, pimg) end

---设置复选框背景图片
---*  widget : 控件对象
---*  value : 默认状态图片路径
---@param widget userdata
---@param filepath string
function GUI:CheckBox_loadTextureBackGround(widget, filepath) end

---设置复选框选中状态图片路径
---*  widget : 控件对象
---*  filepath : 选中状态图片路径
---@param widget userdata
---@param filepath string
function GUI:CheckBox_loadTextureFrontCross(widget, filepath) end

---设置复选框禁用状态图片路径
---*  widget : 控件对象
---*  filepath : 禁用状态图片路径
---@param widget userdata
---@param filepath string
function GUI:CheckBox_loadTextureFrontCrossDisabled(widget, filepath) end

---设置复选框是否选中
---*  widget : 控件对象
---*  value : 是否选中
---@param widget userdata
---@param value boolean
function GUI:CheckBox_setSelected(widget, value) end

---获取复选框是否选中
---*  widget : 控件对象
---@param widget userdata
---@return boolean
function GUI:CheckBox_isSelected(widget) end


---设置复选框点击事件
---*  widget : 控件对象
---*  eventCB : 点击事件函数
---@param widget userdata
---@param eventCB function
function GUI:CheckBox_addOnEvent(widget, eventCB) end

---创建输入框控件
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  width : 	控件的宽
---*  height : 控件的高
---*  fontSize : 字体大小
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param fontSize integer
function GUI:TextInput_Create(parent, ID, x, y, width, height, fontSize) end

---设置输入框控件字体
---*  widget : 控件对象
---*  value : 	字体路径
---*  value2 : 	字体(“font.ttf”)
---@param widget userdata
---@param value string
---@param value2 string
function GUI:TextInput_setFont(widget, value, value2) end

---设置输入框控件字体颜色
---*  widget : 控件对象
---*  value : 	字体颜色
---@param widget userdata
---@param value string
function GUI:TextInput_setFontColor(widget, value) end

---设置输入框控件字体大小
---*  widget : 控件对象
---*  value : 	字体大小
---@param widget userdata
---@param value integer
function GUI:TextInput_setFontSize(widget, value) end

---设置输入框占位文本字体
---*  widget : 控件对象
---*  value : 	字体路径
---*  value2 : 	字体(“font.ttf”)
---@param widget userdata
---@param value integer
function GUI:TextInput_setPlaceholderFont(widget, value, value2) end

---设置输入框占位文本字体颜色
---*  widget : 控件对象
---*  value : 	字体颜色
---@param widget userdata
---@param value string
function GUI:TextInput_setPlaceholderFontColor(widget, value) end

---设置输入框占位文本字体大小
---*  widget : 控件对象
---*  value : 	字体大小
---@param widget userdata
---@param value integer
function GUI:TextInput_setPlaceholderFontSize(widget, value) end

---设置输入框占位文本
---*  widget : 控件对象
---*  value : 	文本
---@param widget userdata
---@param value string
function GUI:TextInput_setPlaceHolder(widget, value) end

---设置输入框控件文本
---*  widget : 控件对象
---*  value : 	文本
---@param widget userdata
---@param value string
function GUI:TextInput_setString(widget, value) end

---获取输入框控件文本
---*  widget : 控件对象
---@param widget userdata
---@return string
function GUI:TextInput_getString(widget) end

---设置输入框控件输入长度
---*  widget : 控件对象
---*  value : 输入长度
---@param widget userdata
---@param value integer
function GUI:TextInput_setMaxLength(widget, value) end

---设置输入框水平对齐
---*  widget : 控件对象
---*  value : 对齐方式 0 顶对齐 1 底对齐 2 水平居中
---@param widget userdata
---@param value integer
function GUI:TextInput_setTextHorizontalAlignment(widget, value) end

---设置输入框文本类型
---*  widget : 控件对象
---*  value : 文本类型 0 密码形式; 1 敏感数据输入; 2 每个单词首字符大写，并有提示; 3 第一句首字符大写，并有提示; 4 自动大写;
---@param widget userdata
---@param value integer
function GUI:TextInput_setInputFlag(widget, value) end

---设置输入框键盘编辑类型
---*  widget : 控件对象
---*  value : 	类型:0 开启任何文本的输入键盘(含换行); 1 开启邮箱地址输入类型键盘;2 开启数字符号输入类型键盘;3 开启电话号码输入类型键盘;4 开启URL输入类型键盘;5 开启数字输入类型键盘(含小数点);6 开启任何文本的输入键盘(不含换行)
---@param widget userdata
---@param value integer
function GUI:TextInput_setInputMode(widget, value) end

---设置输入框监听事件
---*  widget : 控件对象
---*  eventCB : 事件函数
---@param widget userdata
---@param eventCB function
function GUI:TextInput_addOnEvent(widget, eventCB) end

---创建复选框控件
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  barimg : 滚动条背景图片
---*  pbarimg : 滚动条图片
---*  nimg : 滚动条拖动块图片
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param barimg string
---@param pbarimg string
---@param nimg string
---@return userdata
function GUI:Slider_Create(parent, ID, x, y, barimg, pbarimg, nimg) end

---设置滚动条背景图
---*  widget : 滚动条对象
---*  filepath : 背景图路径
---@param widget userdata
---@param filepath string
function GUI:Slider_loadBarTexture(widget, filepath) end

---设置滚动条图片
---*  widget : 滚动条对象
---*  filepath : 背景图路径
---@param widget userdata
---@param filepath string
function GUI:Slider_loadProgressBarTexture(widget, filepath) end

---设置滚动条拖动块普通图片
---*  widget : 滚动条对象
---*  filepath : 背景图路径
---@param widget userdata
---@param filepath string
function GUI:Slider_loadSlidBallTextureNormal(widget, filepath) end

---设置滚动条进度
---*  widget : 滚动条对象
---*  value : 滚动条进度(0-100)
---@param widget userdata
---@param value integer
function GUI:Slider_setPercent(widget, value) end

---获得滚动条进度
---*  widget : 滚动条对象
---@param widget userdata
---@return integer
---@nodiscard
function GUI:Slider_setPercent(widget) end


---设置滚动条触摸事件
---*  widget : 控件对象
---*  eventCB : 事件函数
---@param widget userdata
---@param eventCB function
function GUI:Slider_addOnEvent(widget, eventCB) end

---创建圆形进度条控件
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  img : 图片路径
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param img string
function GUI:ProgressTimer_Create(parent, ID, x, y, img) end

---设置圆形进度条控件进度值
---*  widget : 按钮对象
---*  value : 进度值（0-100）
---@param widget userdata
---@param value integer
function GUI:ProgressTimer_setPercentage(widget, value) end

---获取圆形进度条控件的进度值
---*  widget : 控件对象
---@param widget userdata
---@return integer
---@nodiscard
function GUI:ProgressTimer_getPercentage(widget) end

---设置圆形进度条控件进方向
---*  widget : 控件对象
---*  value : true:顺时针 false:逆时针 
---@param widget userdata
---@param value boolean
function GUI:ProgressTimer_setReverseDirection(widget, value) end

---设置圆形进度条动作和回调函数
---*  widget : 控件对象
---*  time : 时间
---*  from : 开始进度(0-100)
---*  to : 结束进度(0-100)
---*  completeCB : 回调函数
---@param widget userdata
---@param time integer
---@param from integer
---@param to integer
---@param completeCB function
function GUI:ProgressTimer_progressFromTo(widget, time, from, to, completeCB) end

---设置圆形进度条动作和回调函数2
---*  widget : 控件对象
---*  time : 时间
---*  from : 开始进度(0-100)
---*  to : 结束进度(0-100)
---*  completeCB : 回调函数
---@param widget userdata
---@param time integer
---@param to integer
---@param completeCB function
---@param tag integer
function GUI:ProgressTimer_progressTo(widget, time, to, completeCB,tag) end

---设置圆形进度条背景图
---*  widget : 控件对象
---*  img : 图片路径
---@param widget userdata
---@param img string
function GUI:ProgressTimer_ChangeImg(widget, img) end

---创建进度条控件
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  nimg : 	图片路径
---*  directtion : 方向 0:从左到右 1:从右到左
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param nimg string
---@param directtion integer
function GUI:LoadingBar_Create(parent, ID, x, y, nimg, directtion) end

---设置进度条控件图片
---*  widget : 按钮对象
---*  filepath : 图片路径
---@param widget userdata
---@param filepath string
function GUI:LoadingBar_loadTexture(widget, filepath) end

---设置进度条控件方向
---*  widget : 按钮对象
---*  value : 方向 0:从左到右 1:从右到左
---@param widget userdata
---@param value integer
function GUI:LoadingBar_setDirection(widget, value) end

---设置进度条控件进度值
---*  widget : 按钮对象
---*  value : 进度值（0-100）
---@param widget userdata
---@param value integer
function GUI:LoadingBar_setPercent(widget, value) end

---获取进度条控件的进度值
---*  widget : 控件对象
---@param widget userdata
---@return integer
function GUI:LoadingBar_getPercent(widget) end

---设置进度条控件颜色
---*  widget : 进度条对象
---*  value : 	颜色值(“#000000”)
---@param widget userdata
---@param value string
function GUI:LoadingBar_setColor(widget, value) end

---获取进度条颜色
---*  widget : 控件对象
---@param widget userdata
---@return string
function GUI:LoadingBar_getColor(widget) end


---创建特效控件
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  effecttype : 特效类型 0:特效、1:NPC、2:怪物、3:技能、4:人物、5:武器、6:翅膀、7:发型
---*  effectid : 	特效ID
---*  sex : 性别(0 男 1 女)
---*  act : 特效动作 0.待机 1.走 2.攻击 3.施法 4.死亡 5.跑步
---*  dir : 特效方向
---*  speed : 播放速度
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param effecttype integer
---@param effectid integer
---@param sex? integer
---@param act? integer
---@param dir? integer
---@param speed? integer
---@return userdata
function GUI:Effect_Create(parent, ID, x, y, effecttype, effectid, sex, act, dir, speed) end

---设置特效播放
---*  widget : 控件对象
---*  act : 特效动作 0.待机 1.走 2.攻击 3.施法 4.死亡 5.跑步
---*  dir : 特效方向
---*  isLoop : 是否循环
---*  speed : 播放速度
---*  isSequence : 是否暂停最后一帧
---@param widget userdata
---@param act integer
---@param dir integer
---@param isLoop boolean
---@param speed integer
---@param isSequence integer
function GUI:Effect_play(widget, act, dir, isLoop, speed, isSequence) end

---设置特效停止
---*  widget : 控件对象
---*  frameIndex : 停在第几帧
---*  act : 特效动作 0.待机 1.走 2.攻击 3.施法 4.死亡 5.跑步….
---*  dir : 特效方向 
---@param widget userdata
---@param frameIndex integer
---@param act integer
---@param dir integer
function GUI:Effect_stop(widget, frameIndex, act, dir) end

---设置特效播放完成事件
---*  widget : 控件对象
---*  value : 回调函数
---@param widget userdata
---@param func function
function GUI:Effect_addOnCompleteEvent(widget, func) end

---设置打开面板特效(小-大)1
---*  widget : 父控件对象
---@param widget userdata
function GUI:Timeline_Window1(widget) end

---设置打开面板特效(小-大)2
---*  widget : 父控件对象
---@param widget userdata
function GUI:Timeline_Window2(widget) end

---设置打开面板特效(小-大)3
---*  widget : 父控件对象
---@param widget userdata
function GUI:Timeline_Window3(widget) end

---设置打开面板特效(大-小)4
---*  widget : 父控件对象
---@param widget userdata
function GUI:Timeline_Window4(widget) end

---设置打开面板特效(大-小)5
---*  widget : 父控件对象
---@param widget userdata
function GUI:Timeline_Window5(widget) end

---设置打开面板特效(大-小)6
---*  widget : 父控件对象
---@param widget userdata
function GUI:Timeline_Window6(widget) end

---设置动画标记
---*  widget : 父控件对象
---@param widget userdata
---@param tag integer
function GUI:Timeline_SetTag(widget,tag) end

---停止所有动画
---*  widget : 父控件对象
---@param widget userdata
function GUI:Timeline_StopAll(widget) end

---通过标记停止动画
---*  widget : 父控件对象
---*  widget : 标记值
---@param widget userdata
---@param tag integer
function GUI:Timeline_StopByTag(widget,tag) end

---设置控件淡出
---*  widget : 控件对象
---*  time : 过程耗时
---*  timelineCB : 完成时触发函数
---@param widget userdata
---@param time integer
---@param timelineCB function
function GUI:Timeline_FadeOut(widget, time, timelineCB) end

---设置控件淡入
---*  widget : 控件对象
---*  time : 过程耗时
---*  timelineCB : 完成时触发函数
---@param widget userdata
---@param time integer
---@param timelineCB function
function GUI:Timeline_FadeIn(widget, time, timelineCB) end

---修改透明度到某个值
---*  widget : 控件对象
---*  value : 透明度
---*  time : 过程耗时
---*  timelineCB : 完成时触发函数
---@param widget userdata
---@param value integer
---@param time integer
---@param timelineCB function
function GUI:Timeline_FadeTo(widget, value, time, timelineCB) end

---设置控件缩放至一个值
---*  widget : 控件对象
---*  value : 缩放比例(0-100)
---*  time : 过程耗时
---*  timelineCB : 完成时触发函数
---@param widget userdata
---@param value integer
---@param time integer
---@param timelineCB function
function GUI:Timeline_ScaleTo(widget, value, time, timelineCB) end

---设置控件缩放动画
---*  widget : 控件对象
---*  value : 缩放比例(0-100)
---*  time : 动画时间
---*  timelineCB : 完成时触发函数
---@param widget userdata
---@param value integer
---@param time integer
---@param timelineCB function
function GUI:Timeline_ScaleBy(widget, value, time, timelineCB) end

---设置控件旋转至一个值
---*  widget : 控件对象
---*  value : 旋转角度
---*  time : 过程耗时
---*  timelineCB : 完成时触发函数
---@param widget userdata
---@param value integer
---@param time integer
---@param timelineCB function
function GUI:Timeline_RotateTo(widget, value, time, timelineCB) end

---设置控件旋转动画
---*  widget : 控件对象
---*  value : 旋转角度
---*  time : 动画时间
---*  timelineCB : 完成时触发函数
---@param widget userdata
---@param value integer
---@param time integer
---@param timelineCB function
function GUI:Timeline_RotateBy(widget, value, time, timelineCB) end

---设置控件移动至一个值
---*  widget : 控件对象
---*  value : 移动坐标{x=int,y=int}
---*  time : 动画时间
---*  timelineCB : 完成时触发函数
---@param widget userdata
---@param value table
---@param time integer
---@param timelineCB function
function GUI:Timeline_MoveTo(widget, value, time, timelineCB) end

---设置控件移动动画
---*  widget : 控件对象
---*  value : 移动坐标{x=int,y=int}
---*  time : 动画时间
---*  timelineCB : 完成时触发函数
---@param widget userdata
---@param value table
---@param time integer
---@param timelineCB function
function GUI:Timeline_MoveBy(widget, value, time, timelineCB) end

---设置控件闪烁
---*  widget : 控件对象
---*  value : 闪烁次数
---*  time : 动画时间
---*  timelineCB : 完成时触发函数
---@param widget userdata
---@param value integer
---@param time integer
---@param timelineCB function
function GUI:Timeline_Blink(widget, value, time, timelineCB) end

---设置控件抖动
---*  widget : 控件对象
---*  x : X轴抖动幅度
---*  y : Y轴抖动幅度
---*  time : 	动画时间
---*  timelineCB : 完成时触发函数
---@param widget userdata
---@param time integer
---@param x integer
---@param y integer
---@param timelineCB function
function GUI:Timeline_Shake(widget, time,x, y, timelineCB) end

---疯狂抖动动画
---*  widget : 控件对象
---*  time
---*  抖动幅度（0-360）
---@param widget userdata
---@param time integer
---@param angle integer
function GUI:Timeline_Shake(widget, time,angle) end

---动画延迟播放
---*  widget : 控件对象
---*  time : 时间
---*  timelineCB : 完成时触发函数
---@param widget userdata
---@param time integer
---@param timelineCB function
function GUI:Timeline_DelayTime(widget, time, timelineCB) end

---控件延时回调
---*  widget : 控件对象
---*  time : 	动画时间
---*  timeCB : 完成时触发函数
---@param widget userdata
---@param time integer
---@param timelineCB function
function GUI:Timeline_CallFunc(widget, value, time, timelineCB) end

---控件延时显示
---*  widget : 控件对象
---*  time : 	动画时间
---@param widget userdata
---@param time integer
function GUI:Timeline_Show(widget, time) end

---控件延时隐藏
---*  widget : 控件对象
---*  time : 	动画时间
---@param widget userdata
---@param time integer
function GUI:Timeline_Hide(widget, time) end

---创建一个角色静态模型
---*  _parent : 父控件对象
---*  _ID : 控件ID
---*  _PosX : 控件位置的横坐标
---*  _PosY : 控件位置的纵坐标
---*  sex : 性别 0 男性 1 女性
---*  feature : 模型属性
---*  scale : 缩放比例(0-100)
---@param _parent userdata
---@param _ID string
---@param _PosX integer
---@param _PosY integer
---@param sex integer
---@param feature table
---@param scale boolean
function GUI:UIModel_Create( _parent, _ID, _PosX, _PosY, sex, feature, scale ) end

---创建容器控件
---*  Parent : 父控件对象
---*  ID : 控件ID
---*  PosX : 控件位置的横坐标
---*  PosY : 控件位置的纵坐标
---*  Width : 控件的宽
---*  Height : 控件的高
---*  isClip : 是否裁剪
---@param Parent userdata
---@param ID string
---@param PosX integer
---@param PosY integer
---@param Width integer
---@param Height integer
---@param isClip boolean
---@return userdata
function GUI:Layout_Create( Parent, ID, PosX, PosY, Width, Height, isClip) end

---设置容器背景颜色
---*  widget : 控件对象
---*  value : 	色值(“#000000”)
---@param widget userdata
---@param value string
function GUI:Layout_setBackGroundColor(widget, value) end

---设置容器是否有背景颜色
---*  widget : 控件对象
---*  value : 类型(1单色，2渐变色)
---@param widget userdata
---@param value boolean
function GUI:Layout_setBackGroundColorType(widget, value) end

---设置层背景颜色不透明度
---*  widget : 控件对象
---*  value : 透明度(0-255)
---@param widget userdata
---@param value integer
function GUI:Layout_setBackGroundColorOpacity(widget, value) end

---设置容器是否裁剪
---*  widget : 控件对象
---*  value : 是否裁剪 
---@param widget userdata
---@param value boolean
function GUI:Layout_setClippingEnabled(widget, value) end

---设置层背景图片
---*  widget : 控件对象
---*  value : 图片路径 
---@param widget userdata
---@param value boolean
function GUI:Layout_setBackGroundImage(widget, value) end

---设置层背景图片九宫格
---*  widget : 控件对象
---*  scale9l : 左边比例
---*  scale9r : 右边比例
---*  scale9t : 上边比例
---*  scale9b : 下边比例
---@param widget userdata
---@param scale9l integer
---@param scale9r integer
---@param scale9t integer
---@param scale9b integer
function GUI:Layout_setBackGroundImageScale9Slice(widget, scale9l, scale9r, scale9t, scale9b) end

---创建列表容器
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  width : 	控件的宽
---*  height : 控件的高
---*  direction : 滑动方向1:垂直2:水平
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param direction integer
---@return userdata
function GUI:ListView_Create(parent, ID, x, y, width, height, direction) end

---设置列表容器对齐方式
---*  widget : 列表容器对象
---*  value : 对齐方式0:左对齐1:右对齐2:水平居中3:顶对齐4:底对齐5:垂直居中
---@param widget userdata
---@param value integer
function GUI:ListView_setGravity(widget, value) end

---设置列表容器滑动方向
---*  widget : 列表容器对象
---*  value : 滑动方向:1:垂直2:水平
---@param widget userdata
---@param value integer
function GUI:ListView_setDirection(widget, value) end

---设置列表容器控件间隔
---*  widget : 列表容器对象
---*  value : 间隔
---@param widget userdata
---@param value integer
function GUI:ListView_setItemsMargin(widget, value) end

---获取列表容器控件间距
---*  widget : 列表容器对象
---@param widget userdata
---@return integer
---@nodiscard
function GUI:ListView_getItemsMargin(widget) end

---设置列表容器是否回弹
---*  widget : 列表容器对象
---*  value : 是否有回弹
---@param widget userdata
---@param value boolean
function GUI:ListView_setBounceEnabled(widget, value) end

---设置列表容器是否裁剪
---*  widget : 列表容器对象
---*  value : 是否裁剪
---@param widget userdata
---@param value boolean
function GUI:ListView_setClippingEnabled(widget, value) end

---设置列表容器背景颜色
---*  widget : 列表容器对象
---*  value : 色值(“#000000”)
---@param widget userdata
---@param value boolean
function GUI:ListView_setBackGroundColor(widget, value) end

---设置列表容器背景颜色类型
---*  widget : 列表容器对象
---*  value : 1:单色，2:渐变色
---@param widget userdata
---@param value boolean
function GUI:ListView_setBackGroundColorType(widget, value) end

---设置列表容器背景透明度
---*  widget : 列表容器对象
---*  value : 透明度(0-255)
---@param widget userdata
---@param value boolean
function GUI:ListView_setBackGroundOpacity(widget, value) end

---设置列表容器背景图片
---*  widget : 列表容器对象
---*  value : 图片路径
---@param widget userdata
---@param value string
function GUI:ListView_setBackGroundImage(widget, value) end

---设置列表容器背景图片九宫格
---*  widget : 列表容器对象
---*  scale9l : 左边比例
---*  scale9r : 右边比例
---*  scale9t : 上边比例
---*  scale9b : 下边比例
---@param widget userdata
---@param scale9l integer
---@param scale9r integer
---@param scale9t integer
---@param scale9b integer
function GUI:ListView_setBackGroundImageScale9Slice(widget, scale9l, scale9r, scale9t, scale9b) end

---列表容器加载子节点
---*  widget : 列表容器对象
---*  value : 子节点对象（末尾加载）
---@param widget userdata
---@param value userdata
function GUI:ListView_pushBackCustomItem(widget, value) end

---列表容器加载子节点
---*  widget : 列表容器对象
---*  value : 子节点对象
---*  index : 序列号位置
---@param widget userdata
---@param value userdata
---@param index integer
function GUI:ListView_insertCustomItem(widget, value, index) end

---列表容器删除所有子节点
---*  widget : 列表容器对象
---@param widget userdata
function GUI:ListView_removeAllItems(widget) end

---通过序列号删除列表容器子节点
---*  widget : 列表容器对象
---*  index : 序列号位置
---@param widget userdata
---@param index integer
function GUI:ListView_removeItemByIndex(widget,index) end

---列表容器删除子节点
---*  widget : 列表容器对象
---*  value : 子节点对象
---@param widget userdata
---@param value userdata
function GUI:ListView_removeChild(widget, value) end

---跳转到列表容器序列号节点位置
---*  widget : 列表容器对象
---*  index : 序列号位置
---@param widget userdata
---@param index integer
function GUI:ListView_jumpToItem(widget, index) end

---某一时间内滑动到列表容器顶部
---*  widget : 列表容器对象
---*  index : 时间
---*  index : 滑动速度是否减弱
---@param widget userdata
---@param time integer
---@param boolvalue boolean
function GUI:ListView_scrollToTop(widget, time, boolvalue) end

---某一时间内滑动到列表容器底部
---*  widget : 列表容器对象
---*  index : 时间
---*  index : 滑动速度是否减弱
---@param widget userdata
---@param time integer
---@param boolvalue boolean
function GUI:ListView_scrollToBottom(widget, time, boolvalue) end


---获取列表容器最顶部可见范围子节点
---*  widget : 列表容器对象
---@param widget userdata
function GUI:ListView_getTopmostItemInCurrentView(widget) end

---获取列表容器最底部部可见范围子节点
---*  widget : 列表容器对象
---@param widget userdata
function GUI:ListView_getBottommostItemInCurrentView(widget) end

---通过子节点序列号获取子节点对象
---*  widget : 列表容器对象
---*  index : 子节点对象
---@param parent userdata
---@param index integer
---@return userdata
function GUI:ListView_getItemIndex(parent,index) end

---通过子节点序列号获取子节点对象
---*  widget : 列表容器对象
---*  index : 子节点序列号
---@param parent userdata
---@param index integer
---@return userdata
function GUI:ListView_getItemByIndex(parent,index) end

---获取列表容器所有子节点对象
---*  widget : 列表容器对象
---@param parent userdata
---@return table
function GUI:ListView_getItems(parent) end

---获取列表容器所有子节点数量
---*  widget : 列表容器对象
---@param parent userdata
---@return table
function GUI:ListView_getItemCount(parent) end

---获取列表容器所有子节点数量
---*  widget : 列表容器对象
---@param parent userdata
---@param eventCB function
function GUI:ListView_addOnScrollEvent(parent ,eventCB) end

---列表容器刷新
---*  widget : 列表容器对象
---@param parent userdata
function GUI:ListView_doLayout(parent) end

---列表容器可见区域绘制
---*  widget : 列表容器对象
---@param parent userdata
function GUI:ListView_paintItems(parent) end

---列表容器可见区域自动绘制
---*  widget : 列表容器对象
---@param parent userdata
function GUI:ListView_autoPaintItems(parent) end

---获取列表容器滚动范围大小
---*  widget : 列表容器对象
---@param parent userdata
function GUI:ListView_getInnerContainerSize(parent) end

---获取列表容器滚动范围坐标
---*  widget : 列表容器对象
---@param parent userdata
function GUI:ListView_getInnerContainerPosition(parent) end

---设置列表容器是否衰减滚动速度(垂直方向)
---*  widget : 列表容器对象
---@param parent userdata
---@param percent integer
---@param time integer
---@param bool boolean
function GUI:ListView_scrollToPercentVertical(parent, percent, time, bool) end

---设置列表容器是否衰减滚动速度(水平方向)
---*  widget : 列表容器对象
---@param parent userdata
---@param percent integer
---@param time integer
---@param bool boolean
function GUI:ListView_scrollToPercentHorizontal(parent, percent, time, bool) end

---创建滚动容器
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x : 控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  width : 控件的宽
---*  height : 控件的高
---*  direction : 滑动方向1:垂直2:水平
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param direction integer
---@return userdata
function GUI:ScrollView_Create(parent, ID, x, y, width, height, direction) end

---设置滚动控件滚动区域大小
---*  widget : 控件对象
---*  width : 区域大小
---*  height : 区域大小
---@param widget userdata
---@param width integer
---@param height integer
function GUI:ScrollView_setInnerContainerSize(widget, width, height) end

---设置滚动控件滚动区域大小
---*  widget : 控件对象
---@param widget userdata
---@return table
---@nodiscard
function GUI:ScrollView_getInnerContainerSize(widget) end

---设置滚动容器滚动方向
---*  widget : 控件对象
---*  value : 滑动方向:1:垂直2:水平
---@param widget userdata
---@param value integer
function GUI:ScrollView_setDirection(widget, value) end

---设置滚动容器是否回弹
---*  widget : 控件对象
---*  value : 	是否回弹
---@param widget userdata
---@param value boolean
function GUI:ScrollView_setBounceEnabled(widget, value) end

---设置滚动容器是否裁剪
---*  widget : 控件对象
---*  value : 	是否裁剪
---@param widget userdata
---@param value boolean
function GUI:ScrollView_setClippingEnabled(widget, value) end

---设置滚动容器背景颜色
---*  widget : 控件对象
---*  value : 	色值(“#000000”)
---@param widget userdata
---@param value boolean
function GUI:ScrollView_setBackGroundColor(widget, value) end

---设置滚动容器背景颜色类型
---*  widget : 控件对象
---*  value : 	1:单色，2:渐变色
---@param widget userdata
---@param value boolean
function GUI:ScrollView_setBackGroundColorType(widget, value) end

---设置滚动容器背景颜色类型
---*  widget : 控件对象
---*  value : 	1:单色，2:渐变色
---@param widget userdata
---@param value boolean
function GUI:ScrollView_setBackGroundColorType(widget, value) end

---设置滚动容器背景透明度
---*  widget : 控件对象
---*  value : 透明度(0-255)
---@param widget userdata
---@param value boolean
function GUI:ScrollView_setBackGroundOpacity(widget, value) end

---设置滚动容器背景图片
---*  widget : 控件对象
---*  value : 图片路径
---@param widget userdata
---@param value boolean
function GUI:ScrollView_setBackGroundImage(widget, value) end

---设置滚动器背景图片九宫格
---*  widget : 图片控件对象
---*  scale9l : 左边比例
---*  scale9r : 右边比例
---*  scale9t : 上边比例
---*  scale9b : 下边比例
---@param widget userdata
---@param scale9l integer
---@param scale9r integer
---@param scale9t integer
---@param scale9b integer
function GUI:ScrollView_setBackGroundImageScale9Slice(widget, scale9l, scale9r, scale9t, scale9b) end

---设置滚动器背景图片九宫格
---*  widget : 图片控件对象
---*  scale9l : 左边比例
---*  scale9r : 右边比例
---*  scale9t : 上边比例
---*  scale9b : 下边比例
---@param widget userdata
---@param scale9l integer
---@param scale9r integer
---@param scale9t integer
---@param scale9b integer
function GUI:ScrollView_setBackGroundImageScale9Slice(widget, scale9l, scale9r, scale9t, scale9b) end

---设置滚动容器滚动事件
---*  widget : 控件对象
---*  eventCB : 事件函数
---@param widget userdata
---@param eventCB function
function GUI:ScrollView_addOnScrollEvent(widget, eventCB) end

---滚动容器加载子节点
---*  widget : 控件对象
---*  value : 子节点对象
---@param widget userdata
---@param value userdata
function GUI:ScrollView_addChild(widget, value) end

---滚动容器删除所有子节点
---*  widget : 控件对象
---*  value : 子节点对象
---@param widget userdata
function GUI:ScrollView_removeAllChildren(widget) end

---滚动容器刷新
---*  widget : 控件对象
---@param widget userdata
function GUI:ScrollView_doLayout(widget) end

---创建翻页容器
---*  parent : 父控件对象
---*  ID :控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  width :控件的宽
---*  height :控件的高
---*  direction : 0:水平滚动 1:垂直滚动
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param width integer
---@param height integer
function GUI:PageView_Create(parent, ID, x, y, width, height, direction) end

---设置翻页容器是否有裁切
---*  widget : 控件对象
---*  value : 是否有裁切
---@param widget string
---@param value boolean
function GUI:PageView_setClippingEnabled(widget, value) end

---设置翻页容器背景颜色
---*  widget : 控件对象
---*  value : 色值(“#000000”)
---@param widget string
---@param value boolean
function GUI:PageView_setBackGroundColor(widget, value) end

---设置翻页容器背景颜色类型
---*  widget : 控件对象
---*  value : 1:单色 2:渐变色
---@param widget string
---@param value boolean
function GUI:PageView_setBackGroundColorType(widget, value) end

---设置翻页容器背景透明度
---*  widget : 控件对象
---*  value : 透明度(0-255)
---@param widget string
---@param value boolean
function GUI:PageView_setBackGroundColorOpacity(widget, value) end

---设置翻页容器翻页
---*  widget : 进度条对象
---*  index : 子页面序列号
---@param widget userdata
---@param index integer
function GUI:PageView_scrollToItem(widget, index) end

---获取当前子页面序列号
---*  widget : 翻页容器对象
---@param widget userdata
---@return integer
---@nodiscard
function GUI:PageView_getCurrentPageIndex(widget) end


---获取当前子页面序列号
---*  widget : 翻页容器对象
---@param widget userdata
---@return userdata
---@nodiscard
function GUI:PageView_getItems(widget) end

---获取翻页容器子页面数量
---*  widget : 翻页容器对象
---@param widget userdata
---@return integer
---@nodiscard
function GUI:PageView_getItemCount(widget) end

---添加翻页容器页面
---*  parent : 翻页容器对象
---*  widget : 子页面对象
---@param parent userdata
---@param widget integer
function GUI:PageView_addPage(parent, widget) end


---设置翻页容器监听事件
---*  widget : 进度条对象
---*  eventCB : 回调函数 
---@param widget userdata
---@param eventCB function
function GUI:PageView_addOnEvent(widget, eventCB) end

---创建快速刷新控件
---*  parent : 父控件对象
---*  ID :控件ID
---*  x :控件位置的横坐标
---*  y :控件位置的纵坐标
---*  w :宽
---*  h :高
---*  createCB : 函数
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@param createCB function
---@return userdata
function GUI:QuickCell_Create(parent, ID, x, y, w, h, createCB) end

---播放动作
---*  widget : 控件对象
---*  value : 动作内容 
---@param widget userdata
---@param value userdata
function GUI:runAction(widget, value) end

---通过标记获取动作内容
---*  widget : 翻页容器对象
---*  tag : 动作标记
---@param widget userdata
---@param tag integer
---@return userdata
---@nodiscard
function GUI:getActionByTag(widget, tag) end

---停止所有动作
---*  widget : 翻页容器对象
---@param widget userdata
function GUI:stopAllActions(widget) end

---停止所有动作
---*  widget : 翻页容器对象
---@param widget userdata
---@param tag integer
function GUI:stopActionByTag(widget, tag) end

---移动到B点:以世界坐标系为原点(0,0)
---*  time : 时间
---*  x : 位置 横坐标
---*  y : 位置 纵坐标
---@param time integer
---@param x integer
---@param y integer
function GUI:ActionMoveTo(time, x, y) end

---A点移动到B点 移动相对位置:以A点为原点(0,0)
---*  time : 时间
---*  x : 位置 横坐标
---*  y : 位置 纵坐标
---@param time integer
---@param x integer
---@param y integer
function GUI:ActionMoveBy(time, x, y) end

---放大或缩小到某一比例
---*  time : 时间
---*  ratio : 缩放比例（百分比）
---@param time integer
---@param ratio integer
function GUI:ActionScaleTo(time, ratio) end

---放大或缩小到原来的某一比例
---*  time : 时间
---*  ratio : 缩放比例（百分比）
---@param time integer
---@param ratio integer
function GUI:ActionScaleBy(time, ratio) end


---旋转到多少角度
---*  time : 时间
---*  angle : 旋转角度
---@param time integer
---@param angle integer
function GUI:ActionRotateTo(time, angle) end

---旋转到原来的多少角度
---*  time : 时间
---*  angle : 旋转角度
---@param time integer
---@param angle integer
function GUI:ActionRotateBy(time, angle) end

---淡入
---*  time : 时间
---@param time integer
function GUI:ActionFadeIn(time) end

---淡出
---*  time : 时间
---@param time integer
function GUI:ActionFadeOut(time) end

---闪烁
---*  time : 时间
---*  num : 闪烁次数
---@param time integer
---@param num integer
function GUI:ActionBlink(time, num) end

---动画回调函数
---*  timeCB : 回调函数
---@param callback function
function GUI:CallFunc( callback) end

---延迟
---*  timeCB : 延迟时间
---@param time function
function GUI:DelayTime( time) end

---创建动画控件
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :位置 横坐标
---*  y : 位置 纵坐标
---*  prefix : 前缀
---*  suffix : 后缀
---*  beginframe : 起始帧, 默认1
---*  finishframe : 结束帧
---*  ext : 附加参数, {speed = 播放速度(毫秒), count = 图片数量, loop = 播放次数(-1: 循环), finishhide = 播放结束是否隐藏(1: 隐藏)}
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param prefix string
---@param suffix string
---@param beginframe integer
---@param finishframe integer
---@param ext table
---@return userdata
function GUI:Frames_Create(parent, ID, x, y, prefix, suffix, beginframe, finishframe, ext) end

---创建粒子特效
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :位置 横坐标
---*  y : 位置 纵坐标
---*  res : 粒子特效资源路径 plist文件
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param res string
---@return userdata
function GUI:ParticleEffect_Create(parent, ID, x, y, res) end

---设置持续时间
---*  widget : 粒子特效
---*  time : 持续时间, 单位: 秒 -1 表示永久
---@param widget integer
---@param time integer
function GUI:ActionRotateTo(widget, time) end

---设置总粒子数量
---*  widget : 粒子特效
---*  time : 数量
---@param widget integer
---@param value integer
function GUI:ParticleEffect_setTotalParticles(widget, value) end

---创建Spine动画
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :位置 横坐标
---*  y : 位置 纵坐标
---*  jsonPath : json文件路径
---*  atlasPath : atlas文件路径
---*  trackIndex : 索引值
---*  name : 动画名
---*  loop : 动画是否循环
---@param parent userdata
---@param ID string
---@param x integer
---@param y integer
---@param jsonPath string
---@param atlasPath string
---@param trackIndex integer
---@param name string
---@param loop boolean
---@return userdata
function GUI:SpineAnim_Create(parent, ID, x, y, jsonPath, atlasPath, trackIndex, name, loop) end




return GUI