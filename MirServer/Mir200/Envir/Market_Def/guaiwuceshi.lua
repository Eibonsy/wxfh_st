include("Market_Def/zh.lua") --个人封装函数

function show(actor)
	local msg = [[
	<Img|x=0|width=860|height=600|reset=0|loadDelay=1|bg=1|img=zhangheng/1.png|move=1|esc=1|show=4>
	<Button|x=639.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	]]
	local ysxx = 20
	local ysyy = 50
	local geshu = 8
	for i = 1,45 do
		msg = msg ..'<Button|x='.. ysxx+10 + (i-1)%geshu*100 ..'|y='.. ysyy+9+math.floor((i-1)/geshu) * 40 ..'|color=10051|nimg=zhangheng/13.png|size=18|text=编号'..i..'|link=@set2,'..i..'>'
	end
	
	for i = 1,48 do
		msg = msg ..'<Button|x='.. ysxx+10 + (i-1)%geshu*100 ..'|y='.. ysyy+259+math.floor((i-1)/geshu) * 40 ..'|color=10051|nimg=zhangheng/13.png|size=18|text=编号'..i..'|link=@set3,'..i..'>'
	end
	
	say(actor,msg)
end
function set2(actor,par)
	par = tonumber(par)
	local item = linkbodyitem(actor,15) --马牌位置装备 武穆遗书
	if item == "0" then
		sendmsg9(actor,"设置失败")
		return
	end
	setitem_wmysd2tbh(actor,item,par)
	sendmsg9(actor,"设置成功")
	refreshitem(actor, item)
	callscriptex(actor, "CallLua", "wumuyishu", "@setbuff") --设置武穆遗书buff
end

function set3(actor,par)
	par = tonumber(par)
	local item = linkbodyitem(actor,15) --马牌位置装备 武穆遗书
	if item == "0" then
		sendmsg9(actor,"设置失败")
		return
	end
	setitem_wmysd3tbh(actor,item,par)
	sendmsg9(actor,"设置成功")
	refreshitem(actor, item)
	callscriptex(actor, "CallLua", "wumuyishu", "@setbuff") --设置武穆遗书buff
end