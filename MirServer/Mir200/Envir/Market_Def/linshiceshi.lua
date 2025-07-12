include("Market_Def/zh.lua") --个人封装函数

function show(actor)
	local msg = [[
		<Img|move=0|img=public/bg_npc_01.png|loadDelay=1|bg=1|reset=1|show=0>
		<Layout|x=545|y=0|width=80|height=80|link=@exit>
		<Button|x=546|y=0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Text|x=25|y=20|color=255|size=18|text=75级玩家只需要 50万经验卷*10 + 金砖*2 即可升级到76>
		<Text|x=25.0|y=47.0|color=250|size=18|text=确定升级|link=@shengji>
		<Text|x=25.0|y=83.0|color=255|size=18|text=金币1100000+金矿石>
		<Text|x=25.0|y=110.0|color=255|size=18|text=5个金条+金锭>
		<Text|x=25.0|y=137.0|color=255|size=18|text=4个金砖+金箔>
		<Text|x=277.0|y=82.0|color=250|size=18|text=合成金条|link=@hecheng1>
		<Text|x=277.0|y=112.0|color=250|size=18|text=合成金砖|link=@hecheng2>
		<Text|x=277.0|y=142.0|color=250|size=18|text=合成金盒|link=@hecheng3>
	]]
	
	say(actor,msg)
end

function shengji(actor)
	if getlevel(actor) ~= 75 then
		sendmsg9(actor,"75级才可以升级")
		return
	end
	if itemcount(actor,"50万经验卷") < 10 or itemcount(actor,"金砖") < 2 then
		sendmsg9(actor,"经验卷或金盒不足")
		return
	end
	takeitem(actor,"50万经验卷",10)
	takeitem(actor,"金砖",2)
	setlevel(actor,76)
	gmexecute(actor,"jy",getname(actor),0)
end

function hecheng1(actor)
	if getgold(actor) < 1100000 or itemcount(actor,"金矿石") < 1 then
		sendmsg9(actor,"条件不足")
		return
	end
	subgold(actor,1100000)
	takeitem(actor,"金矿石",1)
	giveitem(actor,"金条",1)
end

function hecheng2(actor)
	if itemcount(actor,"金条") < 5 or itemcount(actor,"金锭") < 1 then
		sendmsg9(actor,"条件不足")
		return
	end
	takeitem(actor,"金条",5)
	takeitem(actor,"金锭",1)
	giveitem(actor,"金砖",1)
end

function hecheng3(actor)
	if itemcount(actor,"金砖") < 4 or itemcount(actor,"金箔") < 1 then
		sendmsg9(actor,"条件不足")
		return
	end
	takeitem(actor,"金砖",4)
	takeitem(actor,"金箔",1)
	giveitem(actor,"金盒",1)
end

