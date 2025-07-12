include("Market_Def/zh.lua") --个人封装函数

function show(actor,weizhi,wyid,xianshi,chaoyouxianshi)
	if getsysint("合区次数") == 0 then
		sendmsg9(actor,"请合区后再来找老夫吧...")
		return
	end
	if getlevel(actor) < 60 then
		sendmsg9(actor,"你都还没有60级就不要打扰老夫了....")
		return
	end
	
	--haoshistart(actor)
	--sendmsg9(actor,tostring(weizhi)..tostring(wyid))
	weizhi = tonumber(weizhi) or 1 --人物还是背包 1是人物
	wyid = tonumber(wyid) or 0
	xianshi = tonumber(xianshi) or 0
	chaoyouxianshi = tonumber(chaoyouxianshi) or 0
	msg = [[
	<Img|x=0|width=643|height=457|show=4|bg=1|img=zhangheng/1.png|move=1|esc=1|reset=0>
	<Button|x=639.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	<Img|x=16.5|y=40.5|img=zhangheng/100.png|esc=0>
	<Img|x=386.5|y=39.5|img=zhangheng/161.png|esc=0>
	<Text|ay=0.5|x=469.5|y=59.0|size=18|color=94|outline=1|text=武器展示>
	<Img|x=388.5|y=117.5|width=230|height=310|scale9l=3|scale9b=3|img=zh/36.png|scale9r=3|esc=0|scale9t=3>
	<ListView|id=1999|children={2000}|x=389.5|y=122.5|width=230|height=300|direction=1|margin=0>
	<Img|x=159.5|y=70.5|width=88|height=88|esc=0|img=zhangheng/101.png>
	<Text|x=120.5|y=233.5|color=250|size=18|text=武器上可查看祝福值>
	<Img|x=143.5|y=281.5|img=zhangheng/231.png|esc=0>

	]]
	msg = msg ..'<ItemShow|x=137.5|y=276.5|width=70|height=70|itemid='.. getidbyname("超级祝福油") ..'|itemcount=1|showtips=1|bgtype=0>'
	msg = msg ..'<RText|x=212.5|y=300.5|color=255|size=18|text=<'.. itemcount(actor,"超级祝福油") ..'/FCOLOR=249>/<1/FCOLOR=250>>'
	msg = msg ..'<Button|x=18.5|y=396|nimg=zhangheng/8.png|pimg=zhangheng/8.png|mimg=zhangheng/8.png|link=@show,'..weizhi..','..wyid..',1>'
	msg = msg ..'<Text|x=297.5|y=396|color=251|size=18|text=获取超油|link=@show,'..weizhi..','..wyid..',0,1>'
	local t = {}
	if weizhi == 1 then
		msg=msg.."<Button|x=398.5|y=79.5|width=100|size=16|color=103|nimg=zhangheng/163.png|text=人物>"
		msg=msg.."<Button|x=510.5|y=79.5|width=100|size=16|color=7|nimg=zhangheng/162.png|pimg=zhangheng/162.png|text=背包|link=@show,2>"
		local item = linkbodyitem(actor,1) --关联武器
		if item ~= "0" and getitemname(actor,item) ~= "幸运小红剑" then
			table.insert(t,item)
		end
	else
		msg=msg.."<Button|x=398.5|y=79.5|width=100|size=16|color=7|nimg=zhangheng/162.png|pimg=zhangheng/162.png|text=人物|link=@show,1>"
		msg=msg.."<Button|x=510.5|y=79.5|width=100|size=16|color=103|nimg=zhangheng/163.png|text=背包>"
		local list = getbaglist(actor) --获取背包道具列表
		for i = 1,#list do
			local id = getiteminfo(actor,list[i],2) --物品id
			local std = getstditeminfo(id,2) --StdMode
			local name = getstditeminfo(id,1)
			if ( std == 5 or std == 6 ) and name ~= "幸运小红剑" then
				table.insert(t,list[i])
			end
		end
	end
	
	local ziids = ""
	for i = 2002,2002+#t+30 do
		ziids = ziids .. i .. ","
	end
	
	local ziid = 2002
	local ysxx = -2
	local ysyy = -6
	local gaodu = (math.floor((#t-1)/3) + 1) * 60 + 3
	msg = msg ..'<Layout|id=2000|children={2001}|height='.. gaodu ..'>' --设置底框宽 高
	msg = msg ..'<Layout|id=2001|children={'.. ziids ..'}|height='.. gaodu ..'>' --设置底框宽 高
	for i = 1,15 do
		msg = msg ..'<Img|id='..ziid..'|x='.. ysxx+19 + (i-1)%3*70 ..'|y='.. ysyy+9+math.floor((i-1)/3) * 60 ..'|width=52|height=52|scale9t=3|scale9b=3|img=zh/36.png|scale9r=3|scale9l=3>'
		ziid = ziid + 1		
	end
	
	for i = 1,#t do
		msg = msg ..'<Img|id='..ziid..'|children={wuping'..i..',liangkuang'..i..'}||x='.. ysxx+19 + (i-1)%3*70 ..'|y='.. ysyy+9+math.floor((i-1)/3) * 60 ..'|width=52|height=52|scale9t=3|scale9b=3|img=zh/36.png|scale9r=3|scale9l=3>'
		ziid = ziid + 1
		local makeid = getiteminfo(actor,t[i],1)
		msg = msg ..'<DBItemShow|id=wuping'..i..'|x=-8|y=-8|makeindex='..makeid..'|link=@show,'.. weizhi ..','.. makeid ..'>'
		if makeid == wyid then
			msg = msg ..'<Img|id=liangkuang'..i..'|x=-1|y=-1|img=zh/71.png|esc=0>'
			msg = msg ..'<DBItemShow|x=168.5|y=80.5|width=70|height=70|makeindex='..makeid..'|itemcount=1|showtips=1|bgtype=0>'
		end
	end
	msg = msg ..'<Button|x=157|y=380|color=10051|nimg=zhangheng/13.png|size=18|text=确定提升|link=@shengji,'..weizhi..','..wyid..'>'
	if xianshi == 1 then
		msg=msg..'<Layout|x=-1000|y=-1000|width=3000|height=3000|link=@show,'..weizhi..','..wyid..'>'
		msg=msg..[[
		<Img|ay=0.5|x=50.5|y=312.5|width=380|height=230|scale9r=10|scale9l=10|scale9b=10|img=zh/7.png|esc=0|scale9t=10>
		<RText|x=64.5|y=208.5|color=251|size=16|text=武器祝福说明：>
		<RText|x=64.5|y=238.5|size=16|color=255|text=⒈武器<幸运+6/FCOLOR=250>后可给武器增加<祝福值/FCOLOR=250>每消耗1瓶<超/FCOLOR=254>>
		<RText|x=80.5|y=263.5|size=16|color=255|text=<级祝福油/FCOLOR=254>可为武器增加300点祝福值，每分钟损>
		<RText|x=80.5|y=288.5|size=16|color=255|text=失祝福值2点>
		<RText|x=64.5|y=323.5|size=16|color=255|text=⒉当祝福值达到<800点>武器可额外获得1点幸运,达>
		<RText|x=80.5|y=348.5|size=16|color=255|text=到<1600点>可额外获得2点幸运  武器额外最高可>
		<RText|x=80.5|y=373.5|size=16|color=255|text=获得2点幸运，当全身<幸运+10点/FCOLOR=250>可获得<1.05倍/FCOLOR=70>>
		<RText|x=80.5|y=398.5|size=16|color=255|text=<攻击/FCOLOR=70>，加<11点/FCOLOR=250>时可获得<1.1倍攻击/FCOLOR=70>，以此类推...>


		]]
	end
	if chaoyouxianshi == 1 then
		msg=msg..[[
		<Img|ay=0.5|x=20.0|y=265.0|width=360|height=200|scale9r=10|scale9t=10|scale9l=10|img=zh/7.png|scale9b=10|esc=0>
		<RText|x=137.0|y=193.0|color=251|size=18|text=超级祝福油合成>
		<RText|x=53.0|y=245.0|color=255|size=18|text=材料：>
		<Img|x=124.0|y=232.0|width=50|height=50|esc=0|img=zhangheng/104.png>
		
		<Img|x=227.0|y=232.0|width=50|height=50|esc=0|img=zhangheng/104.png>
		

		]]
		msg=msg..'<ItemShow|x=116.0|y=224.0|width=70|height=70|itemid='.. getidbyname("祝福油") ..'|itemcount=1|showtips=1|bgtype=0>'
		msg=msg..'<RText|ax=0.5|ay=0.5|x=149.0|y=273.5|color=255|size=16|text=<'.. itemcount(actor,"祝福油") ..'/FCOLOR=249>/<150/FCOLOR=250>>'
		
		msg=msg..'<ItemShow|x=219.0|y=224.0|width=70|height=70|itemid='.. getidbyname("金条") ..'|itemcount=1|showtips=1|bgtype=0>'
		msg=msg..'<RText|ax=0.5|ay=0.5|x=252.0|y=273.5|color=255|size=16|text=<'.. itemcount(actor,"金条") ..'/FCOLOR=249>/<1/FCOLOR=250>>'
		
		msg=msg..'<Button|x=90.5|y=305.5|nimg=zhangheng/13.png|color=10051|size=18|text=确定合成|link=@hecheng,'..weizhi..','..wyid..'>'
		msg=msg..'<Button|x=225.5|y=306.5|nimg=zhangheng/13.png|color=10051|size=18|text=取消|link=@show,'..weizhi..','..wyid..'>'
	end
	--haoshiend(actor)
	say(actor,msg)
end

function shengji(actor,weizhi,wyid)
	weizhi = tonumber(weizhi)
	wyid = tonumber(wyid)
	if wyid == 0 then
		sendmsg9(actor,"请选择要祝福的武器")
		return
	end
	local item = getitembymakeindex(actor,wyid) --物品对象
	if item == "0" then
		sendmsg9(actor,"你没有这件装备")
		return show(actor,weizhi,wyid)
	end
	--sendmsg6(actor,"物品对象"..tostring(item))
	if weizhi == 1 and not isinrole(actor,wyid) then
		sendmsg9(actor,"物品已经不在身上")
		return show(actor,weizhi,wyid)
	end
	if weizhi == 2 and not isinbag(actor,item) then
		sendmsg9(actor,"物品已经不在背包")
		return show(actor,weizhi,wyid)
	end
	local luck = getluck(actor,item) --幸运
	if luck < 6 then
		sendmsg9(actor,"幸运低于6的武器无法提升祝福值")
		return
	end
	
	if getitem_zfz(actor,item) >= 5000 then
		sendmsg9(actor,"祝福值已满")
		return
	end
	
	if itemcount(actor,"超级祝福油",1) < 1 then
		sendmsg9(actor,"超级祝福油不足")
		return
	end
	takeitem(actor, "超级祝福油", 1,0)
	
	local zhufuzhi = getitem_zfz(actor,item)+300
	if zhufuzhi > 5000 then
		zhufuzhi = 5000
	end
	setitem_zfz(actor,item,zhufuzhi) --设置祝福值
	setxingyun(actor,item)
	sendmsg9(actor,"祝福成功")
	return show(actor,weizhi,wyid)
end

function setxingyun(actor,item)
	local zhufuzhi = getitem_zfz(actor,item) --祝福值
	local luck = getluck(actor,item) --幸运值
	--lib996:release_print("祝福值"..zhufuzhi,"幸运值"..luck)
	if zhufuzhi >= 1600 then
		if luck ~= 8 then
			setitemaddvalue(actor,item,1,5,8)
		end
	elseif zhufuzhi >= 800 then
		if luck ~= 7 then
			setitemaddvalue(actor,item,1,5,7)
		end
	elseif luck > 6 then
		setitemaddvalue(actor,item,1,5,6)
	end
	local t = {
    open=1,  
    show=2,  
    name="祝福值",  
    color=254,  
    imgcount=3,  
    cur=zhufuzhi, 
    max=5000, 
	level=0
	}
	setcustomitemprogressbar(actor,item,0,tbl2json(t))
	refreshitem(actor, item)
end

function hecheng(actor,weizhi,wyid)
	if itemcount(actor,"祝福油",1) < 150 then
		sendmsg9(actor,"祝福油不足")
		return
	end
	if itemcount(actor,"金条",1) < 1 then
		sendmsg9(actor,"金条不足")
		return
	end
	takeitem(actor, "祝福油", 150,0)
	takeitem(actor, "金条", 1,0)
	giveitem(actor,"超级祝福油",1)
	sendmsg9(actor,"合成成功")
	return show(actor,weizhi,wyid,0,1)
end