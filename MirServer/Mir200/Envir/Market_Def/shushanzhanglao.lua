include("Market_Def/zh.lua") --个人封装函数
function show(actor)
	local msg = ""
	if getint(actor,"酒剑仙任务是否领取") == 1 and getint(actor,"酒剑仙任务编号") == 6 and itemcount(actor,"护心莲") < 1 then 
		msg = [[
		<Img|x=0.0|y=0.0|width=480|height=280|reset=1|scale9r=30|scale9t=30|bg=1|scale9b=30|move=0|scale9l=30|loadDelay=1|esc=1|img=zhangheng/176.png|show=0>
		<Button|x=480.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Text|ax=0.5|x=245.0|y=25.0|color=251|size=18|text=蜀山长老>
		<Text|x=65.0|y=55.0|color=161|size=16|text=小友，没事不要打扰我观赏这美丽的天池，常言道>
		<RText|x=65.0|y=75.0|color=161|size=16|text=溪流渺渺净涟漪，鱼跃鱼潜乐自知，若逐桃花浪里>
		<RText|x=65.0|y=95.0|color=161|size=16|text=去，风雷相送入天池.........>
		<RText|x=65.0|y=125.0|color=161|size=16|text=我守护这"天池"中的护心莲已有800年, 见证过无数>
		<RText|x=65.0|y=145.0|color=161|size=16|text=勇士都想得到它，奈何实力不足，最终掉入这天池>
		<RText|x=65.0|y=165.0|color=161|size=16|text=喂鱼了，老夫掐指一算，看少侠定是"财力雄厚"之>
		<RText|x=65.0|y=185.0|size=16|color=161|text=人，如果你愿意给老夫<500金矿石/FCOLOR=253>换酒喝, 我定帮你>
		<RText|x=65.0|y=205.0|size=16|color=161|text=采集到护心莲.....>
		<Text|x=140.0|y=236.0|color=250|size=18|text=愿意|link=@yuanyi>
		<Text|x=286.0|y=236.0|color=250|size=18|text=不愿意|link=@exit>

		]]
	else
		msg = [[
		<Img|x=0.0|y=0.0|width=480|height=180|img=zhangheng/176.png|scale9t=30|move=0|loadDelay=1|reset=1|scale9l=30|scale9b=30|show=0|bg=1|scale9r=30|esc=1>
		<Button|x=480.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Text|ax=0.5|x=245.0|y=26.0|size=18|color=251|text=蜀山长老>
		<Text|x=65.0|y=62.0|size=16|color=161|text=小友，没事不要打扰我观赏这美丽的天池，常言道>
		<RText|x=65.0|y=82.0|size=16|color=161|text=溪流渺渺净涟漪，鱼跃鱼潜乐自知，若逐桃花浪里>
		<RText|x=65.0|y=102.0|size=16|color=161|text=去，风雷相送入天池.........>
		]]
	end
	
	say(actor,msg)
end

function yuanyi(actor)
	if itemcount(actor,"金矿石") < 500 then
		sendmsg9(actor,"金矿石不足500个")
		return
	end
	takeitem(actor,"金矿石",500)
	showprogressbardlg(actor,5,"@caijihuxinlian","正在采集,进度%d%...",0)
	close()
end

