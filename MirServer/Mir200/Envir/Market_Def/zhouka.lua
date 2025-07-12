
include("Market_Def/zh.lua") --个人封装函数
local zhouka_give_t = {{"金矿石",100},{"鸿运之锤",10},{"金蚕丝",100}}

function zhouka_show(actor)
	local zhouka_day_t = {{"药品捆绳",100},{"金币",500000},{"超级祝福油",2},{"神兽之血",2},{"兽魂蛋",10}}
	if getkaiquday() >= 11 then
		zhouka_day_t[5][1] = "虎骨酒"
		zhouka_day_t[5][2] = 2
	end
	local msg = [[
		<Img|show=4|bg=1|loadDelay=1|move=1|esc=1|img=zhangheng/236.png|reset=1>
		<Button|x=360.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Text|x=24.0|y=92.0|color=255|size=18|text=购买后获得：>	
		<RText|x=20.0|y=356.0|color=255|size=16|text=获取周享需6800元宝 可连续领取7天每日福利>
		
	]]
	if getkaiquday() >= 2 then
		msg = msg..[[
		<Img|x=359.0|y=129.0|img=zhangheng/237.png|link=@richong_show>
		<Text|x=364.0|y=144.0|size=18|color=7|text=日>
		<Text|x=364.0|y=164.0|size=18|color=7|text=享>
		<Img|x=359.0|y=59.0|img=zhangheng/238.png|link=@kong>
		<Text|x=364.0|y=74.0|color=255|size=18|text=周>
		<Text|x=364.0|y=94.0|color=255|size=18|text=享>
		]]
	end
	
	for i = 1,#zhouka_give_t do
		msg=msg.."<Img|x=".. 130+(i-1)*70 .."|y=74.0|img=zhangheng/231.png|esc=0>"
		msg=msg.."<ItemShow|x=".. 125+(i-1)*70 .."|y=68.0|width=70|height=70|itemid=".. getidbyname(zhouka_give_t[i][1]) .."|itemcount=".. zhouka_give_t[i][2] .."|showtips=1|bgtype=0>"
	end
	
	for i = 1,#zhouka_day_t do
		msg=msg.."<Img|x=".. 23+(i-1)*65 .."|y=201.0|img=zhangheng/231.png|esc=0>"
		msg=msg.."<ItemShow|x=".. 17+(i-1)*65 .."|y=196.0|width=70|height=70|itemid=".. getidbyname(zhouka_day_t[i][1]) .."|itemcount=".. zhouka_day_t[i][2] .."|showtips=1|bgtype=0>"
	end
	if not hasbuff(actor,10067) then
		msg=msg.."<Button|x=145.0|y=292.0|nimg=zhangheng/13.png|color=10051|size=18|text=获取周享|link=@huoquzhouka>"
	else
		msg=msg.."<Button|x=145.0|y=292.0|nimg=zhangheng/13.png|color=10051|size=18|text=领取福利|link=@zhoukameiri>"
	end
	say(actor,msg)
end

function zhoukameiri(actor)
	local zhouka_day_t = {{"药品捆绳",100},{"金币",500000},{"超级祝福油",2},{"神兽之血",2},{"兽魂蛋",10}}
	if getkaiquday() >= 11 then
		zhouka_day_t[5][1] = "虎骨酒"
		zhouka_day_t[5][2] = 2
	end
	if getdayint(actor,"周卡每日领取") == 1 then
		sendmsg9(actor,"您今日已经领取过了")
		return
	end
	if not hasbuff(actor,10067) then
		sendmsg9(actor,"您没有周享")
		return
	end
	
	setdayint(actor,"周卡每日领取",1)
	for i = 1,#zhouka_day_t do
		if zhouka_day_t[i][1] == "金币" then
			addbindgold(actor,zhouka_day_t[i][2])
		elseif zhouka_day_t[i][1] == "赏金值" then
			addshangjinzhi(actor,zhouka_day_t[i][2])
		else
			giveitem(actor,zhouka_day_t[i][1],zhouka_day_t[i][2],370)
		end
	end 
	sendmsg9(actor,"领取每日福利成功")
end

function huoquzhouka(actor)
	if hasbuff(actor,10067) then
		sendmsg9(actor,"您已经拥有周享了")
		return
	end
	if getingot(actor) < 6800 then
		sendmsg9(actor,"元宝不足")
		return
	end
	subingot(actor,6800,"购买周卡")
	addbuff(actor,10067)
	for i = 1,#zhouka_give_t do
		giveitem(actor,zhouka_give_t[i][1],zhouka_give_t[i][2],370)
	end 
	sendmsg9(actor,"恭喜你获取周享成功")
	return zhouka_show(actor)
end


function richong_show(actor,xianshi,xzid)
	local richong_t = {{"元宝",2800},{"金币",1000000},{"经验宝典",10},{"紫水晶矿",100},{"赏金值",1000},{"挂机点数",1},}
	if getkaiquday() >= 30 then
		richong_t[5][1] = "高粱酒"
		richong_t[5][2] = 10
	end
--[[	if getlevel(actor) >= 75 then
		richong_t[3][1] = "永恒之泪"
		richong_t[3][2] = 1
	end--]]
	
	xianshi = tonumber(xianshi) or 0
	xzid = tonumber(xzid) or 1
	local msg = [[
		<Img|show=4|bg=1|loadDelay=1|move=0|reset=1|img=zhangheng/239.png|esc=1>
		<Button|x=360.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<RText|x=24.0|y=356.0|color=255|size=18|text=每日在此页面充值28元 可获得超值福利>
		<Img|x=359.0|y=59.0|img=zhangheng/237.png|link=@zhouka_show>
		<Img|x=359.0|y=129.0|img=zhangheng/238.png|link=@kong>
		<Text|x=364.0|y=74.0|size=18|color=7|text=周>
		<Text|x=364.0|y=94.0|size=18|color=7|text=享>
		<Text|x=364.0|y=144.0|size=18|color=255|text=日>
		<Text|x=364.0|y=164.0|size=18|color=255|text=享>
		<Img|x=46.0|y=255.0|width=270|esc=0|img=zhangheng/203.png>
		<Img|x=46.0|y=150.0|width=270|img=zhangheng/203.png|esc=0>

	]]
	if getsysint("合区次数") >= 2 then
		msg=msg.."<RText|x=188.0|y=192.0|color=251|size=16|text=延续首充打怪效率卡>"
	end
	for i = 1,#richong_t do
		msg=msg.."<Img|x=".. 42+(i-1)%4*74 .."|y=".. 74+math.floor((i-1)/4)*100 .."|img=zhangheng/231.png|esc=0>"
		msg=msg.."<ItemShow|x=".. 37+(i-1)%4*74 .."|y=".. 68+math.floor((i-1)/4)*100 .."|width=70|height=70|itemid=".. getidbyname(richong_t[i][1]) .."|itemcount=".. richong_t[i][2] .."|showtips=1|bgtype=0>"
	end
	if getdayint(actor,"日充福利") == 0 then
		msg=msg.."<Button|x=145.0|y=292.0|nimg=zhangheng/13.png|color=10051|size=18|text=获取福利|link=@richong_show,1>"
	else
		msg=msg.."<Button|x=145.0|y=292.0|nimg=zhangheng/13.png|color=10051|size=18|text=今日已获取>"
	end
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@richong_show>"
		msg=msg.."<Img|ay=0.5|x=13.0|y=250.0|width=334|height=160|scale9t=10|scale9l=10|img=zh/7.png|scale9r=10|esc=0|scale9b=10>"
		msg=msg.."<Button|ay=0.5|x=13.0|y=250.0|width=334|height=160|nimg=zhangheng/13.png|opacity=0|link=@kong>"
		msg=msg.."<RText|x=115.0|y=188.0|color=251|size=18|text=充值金额：28元>"
		local tu_t = {{90,91},{92,93},{94,95}}
		for i = 1,#tu_t do
			if i == xzid then
				msg=msg.."<Button|x=".. 35+(i-1)*101 .."|y=230.0|nimg=zh/".. tu_t[i][1] ..".png>"
				msg=msg.."<Img|x=".. 103+(i-1)*101 .."|y=230.0|img=zh/".. tu_t[i][2] ..".png>"
			else
				msg=msg.."<Button|x=".. 35+(i-1)*101 .."|y=230.0|nimg=zh/".. tu_t[i][1] ..".png|link=@richong_show,1,"..i..">"
			end
		end
		msg=msg.."<Button|x=137.0|y=284.0|color=10051|size=18|nimg=zhangheng/13.png|text=确定充值|link=@huoqurichong,"..xzid..">"
	end
	say(actor,msg)
end

local zhifu_t = {3,1,2}
function huoqurichong(actor,fangshi) -- 1微信 2支付宝 3花呗
	fangshi = tonumber(fangshi)
	if getdayint(actor,"日充福利") == 1 then
		sendmsg9(actor,"今日福利已领取")
		return
	end
	pullpay(actor,28,zhifu_t[fangshi],12) --拉起充值
end

function richong_giveitem(actor)
	local richong_t = {{"元宝",2800},{"金币",1000000},{"经验宝典",10},{"紫水晶矿",100},{"赏金值",1000},{"挂机点数",1},}
	if getkaiquday() >= 30 then
		richong_t[5][1] = "高粱酒"
		richong_t[5][2] = 10
	end
--[[	if getlevel(actor) >= 75 then
		richong_t[3][1] = "永恒之泪"
		richong_t[3][2] = 1
	end--]]
	for i = 1,#richong_t do
		if richong_t[i][1] == "金币" then
			addbindgold(actor,richong_t[i][2])
		elseif richong_t[i][1] == "赏金值" then
			addshangjinzhi(actor,richong_t[i][2])
		elseif richong_t[i][1] == "元宝" then
			addingot(actor,richong_t[i][2])
		elseif richong_t[i][1] == "挂机点数" then
			local curdianshu = getint(actor,"挂机点数")
			local givedianshu = curdianshu + 5000
			if givedianshu > 21600 then
				givedianshu = 21600
			end
			setint(actor,"挂机点数",givedianshu)
		else
			giveitem(actor,richong_t[i][1],richong_t[i][2],370)
		end
	end 
	setdayint(actor,"日充福利",1)
	sendmsg9(actor,"恭喜你获取日充福利成功")
	return richong_show(actor)
end
