include("Market_Def/zh.lua") --个人封装函数



function show(actor,weizhi,wyid,xianshi)
	--haoshistart(actor)
	--sendmsg9(actor,tostring(weizhi)..tostring(wyid))
	weizhi = tonumber(weizhi) or 1 --人物还是背包 1是人物
	wyid = tonumber(wyid) or 0
	xianshi = tonumber(xianshi) or 0
	msg = [[
	<Img|x=0|width=643|height=457|reset=0|show=4|bg=1|img=zhangheng/1.png|move=1|esc=1>
	<Button|x=639.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	<Img|x=16.5|y=40.5|img=zhangheng/100.png|esc=0>
	<Img|x=386.5|y=39.5|img=zhangheng/161.png|esc=0>
	<Text|ay=0.5|x=469.5|y=59.0|outline=1|color=94|size=18|text=项链展示>
	<Img|x=388.5|y=117.5|width=230|height=310|scale9l=3|scale9b=3|img=zh/36.png|scale9r=3|esc=0|scale9t=3>
	<ListView|id=1999|children={2000}|x=389.5|y=122.5|width=230|height=300|direction=1|margin=0>
	<Img|x=159.5|y=70.5|width=88|height=88|esc=0|img=zhangheng/101.png>

	]]
	msg = msg ..'<RText|a=4|x=206.5|y=289.0|color=150|size=18|text=元宝：<'.. jianhuanum(getingot(actor)) ..'>/<500/FCOLOR=250>>'
	msg = msg ..'<Button|x=18.5|y=396.5|nimg=zhangheng/8.png|pimg=zhangheng/8.png|mimg=zhangheng/8.png|link=@show,'..weizhi..','..wyid..',1>'
	
	for i = 1,3 do
		msg = msg ..'<Img|x='.. 129.5 + (i-1)*55 ..'|y=227.5|img=zhangheng/49.png|esc=0>'
	end
	
	local t = {}
	if weizhi == 1 then
		msg=msg.."<Button|x=398.5|y=79.5|width=100|size=16|color=103|nimg=zhangheng/163.png|text=人物>"
		msg=msg.."<Button|x=510.5|y=79.5|width=100|size=16|color=7|nimg=zhangheng/162.png|pimg=zhangheng/162.png|text=背包|link=@show,2>"
		local item = linkbodyitem(actor,3) --关联项链
		if item ~= "0" and getitemname(actor,item) ~= "幸运灯笼项链" then
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
			if ( std == 19 or std == 20 or std == 21 ) and name ~= "幸运灯笼项链" then
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
			local gailv = {50,30,20,0}
			local luck = getluck(actor,t[i]) --幸运
			if luck >= 3 then
				msg = msg ..'<Text|ax=0.5|x=205.0|y=316.5|size=18|color=254|text=此项链已达最高幸运>'
			else
				msg = msg ..'<Text|ax=0.5|x=205.0|y=316.5|size=18|color=254|text=成功概率：'..gailv[luck+1]..'%>'
			end
			for i = 1,luck do
				msg = msg ..'<Img|x='.. 129.5 + (i-1)*55 ..'|y=227.5|img=zhangheng/50.png|esc=0>'
			end
		end
	end
	msg = msg ..'<Button|x=83.5|y=379.5|color=10051|nimg=zhangheng/13.png|size=18|text=确定升级|link=@shengji,'..weizhi..','..wyid..'>'
	msg = msg ..'<Button|x=237.5|y=379.5|color=10051|nimg=zhangheng/13.png|size=18|text=免费清洗|link=@qingxi,'..weizhi..','..wyid..'>'
	if xianshi == 1 then
		msg=msg..'<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@show,'..weizhi..','..wyid..'>'
		msg=msg..[[
		<Img|ay=0.5|x=50.5|y=346.5|width=260|height=160|rotate=0|scale9r=10|scale9t=10|scale9l=10|img=zh/7.png|scale9b=10|esc=0>
		<RText|x=62.5|y=274.5|color=251|size=16|text=幸运介绍：>
		<RText|x=62.5|y=299.5|color=255|size=16|text=1.幸运项链<+1/FCOLOR=250>成功几率为：<50%/FCOLOR=254>>
		<RText|x=62.5|y=324.5|color=255|size=16|text=2.幸运项链<+2/FCOLOR=250>成功几率为：<30%/FCOLOR=254>>
		<RText|x=62.5|y=349.5|color=255|size=16|text=3.幸运项链<+3/FCOLOR=250>成功几率为：<20%/FCOLOR=254>>
		<RText|x=62.5|y=374.5|size=16|color=255|text=每次给项链附加幸运时需<500元宝/FCOLOR=250>>
		<RText|x=62.5|y=399.5|size=16|color=255|text=当项链<幸运+3/FCOLOR=249>时可触发<1-3点暴击/FCOLOR=249>>
		]]
	end
	--haoshiend(actor)
	say(actor,msg)
end
local jilv = {50,15,8}
local jilv1 = {50,23,12}
local dijixianglian = {
["圣战项链"]=1,["法神项链"]=1,["天尊项链"]=1,["雷霆项链"]=1,["烈焰项链"]=1,["光芒项链"]=1,
["天之雷霆项链"]=1,["天之烈焰项链"]=1,["天之光芒项链"]=1,["记忆项链"]=1,["黑铁项链"]=1,["魔血项链"]=1,["祈祷项链"]=1,
}
function shengji(actor,weizhi,wyid)
	weizhi = tonumber(weizhi)
	wyid = tonumber(wyid)
	if wyid == 0 then
		sendmsg9(actor,"请选择要升级幸运的项链")
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
	if luck >= 3 then
		sendmsg9(actor,"此项链已达最高幸运")
		return
	end
	
	if getingot(actor) < 500 then
		sendmsg9(actor,"元宝不足")
		return
	end
	subingot(actor,500,"幸运项链")

	local t = jilv
	if dijixianglian[getitemname(actor,item)] then
		t = jilv1
	end

	if math.random(1,100) > t[luck+1] then
		sendmsg9(actor,"不好意思,项链升级幸运失败")
		return
	end
	
	setitemaddvalue(actor,item,1,5,getitemaddvalue(actor,item,1,5)+1)
	
	if luck == 2 then
		if getitem_xlxlcs(actor,item) >= 6 and math.random(1,100) <= 50 then
			setitemaddvalue(actor,item,1,30,3)
			--sendmsg6(actor,"恭喜你升级幸运成功，项链暴击+3")
		else
			local baoji = 0
			local sjzhi = math.random(1,100)
			if sjzhi <= 50 then
				baoji = 1
			elseif sjzhi <= 90 then
				baoji = 2
			else
				baoji = 3
			end	
			setitemaddvalue(actor,item,1,30,baoji)	
			--sendmsg6(actor,"恭喜你升级幸运成功，项链暴击+"..baoji)	
		end
		if getitemaddvalue(actor,item,1,30) >= 3 then --暴击3给淬炼值
			local clzhi = 0
			local sjzhi = math.random(1,100)
			if sjzhi <= 50 then
				clzhi = 1
			elseif sjzhi <= 80 then
				clzhi = 2
			else
				clzhi = 3
			end	
			
			changecustomitemtext(actor,item,"",5)
			--changecustomitemtextcolor(actor,item,154,5) --颜色
			changecustomitemabil(actor,item,0,1,209,5) --参数4  1为绑定att属性 
			--changecustomitemabil(actor,item,0,2,31,5) --参数4  2为绑定自定属性表 显示用
			--changecustomitemabil(actor,item,0,3,0,5) --参数4  3为绑定的值是否为百分比 0不是 1是
			--changecustomitemabil(actor,item,0,4,0,5) --参数4  4为绑定属性显示位置哪一行
			changecustomitemvalue(actor,item,0,"=",clzhi,5) --设置绑定att属性的值
			
			callscriptex(actor, "CallLua", "wuqishengji", "@setcuilianzhishuxing") --设置淬炼值属性
		end
	end
	refreshitem(actor,item)
	sendmsg9(actor,"恭喜你升级幸运成功，项链幸运+"..luck+1,"#00FF00")
	return show(actor,weizhi,wyid)
end

function qingxi(actor,weizhi,wyid)
	messagebox(actor,"\n清洗项链将会把项链幸运和暴击清零，是否继续清洗？","@qingxi1,".. weizhi ..","..wyid,"@kong")
end

function qingxi1(actor,weizhi,wyid)
	weizhi = tonumber(weizhi)
	wyid = tonumber(wyid)
	if wyid == 0 then
		sendmsg9(actor,"请选择要清洗幸运的项链")
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
	if luck < 3 then
		sendmsg9(actor,"只有幸运+3的项链才能清洗")
		return
	end
	setitemaddvalue(actor,item,1,5,0)
	setitemaddvalue(actor,item,1,30,0)
	
	clearitemcustomabil(actor,item,5) --清理自定义组别
	setitem_xlxlcs(actor,item,getitem_xlxlcs(actor,item)+1)
	callscriptex(actor, "CallLua", "wuqishengji", "@setcuilianzhishuxing") --设置淬炼值属性
	refreshitem(actor,item)
	sendmsg9(actor,"清洗成功")
	return show(actor,weizhi,wyid)
end