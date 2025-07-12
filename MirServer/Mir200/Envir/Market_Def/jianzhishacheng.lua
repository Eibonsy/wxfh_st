include("Market_Def/zh.lua") --个人封装函数


function show(actor,yemian)
	yemian = tonumber(yemian) or 1
	local msg = [[
		<Img|x=0|width=585|height=423|bg=1|scale9l=50|scale9r=50|scale9t=50|scale9b=50|move=1|loadDelay=1|esc=1|reset=0|img=zhangheng/1.png|show=4>
		<Button|x=581.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=15.5|y=38.5|img=zhangheng/255.png|esc=0>
		
	]]
	if yemian == 1 then
		msg=msg..[[
			<Text|x=410.5|y=205.5|color=250|size=18|text=沙城垃圾口|link=@shamove,沙城垃圾口>
			<Text|x=75.5|y=105.5|color=250|size=18|text=沙城武器店|link=@shamove,沙城武器店>
			<Text|x=410.5|y=105.5|color=250|size=18|text=沙城首饰店|link=@shamove,沙城首饰店>
			<Text|x=75.5|y=205.5|color=250|size=18|text=沙巴克仓库|link=@shamove,沙巴克仓库>
			<Text|x=245.5|y=155.5|color=250|size=18|text=沙巴克大门|link=@shamove,沙巴克大门>
			<Img|x=209.5|y=45.5|img=zhangheng/71.png|esc=0>
			<Text|ax=0.5|ay=0.5|x=290.5|y=63.0|outline=1|size=18|color=251|text=攻城点传送>
			<Img|x=40.5|y=87.5|width=500|img=zhangheng/175.png|esc=0>
			<Img|x=40.5|y=242.5|width=500|img=zhangheng/175.png|esc=0>
			<RText|x=66.5|y=262.5|color=255|size=18|text=攻城奖励由胜利方行会掌门领取，自动平分给沙巴克成员>
			<RText|x=144.5|y=299.5|color=31|size=18|text=每次攻城时间为晚上：21:00 -- 22:00>
			<Text|x=75.5|y=355.5|color=116|size=18|text=查看规则|link=@show,2>
			
		]]
		local name = "无"
		if castleinfo(3) ~= "管理员" then
			name = castleinfo(3)
		end
		msg=msg.."<RText|x=303.5|y=355.5|color=116|size=18|text=沙巴克城主：".. name ..">"
	else
		msg=msg..[[
			<RText|x=29.5|y=46.5|color=116|size=18|text=攻城时间：>
<RText|x=29.5|y=69.5|color=255|size=18|text=新区第三天合区集体攻城，其后每天举行攻城>
<RText|x=29.5|y=96.5|color=116|size=18|text=奖励说明：>
<RText|x=29.5|y=119.5|color=255|size=18|text=首次合区后额外奖励<5万元宝/FCOLOR=251>， 其后每天攻城奖励<5000万金币/FCOLOR=251>，战>
<RText|x=29.5|y=144.5|color=255|size=18|text=区合区额外奖励<10万元宝/FCOLOR=253>，如攻城人数过多会额外追加元宝奖励，>
<RText|x=29.5|y=169.5|color=255|size=18|text=详情请关注系统公告或者咨询游戏客服>
<RText|x=29.5|y=197.5|color=116|size=18|text=奖励发放：>
<RText|x=29.5|y=220.5|color=255|size=18|text=攻城结束后<22:01 - 22:30/FCOLOR=250>分内沙巴克掌门在皇宫点击"奖励员"领取>
<RText|x=29.5|y=245.5|color=255|size=18|text=攻城奖励，<行会掌门独享20%奖励/FCOLOR=22>，剩余奖励皇宫内行会成员平均>
<RText|x=29.5|y=270.5|color=255|size=18|text=分配(包括掌门) <行会掌门额外奖励10000点赏金值以及对15万血以/FCOLOR=254>>
<RText|x=29.5|y=322.5|color=255|size=18|text=奖励将通过邮件形式发放，平均分配当天攻城奖励为避免影响真正>
<RText|x=29.5|y=347.5|color=255|size=18|text=参与攻城玩家的利益，<攻城期间没在攻沙区域参加15分钟以上的玩/FCOLOR=250>>
<RText|x=29.5|y=372.5|color=255|size=18|text=<家将获取不到攻城奖励/FCOLOR=250>，发放奖励期间请玩家尽量保持在线>
<Text|x=452.5|y=69.5|color=250|size=18|text=返回主页|link=@show,1>
<RText|x=29.5|y=295.5|color=255|size=18|text=<上的boss爆率加成/FCOLOR=254>>



		]]
	end

	say(actor,msg)
end
local shachuansong = {
		["沙城垃圾口"]={600,292},
        ["沙城武器店"]={639,312},
        ["沙城首饰店"]={668,285},
        ["沙巴克仓库"]={640,245},
        ["沙巴克大门"]={681,338},
	}

function shamove(actor,par)
	if getlevel(actor) < 50 then
		sendmsg9(actor,"达到50级才可以直接传送")
		return
	end
	mapmove(actor,"3",shachuansong[par][1],shachuansong[par][2],0)
end