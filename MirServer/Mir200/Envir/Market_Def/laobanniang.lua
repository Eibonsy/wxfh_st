include("Market_Def/zh.lua") --个人封装函数
function show(actor)
	local msg = ""
	if itemcount(actor,"玫瑰花") > 0 then 
		msg = [[
		<Img|x=0.0|y=0.0|width=490|height=280|reset=1|scale9r=30|scale9t=30|bg=1|scale9b=30|move=0|scale9l=30|loadDelay=1|esc=1|img=zhangheng/176.png|show=0>
		<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
		<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=246.0|y=34.5|size=18|color=251|text=酒馆老板娘>
		<Text|x=22.0|y=55.0|size=16|color=161|text=年轻人，没事不要打扰我算账，最近酒馆生意非常红火，忙得>
		<RText|x=22.0|y=77.0|size=16|color=161|text=我焦头烂额....>
		<RText|x=22.0|y=109.0|size=16|color=161|text=如果你能寻来一朵<"玫瑰花"/FCOLOR=253>装饰下这酒馆那该多好呀，如果能>
		<RText|x=22.0|y=131.0|size=16|color=161|text=让我满意的话，我会传授酿酒术做为报答......>
		<Text|ax=0.5|x=246.0|y=236.0|color=250|size=18|text=领悟 → 酿酒术|link=@lingwu>
		<Img|x=221.0|y=172.0|width=52|height=52|esc=0|img=zhangheng/104.png>

		]]
		msg =msg..'<ItemShow|x=214.0|y=165.0|width=70|height=70|itemid='.. getidbyname("玫瑰花") ..'|itemcount=1|showtips=1|bgtype=0>'
	elseif getint(actor,"领悟酿酒术") == 1 then 
		msg = [[
		<Img|x=0.0|y=0.0|width=490|height=320|img=zhangheng/176.png|scale9t=30|move=0|loadDelay=1|reset=1|scale9l=30|scale9b=30|show=0|bg=1|scale9r=30|esc=1>
		<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
		<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=酒馆老板娘>
		<Text|x=22.0|y=55.0|color=161|size=16|text=年轻人，没事不要打扰我算账，最近酒馆生意非常红火，忙得>
		<RText|x=22.0|y=77.0|color=161|size=16|text=我焦头烂额....>
		<RText|x=22.0|y=104.0|color=161|size=16|text=如果你能寻来一朵<"玫瑰花"/FCOLOR=253>装饰下这酒馆那该多好呀，如果能>
		<RText|x=22.0|y=126.0|color=161|size=16|text=让我满意的话，我会传授酿酒术做为报答......>
		<RText|x=22.0|y=153.0|color=161|size=16|text=不好意思，这花带刺我不满意，无法传授酿酒术给你，如果你>
		<RText|x=22.0|y=175.0|size=16|color=161|text=能帮忙寻找到一个金砖，我会<100%/FCOLOR=250>传授酿酒术.......>
		<Text|ax=0.5|x=246.0|y=272.0|color=250|size=18|text=领悟 → 酿酒术|link=@lingwu1>
		<Img|x=221.0|y=208.0|width=52|height=52|esc=0|img=zhangheng/104.png>

		]]
		msg =msg..'<ItemShow|x=214.0|y=202.0|width=70|height=70|itemid='.. getidbyname("金砖") ..'|itemcount=1|showtips=1|bgtype=0>'
	else
		msg = [[
		<Img|x=0.0|y=0.0|width=490|height=180|reset=1|scale9r=30|scale9t=30|bg=1|scale9b=30|move=0|scale9l=30|loadDelay=1|esc=1|img=zhangheng/176.png|show=0>
		<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
		<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=246.0|y=34.5|size=18|color=251|text=酒馆老板娘>
		<Text|x=22.0|y=60.0|size=16|color=161|text=年轻人，没事不要打扰我算账，最近酒馆生意非常红火，忙得>
		<RText|x=22.0|y=87.0|size=16|color=161|text=我焦头烂额....>

		]]
	end
	
	say(actor,msg)
end

function lingwu(actor)
	takeitem(actor,"玫瑰花",1)
	setint(actor,"领悟酿酒术",1)
	sendmsg9(actor,"领悟失败，请重新点击老板娘领悟")
	sendmsg6(actor,"领悟失败，请重新点击老板娘领悟")
	callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
	close()
end

function lingwu1(actor)
	if itemcount(actor,"金砖") < 1 then
		sendmsg9(actor,"金砖不足")
		return
	end
	takeitem(actor,"金砖",1)
	setint(actor,"领悟酿酒术",2)
	sendmsg9(actor,"领悟成功")
	giveitem(actor,"泉水",1,371)
	giveitem(actor,"高粱",1,371)
	callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
	show(actor)
end

