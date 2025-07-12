# 打包说明

本项目提供了自动化打包脚本，便于将客户端和服务器端代码分别部署到指定目录。

## 步骤

1. 修改 `build.bat` 中的 `SERVER_PATH` 和 `CLIENT_PATH` 为你项目的实际路径（可用相对或绝对路径）。

```bat
@REM Server Path MirServer/Mir200
set SERVER_PATH="F:/996Box/Lua/MirServer/Mir200"

@REM Client Path 996M2/dev
set CLIENT_PATH="F:/996Box/Lua/996M2_debug/dev"
```

2. 运行 `build.bat` 脚本。

3. 客户端需在 `dev\GUILayout\GUIUtil.lua` 中增加：

```lua
SL:Require("Skywalker/Source/SkywalkerC.lua", true)
```

4. 服务器需在 `Mir200\Envir\Market_Def\QFunction-0.lua` 中增加：

```lua
Include("Skywalker/Source/SkywalkerS.lua")
```

如有疑问请查阅 FAQ 或联系维护者。
