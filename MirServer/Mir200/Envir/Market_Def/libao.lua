include("Market_Def/zh.lua") --个人封装函数
local gz_item_t = {{"经验宝典",3},{"蚕丝",20},{"金蚕丝",20}}
function show(actor)

	local msg = [[
		<Img|x=0|width=636|height=498|bg=1|show=4|scale9r=50|scale9l=50|scale9b=50|move=1|esc=1|loadDelay=1|scale9t=50|img=zhangheng/1.png|reset=0>
<Button|x=633.0|y=1.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
<Img|x=17.0|y=39.0|img=zhangheng/271.png|esc=0>

<RText|x=51.0|y=319.0|outline=2|color=255|size=18|text=<QQ交流群：/FCOLOR=251><672159629/FCOLOR=254>>
<RText|x=43.0|y=356.0|color=255|size=18|outline=2|text=<元宝回收问题，游戏问题，游戏不会玩，外挂举报，均可咨询游戏客服/FCOLOR=250>>


	]]
	
	if getint(actor,"累计充值") >= 300 then  
		msg = msg ..'<Img|x=55.0|y=126.0|width=180|height=170|esc=0|img=zhangheng/277.png>'
	else
		msg = msg ..'<Img|x=55.0|y=126.0|width=180|height=170|esc=0|img=zhangheng/377.png>'
	end

	say(actor,msg)
end

function show1(actor)
	local msg = [[
		<Img|x=0|width=636|height=498|bg=1|reset=0|scale9r=50|scale9l=50|scale9b=50|move=1|loadDelay=1|esc=1|scale9t=50|img=zhangheng/1.png|show=4>
<Button|x=633.0|y=1.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
<Img|x=17.0|y=39.0|width=600|height=434|esc=0|img=zhangheng/270.png>
<Img|x=58.0|y=200|width=138|height=139|esc=0|img=zhangheng/274.png>
<RText|x=276.0|y=190.0|color=255|size=18|text=1.使用微信扫一扫或者截屏微信识别>
<RText|x=276.0|y=225.0|color=255|size=18|text=2.关注后将兑换码输入即可领取礼包>
<RText|x=276.0|y=260.0|color=255|size=18|text=3.微信公众号搜索　<顺天网络/FCOLOR=250>>
<Img|x=359.0|y=410.0|img=zhangheng/276.png|esc=0>
<Text|x=262.0|y=422.0|color=255|size=16|text=输入礼包码>
<Button|x=509.0|y=412.0|color=255|size=18|submitInput=1|nimg=zhangheng/13.png|text=领取奖励|link=@lingqulibao>
<Input|x=366.0|y=418.0|width=120|height=25|color=251|type=0|size=16|inputid=1>
<RText|x=90.0|y=381.0|outline=2|color=255|size=18|text=<元宝回收问题，游戏问题，游戏不会玩，均可咨询游戏客服/FCOLOR=250>>


	]]

		for i = 1,#gz_item_t do
			msg=msg.."<Img|x=".. 312+(i-1)*80 .."|y=303.0|img=zhangheng/275.png|esc=0>"
			msg=msg.."<ItemShow|x=".. 310+(i-1)*80 .."|y=301.0|itemid=".. getidbyname(gz_item_t[i][1]) .."|itemcount=".. gz_item_t[i][2] .."|showtips=1|bgtype=0>"
		end

	say(actor,msg)
end

function lingqulibao(actor)
	local code = getconst(actor,'<$NPCINPUT(1)>')
	if code ~= "888888" and code ~= "666666" then
		sendmsg9(actor,"请输入正确的礼包码")
		return
	end
	if code == "888888" then
		if getint(actor,"领取公众号礼包") == 1 then
			sendmsg9(actor,"你已经领取过了")
			return
		end
		setint(actor,"领取公众号礼包",1)
		for i = 1,#gz_item_t do
			giveitem(actor,gz_item_t[i][1],gz_item_t[i][2],370)
		end
		setint(actor,"公众号隐藏",getint(actor,"公众号隐藏")+1)
	else
		if getint(actor,"领取抖音礼包") == 1 then
			sendmsg9(actor,"你已经领取过了")
			return
		end
		setint(actor,"领取抖音礼包",1)
		giveitem(actor,"经验宝典",3,370)
		giveitem(actor,"强效太阳水包",5,370)
		giveitem(actor,"金蚕丝",20,370)
		setint(actor,"公众号隐藏",getint(actor,"公众号隐藏")+1)
	end
	if getint(actor,"领取公众号礼包") == 1 and getint(actor,"领取抖音礼包") == 1 then
		callscriptex(actor, "CallLua", "QFunction-0", "@tubiaoxianshi")
	end
	
	sendmsg9(actor,"领取成功")
end

