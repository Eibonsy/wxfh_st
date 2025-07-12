include("Market_Def/zh.lua") --个人封装函数
function show(actor)
	local zslv = getbaseinfo(actor,39) --转生等级
	if zslv < 10 then
		sendmsg9(actor,"小伙子，你看最近剑池的水是不是快没有了...")
		return
	end
	
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|size=18|color=251|text=干将莫邪>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<RText|ax=0|ay=0.5|x=22.0|y=86.5|size=18|color=255|text=今日我与干将小饮，我问他何谓剑道？干将缓缓道，持剑之资>
		<RText|ay=0.5|x=22.0|y=116.5|color=255|size=18|text=不在天赋，而在于拥有神兵利器，既然你注定要持剑而生，老>
		<RText|ay=0.5|x=22.0|y=146.5|color=255|size=18|text=夫愿意亲手帮你打造一把神兵>
		<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
		<Text|ay=0.5|x=227.0|y=214.5|color=250|size=18|text=神兵利器|link=@shenbing>

	]]
	say(actor,msg)
end


local anniu_t = {"阿修罗ぬ命运之殇","帝释天ぬ流星之陨","迦楼罗ぬ万剑归宗",}
local xiaohao = {
	{{"游龙ぬ锥心斩",1},{"游龙ぬ锥心斩",1},{"游龙ぬ锥心斩",1},{"永恒之泪",1000}},
	{{"咆哮ぬ怒吼杖",1},{"咆哮ぬ怒吼杖",1},{"咆哮ぬ怒吼杖",1},{"永恒之泪",1000}},
	{{"契约ぬ神罚剑",1},{"契约ぬ神罚剑",1},{"契约ぬ神罚剑",1},{"永恒之泪",1000}},

}

local tuzhi = {
	{"001号图纸","002号图纸","003号图纸","004号图纸"},
	{"005号图纸","006号图纸","007号图纸","008号图纸"},
	{"009号图纸","010号图纸","011号图纸","012号图纸"},
}

local sm = {"忽视类","吸血类","增伤类"}

function shenbing(actor,anniu,zhuwuqiid,xianshi)
	anniu = tonumber(anniu) or 1
	zhuwuqiid = tonumber(zhuwuqiid) or 1
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
	msg=msg.."<Img|x=18.0|y=408.0|img=zhangheng/8.png||link=@shenbing,"..anniu..","..zhuwuqiid..",1>"

	local tuzhit = tuzhi[anniu]
	msg = msg ..'<Img|x='.. 222+(4-1)*90 ..'|y=196.0|img=zhangheng/73.png|esc=0>'
	local zuobiaot = {{475,179},{503,179},{475,207},{503,207}}
	for i = 1,4 do
		if itemcount(actor,tuzhit[i]) > 0 then
			msg=msg..'<ItemShow|x='..zuobiaot[i][1]..'|y='..zuobiaot[i][2]..'|width=70|height=70|itemid='.. getidbyname(tuzhit[i]) ..'|itemcount=1|showtips=1|bgtype=0>'
		else	
			msg=msg..'<ItemShow|x='..zuobiaot[i][1]..'|y='..zuobiaot[i][2]..'|width=70|height=70|itemid='.. getidbyname(tuzhit[i]) ..'|itemcount=1|showtips=1|bgtype=0|grey=1>'
		end
	end
	
	
	for i = 1,#anniu_t do
		if anniu == i then --大类按钮
			msg=msg.."<Button|x=20.0|y=".. 40.5 + (i-1)*40 .."|size=18|color=150|nimg=zh/66.png|text="..anniu_t[i]..">"
		else
			msg=msg.."<Button|x=20.0|y=".. 40.5 + (i-1)*40 .."|size=18|color=7|nimg=zh/67.png|pimg=zh/67.png|text="..anniu_t[i].."|link=@shenbing,"..i..">"
		end
	end
	msg = msg ..'<Img|x=357.0|y=90.0|img=zhangheng/73.png|esc=0>'
	msg = msg ..'<ItemShow|x=354.0|y=87.0|width=70|height=70|itemid='.. getidbyname(anniu_t[anniu]) ..'|itemcount=1|showtips=1|bgtype=0>'
	local t = xiaohao[anniu]
	for i = 1,3 do
		msg = msg ..'<Img|x='.. 222+(i-1)*90 ..'|y=196.0|img=zhangheng/73.png|esc=0>'
		msg = msg ..'<ItemShow|x='.. 219+(i-1)*90 ..'|y=193.0|width=70|height=70|itemid='..getidbyname(t[i][1])..'|itemcount='..t[i][2]..'|showtips=1|bgtype=0>'
	end
	for i = 1,3 do	
		msg = msg ..'<Text|x='.. 248+(i-1)*90 ..'|y=262.0|color=255|size=14|text='.. sm[i] ..'>'
		if zhuwuqiid == i then
			msg = msg ..'<Img|x='.. 224+(i-1)*90 ..'|y=198.0|img=zhangheng/168.png|esc=0>'
			msg = msg ..'<Img|x='.. 218+(i-1)*90 ..'|y=256.0|img=zhangheng/170.png|esc=0>'
		else
			msg = msg ..'<Img|x='.. 218+(i-1)*90 ..'|y=256.0|img=zhangheng/169.png|esc=0|link=@shenbing,'.. anniu ..','.. i ..'>'
		end
	end
	msg = msg ..'<Text|x='.. 248+254 ..'|y=262.0|color=255|size=14|text=图纸类>'

	msg = msg ..'<Text|x=253.0|y=310.0|color=255|size=18|text=消耗：>'
	
	msg = msg ..'<RText|x=313.0|y=310.0|color=250|size=18|text=元宝200万>'
	msg = msg ..'<ItemShow|x=418.0|y=286.0|width=70|height=70|itemid='.. getidbyname(t[4][1]) ..'|itemcount=1|showtips=1|scale=0.7|bgtype=0>'
	msg = msg ..'<RText|x=473.0|y=310.0|color=250|size=18|text=<'.. itemcount(actor,t[4][1]) ..'/FCOLOR=249>/'.. t[4][2] ..'>'
	msg = msg ..'<Text|x=325.0|y=349.0|color=254|size=18|text=成功几率：100%>'

	msg = msg ..'<Button|x=348.0|y=385.0|size=18|nimg=zhangheng/13.png|color=10051|text=确定锻造|link=@duanzao,'.. anniu ..','..zhuwuqiid..'>'
	
	if xianshi == 1 then
		msg = msg.."<Layout|x=-1000.0|y=-1001.0|width=3000|height=3000|color=255>|link=@shenbing,"..anniu..","..zhuwuqiid..">"
		msg = msg..[[
		<Img|ay=0.5|x=50.0|y=356.0|width=300|height=160|scale9r=10|scale9l=10|esc=0|img=zh/7.png|scale9b=10|scale9t=10>
		<RText|ay=0.5|x=58.0|y=318.5|color=255|size=16|text=使用3把不同类型的武器可100%锻造出>
		<RText|ay=0.5|x=58.0|y=343.5|color=255|size=16|text=<"阿修罗, 帝释天, 迦楼罗"/FCOLOR=250>系列武器，自>
		<RText|ay=0.5|x=58.0|y=368.5|color=255|size=16|text=行选择武器属性类型，如<选择吸血类/FCOLOR=250>的>
		<RText|ay=0.5|x=58.0|y=393.5|color=255|size=16|text=的武器做为<主类型/FCOLOR=250>，那么锻造出来的武>
		<RText|ay=0.5|x=58.0|y=418.5|color=255|size=16|text=器将会是<附加吸血属性/FCOLOR=250>>
		<RText|ay=0.5|x=58.0|y=293.5|color=251|size=16|text=锻造介绍：>
		]]
	end
	say(actor,msg)
end
local sx_t = {
	{28,11,1016}, --忽视双防+11%
	{34,1100,1017}, --吸血+11% 万分比
	{25,11,1018}, --增伤+11%
}
function duanzao(actor,par,zhuwuqiid)
	par = tonumber(par)
	zhuwuqiid = tonumber(zhuwuqiid)
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
	
	if getingot(actor) < 2000000 then
		sendmsg9(actor,"条件不足")
		return
	end
	
	for i = 4,#t do
		if itemcount(actor,t[i][1]) < t[i][2] then
			sendmsg9(actor,"条件不足")
			return
		end
	end
	
	for i = 1,4 do
		if itemcount(actor,tuzhi[par][i]) < 1 then
			sendmsg9(actor,"条件不足")
			return
		end
	end
	
	for i = 1,4 do
		takeitem(actor,tuzhi[par][i],1)
	end
	
	for i = 1,#sct do
		delitem(actor,sct[i],1)
	end
	
	for i = 4,#t do
		takeitem(actor,t[i][1],t[i][2])
	end
	
	subingot(actor,2000000)
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
	shenbing(actor,par,zhuwuqiid)
end
