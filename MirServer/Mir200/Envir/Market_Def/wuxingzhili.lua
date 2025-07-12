include("Market_Def/zh.lua") --个人封装函数
function show(actor)
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|size=18|color=251|text=五行之力>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<RText|ax=0|ay=0.5|x=22.0|y=70.0|size=18|color=255|text=无极道洪荒，天地本初生，盘古大神诞于其中，开天地、分阴>
		<RText|ay=0.5|x=22.0|y=95.0|color=255|size=18|text=阳，卒后三魂七魄分而化之。其五魄化为<金、木、水、火、土/FCOLOR=250>>
		<RText|ay=0.5|x=22.0|y=120.5|color=255|size=18|text=五行得以创造玛法今日之山川湖泊，生灵万物>
		<RText|ay=0.5|x=22.0|y=145.5|color=255|size=18|text=传闻只需<少量金币/FCOLOR=253>，即可掌控<五行之力/FCOLOR=22>，其战斗力快速飙升助>
		<RText|ay=0.5|x=22.0|y=170.5|color=255|size=18|text=你斩妖除魔>
		<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
		<Text|ay=0.5|x=200.0|y=214.5|color=250|size=18|text=掌控 → 五行之力|link=@jinji>
	]]
	say(actor,msg)
end

local anniu_t = {
	{x=179.5,y=104.5,tupath="zhangheng/88.png",nametu="zhangheng/94.png"},
	{x=291.5,y=184.5,tupath="zhangheng/89.png",nametu="zhangheng/95.png"},
	{x=254.5,y=295.5,tupath="zhangheng/90.png",nametu="zhangheng/96.png"},
	{x=106.5,y=295.5,tupath="zhangheng/91.png",nametu="zhangheng/97.png"},
	{x=70.5,y=184.5, tupath="zhangheng/92.png",nametu="zhangheng/98.png"},
}

shengji_t = {
	{buffid=10021,name="金",text={[0]="攻击提升：",[1]="魔法提升：",[2]="道术提升："}, zhi={[0]="0.0%","0.5%","1.0%","1.5%","2.0%","2.5%","已满　"},	 	feiyong={[0]=50000,50000,50000,50000,50000,0},jilv ={[0]=50,50,50,50,50,0}          }, --金
	{buffid=10022,name="木",text={[0]="对怪增伤：",[1]="对怪增伤：",[2]="对怪增伤："}, zhi={[0]="0.0%","1.0%","2.0%","3.0%","4.0%","5.0%","已满　"}, 		feiyong={[0]=50000,50000,50000,50000,50000,0},jilv ={[0]=50,50,50,50,50,0}          }, --火
	{buffid=10023,name="水",text={[0]="生命值提升：",[1]="生命值提升：",[2]="生命值提升："}, zhi={[0]="0.0%","1.0%","2.0%","3.0%","4.0%","5.0%","已满　"},	feiyong={[0]=50000,50000,50000,50000,50000,0},jilv ={[0]=50,50,50,50,50,0}          }, --水
	{buffid=10024,name="火",text={[0]="打怪爆率：",[1]="打怪爆率：",[2]="打怪爆率："}, zhi={[0]="0.0%","1.0%","2.0%","3.0%","4.0%","5.0%","已满　"}, 		feiyong={[0]=50000,50000,50000,50000,50000,0},jilv ={[0]=50,50,50,50,50,0}          }, --土
	{buffid=10025,name="土",text={[0]="吸血提升：",[1]="吸血提升：",[2]="吸血提升："}, zhi={[0]="0.0%","0.5%","1.0%","1.5%","2.0%","2.5%","已满　"},	feiyong={[0]=50000,50000,50000,50000,50000,0},jilv ={[0]=50,50,50,50,50,0}          }, --木
}



local bl_t = {"五行金等级","五行木等级","五行水等级","五行火等级","五行土等级"}

function jinji(actor,xzid,xianshi)
	if getint(actor,"五行总等级") >= 25 then
		return qiehuan(actor)
	end
	xzid = tonumber(xzid) or 1
	xianshi = tonumber(xianshi) or 0
	local msg = [[
		<Img|x=0|width=643|height=457|esc=1|loadDelay=1|bg=1|img=zhangheng/1.png|move=1|reset=0|show=4>
		<Button|x=639.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=16.5|y=40.5|img=zhangheng/87.png|esc=0>
		<Img|x=392.5|y=46.5|img=zhangheng/84.png|esc=0>
		<Img|x=414.5|y=183.5|width=200|img=zhangheng/99.png|esc=0>
		<Img|x=414.5|y=293.5|width=200|img=zhangheng/99.png|esc=0>
		<Text|x=480.5|y=96.5|color=95|size=18|text=当前属性>
		<Text|x=480.5|y=209.5|size=18|color=95|text=下级属性>
		<Img|x=131.5|y=224.5|img=zhangheng/71.png|esc=0>
		<Img|x=54.5|y=44.5|img=zhangheng/209.png|esc=0>

	]]
	msg=msg.."<Img|x=18.5|y=398.5|img=zhangheng/8.png|esc=0|link=@jinji,"..xzid..",1>"
	for i = 1,5 do
		if i == xzid then
			local job = getjob(actor) --职业
			local sxlv = getint(actor,bl_t[i]) --属性等级
			msg=msg.."<Button|x="..anniu_t[i].x.."|y="..anniu_t[i].y.."|color=255|size=18|nimg="..anniu_t[i].tupath..">"
			msg=msg.."<Img|x="..anniu_t[i].x-12 .."|y="..anniu_t[i].y-13 .."|img=zhangheng/93.png|esc=0>"
			msg=msg.."<Text|ax=0.5|x=209.5|y=232.5|size=18|color=250|text=Lv.".. sxlv ..">"
			msg=msg.."<Text|ax=0.5|x=209.5|y=397.5|color=254|size=18|text=当前选择“".. shengji_t[i].name .."”，成功几率为：".. shengji_t[i].jilv[sxlv] .."%>"
			msg=msg.."<Img|x=467.5|y=47.5|img=".. anniu_t[i].nametu .."|esc=0>"
			msg=msg.."<Text|ax=0.5|x=517.0|y=138.5|color=103|size=18|text="..shengji_t[i].text[job].. shengji_t[i].zhi[sxlv]..">"
			msg=msg.."<Text|ax=0.5|x=517.0|y=251.5|color=103|size=18|text="..shengji_t[i].text[job].. shengji_t[i].zhi[sxlv+1]..">"
			if shengji_t[i].feiyong[sxlv] == 0 then
				msg=msg.."<RText|ax=0.5|x=516.5|y=325.5|size=18|color=255|text=<需要金币：/FCOLOR=251><".. jianhuanum(getbindgold(actor)) .."/FCOLOR=249>/<已满/FCOLOR=250>>"
			else
				msg=msg.."<RText|ax=0.5|x=516.5|y=325.5|size=18|color=255|text=<需要金币：/FCOLOR=251><".. jianhuanum(getbindgold(actor)) .."/FCOLOR=249>/<"..jianhuanum(shengji_t[i].feiyong[sxlv]) .."/FCOLOR=250>>"
			end
			msg=msg.."<Button|x=473.5|y=373.5|color=10051|size=18|nimg=zhangheng/13.png|text=确定提升|link=@tisheng,"..i..">"
		else
			msg=msg.."<Button|x="..anniu_t[i].x.."|y="..anniu_t[i].y.."|color=255|size=18|nimg="..anniu_t[i].tupath.."|link=@jinji,"..i..">"
		end	
	end
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|link=@jinji,"..xzid..">"
		msg=msg..[[
		<Img|ay=0.5|x=50.0|y=310.0|width=330|height=230|scale9l=10|scale9b=10|img=zh/7.png|scale9r=10|scale9t=10|esc=0>
<RText|x=62.0|y=234.0|width=344|color=255|size=16|text=⒈选择自己想要的属性进行升级，每次成>
<RText|x=78.0|y=256.0|width=344|color=255|size=16|text=功将提升1级 失败降低1级 最高为5级.>
<RText|x=78.0|y=278.0|width=344|size=16|color=255|text=官方为运气不好的玩家设置了保底。>
<RText|x=78.0|y=322.0|width=344|color=255|size=16|text=<倍属性/FCOLOR=251>>
<RText|x=63.0|y=351.0|width=344|color=255|size=16|text=⒉五行天生相克　<金克木　木克水　水克火/FCOLOR=250>>
<RText|x=78.5|y=373.5|width=344|color=255|size=16|text=<火克土　土克金/FCOLOR=250>　符合相克条件时对被克>
<RText|x=62.0|y=209.0|width=344|color=251|size=16|text=属性介绍>
<RText|x=78.0|y=300.0|width=344|color=255|size=16|text=全部点满后可自行选择其中一条获得<双/FCOLOR=251>>
<RText|x=78.5|y=395.5|width=344|color=255|size=16|text=制的敌人<额外产生8%伤害>>




		]]
	end
	say(actor,msg)
end
local sssxs = {[0]="攻　击",[1]="魔　法",[2]="道　术",}
function qiehuan(actor,xzid,xianshi)
	xzid = tonumber(xzid) or 0
	xianshi = tonumber(xianshi) or 0
	local msg = [[
		<Img|x=0|width=643|height=457|reset=1|loadDelay=1|bg=1|img=zhangheng/1.png|move=0|esc=1|show=4>
		<Button|x=639.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=16.5|y=40.5|img=zhangheng/87.png|esc=0>
		<Img|x=392.5|y=46.5|img=zhangheng/84.png|esc=0>
		<Text|ay=0.5|x=480.5|y=61.0|color=95|size=18|text=五行属性>
		
		<Text|ax=0|x=410.5|y=115.5|color=103|size=17|text=曲直之木：对怪增伤+5.0%>
		<Text|ax=0|x=410.5|y=140.5|color=103|size=17|text=润下之水：生命值+5.0%>
		<Text|ax=0|x=410.5|y=165.5|color=103|size=17|text=炎上之火：打怪爆率+5.0%>
		<Text|ax=0|x=410.5|y=190.5|color=103|size=17|text=稼穑之土：吸血值+2.5%>
		
		<Img|x=392.5|y=225.5|img=zhangheng/84.png|esc=0>
		<Text|ay=0.5|x=462.5|y=240.0|color=95|size=18|text=当前拥有五行>
		<Img|x=54.5|y=44.5|img=zhangheng/209.png|esc=0>

	]]

	
	msg=msg.."<Text|ax=0|x=410.5|y=90.5|color=103|size=17|text=从革之金：".. sssxs[getjob(actor)] .."+2.5%>"
	if getint(actor,"免费五行") == 0 then
		msg=msg.."<Text|ax=0.5|x=210.5|y=372.5|color=254|size=18|text=请选择一条五行之力，可获得双倍属性>"
		msg=msg.."<Button|x=473.5|y=365.5|nimg=zhangheng/13.png|color=10051|size=18|text=免费转换|link=@zhuanhuan,3,"..xzid..">"
	else
		msg=msg.."<Text|ax=0.5|x=210.5|y=372.5|color=254|size=18|text=转换一次需要1000元宝或1根金条>"
		msg=msg.."<Button|x=417.5|y=365.5|nimg=zhangheng/13.png|color=10051|size=18|text=金条转换|link=@zhuanhuan,1,"..xzid..">"
		msg=msg.."<Button|x=522.5|y=365.5|nimg=zhangheng/13.png|color=10051|size=18|text=元宝转换|link=@zhuanhuan,2,"..xzid..">"
	end
	msg=msg.."<Text|ax=0.5|x=220.5|y=402.5|color=254|size=18|text=可点击人物界面的金木水火土位置随时切换>"
	
	msg=msg.."<Img|x=18.5|y=398.5|img=zhangheng/8.png|esc=0|link=@qiehuan,"..xzid..",1>"
	local sm = {[0]="无","从革之金","曲直之木","润下之水","炎上之火","稼穑之土"}
	local t = {[0]="攻击","魔法","道术"}
	local dqsx = getint(actor,"五行当前属性")
	local job = getjob(actor)
	msg=msg.."<RText|ax=0.5|ay=0.5|x=516.5|y=285.0|color=95|size=18|text=<"..sm[dqsx].."/FCOLOR=251>>"
	if dqsx ~= 0 then
		local wenben = {
		t[job] .."提升：5%(+2.5%)",
		"对怪增伤提升：10%(+5%)",
		"生命值提升：10%(+5%)",
		"打怪爆率提升：10%(+5%)",
		"吸血值提升：5%(+2.5%)",}
		msg=msg.."<Text|ax=0.5|x=514.0|y=315.5|color=224|size=17|text="..wenben[dqsx]..">"
	end
	
	
	for i = 1,5 do
		if i == xzid then
			msg=msg.."<Button|x="..anniu_t[i].x.."|y="..anniu_t[i].y.."|color=255|size=18|nimg="..anniu_t[i].tupath.."|link=@qiehuan>"
			msg=msg.."<Img|x="..anniu_t[i].x-12 .."|y="..anniu_t[i].y-13 .."|img=zhangheng/93.png|esc=0>"
		else
			msg=msg.."<Button|x="..anniu_t[i].x.."|y="..anniu_t[i].y.."|color=255|size=18|nimg="..anniu_t[i].tupath.."|link=@qiehuan,"..i..">"
		end	
	end
	
	
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|link=@qiehuan,"..xzid..">"
		msg=msg..[[
		<Img|ay=0.5|x=50.5|y=320.5|width=330|height=210|scale9r=10|scale9l=10|esc=0|img=zh/7.png|scale9b=10|scale9t=10>
<RText|x=62.0|y=254.0|width=344|color=255|size=16|text=⒈选择自己想要的属性进行升级，每次成>
<RText|x=78.0|y=276.0|width=344|color=255|size=16|text=功将提升1级 失败降低1级 最高为5级.>
<RText|x=78.0|y=320.0|width=344|size=16|color=255|text=<倍属性/FCOLOR=251>>
<RText|x=63.0|y=351.0|width=344|size=16|color=255|text=⒉五行天生相克　<金克木　木克水　水克火/FCOLOR=250>>
<RText|x=78.5|y=373.5|width=344|color=255|size=16|text=<火克土　土克金/FCOLOR=250>　符合相克条件时对被克>
<RText|x=62.5|y=228.5|width=344|color=251|size=16|text=属性介绍>
<RText|x=78.0|y=298.0|width=344|size=16|color=255|text=全部点满后可自行选择其中一条获得<双/FCOLOR=251>>
<RText|x=78.5|y=395.5|width=344|color=255|size=16|text=制的敌人<额外产生8%伤害>>
		]]
	end
	
	say(actor,msg)
end

function tisheng(actor,id)
	id = tonumber(id)
	local lv = getint(actor,bl_t[id])
	if lv >= 5 then
		sendmsg9(actor,"当前属性已升满")
		return
	end
	local t = shengji_t[id]
	if getbindgold(actor) < t.feiyong[lv] then
		sendmsg9(actor,"金币不足")
		return
	end
	subbindgold(actor,t.feiyong[lv])
	setint(actor,"五行之力次数",getint(actor,"五行之力次数")+1)
	--local jilv = t.jilv[lv]
	local jilv = 45
	if getint(actor,"五行之力次数") >= 180 then
		jilv = 100
	end
	if math.random(1,100) <= jilv then
		setint(actor,bl_t[id],lv+1)
		setint(actor,"五行总等级",getint(actor,"五行总等级")+1)
		tianjiabuff(actor,t.buffid,getint(actor,bl_t[id]))
		sendmsg9(actor,"提升成功")
	else
		if lv > 0 then
			setint(actor,bl_t[id],lv-1)
			setint(actor,"五行总等级",getint(actor,"五行总等级")-1)
			tianjiabuff(actor,t.buffid,getint(actor,bl_t[id]))
		end
		sendmsg9(actor,"提升失败")
	end
	return jinji(actor,id)
end

function tianjiabuff(actor,buffid,cengci)
	delbuff(actor,buffid)
	if cengci > 0 then
		addbuff(actor,buffid,0,cengci)
	end
end


local bufft = {10026,10027,10028,10029,10030}
function zhuanhuan(actor,fangshi,id)
	id = tonumber(id)
	if id == 0 then
		sendmsg9(actor,"请选择想要转换的五行属性")
		return
	end
	if id == getint(actor,"五行当前属性") then
		sendmsg9(actor,"已是当前五行属性")
		return
	end
	if fangshi == "1" then --金条
		if itemcount(actor,"金条") < 1 then
			sendmsg9(actor,"金条不足")
			return
		end
		takeitem(actor, "金条", 1)
	elseif fangshi == "2" then --元宝
		if getingot(actor) < 1000 then
			sendmsg9(actor,"元宝不足")
			return
		end
		subingot(actor,1000,"五行之力")
	end
	setint(actor,"五行当前属性",id)
	for i = 1,#bufft do
		if hasbuff(actor,bufft[i]) then
			delbuff(actor,bufft[i])
		end
	end
	addbuff(actor,bufft[id])
	sendmsg9(actor,"转换成功")
	if getint(actor,"免费五行") == 0 then
		setint(actor,"免费五行",1)
	else
		if fangshi == "1" then
			post(actor,"五行金条切换")
		else
			post(actor,"五行元宝切换")
		end
	end
	zhuangbeianniu(actor)
	qiehuan(actor,id)
	
end

local zbxs = {"zhangheng/106.png","zhangheng/107.png","zhangheng/108.png","zhangheng/109.png","zhangheng/110.png"}
function zhuangbeianniu(actor)
	delbutton(actor,3001,13)
	if getint(actor,"五行当前属性") == 0 then
		return
	end
	local msg = ""
	if getispc(actor) then --端游
		msg = "<Button|x=190|y=30|nimg="..zbxs[getint(actor,"五行当前属性")].."|link=@openwuxin>"
	else
		msg = "<Button|x=250|y=70|nimg="..zbxs[getint(actor,"五行当前属性")].."|link=@openwuxin>"
	end
	addbutton(actor,3001,13,msg)
end