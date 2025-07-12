# 996Skywalker 代码说明文档

## 1. 项目结构概览

```
Client/         # 客户端代码
  API/          # 客户端可调用的引擎接口（如 SL.lua、GUI.lua）
  Skywalker/    # 客户端主业务逻辑（网络、玩家、UI、操作等模块）
  Module/       # 客户端功能模块
  UIControl/    # 客户端 UI 控件实现

Server/         # 服务器端代码
  API/          # 服务器可调用的引擎接口（如 M2ServerLuaAPI.lua）
  Skywalker/    # 服务器主业务逻辑（房间、战场、玩家、地图等）
  Module/       # 服务器功能模块

Framework/      # 通用基础框架（客户端和服务器共用）
  Base/         # 基础类与通用方法
  Class/        # 面向对象支持
  Config/       # 通用配置
  Const/        # 常量定义
  Logger/       # 日志系统
  Util/         # 工具类

GameConfig/     # 游戏配置（客户端/服务器独立配置）
NetMessage/     # 网络消息协议定义
GameMisc/       # 其他通用配置或脚本
tool/           # 构建、工具脚本
Third-Party Tool/ # 第三方工具
```

## 2. 主要模块说明

### Client
- 客户端所有逻辑，包括 UI、网络、玩家、操作控制等。
- `API/` 目录为客户端可调用的底层引擎接口。
- 典型模块：`Skywalker/Module/Net/SKYC_Module_Net.lua`（网络模块）、`Skywalker/Game/`（游戏逻辑）、`UI/`（界面相关）。

### Server
- 服务器端所有逻辑，包括房间、战场、玩家、地图等。
- `API/` 目录为服务器可调用的底层引擎接口。
- 典型模块：`Skywalker/Game/Match/MatchRoomS.lua`（匹配房间）、`Module/Net/SKYS_Module_Net.lua`（网络模块）。

### Framework
- 通用基础框架，包含工具类、日志、配置、常量、基础类等，供客户端和服务器端共用。
- 典型模块：`Base/`（基础类）、`Util/`（工具类）、`Logger/`（日志）。

### 其他目录
- `GameConfig/`：游戏配置，分为客户端和服务器端独立配置。
- `NetMessage/`：网络消息协议定义，客户端和服务器端通信的消息结构。
- `tool/`：构建脚本和开发辅助工具。

## 3. API 文件夹说明

- `Client/API/` 和 `Server/API/` 目录下的代码为各自可调用的引擎接口。
- 这些接口用于与底层引擎或第三方库进行交互，提供如网络、渲染、输入、系统调用等功能。
- 业务逻辑通过这些 API 与底层解耦。

## 4. 网络模块示例（以客户端为例）

以 `Client/Skywalker/Module/Net/SKYC_Module_Net.lua` 为例：

- 提供注册、反注册、发送网络消息的接口。
- 通过 SL（引擎API）与底层网络通信。
- 支持消息回调注册与调试日志输出。

```lua
-- 注册网络消息
function SKYC_Module_Net:RegisterNetMsg(msgID, callFunc)
    -- ...参数检查...
    msgHandler[msgID] = callFunc
    SL:RegisterLuaNetMsg(msgID, callFunc)
    return true
end

-- 发送网络消息
function SKYC_Module_Net:SendNetMsg(msgID, arg1, arg2, arg3, msgData)
    SL:SendLuaNetMsg(msgID, arg1, arg2, arg3, msgData)
    -- ...调试日志...
    return true
end
```

## 5. 代码风格与模块化建议

- 客户端与服务器端通过各自的 API 目录与底层引擎交互，业务逻辑与引擎解耦。
- 通用逻辑尽量抽离到 Framework，便于维护和复用。
- 网络通信通过 NetMessage 统一协议，客户端和服务器端各自实现消息处理模块。

---

如需进一步了解各模块功能或调用关系，可查阅对应目录下的代码和注释。
