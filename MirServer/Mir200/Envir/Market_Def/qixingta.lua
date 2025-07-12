include("Market_Def/zh.lua") --个人封装函数

function show(actor,xianshi)
	xianshi = tonumber(xianshi) or 0
	local msg = [[
		<Img|x=0|width=606|height=453|bg=1|scale9r=50|scale9t=50|scale9b=50|move=1|esc=1|scale9l=50|loadDelay=1|img=zhangheng/1.png|reset=0|show=4>
		<Button|x=601.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=16.5|y=38.5|img=zhangheng/179.png|esc=0>
		<Img|x=16.5|y=39.5|img=zhangheng/180.png|esc=0>
		<Button|x=20.0|y=393.5|nimg=zhangheng/8.png|pimg=zhangheng/8.png|link=@show,1>
		<Button|x=427.5|y=376.5|width=94|size=18|color=10051|nimg=zhangheng/13.png|text=挑战七星塔|link=@tiaozhan>
		<Button|x=108.5|y=376.5|width=156|size=18|color=10051|nimg=zhangheng/13.png|text=提交 → 承包凭证|link=@tijiao>
		<RText|x=441.5|y=55.5|color=161|size=16|text=玩法介绍>
		<RText|x=372.0|y=90.5|size=16|color=161|text=每位玩家通过提交承包凭证>
		<RText|x=372.0|y=115.5|size=16|color=161|text=均有机会成为<“幸运玩家”/FCOLOR=250>>
		<RText|x=372.0|y=140.5|color=161|size=16|text=享受大量福利！>
		<Text|x=398.0|y=289.5|color=161|size=18|text=幸运玩家进图免费>
		<Text|x=388.0|y=328.5|color=161|size=18|text=其他玩家：30万金币>
	]]

		msg=msg.."<RText|x=29.0|y=294.5|size=18|color=103|text=幸运奖池金币数量为：<".. getsysint("七星塔幸运奖池") .."/FCOLOR=250>>"
		msg=msg.."<RText|x=29.5|y=321.5|size=18|color=103|text=击杀奖池金币数量为：<".. getsysint("七星塔击杀奖池") .."/FCOLOR=250>>"
		
		if getsysstr("七星塔幸运玩家") == "" then
			msg=msg.."<RText|x=372.0|y=186.5|size=16|color=251|text=幸运玩家：<暂无/FCOLOR=254>>"
		else
			msg=msg.."<RText|x=372.0|y=186.5|size=16|color=251|text=幸运玩家：<".. getsysstr("七星塔幸运玩家")  .."/FCOLOR=254>>"
		end
		if getsysstr("七星塔击杀者") == "" then
			msg=msg.."<RText|x=372.0|y=224.5|size=16|color=251|text=boss击杀者：<暂无/FCOLOR=254>>"
		else
			msg=msg.."<RText|x=372.0|y=224.5|size=16|color=251|text=boss击杀者：<".. getsysstr("七星塔击杀者")  .."/FCOLOR=254>>"
		end
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@show>"
		msg=msg..[[
		<Img|ay=0.5|x=52.0|y=239.5|width=410|height=370|scale9r=10|scale9t=10|scale9l=10|img=zh/7.png|scale9b=10|esc=0>
<RText|x=228.0|y=65.5|color=251|size=16|text=七星塔介绍>
<RText|x=64.0|y=94.5|color=255|size=16|text=⒈玩家进入七星塔的费用，将有<50%的金币/FCOLOR=250>纳入七星塔>
<RText|x=80.0|y=114.5|color=255|size=16|text=奖池，每位玩家都有机会成为<"幸运玩家"/FCOLOR=250>>
<RText|ax=0|x=64.0|y=144.5|color=255|size=16|text=⒉玩家通过提交<"承包凭证"/FCOLOR=250>可免费参加中奖资格，<击杀/FCOLOR=253>>
<RText|x=80.0|y=164.5|color=253|size=16|text=5000血量的<六大经典教主/FCOLOR=250>有概率获得承包凭证.........>
<RText|x=80.0|y=184.5|color=255|size=16|text=任意时间均可提交"承包凭证"每天开奖时间为：>
<RText|x=80.0|y=204.5|color=255|size=16|text=早上00:01    早上6:01   中午12:01   晚上18:01>
<RText|x=80.0|y=224.5|size=16|color=255|text=开奖后请重新提交证明，每天有四次中奖机会>
<RText|x=64.0|y=254.5|color=255|size=16|text=⒊提交结束后，系统随机抽取一名<"幸运玩家"/FCOLOR=250>作为七星>
<RText|x=80.0|y=274.5|color=255|size=16|text=塔承包者，可获得<两根金条/FCOLOR=250>以及<免费进入七星塔>权限>
<RText|x=80.0|y=294.5|color=255|size=16|text=还可领取七星塔<奖池40%/FCOLOR=250>的金币，当下一位<"幸运者"/FCOLOR=250>>
<RText|x=80.0|y=314.5|color=255|size=16|text=产生时，奖励以邮件形式发放!>
<RText|x=65.0|y=344.5|color=255|size=16|text=⒋击杀七星塔顶层BOSS者，可获得七星塔<奖池60%的/FCOLOR=250>>
<RText|x=80.0|y=364.5|color=255|size=16|text=<金币/FCOLOR=250>奖励，击杀者享受<5%爆率/FCOLOR=250>加持！>
<RText|x=64.0|y=396.5|color=255|size=16|text=提示：新区只开放<"幸运玩家"/FCOLOR=250>，七星塔地图<合区后/FCOLOR=250>开放>

		]]
	end
	
	say(actor,msg)
end

function tiaozhan(actor)
	-- if getsysint("合区次数") == 0 then
	-- 	sendmsg9(actor,"七星塔地图合区后开放，敬请期待")
	-- 	return
	-- end
	-- if getsysstr("七星塔幸运玩家") == getname(actor) then	
	-- else
	-- 	if getbindgold(actor) < 300000 then
	-- 		sendmsg9(actor,"金币不足30万")
	-- 		return
	-- 	end
	-- 	subbindgold(actor,300000)
	-- 	setsysint("七星塔幸运奖池",getsysint("七星塔幸运奖池")+150000*0.4)
	-- 	setsysint("七星塔击杀奖池",getsysint("七星塔击杀奖池")+150000*0.6)
	-- end
	map(actor,"qxt1")
	callscriptex(actor, "SENDDELAYMSG", "还剩余%s离开本地图",3600, 251,1,"@huicheng")
	setstr(actor,"限时地图","qxt1")
	setint(actor,"限时地图进入时间",os.time())
	setint(actor,"限时时间",3600)
end


function tijiao(actor)
	local data = gettoupiaodata()
	local hour = tonumber(os.date("%H",os.time())) --小时
	local fen = tonumber(os.date("%M",os.time())) --分钟
	--sendmsg6(actor,hour.." "..fen)
--[[	if (hour == 0 or hour == 6 or hour == 12 or hour == 18) and fen < 30 then
	else
		sendmsg9(actor,"当前不是投票时间")
		return
	end--]]
	if istoupiao(actor) then
		sendmsg9(actor,"您已经投票过了，请等待开奖")
		return
	end
	
	if itemcount(actor,"承包凭证") < 1 then
		sendmsg9(actor,"你没有承包凭证")
		return
	end
	takeitem(actor, "承包凭证", 1)
	
	table.insert(data,{name=getname(actor),level=getlevel(actor)})
	setsysstr("七星塔投票数据",tbl2json(data))
	sendmsg6(actor,"投票成功，请耐心等待开奖")
	sendmsg9(actor,"投票成功，请耐心等待开奖")
	
	return show(actor)
end

function istoupiao(actor)
	local data = gettoupiaodata()
	local zai = false --不在表里
	for i = 1,#data do
		if getname(actor) == data[i].name then
			zai = true
			break
		end
	end
	return zai
end

function gettoupiaodata()
	local data = {}
	local data_str = getsysstr("七星塔投票数据")
	if data_str ~= "" then
		data=json2tbl(data_str)
	end
	return data
end