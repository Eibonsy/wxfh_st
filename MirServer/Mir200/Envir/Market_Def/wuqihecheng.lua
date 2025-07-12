include("Market_Def/zh.lua") --个人封装函数
function show(actor)
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=武器锻造>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<RText|ax=0|ay=0.5|x=22.0|y=70.0|color=255|size=18|text=小伙子，老夫已经很久没来玛法大陆了， 今天心情特别好>
	<RText|ay=0.5|x=22.0|y=95.0|color=255|size=18|text=既然今天你碰巧遇到我, 那就让你见识一下老夫的手艺吧>
	<RText|ay=0.5|x=22.0|y=120.0|color=255|size=18|text=想要锻造出黄金系列武器？>
	<RText|ay=0.5|x=22.0|y=145.0|color=255|size=18|text=那你需要<屠龙*2+嗜魂法杖*2+霸者之刃*2/FCOLOR=250>+100万金币>
	<RText|ay=0.5|x=22.0|y=170.0|color=255|size=18|text=此武器蕴含特殊属性，请在游戏中体会...>
	<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
	<Text|x=22.0|y=203.0|color=250|size=18|text=锻造  →>
	<Text|x=105.0|y=203.0|color=251|size=18|text=黄金屠龙|link=@hecheng,1>
	<Text|x=220.0|y=203.0|color=251|size=18|text=赤金逍遥扇|link=@hecheng,2>
	<Text|x=356.0|y=203.0|color=251|size=18|text=紫金嗜魂法杖|link=@hecheng,3>

	]]
	say(actor,msg)
end

local givet = {"黄金屠龙","赤金逍遥扇","紫金嗜魂法杖"}
function hecheng(actor,par)
	par = tonumber(par)
	if itemcount(actor,"屠龙") < 2 or itemcount(actor,"嗜魂法杖") < 2 or itemcount(actor,"霸者之刃") < 2 then
		sendmsg9(actor,"材料不足")
		return
	end
	if getbindgold(actor) < 1000000 then
		sendmsg9(actor,"金币不足")
		return
	end
	takeitem(actor,"屠龙",2)
	takeitem(actor,"嗜魂法杖",2)
	takeitem(actor,"霸者之刃",2)
	subbindgold(actor,1000000)
	giveitem(actor,givet[par],1)
	sendmsg9(actor,"锻造成功")
end