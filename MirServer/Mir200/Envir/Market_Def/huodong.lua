include("Market_Def/zh.lua") --个人封装函数
local biaoti_anniu = {"顺天送宝","怪物攻城","泉水采集"}
function show(actor,anniuid)
	anniuid = tonumber(anniuid) or 1
	local msg = [[
	<Img|x=0|width=638|height=461|bg=1|esc=1|scale9r=50|scale9t=50|scale9b=50|move=1|loadDelay=0|scale9l=50|reset=0|img=zhangheng/1.png|show=4>
	<Button|x=634.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	<Img|x=17.0|y=38.5|img=zhangheng/280.png|esc=0>
	<Img|x=157.0|y=38.5|height=397|esc=0|img=zhangheng/128.png>
	]]
	for i = 1,#biaoti_anniu do
		if i == anniuid then
			msg = msg ..'<Button|x=19.0|y='.. 45+(i-1)*45 ..'|size=18|nimg=zhangheng/267.png|pimg=zhangheng/267.png|color=250|outline=2|text='..biaoti_anniu[i]..'>'
		else
			msg = msg ..'<Button|x=19.0|y='.. 45+(i-1)*45 ..'|size=18|nimg=zhangheng/267.png|pimg=zhangheng/267.png|color=7|outline=2|text='..biaoti_anniu[i]..'|link=@show,'.. i ..'>'
		end
	end
	if biaoti_anniu[anniuid] == "顺天送宝" then
		msg = msg ..[[
		<RText|x=172.0|y=54.5|size=18|color=255|text=为欢迎新玩家入驻顺天传奇，新区<开放60分钟/FCOLOR=251>系统自动>
		<RText|x=172.0|y=84.5|size=18|color=255|text=开启"顺天送宝"活动，在土城药店坐标：355   339刷新>
		<RText|x=172.0|y=114.5|size=18|color=255|text=怪物<"恭喜发财"/FCOLOR=250>必爆高级装备和稀有材料，此活动仅新>
		<RText|x=172.0|y=144.5|color=255|size=18|text=区开放一次，望各位玩家踊跃参加....>
		]]
		if getsysint("顺天送宝活动") == 0 then
			msg=msg.."<RText|x=172.0|y=214.5|size=18|color=255|text=<新区活动详情：/FCOLOR=31><未开启/FCOLOR=242>>"
		else
			msg=msg.."<RText|x=172.0|y=214.5|size=18|color=255|text=<新区活动详情：/FCOLOR=31><已开启/FCOLOR=249>>"
		end
	end
	
	if biaoti_anniu[anniuid] == "怪物攻城" then
		msg = msg ..[[
		<RText|x=172.0|y=54.5|color=255|size=18|text=重拾青春，回味经典，新区<开区4小时/FCOLOR=251>，系统自动开启>
<RText|x=172.0|y=84.5|color=255|size=18|text=<"怪物攻城"/FCOLOR=250>。>
<RText|x=172.0|y=144.5|color=255|size=18|text=魔兽军团首领将率领众多小弟随机入侵<“比奇城，苍月/FCOLOR=250>>
<RText|x=172.0|y=174.5|size=18|color=255|text=<岛，白日门，封魔谷，魔龙城”/FCOLOR=250>其中的一座主城，请各>
<RText|x=172.0|y=204.5|size=18|color=255|text=位玩家做好抵御魔兽军团的准备，它们身上携带着大量>
<RText|x=172.0|y=114.5|color=255|size=18|text=从第二天开始<每天10点，14点，18点/FCOLOR=253>开启活动，届时，>
<RText|x=172.0|y=234.5|size=18|color=255|text=高级装备以及珍稀材料，能不能得到就看你的实力了...>

		]]
		if getsysint("怪物攻城活动") == 0 then
			msg=msg.."<RText|x=172.0|y=304.5|size=18|color=255|text=<新区活动详情：/FCOLOR=31><未开启/FCOLOR=242>>"
		else
			msg=msg.."<RText|x=172.0|y=304.5|size=18|color=255|text=<新区活动详情：/FCOLOR=31><已开启/FCOLOR=249>>"
		end
	end
	
	if biaoti_anniu[anniuid] == "泉水采集" then
		msg = msg ..[[
		<RText|x=172.0|y=54.5|size=18|color=255|text=泉水被玛法大陆的居民称之为"生命之水",<合区后每隔/FCOLOR=250>>
		<RText|x=172.0|y=84.5|size=18|color=255|text=<2小时/FCOLOR=250>在<土城药店/FCOLOR=253>刷新<"泉眼"/FCOLOR=70>供各位勇士采集，泉水是>
		<RText|x=172.0|y=144.5|size=18|color=255|text=值性，请各位勇士踊跃参加，采到就是赚到....>
		<RText|x=172.0|y=114.5|size=18|color=255|text=酿制"高梁酒"与"虎骨酒"不可缺少的材料，具有高保>
		]]

	end
	
	say(actor,msg)
end
