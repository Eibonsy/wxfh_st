include("Market_Def/zh.lua") --个人封装函数
function show(actor)
	local msg = ""
	if getint(actor,"领悟酿酒术") >= 2 then 
		msg = [[
		<Img|x=0.0|y=0.0|width=490|height=280|scale9t=30|img=zhangheng/176.png|move=0|loadDelay=1|reset=1|scale9l=30|scale9b=30|show=0|bg=1|scale9r=30|esc=1>
		<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
		<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=品酒师>
		<Text|x=22.0|y=55.0|color=161|size=16|text=小伙子，不要打扰老夫品酒，这老板娘现在酿酒的技术越来越高>
		<RText|x=22.0|y=77.0|color=161|size=16|text=都飘着阵阵酒香.....>
		<RText|x=22.0|y=109.0|size=16|color=161|text=老夫也想成为"酒剑仙"那样潇洒的人物, 我永远记得那句<"御剑乘/FCOLOR=250>>
		<RText|x=22.0|y=131.0|size=16|color=161|text=<风来，除魔天地间，有酒乐逍遥，无酒我亦颠"/FCOLOR=250>的壮志豪言, 不过>
		<RText|x=22.0|y=153.0|size=16|color=161|text=老夫这里有酿酒的工具可以供你使用，但材料还需要你自行寻找>
		<RText|x=22.0|y=175.0|size=16|color=161|text=随着你酿酒的次数越多, 终有一天会成为<"酿酒宗师"/FCOLOR=254>名动玛法大>
		<RText|x=22.0|y=197.0|size=16|color=161|text=陆，毕竟老夫也想尝尝那传说中的<"虎骨酒"/FCOLOR=253>.......>
		<Text|ax=0.5|x=246.0|y=230.0|color=250|size=18|text=点击 → 开始酿酒|link=@niangjiu>
		]]
	else
		msg = [[
		<Img|x=0.0|y=0.0|width=490|height=180|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|reset=1|scale9l=30|esc=1|img=zhangheng/176.png|show=0>
		<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
		<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=246.0|y=34.5|size=18|color=251|text=品酒师>
		<Text|x=22.0|y=60.0|size=16|color=161|text=小伙子，不要打扰老夫品酒，这老板娘现在酿酒的技术越来越高>
		<RText|x=22.0|y=87.0|size=16|color=161|text=都飘着阵阵酒香.....>

		]]
	end
	say(actor,msg)
end
local niangjiu_t = {
	{"泉水","高粱","高粱酒"},
	{"泉水","虎骨","虎骨酒"}
}
function niangjiu(actor,id,shuoming,donghua)
	id = tonumber(id) or 1
	shuoming = tonumber(shuoming) or 0
	donghua = tonumber(donghua) or 0
	
	local msg = [[
		<Img|show=4|img=zhangheng/188.png|move=1|bg=1|reset=0|esc=1>
		<Layout|x=545|y=0|width=80|height=80|link=@exit>
		<Button|x=500.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=144.0|y=276.0|width=52|height=52|esc=0|img=zhangheng/104.png>
		<Img|x=238.0|y=276.0|width=52|height=52|esc=0|img=zhangheng/104.png>
		<Img|x=334.0|y=276.0|width=52|height=52|esc=0|img=zhangheng/104.png>
		<Button|x=37.0|y=264.0|nimg=zhangheng/189.png|color=255|size=18|link=@niangjiu,1>
		<Button|x=37.0|y=305.0|nimg=zhangheng/190.png|color=255|size=18|link=@niangjiu,2>
		<Img|x=198.0|y=283.0|img=zh/28.png|esc=0>
		<Img|x=290.0|y=286.0|img=zh/29.png|esc=0>
	]]
	
	msg=msg..'<Button|x=37.0|y=223.0|nimg=zhangheng/254.png|color=255|size=18|link=@niangjiu,'..id..',1>'
	msg=msg..'<RText|x=205.0|y=224.0|color=161|size=18|outline=1|text=酿制<'.. niangjiu_t[id][3] ..'/FCOLOR=250>需<'.. niangjiu_t[id][1] ..'*1+'.. niangjiu_t[id][2] ..'*1/FCOLOR=70>>'
	msg=msg..'<ItemShow|x=138.0|y=270.0|width=70|height=70|itemid='.. getidbyname(niangjiu_t[id][1]) ..'|itemcount=1|showtips=1|bgtype=0>'
	msg=msg..'<ItemShow|x=232.0|y=270.0|width=70|height=70|itemid='.. getidbyname(niangjiu_t[id][2]) ..'|itemcount=1|showtips=1|bgtype=0>'
	msg=msg..'<ItemShow|x=328.0|y=270.0|width=70|height=70|itemid='.. getidbyname(niangjiu_t[id][3]) ..'|itemcount=1|showtips=1|bgtype=0>'
	msg=msg..'<RText|ax=0.5|x=172.0|y=306.0|color=250|size=16|outline=1|text=<'.. itemcount(actor,niangjiu_t[id][1]) ..'/FCOLOR=249>/1>'
	msg=msg..'<RText|ax=0.5|x=266.0|y=306.0|color=250|size=16|outline=1|text=<'.. itemcount(actor,niangjiu_t[id][2]) ..'/FCOLOR=249>/1>'
	msg=msg..'<Button|x=402.0|y=287.0|nimg=zhangheng/191.png|color=255|size=18|link=@niang,'..id..','..shuoming..'>'
	if shuoming == 1 then
		msg=msg..[[
		<Img|ay=0.5|x=138.0|y=151.0|width=352|height=212|scale9t=10|scale9l=10|img=zh/7.png|scale9r=10|esc=0|scale9b=10>
		<RText|x=292.0|y=55.0|color=251|size=16|text=酿酒说明>
		<RText|x=147.0|y=82.0|width=344|size=16|color=255|text=老夫这里可提供酿制<"高粱酒"/FCOLOR=250>与<"虎骨酒"/FCOLOR=250>的工具>
		<RText|x=147.0|y=104.0|width=344|size=16|color=255|text=但酿酒所需的<"高梁，虎骨"/FCOLOR=70>在任何地图打怪均可>
		<RText|x=147.0|y=126.0|width=344|size=16|color=255|text=掉落，<泉水/FCOLOR=253>则需要到60-65级地图采集，当然老>
		<RText|x=147.0|y=148.0|width=344|color=255|size=16|text=夫这里也可购买，前期只能酿制高粱酒，当酿制>
		<RText|x=147.0|y=170.0|width=344|color=255|size=16|text=高粱酒的数量达到1000坛时，可获得<"酿酒宗师"/FCOLOR=253>>
		<RText|x=147.0|y=192.0|width=344|color=255|size=16|text=称号，就能酿制传说中的<"虎骨酒"/FCOLOR=253>了...>
		<RText|x=163.0|y=225.0|width=344|size=16|color=254|text=购买一瓶泉水需要50元宝>
		]]
		msg=msg..'<Text|x=392.0|y=225.0|width=344|size=16|color=70|text=确定购买|link=@goumai,'..id..'>'
	end
	if donghua == 1 then
		msg=msg..'<Frames|x=138.0|y=45.0|speed=10|finishhide=1|loop=1|prefix=niangjiu/niangjiu_|count=20|suffix=.png>'
	end
	say(actor,msg)
end

function goumai(actor,id)
	if not subingot(actor,50) then
		sendmsg9(actor,"元宝不足")
		return
	end
	setsysint("购买泉水的元宝",getsysint("购买泉水的元宝")+50)
	setsysint("每日购买泉水的元宝",getsysint("每日购买泉水的元宝")+50)
	
	giveitem(actor,"泉水",1)
	return niangjiu(actor,id,1)
end

function niang(actor,id,shuoming)
	id = tonumber(id)
	
	if id == 2 then
		if getskillinfo(actor,3001,1) ~= 3 then
			sendmsg9(actor,"达到<font color='#00FF00'>酿酒宗师</font>才可以酿制<font color='#00FF00'>虎骨酒</font>")
			return
		end
	end
	if itemcount(actor,niangjiu_t[id][1]) < 1 then
		sendmsg9(actor,"材料不足")
		return
	end
	if itemcount(actor,niangjiu_t[id][2]) < 1 then
		sendmsg9(actor,"材料不足")
		return
	end
	takeitem(actor,niangjiu_t[id][1],1)
	takeitem(actor,niangjiu_t[id][2],1)
	local bind = 0
	if getint(actor,"领悟酿酒术") == 2 then
		addskill(actor,3001,0)
		setint(actor,"领悟酿酒术",3)
		bind = 371
		confertitle(actor, '酿酒学徒')
		callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show")
	end
	if getskillinfo(actor,3001,1) < 3 then
		setskillinfo(actor,3001,3,getskillinfo(actor,3001,3)+1)
		--sendmsg6(actor,"酿酒熟练度+1点")
		sendmsg9(actor,"酿制成功，酿酒熟练度+1点")
	end
	if getskillinfo(actor,3001,1) == 0 and getskillinfo(actor,3001,3) >= 1000 then
		setskillinfo(actor,3001,1,3)
		setskillinfo(actor,3001,3,1)
		confertitle(actor, '酿酒宗师')
		deprivetitle(actor, '酿酒学徒')
	end
	
	giveitem(actor,niangjiu_t[id][3],1,bind)
	--sendmsg9(actor,"酿制成功")
	return niangjiu(actor,id,shuoming,1)
end


