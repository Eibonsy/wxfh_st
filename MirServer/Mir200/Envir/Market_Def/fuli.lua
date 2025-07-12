local fuli_anniu = {"免费福利","投资新秀","投资大使","投资达人","投资专家",}
local fuli_xianshi_t = {
	["投资新秀"] = {
		buffid=10061,dj=1,yb=1800,tubiao=223,shuxing={"<怪物爆率增加2%/FCOLOR=161>","<对怪伤害增加2%/FCOLOR=161>","<回收比例增加10%/FCOLOR=161>","<武穆遗书成长经验额外+10%/FCOLOR=161>"},shouyi=20,
		items={{"金币",300000},{"幸运灯笼项链",1},{"二级金针",30},{"神兽之角",20},{[0]="圣战斗笠","法神斗笠","天尊斗笠"}}
	},
	["投资大使"] = {
		buffid=10062,dj=2,yb=4800,tubiao=222,shuxing={"<怪物爆率增加4%/FCOLOR=161>","<对怪伤害增加4%/FCOLOR=161>","<回收比例增加20%/FCOLOR=161>","<武穆遗书成长经验额外+30%/FCOLOR=161>","<解锁物品不绑定/FCOLOR=250>","<解锁金币材料装备不绑定/FCOLOR=250>"},shouyi=40,
		items={{"金币",600000},{"疏筋活络丸",6},{"三级金针",30},{"神兽之角",40},{[0]="圣战勋章","法神勋章","天尊勋章"}}
	},
	["投资达人"] = {
		buffid=10063,dj=3,yb=8800,tubiao=221,shuxing={"<怪物爆率增加7%/FCOLOR=250>","<对怪伤害增加7%/FCOLOR=70>","<回收比例增加40%/FCOLOR=254>","<武穆遗书成长经验额外+60%/FCOLOR=116>","<打怪经验增加10%/FCOLOR=251>","<隐藏地图每日无条件进入次数+1/FCOLOR=253>"},shouyi=60,
		items={{"金币",1200000},{"疏筋活络丸",9},{"书页",20},{"赏金值",500},{[0]="雷霆斗笠","烈焰斗笠","光芒斗笠"}}
	},
	["投资专家"] = {
		buffid=10064,dj=4,yb=13800,tubiao=224,shuxing={"<怪物爆率增加10%/FCOLOR=250>","<对怪伤害增加10%/FCOLOR=70>","<回收比例增加70%/FCOLOR=254>","<武穆遗书成长经验额外+100%/FCOLOR=116>","<打怪经验增加20%/FCOLOR=251>","<隐藏地图每日无条件进入次数+3/FCOLOR=253>"},shouyi=100,
		items={{"金币",1800000},{"疏筋活络丸",12},{"神兽之血",30},{"赏金值",1000},{[0]="雷霆勋章","烈焰勋章","光芒勋章"}}
	},
}
  

local touzi_t = {
	{jinbi=3000000,yb=2000},
	{jinbi=6000000,yb=4000},
	{jinbi=12000000,yb=6000},
	{jinbi=16000000,yb=8000},
	{jinbi=20000000,yb=10000},
}

function fulishow(actor,anniuid,xianshi,lingquxianshi)
	anniuid = tonumber(anniuid) or 2
	xianshi = tonumber(xianshi) or 0
	lingquxianshi = tonumber(lingquxianshi) or 0
	if anniuid == 1 then
		setint(actor,"免费福利红点",0)
	end
	local msg = [[
		<Img|x=0|width=636|height=484|bg=1|scale9l=50|scale9r=50|scale9t=50|scale9b=50|move=1|esc=1|loadDelay=1|reset=0|img=zhangheng/1.png|show=4>
		<Button|x=633.0|y=1.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=16.5|y=39.5|img=zhangheng/216.png|esc=0>
		<Img|x=143.5|y=109.5|height=350|img=zhangheng/219.png|esc=0>
		<Img|x=16.5|y=37.5|img=zhangheng/220.png|esc=0>
		<Button|x=20.0|y=125.0|color=255|size=18|pimg=zhangheng/214.png>
	]]
		
	for i = 1,#fuli_anniu do
		if i == anniuid then
			msg = msg ..'<Button|x=20.0|y='.. 125+(i-1)*60 ..'|size=20|nimg=zhangheng/214.png|pimg=zhangheng/214.png|color=250|outline=2|text='..fuli_anniu[i]..'>'
		else
			msg = msg ..'<Button|x=20.0|y='.. 125+(i-1)*60 ..'|size=20|nimg=zhangheng/214.png|pimg=zhangheng/214.png|color=7|outline=2|text='..fuli_anniu[i]..'|link=@fulishow,'.. i ..'>'
		end
		if getint(actor,"会员等级") < 2 and i == 1 and getint(actor,"免费福利红点") == 1 then
			msg = msg .. '<Img|x=122.0|y='.. 128+(i-1)*60 ..'|img=zh/100.png|esc=0>'
		end
	end
	if fuli_anniu[anniuid] ~= "免费福利" then
		msg = msg ..'<Img|x=149.0|y=308.0|img=zhangheng/218.png|esc=0>'
		local name = fuli_anniu[anniuid]
		msg = msg ..'<Img|x=241.0|y=120.0|img=zhangheng/'.. fuli_xianshi_t[name].tubiao ..'.png|esc=0>'
		--属性显示
		local shuxing_t = fuli_xianshi_t[name].shuxing
		for i = 1,#shuxing_t do
			msg = msg ..'<RText|x='.. 160+((i-1)%2)*195 ..'|y='.. 160+ math.floor((i-1)/2)*30 ..'|color=255|outline=1|size=18|text='.. shuxing_t[i] ..'>'
		end
		--收益展示
		msg = msg ..'<RText|ax=0.5|x=386.0|y=259.0|color=249|size=18|text=投资后可领取<(免费福利)/FCOLOR=251>1-5档<'.. fuli_xianshi_t[name].shouyi ..'%/FCOLOR=250>的元宝收益>'
		--物品显示
		local wupin_t = fuli_xianshi_t[name].items
		for i = 1,#wupin_t do
			local iname = ""
			local isl = 1
			if i == 5 then
				iname = wupin_t[i][getjob(actor)]
			else
				iname = wupin_t[i][1]
				isl = wupin_t[i][2]
			end
			msg = msg ..'<Img|x='.. 206+(i-1)*76 ..'|y=291.0|width=50|height=50|scale9t=3|scale9r=3|img=zh/36.png|scale9b=3|scale9l=3|esc=0>'
			msg = msg ..'<ItemShow|x='.. 198+(i-1)*76 ..'|y=283.0|width=70|height=70|itemid='.. getidbyname(iname) ..'|itemcount='.. isl ..'|showtips=1|bgtype=0>'
			
		end
		if getint(actor,"会员等级") >= fuli_xianshi_t[name].dj then
			msg = msg ..'<Button|x=317.0|y=410.0|color=10051|size=18|nimg=zhangheng/217.png|text=已获取>'
		else
			msg = msg ..'<Button|x=317.0|y=410.0|color=10051|size=18|nimg=zhangheng/217.png|text=获取'..name..'|link=@fuli_huoqu,'..anniuid..'>'
		end
		
		msg=msg..'<RText|a=4|x=384.0|y=388.0|color=70|outline=1|size=18|text=需投资：'.. fuli_xianshi_t[fuli_anniu[anniuid]].yb ..'元宝>'
	else
		for i = 1,#touzi_t do
			msg = msg ..'<RText|ax=0|ay=0.5|x=169.0|y='.. 2+135.5+(i-1)*56 ..'|color=255|size=18|outline=1|text=提交<'.. touzi_t[i].jinbi/10000 ..'万金币/FCOLOR=21>可领取<'.. touzi_t[i].yb ..'元宝/FCOLOR=254>>'
			if getint(actor,"福利领取"..i) == 1 then
				msg = msg ..'<Text|ax=0.5|ay=0.5|x=528.0|y='.. 2+135.5+(i-1)*56 ..'|color=249|size=18|text=已领取>'
			else
				if getint(actor,"会员等级") == 0 or getsysint("合区次数") > 0 then --没有投资或合区后
					msg = msg ..'<Text|ax=0.5|ay=0.5|x=528.0|y='.. 2+135.5+(i-1)*56 ..'|color=250|size=18|text=领取福利|link=@fuli_tishi,'..anniuid..','..i..'>'
				else
					msg = msg ..'<Text|ax=0.5|ay=0.5|x=528.0|y='.. 2+135.5+(i-1)*56 ..'|color=250|size=18|text=领取福利|link=@fulishow,'..anniuid..',0,'..i..'>'
				end
			end
			msg = msg ..'<Img|x=152.0|y='.. 5+158+(i-1)*56 ..'|img=zhangheng/203.png|esc=0>'
		end
		msg = msg ..'<Img|x=149.0|y=334.0|img=zhangheng/218.png|esc=0>' --下面横线
		msg = msg ..'<RText|x=252.0|y=405.0|color=253|size=18|text=请投资者在合区前完成福利领取>'
		msg = msg ..'<RText|x=184.0|y=432.0|color=251|size=18|text=打金赚米玩家建议成为投资大使 体验感增加100%>'
	end
	
	if lingquxianshi >= 1 then
		msg=msg..'<Layout|x=-1000|y=-1000|width=3000|height=3000|link=@fulishow,'..anniuid..'>'
		msg=msg..'<Img|ay=0.5|x=199.0|y=336.0|width=360|height=100|scale9r=10|scale9l=10|esc=0|img=zh/7.png|scale9b=10|scale9t=10>'
		msg=msg..'<RText|ax=0.5|x=382.0|y=302.0|color=255|size=18|text=领取需'.. touzi_t[lingquxianshi].jinbi/10000 ..'万金币，是否确定领取？>'
		msg=msg..'<Button|x=256.0|y=336.0|nimg=zhangheng/13.png|color=10051|size=18|text=取消|link=@fulishow,'..anniuid..'>'
		msg=msg..'<Button|x=410.0|y=336.0|size=18|nimg=zhangheng/13.png|color=10051|text=确定领取|link=@fuli_lingqu,'..anniuid..','..lingquxianshi..'>'
	end
	say(actor,msg)
end

function fuli_tishi(actor,anniuid,lingquxianshi)
	anniuid = tonumber(anniuid)
	lingquxianshi = tonumber(lingquxianshi)
	if getsysint("合区次数") > 0 then
		sendmsg9(actor,"投资返还新区生效","00FF00")
		return
	end
	
	local gold = touzi_t[lingquxianshi].jinbi --需要金币
	
	if getbindgold(actor) < gold then
		sendmsg9(actor,"你的金币不足")
		return fulishow(actor,anniuid)
	end 
	
	if getgold(actor) < gold then
		sendmsg9(actor,"你的非绑定金币不足")
		return fulishow(actor,anniuid)
	end
	
	if getint(actor,"会员等级") == 0 then
		sendmsg9(actor,"请先获取投资称号")
		return fulishow(actor,anniuid)
	end
end
local fuli_bili = {20,40,60,100}
function fuli_lingqu(actor,anniuid,lingquxianshi)
	anniuid = tonumber(anniuid)
	lingquxianshi = tonumber(lingquxianshi)
	if getint(actor,"领取返还顺序") + 1 ~= lingquxianshi then
		sendmsg9(actor,"请按顺序领取福利")
		return fulishow(actor,anniuid)
	end
	
	if getsysint("合区次数") > 0 then
		sendmsg9(actor,"投资返还新区生效","00FF00")
		return
	end
	
	local gold = touzi_t[lingquxianshi].jinbi --需要金币
	local yb = touzi_t[lingquxianshi].yb --给元宝
	local bili = fuli_bili[getint(actor,"会员等级")]/100
	
	
	if getbindgold(actor) < gold then
		sendmsg9(actor,"你的金币不足")
		return fulishow(actor,anniuid)
	end 
	
	if getgold(actor) < gold then
		sendmsg9(actor,"你的非绑定金币不足")
		return fulishow(actor,anniuid)
	end
	
	if getint(actor,"会员等级") == 0 then
		sendmsg9(actor,"请先获取投资称号")
		return fulishow(actor,anniuid)
	end
	
	subgold(actor,gold)
	addingot(actor,yb*bili)
	setint(actor,"福利领取"..lingquxianshi,1)
	setint(actor,"领取返还顺序",getint(actor,"领取返还顺序")+1)
	sendmsg9(actor,"福利领取成功，获得元宝"..yb*bili)
	post(actor,getint(actor,"会员等级").."档投资获取元宝*"..yb*bili)
	
	setsysint("免费福利金币兑换的元宝",getsysint("免费福利金币兑换的元宝")+yb*bili)
	setsysint("每日免费福利金币兑换的元宝",getsysint("每日免费福利金币兑换的元宝")+yb*bili)
	
	return fulishow(actor,anniuid)
end

local ming = {"投资新秀","投资大使","投资达人","投资专家"}
function fuli_huoqu(actor,anniuid)
	anniuid = tonumber(anniuid)
	local name = fuli_anniu[anniuid] --按钮名字
	local hydj = fuli_xianshi_t[name].dj --要获取的等级
	local wupin_t = fuli_xianshi_t[name].items --要给的物品表
	local yb = fuli_xianshi_t[name].yb --需要的元宝数
	local buffid = fuli_xianshi_t[name].buffid --要给的buffid
	if getint(actor,"会员等级") + 1 ~= hydj then
		sendmsg9(actor,"请先获取"..ming[hydj-1])
		return fulishow(actor,anniuid)
	end
	
	if getingot(actor) < yb then
		sendmsg9(actor,"元宝不足")
		return fulishow(actor,anniuid)
	end
	
	if hydj == 1 and getint(actor,"累计充值") < 10 then
		sendmsg9(actor,"请先获取开荒豪礼")
		return shouchong_show(actor)
	end
	
	subingot(actor,yb,"投资大使")
	addbuff(actor,buffid)
	for i = 1,#wupin_t do
		if wupin_t[i][1] == "金币" then
			addbindgold(actor,wupin_t[i][2])
		elseif wupin_t[i][1] == "赏金值" then
			addshangjinzhi(actor,wupin_t[i][2])
		else
			local iname = ""
			local isl = 1
			if i == 5 then
				iname = wupin_t[i][getjob(actor)]
			else
				iname = wupin_t[i][1]
				isl = wupin_t[i][2]
			end
			if iname == "幸运灯笼项链" then
				iname = "幸运灯笼項链"
			end
			giveitem(actor,iname,isl,370)
		end
	end
	setint(actor,"会员等级",hydj)
	sendmsg9(actor,"成功获取"..name)
	
	if hydj == 1 then
		setsysint("购买投资新秀的个数",getsysint("购买投资新秀的个数")+1)
		setsysint("每日购买投资新秀的个数",getsysint("每日购买投资新秀的个数")+1)
	elseif hydj == 2 then
		setsysint("购买投资大使的个数",getsysint("购买投资大使的个数")+1)
		setsysint("每日购买投资大使的个数",getsysint("每日购买投资大使的个数")+1)
	elseif hydj == 3 then
		setsysint("购买投资达人的个数",getsysint("购买投资达人的个数")+1)
		setsysint("每日购买投资达人的个数",getsysint("每日购买投资达人的个数")+1)
	elseif hydj == 4 then
		setsysint("购买投资专家的个数",getsysint("购买投资专家的个数")+1)
		setsysint("每日购买投资专家的个数",getsysint("每日购买投资专家的个数")+1)
	end
	touzichenghao(actor)
	
	return fulishow(actor,anniuid)
end

local tzch_t = {"投资新秀","投资大使","投资达人","投资专家"}
function touzichenghao(actor)
	for i = 1,#tzch_t do
		if getint(actor,"会员等级") == i then
			if not checktitle(actor,tzch_t[i]) then --没有称号
				confertitle(actor, tzch_t[i])
			end
		else
			if checktitle(actor,tzch_t[i]) then --有称号
				deprivetitle(actor, tzch_t[i])
			end
		end
	end
end
