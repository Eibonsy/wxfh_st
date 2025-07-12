include("Market_Def/zh.lua") --个人封装函数

local guaiwut = {
	{name="巨型多角虫",	mon="巨型多角虫3",dengji=35,yanse=254,	},
	{name="半兽勇士",	mon="半兽勇士",dengji=45,yanse=70,	},

}
function show(actor,yemian)
	
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=驯兽师>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<RText|ax=0|ay=0.5|x=22.0|y=72.5|color=255|size=18|text=法师作为传奇界群攻最多的职业,怎么能没有几只耀武杨威的>
		<RText|ay=0.5|x=22.0|y=97.5|color=255|size=18|text=宝宝呢? 白日门<虎卫堂/FCOLOR=250>可免费诱惑虎卫, 听说<未知暗殿/FCOLOR=250>可免费>
		<RText|ay=0.5|x=22.0|y=122.5|color=255|size=18|text=诱惑更强大的宝宝哦!>
		<RText|ay=0.5|x=22.0|y=164.5|color=70|size=18|text=巨型多角虫　　　　所需2万金币>
		<RText|ay=0.5|x=22.0|y=203.5|color=254|size=18|text=半兽勇士　　　　　所需4万金币>
		<Text|ay=0.5|x=382.0|y=163.5|size=18|color=250|text=获取宝宝|link=@zhaohuan,1>
		<Text|ay=0.5|x=382.0|y=202.5|size=18|color=250|text=获取宝宝|link=@zhaohuan,2>
	]]
	say(actor,msg)
end

function zhaohuan(actor,par)
	par = tonumber(par)
	local bbt = getbaobaolist(actor) --获取宝宝列表

	if getjob(actor) ~= 1 then
		sendmsg9(actor,"对不起！你不是法师！不能召唤！")
		return
	end
	if #bbt >= 5 then
		sendmsg9(actor,"你已经有5个宝宝，不能再召唤！")
		return
	end
	if getlevel(actor) < guaiwut[par].dengji then
		sendmsg9(actor,"勇士，想要获取宝宝需要等级达到".. guaiwut[par].dengji .."级")
		return
	end
	if par == 1 then
		if getbindgold(actor) < 20000 then
			sendmsg9(actor,"领取宝宝需要2万金币","#00FF00")
			return
		end
		subbindgold(actor,20000)
	else
		if getbindgold(actor) < 40000 then
			sendmsg9(actor,"领取宝宝需要4万金币","#00FF00")
			return
		end
		subbindgold(actor,40000)
	end
	
	callscriptex(actor, "RECALLMOB", guaiwut[par].mon, 1,3600,0,0,0,0)
	sendmsg9(actor,"召唤成功","#00FF00")
end
