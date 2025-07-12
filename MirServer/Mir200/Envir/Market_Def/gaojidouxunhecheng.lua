include("Market_Def/zh.lua") --个人封装函数
local dalei_t = {"高级斗笠","高级勋章"} 
local xiaolei_t = {
	{"猎魔人★斗笠(传说)","猎魔人★斗笠(神话)","猎魔人★斗笠(完美)"},
	{"猎魔人★勋章(传说)","猎魔人★勋章(神话)","猎魔人★勋章(完美)"},
} 
local data = {
	[0]={
			{
				{
					{xiaohao={shengwang=10000,item={{"傲天々斗笠",2},{"金盒",8},{"猎魔人★斗笠",1}}},givename="猎魔人★斗笠(传说)",chenggonglv=50,tishi=""},
					{xiaohao={shengwang=20000,item={{"猎魔人★斗笠(传说)",2},{"金盒",40}}},givename="猎魔人★斗笠(神话)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=40000,item={{"猎魔人★斗笠(神话)",2},{"金盒",100}}},givename="猎魔人★斗笠(完美)",chenggonglv=100,tishi=""},
				},	
				{
					{xiaohao={shengwang=5000,yuanbao=200000,item={{"傲天々斗笠",2},{"猎魔人★斗笠",1}}},givename="猎魔人★斗笠(传说)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=10000,yuanbao=500000,item={{"猎魔人★斗笠(传说)",2}}},givename="猎魔人★斗笠(神话)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=20000,yuanbao=1000000,item={{"猎魔人★斗笠(神话)",2}}},givename="猎魔人★斗笠(完美)",chenggonglv=100,tishi=""},
				},			
			},
			{
				{
					{xiaohao={shengwang=10000,item={{"傲天々勋章",2},{"金盒",8},{"猎魔人★勋章",1}}},givename="猎魔人★勋章(传说)",chenggonglv=50,tishi=""},
					{xiaohao={shengwang=20000,item={{"猎魔人★勋章(传说)",2},{"金盒",40}}},givename="猎魔人★勋章(神话)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=40000,item={{"猎魔人★勋章(神话)",2},{"金盒",100}}},givename="猎魔人★勋章(完美)",chenggonglv=100,tishi=""},
				},	
				{
					{xiaohao={shengwang=5000,yuanbao=200000,item={{"傲天々勋章",2},{"猎魔人★勋章",1}}},givename="猎魔人★勋章(传说)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=10000,yuanbao=500000,item={{"猎魔人★勋章(传说)",2}}},givename="猎魔人★勋章(神话)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=20000,yuanbao=1000000,item={{"猎魔人★勋章(神话)",2}}},givename="猎魔人★勋章(完美)",chenggonglv=100,tishi=""},
				},		
			},
		},
	[1]={
			{
				{
					{xiaohao={shengwang=10000,item={{"幻天々斗笠",2},{"金盒",8},{"猎魔人★斗笠",1}}},givename="猎魔人★斗笠(传说)",chenggonglv=50,tishi=""},
					{xiaohao={shengwang=20000,item={{"猎魔人★斗笠(传说)",2},{"金盒",40}}},givename="猎魔人★斗笠(神话)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=40000,item={{"猎魔人★斗笠(神话)",2},{"金盒",100}}},givename="猎魔人★斗笠(完美)",chenggonglv=100,tishi=""},
				},	
				{
					{xiaohao={shengwang=5000,yuanbao=200000,item={{"幻天々斗笠",2},{"猎魔人★斗笠",1}}},givename="猎魔人★斗笠(传说)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=10000,yuanbao=500000,item={{"猎魔人★斗笠(传说)",2}}},givename="猎魔人★斗笠(神话)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=20000,yuanbao=1000000,item={{"猎魔人★斗笠(神话)",2}}},givename="猎魔人★斗笠(完美)",chenggonglv=100,tishi=""},
				},			
			},
			{
				{
					{xiaohao={shengwang=10000,item={{"幻天々勋章",2},{"金盒",8},{"猎魔人★勋章",1}}},givename="猎魔人★勋章(传说)",chenggonglv=50,tishi=""},
					{xiaohao={shengwang=20000,item={{"猎魔人★勋章(传说)",2},{"金盒",40}}},givename="猎魔人★勋章(神话)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=40000,item={{"猎魔人★勋章(神话)",2},{"金盒",100}}},givename="猎魔人★勋章(完美)",chenggonglv=100,tishi=""},
				},	
				{
					{xiaohao={shengwang=5000,yuanbao=200000,item={{"幻天々勋章",2},{"猎魔人★勋章",1}}},givename="猎魔人★勋章(传说)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=10000,yuanbao=500000,item={{"猎魔人★勋章(传说)",2}}},givename="猎魔人★勋章(神话)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=20000,yuanbao=1000000,item={{"猎魔人★勋章(神话)",2}}},givename="猎魔人★勋章(完美)",chenggonglv=100,tishi=""},
				},		
			},
		},
	[2]={
			{
				{
					{xiaohao={shengwang=10000,item={{"玄天々斗笠",2},{"金盒",8},{"猎魔人★斗笠",1}}},givename="猎魔人★斗笠(传说)",chenggonglv=50,tishi=""},
					{xiaohao={shengwang=20000,item={{"猎魔人★斗笠(传说)",2},{"金盒",40}}},givename="猎魔人★斗笠(神话)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=40000,item={{"猎魔人★斗笠(神话)",2},{"金盒",100}}},givename="猎魔人★斗笠(完美)",chenggonglv=100,tishi=""},
				},	
				{
					{xiaohao={shengwang=5000,yuanbao=200000,item={{"玄天々斗笠",2},{"猎魔人★斗笠",1}}},givename="猎魔人★斗笠(传说)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=10000,yuanbao=500000,item={{"猎魔人★斗笠(传说)",2}}},givename="猎魔人★斗笠(神话)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=20000,yuanbao=1000000,item={{"猎魔人★斗笠(神话)",2}}},givename="猎魔人★斗笠(完美)",chenggonglv=100,tishi=""},
				},			
			},
			{
				{
					{xiaohao={shengwang=10000,item={{"玄天々勋章",2},{"金盒",8},{"猎魔人★勋章",1}}},givename="猎魔人★勋章(传说)",chenggonglv=50,tishi=""},
					{xiaohao={shengwang=20000,item={{"猎魔人★勋章(传说)",2},{"金盒",40}}},givename="猎魔人★勋章(神话)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=40000,item={{"猎魔人★勋章(神话)",2},{"金盒",100}}},givename="猎魔人★勋章(完美)",chenggonglv=100,tishi=""},
				},	
				{
					{xiaohao={shengwang=5000,yuanbao=200000,item={{"玄天々勋章",2},{"猎魔人★勋章",1}}},givename="猎魔人★勋章(传说)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=10000,yuanbao=500000,item={{"猎魔人★勋章(传说)",2}}},givename="猎魔人★勋章(神话)",chenggonglv=100,tishi=""},
					{xiaohao={shengwang=20000,yuanbao=1000000,item={{"猎魔人★勋章(神话)",2}}},givename="猎魔人★勋章(完美)",chenggonglv=100,tishi=""},
				},		
			},
		},
}

function getxunzhangdoulidengji(actor)
	local curdengji = getint(actor,"查看斗勋等级")
	local dengji = 0
	if isyongyou(actor,"猎魔人★勋章",2) or isyongyou(actor,"猎魔人★斗笠",13) then
		dengji = 1
	end
	if isyongyou(actor,"猎魔人★勋章(传说)",2) or isyongyou(actor,"猎魔人★斗笠(传说)",13) then
		dengji = 2
	end
	if ( isyongyou(actor,"猎魔人★勋章(神话)",2) or isyongyou(actor,"猎魔人★斗笠(神话)",13) ) and getlevel(actor) >= 75 then
		dengji = 3
	end
	if ( isyongyou(actor,"猎魔人★勋章(完美)",2) or isyongyou(actor,"猎魔人★斗笠(完美)",13) ) and getlevel(actor) >= 75 then
		dengji = 3
	end
	if dengji > curdengji then
		setint(actor,"查看斗勋等级",dengji)
	end
	return getint(actor,"查看斗勋等级")
end

function show(actor,daleiid,xiaoleiid,fangshi)
	local xianshidengji = getxunzhangdoulidengji(actor)
	if xianshidengji == 0 then
		sendmsg9(actor,"请获得猎魔人装备在来了解它的传说吧...")
		return
	end
	if getkaiquday() < 16 then
		sendmsg9(actor,"请在开区15天后再找我把...")
		return
	end

	daleiid = tonumber(daleiid) or 1
	xiaoleiid = tonumber(xiaoleiid) or 1
	fangshi = tonumber(fangshi) or 0 --合成方式 0没有 1金币 2元宝
	local job = getjob(actor)
	local msg = [[
		<Img|x=0|width=643|height=457|esc=1|loadDelay=1|bg=1|img=zhangheng/1.png|move=1|reset=0|show=4>
		<Button|x=639.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=16.5|y=40.5|img=zhangheng/80.png|esc=0>
		<Img|x=172.5|y=39.5|img=zhangheng/81.png|esc=0>
	]]
	local pyy = 0
	for i = 1,#dalei_t do
		if daleiid == i then --大类按钮
			msg=msg.."<Button|x=18.5|y=".. 39.5 + pyy .."|width=152|size=18|color=150|nimg=zh/66.png|text="..dalei_t[i]..">"
			pyy = pyy + 36
			for j = 1,xianshidengji do
				if j == xiaoleiid then
					msg=msg.."<Button|x=16.5|y=".. 39.5 + pyy .."|color=150|size=17|nimg=zhangheng/69.png|text="..xiaolei_t[daleiid][j]..">"
					msg=msg.."<Img|x=18.5|y=".. 70.5 + pyy .."|img=zhangheng/70.png|esc=0>"
					--msg=msg.."<Img|x=16.5|y=".. 41.5 + pyy .."|width=152|height=31|img=zh/22.png|esc=0>"
					pyy = pyy + 36
				else
					msg=msg.."<Button|x=16.5|y=".. 39.5 + pyy .."|color=7|size=17|pimg=zhangheng/69.png|nimg=zhangheng/69.png|text="..xiaolei_t[daleiid][j].."|link=@show,"..daleiid..","..j..">"
					msg=msg.."<Img|x=18.5|y=".. 70.5 + pyy .."|img=zhangheng/70.png|esc=0>"
					pyy = pyy + 36
				end
			end
			pyy = pyy + 6
		else
			msg=msg.."<Button|x=18.5|y=".. 39.5 + pyy .."|width=152|size=18|color=7|nimg=zh/67.png|pimg=zh/67.png|text="..dalei_t[i].."|link=@show,"..i..">"
			pyy = pyy + 40
		end
	end
	if fangshi == 0 then
		msg=msg.."<Text|x=357.5|y=104.5|color=103|size=20|text=锻造说明>"
		msg=msg.."<Text|x=264.5|y=166.5|color=103|size=18|text=系统提供两种锻造方法点击可查看>"
		msg=msg.."<Button|x=266.5|y=294.5|color=10051|size=18|pimg=zhangheng/13.png|nimg=zhangheng/13.png|text=方式一|link=@show,"..daleiid..","..xiaoleiid..",1>"
		msg=msg.."<Button|x=445.5|y=294.5|color=10051|size=18|pimg=zhangheng/13.png|nimg=zhangheng/13.png|text=方式二|link=@show,"..daleiid..","..xiaoleiid..",2>"
	else
		msg=msg.."<Img|x=264.5|y=47.5|img=zhangheng/74.png|esc=0>"
		msg=msg.."<Img|x=259.5|y=180.5|img=zhangheng/75.png|esc=0>"
		local t = data[job][daleiid][fangshi][xiaoleiid]
		msg=msg.."<Img|x=373.5|y=215.5|img=zhangheng/73.png|esc=0>"
		msg=msg.."<ItemShow|x=372.5|y=212.5|itemid=".. getidbyname(t.givename) .."|itemcount=1|showtips=1|bgtype=0>"
		
		if #t.xiaohao.item == 1 then
			msg=msg.."<Img|x=400.5|y=130.5|img=zhangheng/76.png|esc=0>"
			msg=msg.."<Img|x=373.5|y=92.5|img=zhangheng/73.png|esc=0>"
			msg=msg.."<ItemShow|x=372.5|y=89.5|itemid=".. getidbyname(t.xiaohao.item[1][1]) .."|itemcount=1|showtips=1|bgtype=0>"
			msg=msg..'<RText|ax=0.5|x=405.0|y=129.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,t.xiaohao.item[1][1]) ..'/FCOLOR=249>/<'..t.xiaohao.item[1][2]..'/FCOLOR=250>>'
		elseif #t.xiaohao.item == 2 then
			msg=msg.."<Img|x=317.5|y=130.5|img=zhangheng/77.png|esc=0>"
			msg=msg.."<Img|x=292.5|y=92.5|img=zhangheng/73.png|esc=0>"
			msg=msg.."<ItemShow|x=291.5|y=89.5|itemid=".. getidbyname(t.xiaohao.item[1][1]) .."|itemcount=1|showtips=1|bgtype=0>"
			msg=msg..'<RText|ax=0.5|x=324.0|y=129.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,t.xiaohao.item[1][1]) ..'/FCOLOR=249>/<'..t.xiaohao.item[1][2]..'/FCOLOR=250>>'
			msg=msg.."<Img|x=456.5|y=92.5|img=zhangheng/73.png|esc=0>"
			msg=msg.."<ItemShow|x=455.5|y=89.5|itemid=".. getidbyname(t.xiaohao.item[2][1]) .."|itemcount=1|showtips=1|bgtype=0>"
			msg=msg..'<RText|ax=0.5|x=488.0|y=129.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,t.xiaohao.item[2][1]) ..'/FCOLOR=249>/<'..t.xiaohao.item[2][2]..'/FCOLOR=250>>'
		elseif #t.xiaohao.item == 3 then
			msg=msg.."<Img|x=245.5|y=130.5|img=zhangheng/78.png|esc=0>"
			msg=msg.."<Img|x=219.5|y=92.5|img=zhangheng/73.png|esc=0>"
			msg=msg.."<ItemShow|x=218.5|y=89.5|itemid=".. getidbyname(t.xiaohao.item[1][1]) .."|itemcount=1|showtips=1|bgtype=0>"
			msg=msg..'<RText|ax=0.5|x=251.0|y=129.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,t.xiaohao.item[1][1]) ..'/FCOLOR=249>/<'..t.xiaohao.item[1][2]..'/FCOLOR=250>>'
			msg=msg.."<Img|x=374.5|y=92.5|img=zhangheng/73.png|esc=0>"
			msg=msg.."<ItemShow|x=373.5|y=89.5|itemid=".. getidbyname(t.xiaohao.item[2][1]) .."|itemcount=1|showtips=1|bgtype=0>"
			msg=msg..'<RText|ax=0.5|x=406.0|y=129.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,t.xiaohao.item[2][1]) ..'/FCOLOR=249>/<'..t.xiaohao.item[2][2]..'/FCOLOR=250>>'
			msg=msg.."<Img|x=530.5|y=92.5|img=zhangheng/73.png|esc=0>"
			msg=msg.."<ItemShow|x=529.5|y=89.5|itemid=".. getidbyname(t.xiaohao.item[3][1]) .."|itemcount=1|showtips=1|bgtype=0>"
			msg=msg..'<RText|ax=0.5|x=562.0|y=129.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,t.xiaohao.item[3][1]) ..'/FCOLOR=249>/<'..t.xiaohao.item[3][2]..'/FCOLOR=250>>'
		end
		
		local str = ""
		local str1= ""
		if t.xiaohao.yuanbao then
			str = "<元宝：/FCOLOR=251><".. jianhuanum(getingot(actor)) .."/FCOLOR=249>/<".. jianhuanum(t.xiaohao.yuanbao) .."/FCOLOR=250>"
		end
		if t.xiaohao.shengwang then
			str1 = "<声望：/FCOLOR=251><".. jianhuanum(getshengwang(actor)) .."/FCOLOR=249>/<".. jianhuanum(t.xiaohao.shengwang) .."/FCOLOR=250>"
		end
		if str ~= "" then
			if str1 ~= "" then
				str = str .."　　"..str1
			end
		else
			str = str1
		end
		msg=msg.."<RText|ax=0.5|x=404.5|y=303.5|size=18|color=255|text="..str..">"
		if t.tishi ~= "" then
			msg=msg.."<RText|ax=0.5|x=404.5|y=343.5|size=18|color=254|text=成功率："..t.chenggonglv.."%<".. t.tishi .."/FCOLOR=251>>"
		else
			msg=msg.."<RText|ax=0.5|x=404.5|y=343.5|size=18|color=254|text=成功率："..t.chenggonglv.."%>"
		end
		msg=msg.."<Button|x=361.5|y=379.5|nimg=zhangheng/13.png|color=10051|size=18|text=合成|link=@hecheng,"..daleiid..","..fangshi..","..xiaoleiid..">"
		msg=msg.."<Text|x=560.5|y=399.5|size=18|nimg=zhangheng/13.png|color=250|text=返回|link=@show,"..daleiid..","..xiaoleiid..">"
	end

	say(actor,msg)
end


function hecheng(actor,id1,id2,id3)
	id1=tonumber(id1)
	id2=tonumber(id2)
	id3=tonumber(id3)
	local job = getjob(actor)
	local shuju = data[job][id1][id2][id3].xiaohao
	local givename = data[job][id1][id2][id3].givename
	local chenggonglv = data[job][id1][id2][id3].chenggonglv
	if shuju.yuanbao then
		if getingot(actor) < shuju.yuanbao then
			sendmsg9(actor,"条件不足")
			return
		end
	end
	if shuju.shengwang then
		if getshengwang(actor) < shuju.shengwang then
			sendmsg9(actor,"条件不足")
			return
		end
	end
	
	for i = 1,#shuju.item do
		if itemcount(actor,shuju.item[i][1],2) < shuju.item[i][2] then
			sendmsg9(actor,"条件不足")
			return
		end
	end
	for i = 1,#shuju.item do
		takeitem(actor, shuju.item[i][1], shuju.item[i][2],0)
	end
	
	if shuju.yuanbao then
		subingot(actor,shuju.yuanbao)
	end
	if shuju.shengwang then
		subshengwang(actor,shuju.shengwang)
	end
	if math.random(1,100) <= chenggonglv then
		giveitem(actor,givename, 1,0)
		sendmsg9(actor,"锻造成功")
	else
		sendmsg9(actor,"锻造失败")
	end
	return show(actor,id1,id3,id2)
end



