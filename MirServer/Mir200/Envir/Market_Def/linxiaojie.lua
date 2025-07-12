include("Market_Def/zh.lua") --个人封装函数

function show(actor,yemian)
	
	local msg = [[
		<Img|x=0.0|y=0.0|width=530|height=290|bg=1|esc=1|scale9r=10|scale9t=10|scale9b=10|move=0|loadDelay=1|scale9l=10|reset=1|img=zhangheng/176.png|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.5|color=251|size=18|text=林小姐>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<RText|ax=0|ay=0.5|x=22.0|y=72.5|color=255|size=18|text=BOSS迷宫是通往火龙神殿的必经之路.众多BOSS首领在BOSS>
		<RText|ay=0.5|x=22.0|y=97.5|color=255|size=18|text=迷宫迷路找不到方向而被困于此.我也是历经千辛万苦才为勇士>
		<RText|ay=0.5|x=22.0|y=122.5|color=255|size=18|text=们找到了一丝线索.只能告诉你四个单独的迷宫都可以通过<左上/FCOLOR=250>>
		<RText|ay=0.5|x=22.0|y=147.5|color=255|size=18|text=<上上右/FCOLOR=250>的方法找到前往火龙神殿的秘密>
		<RText|ay=0.5|x=23.0|y=172.5|color=255|size=18|text=此处过于凶险.前往此处需要等级达到<58级/FCOLOR=254>并且给我<五十个紫水/FCOLOR=253>>
		<Text|ay=0.5|x=232.0|y=258.5|size=18|color=250|text=我要前往|link=@qianwang>
		<RText|ay=0.5|x=23.0|y=197.5|color=255|size=18|text=<晶矿/FCOLOR=253>.如果你是<投资专家/FCOLOR=251>.只要你达到<50级/FCOLOR=70>我也可以送你前往>
		<RText|x=95.0|y=218.0|color=255|size=18|text=<为方便单混散人追梦，中小BOSS不定点刷新/FCOLOR=254>>
	]]
	say(actor,msg)
end


function qianwang(actor)
	if getsysint("合区次数") >=5 then
		if not hasbuff(actor,10001) and not hasbuff(actor,20083) and getint(actor,"防脱机验证") == 0 then
			sendmsg9(actor,"请先开启防脱机验证才可进入58级以下地图","#00ff00")
			return
		end
	end
	
	
	local xqdj = 58
	if getint(actor,"会员等级") >= 4 then
		xqdj = 50
	end
	
	if getlevel(actor) < xqdj then
		if xqdj == 58 then
			sendmsg9(actor,"由于你不是投资专家，需等级达到58级才能进入","#FF00FF")
		else
			sendmsg9(actor,"等级需达到50级才能进入","#FF00FF")
		end
		return
	end
	if itemcount(actor,"紫水晶矿") < 50 then
		sendmsg9(actor,"紫水晶矿不足50个，无法进入","#FF00FF")
		return
	end
	takeitem(actor,"紫水晶矿",50)
	map(actor,"mgrk")
	sendmsg0(actor,"ぐ【系统】勇敢的勇士:“".. getname(actor) .."”进入BOSS迷宫地图寻找高级装备去了，大家祝福他吧…",117,94)
end