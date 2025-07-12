include("Market_Def/zh.lua") --个人封装函数
function show(actor,xianshi)
	xianshi = tonumber(xianshi) or 0
	local msg = [[
	<Img|x=0.0|y=1.0|width=450|height=480|bg=1|loadDelay=1|scale9r=10|scale9t=10|scale9b=10|move=0|reset=1|esc=1|scale9l=10|img=public/bg_npc_04.jpg|show=0>
	<Button|x=449.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=10.0|y=11.0|width=430|height=460|scale9l=10|scale9b=10|img=zhangheng/210.png|scale9r=10|scale9t=10|esc=0>
	<Img|x=10.0|y=50.0|width=430|img=zhangheng/203.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=228.0|y=32.5|color=251|size=18|text=挂机先锋官>
	<Text|x=29.0|y=65.0|size=18|color=116|text=设置挂机模式>
	<Text|ax=0|ay=0.5|x=86.0|y=109.0|size=18|color=254|text=普通模式>
	<Text|ax=0|ay=0.5|x=304.0|y=109.5|size=18|color=253|text=骨灰模式>
	<Text|x=29.0|y=140.0|size=18|color=116|text=选择挂机地图>
	<Text|ax=0|ay=0.5|x=86.0|y=184.5|size=18|color=161|text=1号挂机地图>
	<Text|ax=0|ay=0.5|x=304.0|y=184.5|size=18|color=161|text=2号挂机地图>
	<Text|ax=0|ay=0.5|x=86.0|y=238.5|size=18|color=161|text=3号挂机地图>
	<Text|ax=0|ay=0.5|x=304.0|y=238.5|size=18|color=161|text=4号挂机地图>
	<Text|ax=0|ay=0.5|x=86.0|y=313.5|size=18|color=222|text=自动修理>

	<Img|x=10.0|y=346.0|width=430|img=zhangheng/203.png|esc=0>
	<RText|x=27.0|y=367.0|color=255|size=18|text=提示：<普通免费/FCOLOR=254>，<骨灰模式每分钟收取5点挂机点/FCOLOR=253>>
	<Button|x=184.0|y=407.0|color=10051|size=18|nimg=zhangheng/13.png|text=开始挂机|link=@guaji>
	<Button|x=14.0|y=435.0|color=255|size=18|nimg=zhangheng/8.png|link=@show,1>
	]]
	msg = msg .. "<RText|x=29.0|y=269.0|size=18|color=116|text=其他功能设置>"
	msg = msg .. "<RText|x=29.0|y=289.0|size=18|color=116|text=　　　　　　　　　　　<当前挂机点数为："..getint(actor,"挂机点数").."/FCOLOR=31>>"
	--普通模式勾选
	if getint(actor,"挂机模式") == 1 then
		msg = msg .. "<Img|x=51.0|y=96.0|img=zh/78.png|link=@moshishezhi,0>"
	else
		msg = msg .. "<Img|x=51.0|y=96.0|img=zh/77.png|link=@moshishezhi,1>"
	end
	--骨灰模式勾选
	if getint(actor,"挂机模式") == 2 then
		msg = msg .. "<Img|x=269.0|y=96.0|img=zh/78.png|link=@moshishezhi,0>"
	else
		msg = msg .. "<Img|x=269.0|y=96.0|img=zh/77.png|link=@moshishezhi,2>"
	end
	
	--挂机点勾选
	if getint(actor,"挂机地图号") == 1 then
		msg = msg .. "<Img|x=51.0|y=171.0|img=zh/78.png|esc=0|link=@setdituhao,0>"
	else
		msg = msg .. "<Img|x=51.0|y=171.0|img=zh/77.png|esc=0|link=@setdituhao,1>"
	end
	if getint(actor,"挂机地图号") == 2 then
		msg = msg .. "<Img|x=269.0|y=171.0|img=zh/78.png|esc=0|link=@setdituhao,0>"
	else
		msg = msg .. "<Img|x=269.0|y=171.0|img=zh/77.png|esc=0|link=@setdituhao,2>"
	end
	if getint(actor,"挂机地图号") == 3 then
		msg = msg .. "<Img|x=51.0|y=225.0|img=zh/78.png|esc=0|link=@setdituhao,0>"
	else
		msg = msg .. "<Img|x=51.0|y=225.0|img=zh/77.png|esc=0|link=@setdituhao,3>"
	end
	if getint(actor,"挂机地图号") == 4 then
		msg = msg .. "<Img|x=269.0|y=225.0|img=zh/78.png|esc=0|link=@setdituhao,0>"
	else
		msg = msg .. "<Img|x=269.0|y=225.0|img=zh/77.png|esc=0|link=@setdituhao,4>"
	end
	--自动修理勾选
	if getint(actor,"自动修理") == 1 then
		msg = msg .. "<Img|x=51.0|y=300.0|img=zh/78.png|esc=0|link=@setxiuli,0>"
	else
		msg = msg .. "<Img|x=51.0|y=300.0|img=zh/77.png|esc=0|link=@setxiuli,1>"
	end
	
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@show>"
		msg=msg..[[
		<Img|ay=0.5|x=52.0|y=323.0|width=340|height=280|scale9t=10|scale9l=10|img=zh/7.png|scale9r=10|esc=0|scale9b=10>
		<RText|x=190.0|y=193.0|color=251|size=16|text=挂机说明>
		<RText|x=64.0|y=222.0|width=344|size=16|color=255|text=⒈官方考虑到不影响玩家的休息时间和>
		<RText|x=80.0|y=247.0|width=344|color=255|size=16|text=与其他玩家拉开等级差距，特此推出>
		<RText|x=81.0|y=272.0|width=344|size=16|color=255|text=<安全挂机/FCOLOR=250>功能>
		<RText|x=64.0|y=302.0|width=344|size=16|color=255|text=⒉官方推出<"普通挂机"/FCOLOR=254>与<"骨灰挂机"/FCOLOR=253>两种>
		<RText|x=80.0|y=327.0|width=344|color=255|size=16|text=挂机模式,普通挂机为多个玩家公共地图>
		<RText|x=80.0|y=352.0|width=344|color=255|size=16|text=骨灰挂机为个人境像地图>
		<RText|x=64.0|y=382.0|width=344|size=16|color=242|text=自动修理>
		<RText|x=64.0|y=407.0|width=344|size=16|color=255|text=挂机过程中系统每隔60分钟>
		<RText|x=64.0|y=432.0|width=344|color=255|size=16|text=自动帮你修理装备,每次收费1万金币>
		]]
	end
	
	say(actor,msg)
end

function setxiuli(actor,par)
	par = tonumber(par)
	setint(actor,"自动修理",par)
	return show(actor)
end

function setdituhao(actor,par)
	par = tonumber(par)
	setint(actor,"挂机地图号",par)
	return show(actor)
end

function moshishezhi(actor,par)
	par = tonumber(par)
	setint(actor,"挂机模式",par)
	return show(actor)
end

function guaji(actor)
	local dituhao = getint(actor,"挂机地图号")
	if getint(actor,"挂机模式") == 0 or getint(actor,"挂机地图号") == 0 then
		sendmsg9(actor,"请先选择挂机模式和地图")
		return
	end
	if getint(actor,"挂机模式") == 1 then --普通挂机
		map(actor,"aqgj"..getint(actor,"挂机地图号"))
		return
	end
	
	if getint(actor,"挂机点数") < 5 then
		sendmsg9(actor,"挂机点数不足，请先获取点数或选择普通模式")
		return
	end
	setint(actor,"挂机点数",getint(actor,"挂机点数")-5)
	addmirrormap("d715",getname(actor),"骨灰挂机地图",999999,3)
	map(actor,getname(actor))
	genmon(getname(actor),200,200,"红野猪4",200,150)
	genmon(getname(actor),200,200,"黑野猪4",200,150)
	genmon(getname(actor),200,200,"黑色恶蛆4",200,150)
	genmon(getname(actor),200,200,"蝎蛇4",200,150)
end
