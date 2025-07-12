include("Market_Def/zh.lua") --个人封装函数
----------------------------比奇城护卫NPC
function biqichenghuwei_show(actor)
	if getsysint("合区次数") < 1 then
		sendmsg9(actor,"合区后才能解救卧龙夫人")
		return
	end
	
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=330|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|reset=1|scale9l=30|esc=1|img=zhangheng/176.png|show=0>
<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=卧龙宝藏>
<RText|x=22.0|y=55.0|size=16|color=161|text=只有击败守护在山庄的<"山庄护卫"/FCOLOR=250>才能得到<"卧龙夫人"/FCOLOR=31>的认可>
<RText|x=22.0|y=77.0|color=161|size=16|text=(击杀者可获得<10根金条/FCOLOR=253>的奖励以及获得卧龙夫人的归属权)，>
<RText|x=22.0|y=99.0|color=161|size=16|text=她将带你寻找到卧龙宝藏.....>
<RText|x=61.0|y=225.0|color=255|size=16|text=无行会的玩家攻击<"山庄护卫"/FCOLOR=250>以及<"卧龙夫人"/FCOLOR=250>无伤害>
<RText|x=21.0|y=256.0|size=16|color=254|text=每天19.30分刷新山庄护卫. 21点之前未完成任务系统则自动取消>
<Text|x=116.0|y=287.0|color=250|size=18|text=偷看卧龙夫人洗澡|link=@biqichenghuwei_toukan>
<Text|x=116.0|y=286.0|outline=1|color=251|size=18|text=　　　　　　　　/50000金币每次>
<RText|x=23.0|y=129.0|color=161|size=16|text=得到卧龙夫人归属权的玩家可将<"卧龙夫人"/FCOLOR=31>送至<"公孙策"/FCOLOR=254>处，>
<RText|x=23.0|y=151.0|color=161|size=16|text=护送成功可获得超级奖励，<所在行会成员/FCOLOR=250>可在<赏金使者/FCOLOR=250>处领取>
<RText|x=23.0|y=173.0|color=161|size=16|text=奖励，如护送过程中卧龙夫人被截杀，那么击杀者可得到卧龙>
<RText|x=23.0|y=195.0|size=16|color=161|text=夫人的归属权，她将在起始点复活，<180秒后需重新护送/FCOLOR=249>...>




	]]
	say(actor,msg)
end

function biqichenghuwei_toukan(actor)
	if getbindgold(actor) < 50000 then
		sendmsg9(actor,"金币不足")
		return
	end
	subbindgold(actor,50000)
	
	local hour = tonumber(os.date("%H",os.time()))
	local fen = tonumber(os.date("%M",os.time()))
	if getsysint("合区次数") > 0 and ((hour == 19 and fen >= 30) or hour == 20) then
		sendmsg9(actor,"小伙子  你想什么呢。。。。。")
	else
		sendmsg9(actor,"现在不是19点30分-21点.卧龙夫人还没有洗澡呢。。。。。。")
	end
	
	return
end

function biqichenghuwei_yuanyi(actor)
	local tab = getobjectinmap("wlsz",150,150,150,2) --所有怪物表 包含宝宝
	--release_print(tbl2json(tab))
	for i = 1,#tab do
		if getname(tab[i]) == "卧龙夫人" then
			sendmsg9(actor,"卧龙夫人已经在路上了")
			return
			--release_print("有卧龙夫人")
		end
	end

	callscriptex(actor, "KILLCALLMOB","卧龙夫人",1)

	callscriptex(actor, "RECALLMOB", "卧龙夫人", 0,200,0)
	darttime(actor,30*60,1)

	local bb_list = getbaobaolist(actor)
	for i = 1,#bb_list do
		if getname(bb_list[i]) == "卧龙夫人" then		 	
			makeposion(bb_list[i],5,180)
			setcurrent(bb_list[i],0,tostring(os.time())) --标识出生时间
		end
	end
	sendtopchatboardmsg(actor,0,251,0,180,"卧龙夫人正在卧龙山庄沐浴更衣，%d秒后勇士将可对其进行......",1)
	
	sendmsg(nil, 2, '{"Msg":"漂亮的<卧龙夫人/FCOLOR=249>正在<卧龙山庄/FCOLOR=250>沐浴更衣，180秒后可护送或者截杀卧龙夫人，将获得高额奖励....","FColor":251,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"200"}')
    sendmsg(nil, 2, '{"Msg":"漂亮的<卧龙夫人/FCOLOR=249>正在<卧龙山庄/FCOLOR=250>沐浴更衣，180秒后可护送或者截杀卧龙夫人，将获得高额奖励....","FColor":251,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"250"}')
    sendmsg(nil, 2, '{"Msg":"漂亮的<卧龙夫人/FCOLOR=249>正在<卧龙山庄/FCOLOR=250>沐浴更衣，180秒后可护送或者截杀卧龙夫人，将获得高额奖励....","FColor":251,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"300"}')
	--sendmovemsg(actor,1,251,0,100,1,"玩家【".. getname(actor) .."】领取护送卧龙夫人任务，她将在180秒后苏醒，此行是福是祸让我们拭目以待吧.....")
	sendmsg9(actor, "成功接取护送任务.")
	close()
end


----------------------------公孙策NPC
function gongsunce_show(actor,xuanzhe)
	xuanzhe = tonumber(xuanzhe) or 0
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=300|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|reset=1|scale9l=30|esc=1|img=zhangheng/176.png|show=0>
<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=公孙策>
<RText|x=22.0|y=55.0|color=161|size=16|text=勇士，一路辛苦了，最近"卧龙山庄"不是很平静，到处潜伏着>
<RText|x=22.0|y=77.0|color=161|size=16|text=危险请把"卧龙夫人"交给我吧!  我将赠送玛法至宝<"六星龙珠"/FCOLOR=70>>
<RText|x=22.0|y=99.0|color=161|size=16|text=或<"七星龙珠"/FCOLOR=70>请勇士随意挑选一颗...>
<RText|x=24.0|y=129.0|color=161|size=16|text=你所在行会的所有成员将以你为荣, <所有行会成员/FCOLOR=254>可至<卧龙山/FCOLOR=250>>
<RText|x=24.0|y=151.0|color=161|size=16|text=<庄(184, 126)/FCOLOR=250>处找<"赏金使者"/FCOLOR=250>领取丰厚报酬！>
<RText|x=77.0|y=193.0|color=31|size=16|text=护送奖励>
<RText|x=45.0|y=215.0|size=16|color=31|text=请二选一后再领取>
<Img|x=179.0|y=187.0|width=50|height=50|esc=0|img=zhangheng/104.png>
<Img|x=264.0|y=187.0|width=50|height=50|esc=0|img=zhangheng/104.png>

	]]
	if xuanzhe == 1 then
		msg=msg..'<ItemShow|x=173.0|y=179.0|width=70|height=70|itemid='.. getidbyname("六星龙珠") ..'|itemcount=1|showtips=1|bgtype=0|link=@gongsunce_show>'
	else
		msg=msg..'<ItemShow|x=173.0|y=179.0|width=70|height=70|itemid='.. getidbyname("六星龙珠") ..'|itemcount=1|showtips=1|bgtype=0|link=@gongsunce_show,1>'
	end
	if xuanzhe == 2 then
		msg=msg..'<ItemShow|x=258.0|y=179.0|width=70|height=70|itemid='.. getidbyname("七星龙珠") ..'|itemcount=1|showtips=1|bgtype=0|link=@gongsunce_show>'
	else
		msg=msg..'<ItemShow|x=258.0|y=179.0|width=70|height=70|itemid='.. getidbyname("七星龙珠") ..'|itemcount=1|showtips=1|bgtype=0|link=@gongsunce_show,2>'
	end
	if xuanzhe == 1 then
		msg=msg..'<Img|x=179.0|y=187.0|width=50|height=50|esc=0|img=zhangheng/39.png>'
	elseif xuanzhe == 2 then
		msg=msg..'<Img|x=264.0|y=187.0|width=50|height=50|esc=0|img=zhangheng/39.png>'
	end
	msg=msg..'<Text|ax=0.5|x=246.0|y=255.0|color=250|size=18|text=领取奖励|link=@gongsunce_lingqu,'.. xuanzhe ..'>'
	say(actor,msg)
end
local giveitemt = {"六星龙珠","七星龙珠"}
function gongsunce_lingqu(actor,par)
	par = tonumber(par)
	
	local biao = ""
	local ncount=getbaseinfo(actor,38) --获得宝宝列表
    for i = 0 ,ncount-1 do
        local mon =  getslavebyindex(actor, i) --获得宝宝对象
		if getname(mon) == "卧龙夫人" then
			biao = mon
		end
    end
	if biao == "" then --没有镖车
		sendmsg9(actor, "卧龙夫人都被你丢了，叫我如何给你报酬呢？")
		return
	end
	if not FCheckRange(biao, 178, 130, 5) then
		sendmsg9(actor, "卧龙夫人距离我太远了.")
		return
	end
	
	if par == 0 then
		sendmsg9(actor, "勇士请选择护送奖励后，才可提交任务.")
		return
	end
	
	callscriptex(actor, "KILLCALLMOB","卧龙夫人",1,1) --移除镖车
	giveitem(actor,giveitemt[par],1)
	setsysstr("押镖成功行会",getbaseinfo(actor,36))
	setsysint("押镖成功时间",os.time()) --以此控制本次领取没有
	sendmsg9(actor, "护送成功，请拿好你的报酬.")
	sendmovemsg(actor,1,251,0,100,1,"由玩家【".. getname(actor) .."】带领的正义之师成功护送卧龙夫人，所在行会成员可至卧龙山庄'赏金使者'处领取奖励.....")
	close()
end

----------------------------赏金使者NPC
function shangjinshizhe_show(actor)

	local husongitems = {{"神兽之血",5},{"金币",100000},{"回收比例+5%",1}, {"属性：10-10",1}}
	if getint(actor,"四象之力总值") >= 80 then --四相之力满后
		husongitems[1] = {"技能神石",3}
	end
	
	local msg = [[
		<Img|x=0.0|y=0.0|width=490|height=300|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|reset=1|scale9l=30|esc=1|img=zhangheng/176.png|show=0>
		<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
		<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
		<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=赏金使者>
		<RText|x=22.0|y=55.0|size=16|color=161|text=老夫在此等候多时，世人都说我亦正亦邪，孰不知相于心生，护>
		<RText|x=22.0|y=77.0|size=16|color=161|text=送卧龙夫人成功的行会成员均可在此领取以下奖励，领奖励时间>
		<RText|x=22.0|y=99.0|size=16|color=161|text=<19点30分至21点/FCOLOR=250>，过时不候.....>
		<RText|x=24.0|y=165.0|color=253|size=16|text=护送成功奖励：>
		<Img|x=14.0|y=217.0|img=zhangheng/203.png|esc=0>

	]]

	local husonghanghui = "无"
	if getsysstr("押镖成功行会") ~= "" then
		husonghanghui = getsysstr("押镖成功行会")
	end 

	msg=msg..'<RText|x=24.0|y=246.0|color=254|size=16|text=护送成功行会：<'.. husonghanghui ..'/FCOLOR=116>>'
	

	for i = 1,#husongitems do
		msg=msg..'<Img|x='.. 150+(i-1)*80 ..'|y=154.0|width=50|height=50|esc=0|img=zhangheng/104.png>'
		msg=msg..'<ItemShow|x='.. 142+(i-1)*80 ..'|y=146.0|width=70|height=70|itemid='.. getidbyname(husongitems[i][1]) ..'|itemcount=1|showtips=1|bgtype=0>'
		if husongitems[i][2] > 1 then
			msg=msg..'<Text|ax=1|ay=0.5|x='.. 197+(i-1)*80 ..'|y=193.0|color=255|outline=1|size=16|simplenum=1|text='.. husongitems[i][2] ..'>'
		end
	end

	msg=msg..'<Text|ax=0.5|x=346.0|y=246.0|color=250|size=18|text=领取护送奖励|link=@shangjin_lingqu>'

	say(actor,msg)
end

function shangjin_lingqu(actor)
	local hour = tonumber(os.date("%H",os.time()))
	local fen = tonumber(os.date("%M",os.time()))
	if (hour == 19 and fen >= 30) or hour == 20 then
	else
		sendmsg9(actor,"每天19点30--21点才可领取奖励")
		return
	end

	if getsysstr("押镖成功行会") ~= "" and getbaseinfo(actor,36) == getsysstr("押镖成功行会") then
		local bianliang = getsysint("押镖成功时间",os.time()) --用作判断这次领取变量
		if getdayint(actor,"押镖"..bianliang) == 1 then
			sendmsg9(actor,"你已经领取过此次奖励")
			return
		end
		setdayint(actor,"押镖"..bianliang,1)
		setdayint(actor,"押镖领取次数",getdayint(actor,"押镖领取次数")+1)
		if getint(actor,"四象之力总值") >= 80 then --四相之力满后
			giveitem(actor,"技能神石",3,370)
		else
			giveitem(actor,"神兽之血",5,370)
		end
		addbindgold(actor,100000)
		if not hasbuff(actor,10058) then
			local sec = 86400 - os.time()%86400 --今天剩余的秒
			sec = sec + 3600*19
			addbuff(actor,10058,sec) --押镖成功buff
		end
		sendmsg9(actor,"领取成功")
	else
		sendmsg9(actor,"不满足领取条件")
		return
	end

end