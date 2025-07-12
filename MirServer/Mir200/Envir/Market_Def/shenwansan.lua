include("Market_Def/zh.lua") --个人封装函数

function show(actor)
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=仓库保管员>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<Text|x=25.0|y=65.0|color=255|size=18|text=你好，勇士老夫可以帮你保管重要物品哦.....>
		<Text|ay=0.5|x=51.0|y=147.5|size=18|color=250|text=兑换金条|link=@jintiaoshow>
		<Img|x=26.0|y=139.0|img=zhangheng/211.png|esc=0>
		<Text|ay=0.5|x=51.0|y=200.5|size=18|color=250|text=扩展背包仓库|link=@kuozhan>
		<Img|x=26.0|y=192.0|img=zhangheng/211.png|esc=0>
		<Text|ay=0.5|x=229.0|y=200.5|size=18|color=251|text=存仓|link=@opencangku>
		<Img|x=204.0|y=192.0|img=zhangheng/211.png|esc=0>
		<Text|ay=0.5|x=403.0|y=200.5|size=18|color=251|text=取回|link=@opencangku>
		<Img|x=378.0|y=192.0|img=zhangheng/211.png|esc=0>
		<Text|x=25.0|y=95.0|color=249|size=18|outline=1|text=金币兑换成金条可在拍卖行寄售换取元宝>

	]]
	
	if getint(actor,"累计充值") >= 1000 or getint(actor,"武穆遗书金砖可见") == 1 or getint(actor,"经脉等级") >= 8 then
		msg=msg.."<Text|ay=0.5|x=229.0|y=147.5|size=18|color=250|text=兑换金砖|link=@jinzhuanshow>"
		msg=msg.."<Img|x=204.0|y=139.0|img=zhangheng/211.png|esc=0>"
	end
	if getbaseinfo(actor,39) >= 1 or getlevel(actor) >= 65 then
		msg=msg.."<Text|ay=0.5|x=403.0|y=147.5|size=18|color=250|text=兑换金盒|link=@jinheshow>"
		msg=msg.."<Img|x=378.0|y=139.0|img=zhangheng/211.png|esc=0>"
	end
	
	say(actor,msg)
end

function kuozhan(actor)
	callscriptex(actor, "CallLua", "QFunction-0", "@stdmodefunc585") --扩展面板
end
function opencangku(actor)
	callfunbynpc(actor, 999999999, 0, 'open_cangku', '') --NPC必须有功能标志 所以调用到其他地方
end
function jinheshow(actor)

	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=仓库保管员>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<Text|x=25.0|y=63.0|color=255|size=18|text=老夫这里可以把金砖兑换成金盒,需要兑换吗？>
		<Text|ay=0.5|x=403.0|y=205.5|size=18|color=250|text=兑换金盒|link=@huanjinhe>
		<Img|x=378.0|y=197.0|img=zhangheng/211.png|esc=0>
		<Text|ay=0.5|x=51.0|y=205.5|size=18|color=250|text=返回主页|link=@show>
		<Img|x=26.0|y=197.0|img=zhangheng/211.png|esc=0>
		<RText|x=25.0|y=133.0|color=161|size=18|text=需要：<4/FCOLOR=250>块金砖+<　　　　/FCOLOR=253>可兑换一块<金盒/FCOLOR=251>>
		<Img|x=162.0|y=114.0|img=zhangheng/231.png|esc=0>

	]]
	msg=msg.."<ItemShow|x=156.0|y=109.0|width=70|height=70|itemid=".. getidbyname("金箔") .."|itemcount=1|showtips=1|bgtype=0>"
	say(actor,msg)
end

function huanjinhe(actor)
	if itemcount(actor,"金砖") < 4 or itemcount(actor,"金箔") < 1 then
		sendmsg9(actor,"条件不足")
		return
	end
	takeitem(actor,"金砖",4)
	takeitem(actor,"金箔",1)
	giveitem(actor,"金盒",1)
	sendmsg9(actor,"兑换金盒成功")
	return jinheshow(actor)
end

function jinzhuanshow(actor)
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=仓库保管员>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<Text|x=25.0|y=63.0|color=255|size=18|text=老夫这里可以把金条兑换成金砖,需要兑换吗？>
		<Text|ay=0.5|x=403.0|y=205.5|size=18|color=250|text=兑换金砖|link=@huanjinzhuan>
		<Img|x=378.0|y=197.0|img=zhangheng/211.png|esc=0>
		<Text|ay=0.5|x=51.0|y=205.5|size=18|color=250|text=返回主页|link=@show>
		<Img|x=26.0|y=197.0|img=zhangheng/211.png|esc=0>
		<RText|x=25.0|y=133.0|color=161|size=18|text=需要：<5/FCOLOR=250>根金条+<　　　　/FCOLOR=253>可兑换一块<金砖/FCOLOR=251>>
		<Img|x=162.0|y=114.0|img=zhangheng/231.png|esc=0>

	]]
	msg=msg.."<ItemShow|x=156.0|y=109.0|width=70|height=70|itemid=".. getidbyname("金锭") .."|itemcount=1|showtips=1|bgtype=0>"
	say(actor,msg)
end

function huanjinzhuan(actor)
	if itemcount(actor,"金条") < 5 or itemcount(actor,"金锭") < 1 then
		sendmsg9(actor,"条件不足")
		return
	end
	takeitem(actor,"金条",5)
	takeitem(actor,"金锭",1)
	giveitem(actor,"金砖",1)
	sendmsg9(actor,"兑换金砖成功")
	return jinzhuanshow(actor)
end

function jintiaoshow(actor)
	if getgold(actor) < 1000000 then
		sendmsg9(actor,"您没有100万非绑定金币")
		return
	end
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=仓库保管员>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<Text|x=25.0|y=63.0|color=255|size=18|text=老夫这里可以把金币兑换金条哦,也可把所有金条一键换成金币>
		<Text|ay=0.5|x=403.0|y=205.5|size=18|color=250|text=兑换金条|link=@huanjintiao>
		<Img|x=378.0|y=197.0|img=zhangheng/211.png|esc=0>
		<Text|ay=0.5|x=51.0|y=205.5|size=18|color=250|text=返回主页|link=@show>
		<Img|x=26.0|y=197.0|img=zhangheng/211.png|esc=0>
		<RText|x=25.0|y=133.0|color=161|size=18|text=需要：<102万/FCOLOR=250>金币+<　　　　/FCOLOR=253>可兑换一根<金条/FCOLOR=251>>
		<Img|x=182.0|y=114.0|img=zhangheng/231.png|esc=0>
		<Text|ay=0.5|x=203.0|y=205.5|size=18|color=250|text=金条一键换金币|link=@yijianhuanjin1>
		<Img|x=178.0|y=197.0|img=zhangheng/211.png|esc=0>

	]]
	msg=msg.."<ItemShow|x=176.0|y=109.0|width=70|height=70|itemid=".. getidbyname("金矿石") .."|itemcount=10|showtips=1|bgtype=0>"
	say(actor,msg)
end

function yijianhuanjin1(actor)
	messagebox(actor,"\n是否一键将所有金条兑换成金币？","@yijianhuanjin","@kong")
end

function yijianhuanjin(actor)
	local sl = itemcount(actor,"金条")
	if sl == 0 then
		sendmsg9(actor,"你没有金条")
		return
	end
	local goldsl = sl * 1000000
	if getgold(actor) + goldsl > 2100000000 then
		sendmsg9(actor,"背包可携带金币最高21亿，请点击金条使用")
		return
	end
	takeitem(actor,"金条",sl)
	addgold(actor,goldsl)
	sendmsg9(actor,"一键成功兑换"..sl.."根金条")
end

function huanjintiao(actor)
	if getgold(actor) < 1020000 and getbindgold(actor) >= 1020000 then
		sendmsg9(actor,"您的非绑定金币不足102万")
		return
	end
	if getbindgold(actor) < 1020000 then
		sendmsg9(actor,"您的金币不足102万")
		return
	end

	if itemcount(actor,"金矿石") < 10 then
		sendmsg9(actor,"金矿石不足10个")
		return
	end
	
	
	subgold(actor,1020000)
	takeitem(actor,"金矿石",10)
	giveitem(actor,"金条",1)
	sendmsg9(actor,"兑换金条成功")
	post(actor,"金条合成数量*1")
end