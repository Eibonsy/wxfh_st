

local bossshuaxin_ts = {
	----野外
	[1]={
	{monname="蚩尤之主",mapname="沃玛寺庙大殿",mapid="d024"},
	{monname="盘丝大仙",mapname="沃玛神庙",mapid="d021"},
	{monname="镜像魔王",mapname="镜像殿堂",mapid="jxdt"},
	{monname="镜像之主",mapname="镜像殿堂",mapid="jxdt"},
	{monname="封魔冥界教父",mapname="封魔殿",mapid="d2013"},
	{monname="通天教主",mapname="通天之路",mapid="d2001"},
	{monname="秦始皇",mapname="国王陵墓",mapid="dm002"},
	{monname="远古祖玛教父",mapname="祖玛教主之家",mapid="d515"},

	{monname="玛法判官",mapname="祖玛祭坛",mapid="zmjt"},
	{monname="不朽帝皇",mapname="骨魔洞五层",mapid="d2067"},
	{monname="不朽帝皇3",mapname="骨魔洞五层",mapid="d2067"},
	{monname="不朽大帝",mapname="黄泉深渊",mapid="hqsy"},
	{monname="谛听兽",mapname="牛魔寺庙大厅",mapid="d2079"},
	{monname="上古谛听",mapname="潜龙深渊",mapid="qlsy"},
	{monname="远古双头金刚",mapname="赤月祭坛",mapid="d10061"},
	{monname="远古双头血魔",mapname="赤月祭坛",mapid="d10061"},
	{monname="远古赤月恶魔",mapname="赤月巢穴",mapid="d10062"},
	{monname="魔龙邪眼",mapname="魔龙岭",mapid="63"},
	
	{monname="暗之魔龙教主",mapname="魔龙血域",mapid="66"},
	{monname="暗之魔龙教主1",mapname="魔龙血域",mapid="66"},
	{monname="邪魔统帅",mapname="魔龙殿",mapid="mld"},
	{monname="地藏魔王",mapname="沙巴克藏宝阁",mapid="h204"},
	{monname="远古赤月恶魔",mapname="万恶之源",mapid="d10071"},
	{monname="万恶之主",mapname="万恶之源",mapid="d10071"},
	{monname="玛雅守护神",mapname="玛雅皇宫",mapid="maya4"},
	
	},
	-----18


	
}


function bosschaxunshow(actor,yeshu)
	yeshu = tonumber(yeshu) or 1
	local msg = [[
		<Img|show=4|bg=1|esc=1|loadDelay=0|move=1|reset=0|img=zh/1.png|reload=0>
		<Button|x=780.0|y=10.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Text|x=25.0|y=16.0|outline=2|color=149|size=20|text=BOSS查询>
		<RText|x=69.0|y=64.0|size=18|color=31|text=怪物名>
		<RText|x=271.0|y=64.0|size=18|color=31|text=地图>
		<RText|x=447.0|y=64.0|size=18|color=31|text=刷新倒计时>
		<RText|x=649.0|y=64.0|size=18|color=31|text=传送>
		<Img|x=30|y=93|width=728|height=364|scale9l=0|scale9b=10|esc=0|scale9r=0|scale9t=10|img=zh/46.png>
		<ListView|children={2}|x=30.0|y=95.0|width=728|height=360|reload=0|margin=1|direction=1|loadDelay=1>
		
	]]
	for i = 1,1 do
		if yeshu == i then
			msg = msg ..'<Button|x='.. 50 + (i-1)* 75 ..'|y=461.0|width=70|height=30|color=250|size=18|nimg=zh/3.png|text=第'..i..'页>'
		else
			msg = msg ..'<Button|x='.. 50 + (i-1)* 75 ..'|y=461.0|width=70|height=30|color=150|size=18|nimg=zh/4.png|text=第'..i..'页|link=@bosschaxunshow,'..i..'>'
		end
	end

	local bossshuaxin_t = bossshuaxin_ts[yeshu]
	
	local pyy = 48
	local gao = pyy * #bossshuaxin_t +4
	local ids = ""
	for i = 3,1000 do
		ids = ids..i..","
	end
	local qsid = 3
	msg = msg ..'<Img|id=2|children={'..ids..'}|x=30.0|y=40.0|width=400|height='..gao..'|img=0.png|esc=0>' --整体子控件图片
	for i = 1,#bossshuaxin_t do
		local t = bossshuaxin_t[i]
		msg = msg ..'<Text|id='..qsid..'|x=29.0|y='.. 112-97 +(i-1)*pyy ..'|color=254|size=18|text='.. t.monname ..'>' --怪物名
		qsid = qsid + 1
		msg = msg ..'<Text|id='..qsid..'|x=200.0|y='.. 112-97 +(i-1)*pyy ..'|color=251|size=18|text='.. t.mapname..'>' --地图
		qsid = qsid + 1
		if checkrangemoncount(t.mapid,t.monname,300,300,500) > 0 then
			msg = msg ..'<Text|id='..qsid..'|x=433.0|y='.. 112-97 +(i-1)*pyy ..'|color=249|size=18|text=已刷新>' --地图
		else
			msg = msg ..'<Text|id='..qsid..'|x=433.0|y='.. 112-97 +(i-1)*pyy ..'|color=249|size=18|text=未刷新>' --地图
		end
		qsid = qsid + 1
		
	end
	say(actor,msg)
end
