include("Market_Def/zh.lua") --个人封装函数

function show(actor,yemian)
	
	local msg = [[
		<Img|width=530|height=200|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=zhangheng/176.png|reset=1|show=0>
<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
<Text|ax=0.5|ay=0.5|x=264.0|y=31.5|color=251|size=18|text=火龙使者>
<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
<RText|ax=0|ay=0.5|x=22.0|y=72.5|size=18|color=255|text=盘古大帝一直守护者火龙神的秘密，只有消灭了<盘古大帝/FCOLOR=70>，并>
<RText|ay=0.5|x=22.0|y=102.5|color=255|size=18|text=且给老夫<五十个紫水晶矿/FCOLOR=253>，我才能送你前往火龙神殿探险>
<Text|ay=0.5|x=229.0|y=152.5|size=18|color=250|text=我要前往|link=@qianwang>



	]]
	say(actor,msg)
end


function qianwang(actor)
	local monlist = getmapmon("pgjd","盘古大帝",17,18,20)
	if #monlist > 0 then
		sendmsg9(actor,"请先消灭盘古大帝")
		return
	end
	if itemcount(actor,"紫水晶矿") < 50 then
		sendmsg9(actor,"紫水晶矿不足")
		return
	end
	takeitem(actor,"紫水晶矿",50)
	mapmove(actor,"hlsd",18,73,1)
	sendmsg0(actor,"ぐ【系统】勇敢的勇士:“".. getname(actor) .."”进入火龙神殿寻找高级装备去了，大家祝福他吧…",117,94)
end