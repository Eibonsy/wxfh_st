-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Map\MapComponent.lua
---作者: shyfan
---日期: 2025/03/18 15:22:17
---功能: 地图组件
-------------------------------------------------------------------
---@class MapComponentS:Class
---@field public new fun(self:MapComponentS, mapInstance:MapInstanceS):MapComponentS 构造函数
MapComponentS = Class("MapComponentS")

--* 构造函数
---@param mapInstance MapInstanceS 地图实例
function MapComponentS:Ctor(mapInstance)
    self.mapInstance = mapInstance
end

--* 析构函数
function MapComponentS:Dtor()
end

--* 加载
function MapComponentS:Load()
end

--* 卸载
function MapComponentS:Unload()
end
