include("Market_Def/zh.lua") --个人封装函数

function show(actor)
	local xz_t = getfengyinxiezi(actor)
	local yd_t = getfengyinyaodai(actor)
	if #xz_t < 1 and #yd_t < 1 then
		sendmsg9(actor,"勇士，赤月恶魔已经战败了......")
		close()
		return
	end 
	local msg = [[
		<Img|x=0|width=518|height=378|bg=1|scale9l=50|scale9r=50|scale9t=50|scale9b=50|move=1|reset=0|loadDelay=1|esc=1|img=zhangheng/1.png|show=4>
		<Button|x=513.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=16.5|y=37.5|width=482|img=zhangheng/185.png|esc=0>
		<RText|ax=0|ay=0.5|x=219.0|y=65.5|size=20|color=251|text=驱魔使者>
		<RText|x=34.0|y=92.0|size=18|color=161|text=随着"远古赤月恶魔"的战败, 在逃跑的过程中,  掉落上古秘>
		<RText|x=34.0|y=119.0|size=18|color=161|text=法, 经老夫研究 可解除被封印的恶魔装备....>
		<RText|x=34.0|y=146.0|size=18|color=161|text=由于此装备蕴含邪恶之力，并且附带神秘buff，我也只有>
		<RText|x=34.0|y=173.0|size=18|color=161|text=<50%的几率/FCOLOR=254>解封成功，能获得多少属性，就看你的造化了>
		<Img|x=310.0|y=59.0|img=zhangheng/178.png|esc=0>
		<Img|x=141.0|y=60.0|img=zhangheng/177.png|esc=0>

		<RText|x=36.0|y=236.0|color=254|size=18|text=解封靴子　→　>
		<Img|x=168.0|y=221.0|width=52|height=50|esc=0|img=zhangheng/158.png>
		<Img|x=244.0|y=221.0|width=52|height=50|esc=0|img=zhangheng/158.png>
		<Img|x=320.0|y=221.0|width=52|height=50|esc=0|img=zhangheng/158.png>
		<RText|x=36.0|y=302.0|color=254|size=18|text=解封腰带　→　>
		<Img|x=168.0|y=287.0|width=52|height=50|esc=0|img=zhangheng/158.png>
		<Img|x=244.0|y=287.0|width=52|height=50|esc=0|img=zhangheng/158.png>
		<Img|x=320.0|y=287.0|width=52|height=50|esc=0|img=zhangheng/158.png>
	]]
	
	msg=msg..'<ItemShow|x=161.0|y=214.0|width=70|height=70|itemid='.. getidbyname("恶魔之靴(封印)") ..'|itemcount=1|showtips=1|bgtype=0>'
	msg=msg..'<ItemShow|x=238.0|y=214.0|width=70|height=70|itemid='.. getidbyname("永恒之泪") ..'|itemcount=1|showtips=1|bgtype=0>'
	msg=msg..'<ItemShow|x=315.0|y=214.0|width=70|height=70|itemid='.. getidbyname("金盒") ..'|itemcount=1|showtips=1|bgtype=0>'
	msg=msg..'<RText|ax=0.5|x=194.0|y=253.0|size=16|color=255|outline=1|text=<'.. #xz_t ..'/FCOLOR=249>/<1/FCOLOR=250>>'
	msg=msg..'<RText|ax=0.5|x=271.0|y=253.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,"永恒之泪") ..'/FCOLOR=249>/<100/FCOLOR=250>>'
	msg=msg..'<RText|ax=0.5|x=348.0|y=253.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,"金盒") ..'/FCOLOR=249>/<3/FCOLOR=250>>'
	msg=msg..'<Button|x=389.0|y=227.0|color=10051|nimg=zhangheng/13.png|size=18|text=确定解封|link=@jiefeng,1>'
	
	msg=msg..'<ItemShow|x=161.0|y=280.0|width=70|height=70|itemid='.. getidbyname("恶魔之带(封印)") ..'|itemcount=1|showtips=1|bgtype=0>'
	msg=msg..'<ItemShow|x=238.0|y=280.0|width=70|height=70|itemid='.. getidbyname("永恒之泪") ..'|itemcount=1|showtips=1|bgtype=0>'
	msg=msg..'<ItemShow|x=315.0|y=280.0|width=70|height=70|itemid='.. getidbyname("金盒") ..'|itemcount=1|showtips=1|bgtype=0>'
	msg=msg..'<RText|ax=0.5|x=193.5|y=319.0|size=16|color=255|outline=1|text=<'.. #yd_t ..'/FCOLOR=249>/<1/FCOLOR=250>>'
	msg=msg..'<RText|ax=0.5|x=271.0|y=319.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,"永恒之泪") ..'/FCOLOR=249>/<100/FCOLOR=250>>'
	msg=msg..'<RText|ax=0.5|x=348.0|y=319.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,"金盒") ..'/FCOLOR=249>/<3/FCOLOR=250>>'
	msg=msg..'<Button|x=389.0|y=293.0|color=10051|nimg=zhangheng/13.png|size=18|text=确定解封|link=@jiefeng,2>'
	
	say(actor,msg)
end

function jiefeng(actor,par)
	local t = getfengyinxiezi(actor)
	if par == "2" then
		t = getfengyinyaodai(actor)
	end
	if #t < 1 or itemcount(actor,"金盒") < 3 or itemcount(actor,"永恒之泪") < 100 then
		sendmsg9(actor,"材料不足")
		return
	end
	takeitem(actor,"金盒",3)
	takeitem(actor,"永恒之泪",100)
	if math.random(1,100) < 50 then
		delitem(actor,t[1])
		sendmsg9(actor,"解除封印失败")
		sendmsg6(actor,"解除封印失败")
		if itemcount(actor,"恶魔之靴(封印)") < 1 and itemcount(actor,"恶魔之带(封印)") < 1 then
			close()
			return
		end
		return show(actor)
	end

	callscriptex(actor, "CallLua", "QFunction-0", "@pickupitemex,"..t[1]..",1")
	local jsonstr = getitemcustomabil(actor,t[1])
	--sendmsg6(actor,jsonstr)
	local json_t = json2tbl(jsonstr)
	if par == "1" then
		json_t["name"] = "恶魔之靴"
	else
		json_t["name"] = "恶魔之带"
	end
	setitemcustomabil(actor,t[1],tbl2json(json_t))
	if math.random(1,100) < 50 then
		setitemaddvalue(actor,t[1],2,2,249) --设置红色
	end
	refreshitem(actor,t[1])
	sendmsg9(actor,"解除封印成功")
	sendmsg6(actor,"解除封印成功")
	return show(actor)
end

function getfengyinxiezi(actor)
	local baglist = getbaglist(actor)
	local t = {}
	for i = 1,#baglist do
		if getitemname(actor,baglist[i]) == "恶魔之靴(封印)" and getisjianquguo(actor,baglist[i]) == 0 then --没鉴定过的
			table.insert(t,baglist[i])
		end
	end
	return t
end

function getfengyinyaodai(actor)
	local baglist = getbaglist(actor)
	local t = {}
	for i = 1,#baglist do
		if getitemname(actor,baglist[i]) == "恶魔之带(封印)" and getisjianquguo(actor,baglist[i]) == 0 then --没鉴定过的
			table.insert(t,baglist[i])
		end
	end
	return t
end