
local sc_items= {
	{"破馆珍剑",1},{"自动回收",1},{"打怪效率卡",1},{"双倍经验卷",1},{"赏金值",160},
}

function shouchong_show(actor)
	local msg = [[
	<Img|x=42.0|y=-30.0|esc=1|show=4|bg=1|move=0|img=zhangheng/233.png|loadDelay=1|reset=1>
<Button|x=566.0|y=21.0|nimg=zh/60.png|color=255|size=18|link=@exit>
<Img|x=181.0|y=126.0|width=400|img=zh/25.png|esc=0>
<Button|x=370.0|y=269.0|color=161|nimg=zh/4.png|size=18|text=我要开荒|link=@shouchong_lingqu>
<Effect|x=152.0|y=254.0|scale=1|speed=1|dir=5|act=0|effecttype=0|effectid=20008>
<Effect|x=145.0|y=212.0|scale=1|speed=1|effecttype=0|act=0|effectid=20009|dir=5>
<Img|x=241.0|y=212.0|img=zh/103.png|esc=0>


	]]
	for i = 1,#sc_items do
		msg=msg..'<Img|x='.. 249+(i-1)*60 ..'|y=138.0|img=zhangheng/234.png|esc=0>'
		msg=msg..'<ItemShow|x='.. 244+(i-1)*60 ..'|y=133.0|width=70|height=70|itemid='.. getidbyname(sc_items[i][1]) ..'|itemcount='.. sc_items[i][2] ..'|showtips=1|bgtype=0>'
	end
	say(actor,msg)
end

function shouchong_lingqu(actor)
	if getint(actor,"累计充值") < 10 then
		sendmsg9(actor,"充值任意金额即可领取")
		openhyperlink(actor,26,0)
		return
	end
	if getint(actor,"首充领取") ~= 0 then
		sendmsg9(actor,"您已经领取过了")
		return
	end

	setint(actor,"首充领取",1) 
	giveitem(actor,"破馆珍剑",1,370)
	giveitem(actor,"双倍经验卷",1,370)
	addshangjinzhi(actor,160)
	
	setsysint("领取首冲的个数",getsysint("领取首冲的个数")+1)
	setsysint("每日领取首冲的个数",getsysint("每日领取首冲的个数")+1)
	
	local str = "<玩家【".. getname(actor) .."】/FCOLOR=251><领取了/FCOLOR=254><【开荒豪礼】/FCOLOR=251>，<起步快人一步！！！/FCOLOR=251>"
	sendmsg13(actor,str)
	sendmsg0(actor,"玩家【".. getname(actor) .."】领取了【开荒豪礼】，起步快人一步！！！")
	close()
	if itemcount(actor,"破馆珍剑") > 2 then
		gmexecute(actor,"DenyCharNameLogon",getname(actor),1)
		callscriptex(actor, "LOGOUT")
		return
	end
	tubiaoxianshi(actor) --刷新按钮
	
end