include("Market_Def/zh.lua") --个人封装函数

function show(actor)
	local t = getfengyinxiangliang(actor)
	if #t < 1 then
		sendmsg9(actor,"帅哥，你永远不知道本仙子的寂寞......")
		close()
		return
	end 
	local msg = [[
		<Img|x=0|width=518|height=378|bg=1|esc=1|scale9r=50|scale9t=50|scale9b=50|move=1|loadDelay=1|scale9l=50|reset=0|img=zhangheng/1.png|show=4>
<Button|x=513.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
<Img|x=16.5|y=37.5|width=482|img=zhangheng/185.png|esc=0>
<Button|x=220.0|y=295.0|color=10051|nimg=zhangheng/13.png|size=18|text=确定解封|link=@jiefeng>
<RText|ay=0.5|x=219.0|y=65.5|color=251|size=20|text=祝福仙子>
<RText|x=34.0|y=92.0|color=161|size=18|text=听闻,最近魔族派遣各大教主携带"祝福项链"寻找能工巧匠>
<RText|x=34.0|y=119.0|color=161|size=18|text=试图解开它的神秘属性，如勇士有机缘得到此宝物只需给>
<RText|x=34.0|y=146.0|color=161|size=18|text=我一个<金盒/FCOLOR=251>就可显示出它的真实属性了，解封后能获得多>
<RText|x=34.0|y=173.0|color=161|size=18|text=少属性，就看你的造化了...>
<RText|x=65.0|y=233.0|color=254|size=18|text=所需材料　→>
<Img|x=199.0|y=217.0|width=52|height=50|esc=0|img=zhangheng/158.png>
<Img|x=275.0|y=217.0|width=52|height=50|esc=0|img=zhangheng/158.png>
<Img|x=310.0|y=59.0|img=zhangheng/178.png|esc=0>
<Img|x=141.0|y=60.0|img=zhangheng/177.png|esc=0>

	]]
	
	msg=msg..'<ItemShow|x=192.0|y=210.0|width=70|height=70|itemid='.. getidbyname("祝福项链(封印)") ..'|itemcount=1|showtips=1|bgtype=0>'
	msg=msg..'<ItemShow|x=269.0|y=210.0|width=70|height=70|itemid='.. getidbyname("金盒") ..'|itemcount=1|showtips=1|bgtype=0>'

	msg=msg..'<RText|ax=0.5|x=225.0|y=249.0|size=16|color=255|outline=1|text=<'.. #t ..'/FCOLOR=249>/<1/FCOLOR=250>>'
	msg=msg..'<RText|ax=0.5|x=302.0|y=249.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,"金盒") ..'/FCOLOR=249>/<1/FCOLOR=250>>'
	say(actor,msg)
end

function jiefeng(actor)
	local t = getfengyinxiangliang(actor)
	if #t < 1 or itemcount(actor,"金盒") < 1 then
		sendmsg9(actor,"材料不足")
		return
	end
	takeitem(actor,"金盒",1)
	callscriptex(actor, "CallLua", "QFunction-0", "@pickupitemex,"..t[1]..",1")
	local jsonstr = getitemcustomabil(actor,t[1])
	--sendmsg6(actor,jsonstr)
	local json_t = json2tbl(jsonstr)
	json_t["name"] = "祝福项链"
	setitemcustomabil(actor,t[1],tbl2json(json_t))
	if math.random(1,100) < 50 then
		setitemaddvalue(actor,t[1],2,2,249) --设置红色
	end
	refreshitem(actor,t[1])
	sendmsg9(actor,"解除封印成功")
	return show(actor)
end

function getfengyinxiangliang(actor)
	local baglist = getbaglist(actor)
	local t = {}
	for i = 1,#baglist do
		if getitemname(actor,baglist[i]) == "祝福项链(封印)" and getisjianquguo(actor,baglist[i]) == 0 then --没鉴定过的
			table.insert(t,baglist[i])
		end
	end
	return t
end