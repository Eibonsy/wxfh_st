function buff_show(actor)
	local msg = ''
	if getispc(actor) then
		msg ='<Button|x=225|y=1|nimg=buff/btn_buffzy_01.png|link=@buffshow_open>'
	else
		msg ='<Button|x=266|y=1|nimg=buff/btn_buffzy_01.png|link=@buffshow_open>'
	end
	delbutton(actor,101,99)
	addbutton(actor,101,99,msg)
end

local buffshow_ids = {10065,10066,19996,19997,20072,20037,20096,20102,20110} --要显示的buffid 20005,20006
-- 20005 月卡
-- 20006 双倍经验
local buffshow_t = {
	[20005] = {name="月卡",tupian="buff_icon/102.png",jieshao="享受月卡特权",isyongjiu=0},
	[10065] = {name="双倍经验",tupian="buff_icon/111.png",jieshao="杀怪获得双倍经验",isyongjiu=0},
	[10066] = {name="1.5倍经验",tupian="buff_icon/111.png",jieshao="杀怪获得1.5倍经验",isyongjiu=0},
	[19996] = {name="蛊毒-鹤顶红",tupian="buff_icon/105.png",jieshao="攻魔道降低12点 下毒者<%s/FCOLOR=253>",isyongjiu="24点消失"},
	[19997] = {name="蛊毒-断肠草",tupian="buff_icon/106.png",jieshao="双防降低12点 下毒者<%s/FCOLOR=253>",isyongjiu="24点消失"},
	[20072] = {name="摩诃心经",tupian="buff_icon/107.png",jieshao="生命值降低10%%",isyongjiu=0},
	[20037] = {name="玉石俱焚",tupian="buff_icon/108.png",jieshao="生命值降低10%%",isyongjiu=0},
	[20096] = {name="有仇必报",tupian="buff_icon/109.png",jieshao="每秒损失3%%血量",isyongjiu=0},
	[20102] = {name="横行霸道",tupian="buff_icon/110.png",jieshao="禁止使用特殊药品",isyongjiu=0},
	[20110] = {name="爆率加成",tupian="buff_icon/112.png",jieshao="爆率加成：+%s%%",isyongjiu=1},
}
function buffshow_open(actor)
	local hasbuffs = {} --存在的需要显示的buff列表
	for i = 1,#buffshow_ids do
		if hasbuff(actor,buffshow_ids[i]) then
			table.insert(hasbuffs,buffshow_ids[i])
		end
	end
	--sendmsg9(actor,"点击进入")
	local msg = ''
	msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@buff_show>"
	if getispc(actor) then
		msg = msg ..'<Button|x=225|y=1|nimg=buff/btn_buffzy_01.png|link=@buff_show>'
		msg = msg ..'<Img|x=221.0|y=32.0|width=400|height=200|move=0|scale9t=10|img=buff/46.png|reset=1|show=0|scale9b=10|loadDelay=1|scale9r=0|scale9l=0|esc=0>'
		msg = msg ..'<ListView|children={2}|ay=1|x=221|y=32.0|width=400|height=200|margin=0|direction=1>'
	else
		msg = msg ..'<Button|x=266|y=1|nimg=buff/btn_buffzy_01.png|link=@buff_show>'
		msg = msg ..'<Img|x=262.0|y=32.0|width=400|height=200|move=0|scale9t=10|img=buff/46.png|reset=1|show=0|scale9b=10|loadDelay=1|scale9r=0|scale9l=0|esc=0>'
		msg = msg ..'<ListView|children={2}|ay=1|x=262|y=32.0|width=400|height=200|margin=0|direction=1>'
	end
	local pyy = 64
	local gao = pyy * #hasbuffs + 8
	local ids = ""
	for i = 3,500 do
		ids = ids..i..","
	end
	local qsid = 3
	msg = msg ..'<Img|id=2|children={'..ids..'}|x=30.0|y=40.0|width=400|height='..gao..'|img=0.png|esc=0>' --整体子控件图片
	for i = 1,#hasbuffs do
		local buffid = hasbuffs[i] --buffid
		local name = ""
		if buffid == 19996 then
			name = getdaystr(actor,"鹤顶红下毒者")
		elseif buffid == 19997 then
			name = getdaystr(actor,"断肠草下毒者")
		elseif buffid == 20110 then
			name = tostring(getbaseinfo(actor,51,215)/100)
		end
		
		local t = buffshow_t[buffid] --buff显示表
		msg = msg ..'<Img|id='..qsid..'|x=30.0|y='.. 40-30 +(i-1)*pyy ..'|width=30|height=30|img='.. t.tupian ..'|esc=0>'
		qsid = qsid + 1
		msg = msg ..'<Text|id='..qsid..'|x=82.0|y='.. 42-30 +(i-1)*pyy ..'|color=255|size=18|text='.. t.name ..'>' --buff名
		qsid = qsid + 1
		msg = msg ..'<RText|id='..qsid..'|x=82.0|y='.. 70-30 +(i-1)*pyy ..'|color=251|size=16|text='.. string.format(t.jieshao,name) ..'>' --buff属性介绍
		qsid = qsid + 1
		local bufftime = getbuffinfo(actor,buffid,2)
		if t.isyongjiu == 1 then
			msg = msg ..'<Text|id='..qsid..'|x=200.0|y='.. 42-30 +(i-1)*pyy ..'|color=250|size=18|text=永久>' --剩余时间显示
		elseif t.isyongjiu ~= 0 then
			msg = msg ..'<Text|id='..qsid..'|x=200.0|y='.. 42-30 +(i-1)*pyy ..'|color=250|size=18|text='.. t.isyongjiu ..'>' --剩余时间显示
		else
			if bufftime == 0 then
				buffshow_shuaxin(actor)
			end
			msg = msg ..'<TIMETIPS|id='..qsid..'|x=200.0|y='.. 42-30 +(i-1)*pyy ..'|color=250|size=18|time='..bufftime..'|link=@buffshow_shuaxin>' --剩余时间显示
		end
		qsid = qsid + 1
		msg = msg ..'<Img|id='..qsid..'|x=0|y='.. 96-30 +(i-1)*pyy ..'|width=400|img=buff/bg_buffzy_02.png|esc=0>' --中级横线隔条
		qsid = qsid + 1
	end

	delbutton(actor,101,99)
	addbutton(actor,101,99,msg)
end

function buffshow_shuaxin(actor)
	delaygoto(actor,200,"buffshow_open")
end
