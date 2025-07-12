include("Market_Def/zh.lua") --个人封装函数
function show(actor)
	local msg = ""
	if itemcount(actor,"酒剑仙的推荐信") > 0 then 
		msg = [[
		<Img|x=0.0|y=0.0|width=490|height=280|reset=1|scale9r=30|scale9t=30|bg=1|scale9b=30|move=0|scale9l=30|loadDelay=1|esc=1|img=zhangheng/176.png|show=0>
		<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
		<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
		<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=酒馆店小二>
		<RText|x=22.0|y=55.0|color=161|size=16|text=年轻人，没事不要打扰我搬砖，如果被老板娘看见我跟你吹牛>
		<RText|x=22.0|y=77.0|color=161|size=16|text=又要扣我工钱了.......>
		<RText|x=22.0|y=99.0|color=161|size=16|text=原来你是酒剑仙介绍过来找老板娘的呀，不知你是否有<推荐信/FCOLOR=253>>
		<RText|x=22.0|y=121.0|color=161|size=16|text=如果有请交付于我吧！最近老板娘脾气不好，我会赠送一朵<玫/FCOLOR=253>>
		<RText|x=22.0|y=143.0|size=16|color=161|text=<瑰花/FCOLOR=253>给你，可以哄哄她，说不定她会传授<酿酒术/FCOLOR=250>给你哦.......>
		<Text|ax=0.5|x=246.0|y=236.0|color=250|size=18|text=提交 → 推荐信|link=@tijiaotuijian>
		<Img|x=221.0|y=172.0|width=52|height=52|esc=0|img=zhangheng/104.png>

		]]
		msg =msg..'<ItemShow|x=214.0|y=165.0|width=70|height=70|itemid='.. getidbyname("酒剑仙的推荐信") ..'|itemcount=1|showtips=1|bgtype=0>'
	else
		msg = [[
		<Img|x=0.0|y=0.0|width=490|height=180|scale9t=30|img=zhangheng/176.png|move=0|loadDelay=1|reset=1|scale9l=30|scale9b=30|show=0|bg=1|scale9r=30|esc=1>
		<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
		<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=246.0|y=34.5|size=18|color=251|text=酒馆店小二>
		<Text|x=22.0|y=60.0|size=16|color=161|text=年轻人，没事不要打扰我搬砖， 如果被老板娘看见我跟你吹牛>
		<RText|x=22.0|y=87.0|size=16|color=161|text=又要扣我工钱了.......>

		]]
	end
	
	say(actor,msg)
end

function tijiaotuijian(actor)
	takeitem(actor,"酒剑仙的推荐信",1)
	giveitem(actor,"玫瑰花",1,371)
	sendmsg9(actor,"提交成功")
	callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
	close()
end

