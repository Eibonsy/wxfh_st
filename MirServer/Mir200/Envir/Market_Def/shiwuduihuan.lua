include("Market_Def/zh.lua") --个人封装函数

local shiwu_t = {
	{"辣条",10,"005001"},{"大白兔奶糖",20,"005002"},{"老冰棍",50,"005003"},{"西瓜泡泡糖",100,"005004"},{"青蛙橡皮",500,"005005"},{"文具盒",1000,"005006"},{"太阳锅巴",5000,"005007"},{"奥特曼卡片",10000,"005008"},
}
function show(actor)
	local msg = [[
		<Img|x=0|width=556|height=416|bg=1|scale9r=50|scale9t=50|scale9b=50|move=1|scale9l=50|esc=1|loadDelay=1|img=zhangheng/1.png|reset=0|show=4>
		<Button|x=552.0|y=1.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=16.5|y=38.5|img=zhangheng/204.png|esc=0>
		<RText|ay=0.5|x=63.0|y=362.5|color=161|outline=1|size=18|text=击杀任何怪物，都有几率掉落实物，可在此处兑换元宝>
	]]
	for i = 1,#shiwu_t do
		msg = msg.."<Img|x=".. 60.5-2 + (i-1)%4*125 .."|y=".. 117.5 + math.floor((i-1)/4)*110 .."|img=zhangheng/205.png|esc=0>"
		msg = msg.."<ItemShow|x=".. 58-2 + (i-1)%4*125 .."|y=".. 116 + math.floor((i-1)/4)*110 .."|width=70|height=70|itemid=".. getidbyname(shiwu_t[i][1]) .."|itemcount=1|showtips=1|scale=0|bgtype=0>"
		msg = msg.."<Img|x=".. 60.5-2 + (i-1)%4*125 .."|y=".. 117.5 + math.floor((i-1)/4)*110 .."|img=zh/".. shiwu_t[i][3] ..".png|esc=0>"
		msg = msg.."<Button|x=".. 24.5+5 + (i-1)%4*125 .."|y=".. 182.5 + math.floor((i-1)/4)*110 .."|width=120|nimg=zh/20.png|color=150|size=16|text=兑换".. shiwu_t[i][2] .."元宝|link=@duihuan,"..i..">"
	end
	
	say(actor,msg)
end

function duihuan(actor,par)
	par = tonumber(par)
	if itemcount(actor,shiwu_t[par][1]) < 1 then
		sendmsg9(actor,"你没有"..shiwu_t[par][1])
		return
	end
	takeitem(actor,shiwu_t[par][1],1)
	addingot(actor,shiwu_t[par][2])
	sendmsg9(actor,"兑换成功，获得元宝"..shiwu_t[par][2],"#00FF00")
end
