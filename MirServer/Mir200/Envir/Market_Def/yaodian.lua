include("Market_Def/zh.lua") --个人封装函数

-----------------------------引路人NPC
function show(actor)
	if getint(actor,"完成任务id") == 15 then
		newdeletetask(actor,16) --删除任务16
		setint(actor,"完成任务id",16)
		addbindgold(actor,10000)
		sendmsg9(actor,"了解药品，获得金币*10000")
		callscriptex(actor, "CallLua", "QFunction-0", "@renwupanduan") --任务系统
	end
	
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Img|x=9.0|y=9.0|height=232|img=zhangheng/210.png|esc=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=药店老板>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<Text|x=25.0|y=65.0|color=255|size=18|text=你好，我是给冒险者提供药品服务的老者，请问需要点什么？>
	<Text|ay=0.5|x=51.0|y=111.5|size=18|color=250|text=购买药品|link=@goumaiyaopin>
	<Img|x=26.0|y=103.0|img=zhangheng/211.png|esc=0>
	<Text|ay=0.5|x=51.0|y=156.5|size=18|color=250|text=打听经验宝典|link=@jingyanbaodian>
	<Img|x=26.0|y=148.0|img=zhangheng/211.png|esc=0>
	
	<Text|ay=0.5|x=51.0|y=201.5|color=250|size=18|text=好的，我知道了|link=@exit>
	<Img|x=26.0|y=193.0|img=zhangheng/211.png|esc=0>

	]]
	--[[if getmap(actor) == "3" then
		msg=msg.."<Text|ay=0.5|x=337.0|y=201.5|color=253|size=18|text=比奇药店也可买药哦>"
		msg=msg.."<Img|x=312.0|y=193.0|img=zhangheng/211.png|esc=0>"
	end--]]
	
	--if getlevel(actor) >= 52 then
		msg=msg.."<Text|ay=0.5|x=337.0|y=156.5|size=18|color=250|text=打听药品捆绳|link=@kunsheng>"
		msg=msg.."<Img|x=312.0|y=148.0|img=zhangheng/211.png|esc=0>"
	--end
	say(actor,msg)
end

function kunsheng(actor)
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Img|x=9.0|y=9.0|height=232|img=zhangheng/210.png|esc=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=药店老板>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<Text|x=25.0|y=65.0|color=255|size=18|text=老夫从赤月峡谷带回的捆绳，可将万年雪霜和疗伤药打捆>
	<Text|x=25.0|y=94.0|color=255|size=18|text=我愿意用药品捆绳跟你交换兽魂值或声望，你愿意吗？>
	
	<Text|x=404.0|y=140.0|size=18|color=250|text=确定交换|link=@kun,1>
	<Text|x=404.0|y=190.0|size=18|color=250|text=确定交换|link=@kun,2>

	]]
	msg=msg.."<RText|x=25.0|y=140.0|color=255|size=18|text=<15/FCOLOR=250>点兽魂可交换<药品捆绳/FCOLOR=116>*10>"
	msg=msg.."<RText|x=25.0|y=190.0|color=255|size=18|text=<50/FCOLOR=250>点声望可交换<药品捆绳/FCOLOR=116>*10>"
	say(actor,msg)
end

function kun(actor,par)
	par = tonumber(par)
	if par == 1 then
		if getshouhunzhi(actor) < 15 then
			sendmsg9(actor,"兽魂值不足")
			return
		end
		subshouhunzhi(actor,15)
	else
		if getshengwang(actor) < 50 then
			sendmsg9(actor,"声望不足")
			return
		end
		subshengwang(actor,50)
	end
	giveitem(actor,"药品捆绳",10,370)
	sendmsg9(actor,"兑换成功")
	return kunsheng(actor)
end


function jingyanbaodian(actor)
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Img|x=9.0|y=9.0|height=232|img=zhangheng/210.png|esc=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=药店老板>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<Text|x=25.0|y=65.0|color=255|size=18|text=你好，老夫可以提供使你升级快的宝典，不过需要道具交换！>
	
	<Text|ay=0.5|x=51.0|y=201.5|color=250|size=18|text=返回主页|link=@show>
	<Img|x=26.0|y=193.0|img=zhangheng/211.png|esc=0>
	<Text|ay=0.5|x=350.0|y=202.0|color=250|size=18|text=确定交换|link=@jiaohuan>
	<Img|x=325.0|y=193.0|img=zhangheng/211.png|esc=0>
	]]
	msg=msg.."<RText|x=25.0|y=114.0|color=255|size=18|text=需要：<15/FCOLOR=250>个紫水晶矿 + <300/FCOLOR=250>个<玛法结晶/FCOLOR=253>可交换<经验宝典/FCOLOR=116>*1>"
	say(actor,msg)
end

function jiaohuan(actor)
	if itemcount(actor,"紫水晶矿") < 15 or itemcount(actor,"玛法结晶") < 300 then
		sendmsg9(actor,"紫水晶矿或玛法结晶不足")
		return
	end
	takeitem(actor,"紫水晶矿",15)
	takeitem(actor,"玛法结晶",300)
	giveitem(actor,"经验宝典",1,370)
	sendmsg9(actor,"兑换成功")
	return jingyanbaodian(actor)
end

local yao_t = {
	{"强效金创药包",1,5000},{"强效魔法药包",1,5000},{"强效太阳水",1,500},{"万年雪霜",1,1500},{"疗伤药",1,2500},{"强效太阳水包",1,2500},{"万年雪霜",10,15000},{"疗伤药",10,25000},{"强效太阳水包",1,1},{"万年雪霜",10,6},{"疗伤药",10,10},{"万年雪霜包",1,10},{"疗伤药包",1,12}
}
function goumaiyaopin(actor,yemian,xzid)
	yemian = tonumber(yemian) or 1
	xzid = tonumber(xzid) or 0
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Img|x=9.0|y=9.0|height=232|img=zhangheng/210.png|esc=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=药店老板>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<RText|x=25.0|y=60.0|color=255|size=16|text=为了给你足够的体验，本服普通药品不占背包，高效续航>
		<RText|x=25.0|y=83.0|color=255|size=16|text=不用再为打怪PK无药而烦恼>
		<RText|x=25.0|y=106.0|color=255|size=16|text=强效金创药包以及强效魔法药包购买后将自动存入内挂保护功能中>
		<RText|x=25.0|y=129.0|color=255|size=16|text=请在内挂保护中设置好使用规则>
		<RText|x=25.0|y=152.0|color=255|size=16|text=每次购买存储量增加<5000/FCOLOR=250>，新人上线赠送<50万/FCOLOR=250>储量>
		
		<Text|ay=0.5|x=51.0|y=214.5|size=18|color=250|text=返回|link=@show>
		<Img|x=26.0|y=206.0|img=zhangheng/211.png|esc=0>
		<Img|x=1.0|y=250.0|img=zh/80.png|link=@kong>
			
	]]

	if yemian == 1 then
		msg=msg.."<Button|x=28.0|y=488.0|nimg=zh/82.png|color=255|size=18|pimg=zh/83.png|link=@kong>"
		msg=msg.."<Button|x=123.0|y=488.0|nimg=zh/84.png|color=255|size=18|pimg=zh/85.png|link=@goumaiyaopin,2>"
	else
		msg=msg.."<Button|x=28.0|y=488.0|nimg=zh/82.png|color=255|size=18|pimg=zh/83.png|link=@goumaiyaopin,1>"
		msg=msg.."<Button|x=123.0|y=488.0|nimg=zh/84.png|color=255|size=18|pimg=zh/85.png|link=@kong>"
	end
	
	msg=msg.."<Text|ax=0.5|ay=0.5|x=99.5|y=512.5|color=255|size=18|text=".. yemian .."/2>"
	
	

	local xuhao = 0
	for i = 1+(yemian-1)*8,8+(yemian-1)*8 do
		if yao_t[i] == nil then
			break
		end
		if i >= 12 then
			if getlevel(actor) < 65 and getbaseinfo(actor,39) == 0 then
				break
			end
		end
		
		msg=msg.."<Img|x=".. 19+xuhao%2*149 .."|y=".. 268+math.floor(xuhao/2)*52 .."|width=145|height=50|esc=0|img=zhangheng/148.png|link=@goumaiyaopin,".. yemian..",".. i ..">"
		msg=msg.."<Img|x=".. 20+xuhao%2*149 .."|y=".. 269+math.floor(xuhao/2)*52 .."|img=zh/81.png|esc=0>"
		msg=msg.."<ItemShow|x=".. 11+xuhao%2*149 .."|y=".. 260+math.floor(xuhao/2)*52 .."|width=70|height=70|itemid=".. getidbyname(yao_t[i][1]) .."|itemcount=1|showtips=1|bgtype=0>"
		if yao_t[i][2] > 1 then
			msg=msg.."<Text|ay=0.5|x=".. 23+xuhao%2*149 .."|y=".. 305+math.floor(xuhao/2)*52 .."|outline=1|color=255|size=14|text=".. yao_t[i][2] ..">"
		end
		msg=msg.."<Text|ay=0.5|x=".. 70+xuhao%2*149 .."|y=".. 283+math.floor(xuhao/2)*52 .."|color=255|size=14|text=".. yao_t[i][1] ..">"
		if i >= 9 then
			msg=msg.."<Text|ay=0.5|x=".. 70+xuhao%2*149 .."|y=".. 305+math.floor(xuhao/2)*52 .."|color=255|size=14|text=".. yao_t[i][3] .."元宝>"
		else
			msg=msg.."<Text|ay=0.5|x=".. 70+xuhao%2*149 .."|y=".. 305+math.floor(xuhao/2)*52 .."|color=255|size=14|text=".. yao_t[i][3] .."金币>"
		end
		if xzid == i then
			msg=msg.."<Img|x=".. 18+xuhao%2*149 .."|y=".. 267+math.floor(xuhao/2)*52 .."|width=147|height=52|scale9b=0|scale9r=0|scale9t=0|img=zhangheng/45.png|scale9l=0|esc=0>"
		end

		xuhao = xuhao + 1
	end
		
	msg=msg.."<Button|x=228.0|y=497.0|nimg=zh/86.png|color=255|size=18|pimg=zh/87.png|link=@goumai,".. xzid ..">"
	say(actor,msg)
end

function goumai(actor,par)
	local sh_data = getshouhunbuffdata(actor) --获取兽魂buff数据
	local zhekou = 1
	for i = 1,#sh_data do
		if sh_data[i] == "救死扶伤" then
			zhekou = 0.8
		end
	end
	
	par = tonumber(par)
	if par == 0 then
		sendmsg9(actor,"请选择购买的药品")
		return
	end
	if par == 1 then
		if getint(actor,"存储红量") >= 500000 then
			sendmsg9(actor,"HP存储量已满")
			return
		end
		if getbindgold(actor) < 5000*zhekou then
			sendmsg9(actor,"金币不足".. 5000*zhekou)
			return
		end
		subbindgold(actor,5000*zhekou)
		setint(actor,"存储红量",getint(actor,"存储红量")+5000)
		if getint(actor,"存储红量") >= 500000 then
			setint(actor,"存储红量",500000)
		end
		sendmsg9(actor,"购买成功，当前HP储量"..getint(actor,"存储红量"))
		callscriptex(actor, "CallLua", "QFunction-0", "@chuliangxiangshi")
		return
	end
	if par == 2 then
		if getint(actor,"存储蓝量") >= 500000 then
			sendmsg9(actor,"MP存储量已满")
			return
		end
		if getbindgold(actor) < 5000*zhekou then
			sendmsg9(actor,"金币不足".. 5000*zhekou)
			return
		end
		subbindgold(actor,5000*zhekou)
		setint(actor,"存储蓝量",getint(actor,"存储蓝量")+5000)
		if getint(actor,"存储蓝量") >= 500000 then
			setint(actor,"存储蓝量",500000)
		end
		sendmsg9(actor,"购买成功，当前MP储量"..getint(actor,"存储蓝量"))
		callscriptex(actor, "CallLua", "QFunction-0", "@chuliangxiangshi")
		return
	end
	if par >= 9 then
		if getbagblank(actor) < yao_t[par][2] then
			sendmsg9(actor,"背包空格不足".. yao_t[par][2] .."格")
			return
		end
		if getingot(actor) < yao_t[par][3] then
			sendmsg9(actor,"元宝不足".. yao_t[par][3])
			return
		end
		subingot(actor,yao_t[par][3],"买药")
		giveitem(actor,yao_t[par][1],yao_t[par][2],0)
		sendmsg9(actor,"购买成功")
		return
	end

	if getbagblank(actor) < yao_t[par][2] then
		sendmsg9(actor,"背包空格不足")
		return
	end
	if getbindgold(actor) < yao_t[par][3]*zhekou then
		sendmsg9(actor,"金币不足"..yao_t[par][3]*zhekou)
		return
	end
	local bind = 0
	if getbindjinbi(actor) > 0 then
		bind = 370
	end
	subbindgold(actor,yao_t[par][3]*zhekou)
	giveitem(actor,yao_t[par][1],yao_t[par][2],bind)
	sendmsg9(actor,"购买成功")

	return
end

function getshouhunbuffdata(actor) --获取兽魂buff数据
	local data = {"","","","","",""}
	local sh_str = getstr(actor,"兽魂buff数据")
	if sh_str ~= "" then
		data=json2tbl(sh_str)
	end
	return data
end
