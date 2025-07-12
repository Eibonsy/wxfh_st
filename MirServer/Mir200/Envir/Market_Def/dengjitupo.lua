include("Market_Def/zh.lua") --个人封装函数

function show(actor)
	if getlevel(actor) < 70 then
		sendmsg9(actor,"老夫正在下棋,请不要来打扰我...")
		return
	elseif getlevel(actor) < 75 then
		sendmsg9(actor,"小伙子, 请继续磨炼等级达到75级在来找老夫")
		return
	end
	
	local msg = [[
		<Img|width=530|height=340|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Img|x=9.0|y=8.0|height=322|scale9r=50|scale9t=50|esc=0|img=zhangheng/210.png|scale9b=50|scale9l=50>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=无崖子>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<Img|x=34.0|y=265.0|img=zhangheng/203.png|esc=0>
		<RText|x=22.0|y=60.0|color=255|size=18|text=在这片玛法大陆上只有强者才能立足，唯有勇者才能突破自我>
		<RText|x=22.0|y=85.0|size=18|color=255|text=75级是征战沙城的硬度，而<76级/FCOLOR=149>则是独步玛法的高度，如果你>
		<RText|x=22.0|y=110.0|color=255|size=18|text=愿意老夫就让你跨越这道难关，成就自己的传奇...>
		<RText|x=22.0|y=140.0|color=255|size=18|text=老夫这里提供两种方式可突破至76级，不过人物被敌人击杀后>
		<RText|x=22.0|y=165.0|size=18|color=255|text=会自动<掉至75级/FCOLOR=249>，本游戏<最高等级为76级/FCOLOR=254>..>
		<Text|x=117.0|y=286.0|color=250|size=18|text=金砖突破|link=@tupo,1>
		<Text|x=346.0|y=286.0|color=250|size=18|text=元宝突破|link=@tupo,2>
	]]
	
	msg=msg.."<RText|x=22.0|y=200.0|color=255|size=18|text=使用材料：75级+<".. itemcount(actor,"50万经验卷") .."/FCOLOR=249>/<10/FCOLOR=250>个<五十万经验卷/FCOLOR=253>+<".. itemcount(actor,"金砖") .."/FCOLOR=249>/<2块/FCOLOR=250><金砖/FCOLOR=70>>"
	msg=msg.."<RText|x=22.0|y=231.0|color=255|size=18|text=使用元宝：75级+<".. itemcount(actor,"50万经验卷") .."/FCOLOR=249>/<10/FCOLOR=250>个<五十万经验卷/FCOLOR=253>+<".. getingot(actor) .."/FCOLOR=249>/<5千/FCOLOR=250><元宝/FCOLOR=70>>"
		
	say(actor,msg)
end

function tupo(actor,par)
	par = tonumber(par)
	if getlevel(actor) >= 76 then
		sendmsg9(actor,"你已达本服最高等级76级","#00FF00")
		return
	end
	
	if getlevel(actor) ~= 75 then
		sendmsg9(actor,"只有75级才能在我这里提升")
		return
	end

	if par == 1 then
		if itemcount(actor,"50万经验卷") < 10 or itemcount(actor,"金砖") < 2 then
			sendmsg9(actor,"条件不满足")
			return
		end
		takeitem(actor,"50万经验卷",10)
		takeitem(actor,"金砖",2)
		
	else
		if itemcount(actor,"50万经验卷") < 10 or getingot(actor) < 5000 then
			sendmsg9(actor,"条件不满足")
			return
		end
		takeitem(actor,"50万经验卷",10)
		subingot(actor,5000)
	end
	setlevel(actor,76)
	gmexecute(actor,"jy",getname(actor),0)
	sendmsg9(actor,"恭喜你成功升级到76级")
	return show(actor)
end
