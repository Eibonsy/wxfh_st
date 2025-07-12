include("Market_Def/zh.lua") --个人封装函数

-----------------------------引路人NPC
function show(actor)
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
<Img|x=9.0|y=9.0|height=232|img=zhangheng/210.png|esc=0>
<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=屠夫>
<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
<Text|x=42.0|y=78.0|color=255|size=18|text=手拿一把杀猪刀，万般妖魔皆可屠...>
<Text|ay=0.5|x=67.0|y=154|size=18|color=250|text=好的，我知道了|link=@exit>
<Img|x=42.0|y=146.0|img=zhangheng/211.png|esc=0>
<Text|ay=0.5|x=371.0|y=154.5|size=18|color=250|text=打探蛊毒|link=@show1>
<Img|x=346.0|y=146.0|img=zhangheng/211.png|esc=0>


	]]
	
	say(actor,msg)
end


function show1(actor)
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
<Img|x=9.0|y=9.0|height=232|img=zhangheng/210.png|esc=0>
<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=蛊毒制作>
<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
<Img|x=115.0|y=66.0|img=zhangheng/28.png|esc=0>
<Img|x=229.0|y=69.0|img=zhangheng/29.png|esc=0>
<Img|x=51.0|y=61.0|width=50|height=50|esc=0|img=zhangheng/104.png>
<Img|x=166.0|y=61.0|width=50|height=50|esc=0|img=zhangheng/104.png>
<Img|x=285.0|y=61.0|width=50|height=50|esc=0|img=zhangheng/104.png>
<Img|x=115.0|y=136.0|img=zhangheng/28.png|esc=0>
<Img|x=229.0|y=139.0|img=zhangheng/29.png|esc=0>
<Img|x=51.0|y=131.0|width=50|height=50|esc=0|img=zhangheng/104.png>
<Img|x=166.0|y=131.0|width=50|height=50|esc=0|img=zhangheng/104.png>
<Img|x=285.0|y=131.0|width=50|height=50|esc=0|img=zhangheng/104.png>
<RText|ay=0.5|x=132.0|y=216.5|color=161|size=18|text=制作蛊毒需要获得对应的魂兽属性>


	]]
	---------------鹤顶红
		msg=msg..'<ItemShow|x=43.0|y=53.0|width=70|height=70|itemid='.. getidbyname("红色药剂") ..'|itemcount=1|showtips=1|bgtype=0>'
		msg=msg..'<RText|x=65.0|y=93.0|color=255|size=16|text=<'.. itemcount(actor,"红色药剂") ..'/FCOLOR=249>/<1/FCOLOR=250>>'
		
		msg=msg..'<ItemShow|x=158.0|y=53.0|width=70|height=70|itemid='.. getidbyname("金条") ..'|itemcount=1|showtips=1|bgtype=0>'
		msg=msg..'<RText|x=180.0|y=93.0|color=255|size=16|text=<'.. itemcount(actor,"金条") ..'/FCOLOR=249>/<1/FCOLOR=250>>'
		
		msg=msg..'<ItemShow|x=277.0|y=53.0|width=70|height=70|itemid='.. getidbyname("鹤顶红") ..'|itemcount=1|showtips=1|bgtype=0>'
		msg=msg..'<Button|x=368.0|y=67.0|width=110|size=18|color=10051|nimg=zhangheng/13.png|text=制作鹤顶红|link=@zhizuo,1>'
	---------------断肠草
		msg=msg..'<ItemShow|x=43.0|y=123.0|width=70|height=70|itemid='.. getidbyname("黄色药剂") ..'|itemcount=1|showtips=1|bgtype=0>'
		msg=msg..'<RText|x=65.0|y=163.0|color=255|size=16|text=<'.. itemcount(actor,"黄色药剂") ..'/FCOLOR=249>/<1/FCOLOR=250>>'
		
		msg=msg..'<ItemShow|x=158.0|y=123.0|width=70|height=70|itemid='.. getidbyname("金条") ..'|itemcount=1|showtips=1|bgtype=0>'
		msg=msg..'<RText|x=180.0|y=163.0|color=255|size=16|text=<'.. itemcount(actor,"金条") ..'/FCOLOR=249>/<1/FCOLOR=250>>'
		
		msg=msg..'<ItemShow|x=277.0|y=123.0|width=70|height=70|itemid='.. getidbyname("断肠草") ..'|itemcount=1|showtips=1|bgtype=0>'
		msg=msg..'<Button|x=368.0|y=137.0|width=110|color=10051|nimg=zhangheng/13.png|size=18|text=制作断肠草|link=@zhizuo,2>'
		
	say(actor,msg)
end

function zhizuo(actor,par)
	local sh_data = getshouhunbuffdata(actor) --获取兽魂buff数据
	if par == "1" then
		local isyou = false
		for i = 1,#sh_data do
			if sh_data[i] == "噬魂决" then
				isyou = true
			end
		end
		if not isyou then
			sendmsg9(actor,"制作鹤顶红需要魂兽属性【噬魂决】")
			return
		end
		if itemcount(actor,"红色药剂") < 1 or itemcount(actor,"金条") < 1 then
			sendmsg9(actor,"材料不足")
			return
		end
		takeitem(actor,"红色药剂",1)
		takeitem(actor,"金条",1)
		giveitem(actor,"鹤顶红",1)
	else
		local isyou = false
		for i = 1,#sh_data do
			if sh_data[i] == "蛊毒术" then
				isyou = true
			end
		end
		if not isyou then
			sendmsg9(actor,"制作断肠草需要魂兽属性【蛊毒术】")
			return
		end
		if itemcount(actor,"黄色药剂") < 1 or itemcount(actor,"金条") < 1 then
			sendmsg9(actor,"材料不足")
			return
		end
		takeitem(actor,"黄色药剂",1)
		takeitem(actor,"金条",1)
		giveitem(actor,"断肠草",1)
	end
	sendmsg9(actor,"制作成功")
	return show1(actor)
end

function getshouhunbuffdata(actor) --获取兽魂buff数据
	local data = {"","","","","",""}
	local sh_str = getstr(actor,"兽魂buff数据")
	if sh_str ~= "" then
		data=json2tbl(sh_str)
	end
	return data
end
