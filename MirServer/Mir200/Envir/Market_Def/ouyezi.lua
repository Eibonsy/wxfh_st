include("Market_Def/zh.lua") --个人封装函数

local chakan = {"暗黑审判者","天行权杖","太极羽扇","传说:无影剑","传说:易水寒","传说:太乙扇","游龙ぬ锥心斩","咆哮ぬ怒吼杖","契约ぬ神罚剑"}

function show(actor)
	if getint(actor,"查看次终极武器") == 0 then
		local you = false
		for i = 1,#chakan do
			if isyongyou(actor,chakan[i],1) then
				setint(actor,"查看次终极武器",1)
				you = true
				break
			end
		end
		if not you then
			sendmsg9(actor,"勇士,你太年轻了需先拜访公孙冶后在来找老夫吧..")
			return
		end
	end
	
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=天尊>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<RText|ax=0|ay=0.5|x=22.0|y=81.5|color=255|size=18|text=风云巨变，一场血雨腥风即将来临，传闻铸造绝世兵器，才能>
		<RText|ay=0.5|x=22.0|y=106.5|color=255|size=18|text=避免悲剧的发生于是乎，欧冶子重现江湖，希望找到一个能阻>
		<RText|ay=0.5|x=22.0|y=131.5|color=255|size=18|text=止这场战争的人，拿起绝世兵器，激发它的威力，玛法大陆的>
		<RText|ay=0.5|x=22.0|y=156.5|color=255|size=18|text=未来就看你的了。少侠你行吗？赶紧来试试吧！>
		<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
		<Text|ay=0.5|x=227.0|y=214.5|size=18|color=250|text=绝世兵器|link=@jueshi>
	]]
	say(actor,msg)
end


local anniu_t = {"传说:无影剑","传说:易水寒","传说:太乙扇","游龙ぬ锥心斩","咆哮ぬ怒吼杖","契约ぬ神罚剑"}
local xiaohao = {
	{{"暗黑审判者",1},{"暗黑审判者",1},{"暗黑审判者",1},	{"金盒",50},{"永恒之泪",2000}},
	{{"天行权杖",1},{"天行权杖",1},{"天行权杖",1},			{"金盒",50},{"永恒之泪",2000}},
	{{"太极羽扇",1},{"太极羽扇",1},{"太极羽扇",1},			{"金盒",50},{"永恒之泪",2000}},
	{{"传说:无影剑",1},{"传说:无影剑",1},{"传说:无影剑",1},{"行走的游龙",1},{"金盒",100},{"永恒之泪",3000}},
	{{"传说:易水寒",1},{"传说:易水寒",1},{"传说:易水寒",1},{"无名的咆哮",1},{"金盒",100},{"永恒之泪",3000}},
	{{"传说:太乙扇",1},{"传说:太乙扇",1},{"传说:太乙扇",1},{"恶魔的契约",1},{"金盒",100},{"永恒之泪",3000}},
}

local sm = {"忽视类","吸血类","增伤类","辅助类",}

function jueshi(actor,anniu,zhuwuqiid,xianshi)
	local zsdj = getbaseinfo(actor,39)
	local sl = 3
	if zsdj >= 10 then
		sl = 6
	end
	anniu = tonumber(anniu) or 1
	zhuwuqiid = tonumber(zhuwuqiid) or 3
	xianshi = tonumber(xianshi) or 0
	local msg = [[
		<Img|move=1|reset=0|img=zhangheng/166.png|bg=1|esc=1|show=4>
		<Button|x=590.0|y=1.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=18.0|y=39.0|img=zhangheng/165.png|esc=0>
		<Img|x=196.0|y=38.0|img=zhangheng/167.png|esc=0>
		<Img|x=248.0|y=52.0|img=zhangheng/201.png|esc=0>
		<Img|x=251.0|y=162.0|img=zhangheng/74.png|esc=0>
	]]
	msg=msg.."<Img|x=18.0|y=408.0|img=zhangheng/8.png||link=@jueshi,"..anniu..","..zhuwuqiid..",1>"
	for i = 1,sl do
		if anniu == i then --大类按钮
			msg=msg.."<Button|x=20.0|y=".. 40.5 + (i-1)*40 .."|size=18|color=150|nimg=zh/66.png|text="..anniu_t[i]..">"
		else
			msg=msg.."<Button|x=20.0|y=".. 40.5 + (i-1)*40 .."|size=18|color=7|nimg=zh/67.png|pimg=zh/67.png|text="..anniu_t[i].."|link=@jueshi,"..i..">"
		end
	end
	msg = msg ..'<Img|x=357.0|y=90.0|img=zhangheng/73.png|esc=0>'
	msg = msg ..'<ItemShow|x=354.0|y=87.0|width=70|height=70|itemid='.. getidbyname(anniu_t[anniu]) ..'|itemcount=1|showtips=1|bgtype=0>'
	--物品展示
	local t = xiaohao[anniu]
	if anniu < 4 then
		for i = 1,3 do
			msg = msg ..'<Img|x='.. 222+26+(i-1)*110 ..'|y=196.0|img=zhangheng/73.png|esc=0>'
			msg = msg ..'<ItemShow|x='.. 219+26+(i-1)*110 ..'|y=193.0|width=70|height=70|itemid='..getidbyname(t[i][1])..'|itemcount='..t[i][2]..'|showtips=1|bgtype=0>'
			msg = msg ..'<Text|x='.. 230+26+(i-1)*110 ..'|y=262.0|color=255|size=14|text='.. sm[i] ..'>'
			
		end
	else
		for i = 1,4 do
			msg = msg ..'<Img|x='.. 222+(i-1)*90 ..'|y=196.0|img=zhangheng/73.png|esc=0>'
			msg = msg ..'<ItemShow|x='.. 219+(i-1)*90 ..'|y=193.0|width=70|height=70|itemid='..getidbyname(t[i][1])..'|itemcount='..t[i][2]..'|showtips=1|bgtype=0>'
			
			msg = msg ..'<Text|x='.. 230+(i-1)*90 ..'|y=262.0|color=255|size=14|text='.. sm[i] ..'>'
		end
		
		for i = 1,3 do
			if zhuwuqiid == i then
				msg = msg ..'<Img|x=260|y='.. 76+(i-1)*30 ..'|img=zhangheng/170.png|esc=0>' --勾了的框框
			else
				msg = msg ..'<Img|x=260|y='.. 76+(i-1)*30 ..'|img=zhangheng/169.png|esc=0|link=@jueshi,'.. anniu ..','.. i ..'>' --没勾的框框
			end
			msg = msg ..'<Text|x=290|y='.. 82+(i-1)*30 ..'|color=255|size=14|text='.. sm[i] ..'>'
		end
	end

	if anniu < 4 then
		msg = msg ..'<Text|x=253.0|y=310.0|color=255|size=18|text=消耗：>'
		msg = msg ..'<ItemShow|x=298.0|y=286.0|width=70|height=70|itemid='.. getidbyname(t[4][1]) ..'|itemcount=1|scale=0.8|showtips=1|bgtype=0>'
		msg = msg ..'<RText|x=353.0|y=310.0|color=250|size=18|text=<'.. itemcount(actor,t[4][1]) ..'/FCOLOR=249>/'.. t[4][2] ..'>'
		msg = msg ..'<ItemShow|x=418.0|y=286.0|width=70|height=70|itemid='.. getidbyname(t[5][1]) ..'|itemcount=1|scale=0.7|showtips=1|bgtype=0>'
		msg = msg ..'<RText|x=473.0|y=310.0|color=250|size=18|text=<'.. itemcount(actor,t[5][1]) ..'/FCOLOR=249>/'.. t[5][2] ..'>'
		msg = msg ..'<Text|x=325.0|y=349.0|color=254|size=18|text=成功几率：100%>'
	else
		msg = msg ..'<Text|x=253.0|y=310.0|color=255|size=18|text=消耗：>'
		msg = msg ..'<ItemShow|x=298.0|y=286.0|width=70|height=70|itemid='.. getidbyname(t[5][1]) ..'|itemcount=1|scale=0.8|showtips=1|bgtype=0>'
		msg = msg ..'<RText|x=353.0|y=310.0|color=250|size=18|text=<'.. itemcount(actor,t[5][1]) ..'/FCOLOR=249>/'.. t[5][2] ..'>'
		msg = msg ..'<ItemShow|x=418.0|y=286.0|width=70|height=70|itemid='.. getidbyname(t[6][1]) ..'|itemcount=1|scale=0.7|showtips=1|bgtype=0>'
		msg = msg ..'<RText|x=473.0|y=310.0|color=250|size=18|text=<'.. itemcount(actor,t[6][1]) ..'/FCOLOR=249>/'.. t[6][2] ..'>'
		msg = msg ..'<Text|x=325.0|y=349.0|color=254|size=18|text=成功几率：100%>'
	end
	
	msg = msg ..'<Button|x=348.0|y=385.0|size=18|nimg=zhangheng/13.png|color=10051|text=确定锻造|link=@duanzao,'.. anniu ..','..zhuwuqiid..'>'
	
	if xianshi == 1 then
		msg = msg.."<Layout|x=-1000.0|y=-1001.0|width=3000|height=3000|color=255>|link=@jueshi,"..anniu..","..zhuwuqiid..">"
		if anniu < 4 then
			msg = msg..[[
			<Img|ay=0.5|x=50.0|y=365.0|width=300|height=140|scale9r=10|scale9l=10|scale9t=10|img=zh/7.png|scale9b=10|esc=0>
			<RText|ay=0.5|x=58.0|y=339.5|color=255|size=16|text=使用3把不同类型的武器可锻造出<"传说"/FCOLOR=250>>
			<RText|ay=0.5|x=58.0|y=364.5|color=255|size=16|text=系列武器，锻造出的武器随机获得<"忽视/FCOLOR=250>>
			<RText|ay=0.5|x=58.0|y=389.5|color=255|size=16|text=<双防+5% 吸血+5% 增伤+5%"/FCOLOR=250>其中的1条>
			<RText|ay=0.5|x=58.0|y=414.5|color=255|size=16|text=特殊属性>
			<RText|ay=0.5|x=58.0|y=314.5|color=251|size=16|text=锻造介绍：>
			]]
		else
			msg = msg..[[			
			<Img|ay=0.5|x=50.0|y=357.0|width=300|height=160|scale9r=10|scale9l=10|scale9t=10|img=zh/7.png|scale9b=10|esc=0>
			<RText|ay=0.5|x=58.0|y=318.5|color=255|size=16|text=使用三把不同类型的武器可锻造出<游龙/FCOLOR=250>>
			<RText|ay=0.5|x=58.0|y=343.5|color=255|size=16|text=<咆哮，契约/FCOLOR=250>系列武器，可自行选择武器>
			<RText|ay=0.5|x=58.0|y=368.5|color=255|size=16|text=锻造出来的特殊属性类型，如<选择吸血/FCOLOR=250>>
			<RText|ay=0.5|x=58.0|y=394.5|color=255|size=16|text=<类/FCOLOR=250>的武器做为主类型，那么锻造出来的>
			<RText|ay=0.5|x=58.0|y=418.5|color=255|size=16|text=武器将会是附加<"吸血属性"/FCOLOR=250>>
			<RText|ay=0.5|x=58.0|y=293.5|color=251|size=16|text=锻造介绍：>

			]]
		end
	end
	say(actor,msg)
end
local sx1 = {
	{28,5,1016}, --忽视双防+5%
	{34,500,1017}, --吸血+5% 万分比
	{25,5,1018}, --增伤+5%
}
local sx2 = {
	{28,8,1016}, --忽视双防+8%
	{34,800,1017}, --吸血+8% 万分比
	{25,8,1018}, --增伤+8%
}
function duanzao(actor,par,zhuwuqiid)
	par = tonumber(par)
	zhuwuqiid = tonumber(zhuwuqiid)
	local sx_t = sx1
	if par > 3 then
		sx_t = sx2
	end
	
	local t = xiaohao[par]
	local wuqiname = t[1][1]
	local baglist = getbaglist(actor) --背包物品列表
	local wuqimanzu = 0
	local sct = {} --要删除的武器T
	for j = 1,3 do
		for i = 1,#baglist do
			if getitemname(actor, baglist[i]) == wuqiname then
				local jsonstr = getitemcustomabil(actor,baglist[i])
				if jsonstr ~= "" then
					local json_t = json2tbl(jsonstr)
					--release_print(tbl2json(json_t.abil[3].v[1]))
					if json_t.abil[3].v[1][2] == sx_t[j][1] then
						table.insert(sct,baglist[i])
						break
					end
				end
			end
		end
	end
	
	if #sct < 3 then --三种武器不满足
		sendmsg9(actor,"条件不足")
		return
	end
	
	for i = 4,#t do
		if itemcount(actor,t[i][1]) < t[i][2] then
			sendmsg9(actor,"条件不足")
			return
		end
	end
	
	if par < 4 then
		for i = 4,#t do
			takeitem(actor,t[i][1],t[i][2])
		end
		
		for i = 1,#sct do
			delitem(actor,sct[i],1)
		end
		local item = giveitem(actor,anniu_t[par])
		local sj = math.random(1,3)
		changecustomitemtext(actor,item,"[隐藏属性]：",2) --分类名字
		changecustomitemtextcolor(actor,item,154,2) --颜色
		changecustomitemabil(actor,item,0,1,sx_t[sj][1],2) --参数4  1为绑定att属性 
		changecustomitemabil(actor,item,0,2,sx_t[sj][3],2) --参数4  2为绑定自定属性表 显示用
		changecustomitemabil(actor,item,0,3,1,2) --参数4  3为绑定的值是否为百分比 0不是 1是
		changecustomitemabil(actor,item,0,4,0,2) --参数4  4为绑定属性显示位置哪一行
		changecustomitemvalue(actor,item,0,"=",sx_t[sj][2],2) --设置绑定att属性的值
		sendmsg9(actor,"锻造成功")
		sendmsg6(actor,"锻造成功")
	
	else	
		for i = 1,#sct do
			delitem(actor,sct[i],1)
		end

		for i = 4,#t do
			takeitem(actor,t[i][1],t[i][2])
		end
		local item = giveitem(actor,anniu_t[par])
		local sj = zhuwuqiid
		changecustomitemtext(actor,item,"[隐藏属性]：",2) --分类名字
		changecustomitemtextcolor(actor,item,154,2) --颜色
		changecustomitemabil(actor,item,0,1,sx_t[sj][1],2) --参数4  1为绑定att属性 
		changecustomitemabil(actor,item,0,2,sx_t[sj][3],2) --参数4  2为绑定自定属性表 显示用
		changecustomitemabil(actor,item,0,3,1,2) --参数4  3为绑定的值是否为百分比 0不是 1是
		changecustomitemabil(actor,item,0,4,0,2) --参数4  4为绑定属性显示位置哪一行
		changecustomitemvalue(actor,item,0,"=",sx_t[sj][2],2) --设置绑定att属性的值
		sendmsg9(actor,"锻造成功")
		sendmsg6(actor,"锻造成功")
	end

	jueshi(actor,par,zhuwuqiid)
end
