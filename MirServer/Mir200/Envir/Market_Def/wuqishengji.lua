include("Market_Def/zh.lua") --个人封装函数

function show(actor,xianshi)
	xianshi = tonumber(xianshi) or 0
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|size=18|color=251|text=武器升级>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<RText|ax=0|ay=0.5|x=22.0|y=81.5|size=18|color=255|text=矿洞守卫与铁匠铺老人聊天，他回忆起当年的忙碌岁月，也是>
	<RText|ay=0.5|x=22.0|y=106.5|color=255|size=18|text=满满的怀念老人眯着眼睛，望着天花板道：“老朽一生中升级>
	<RText|ay=0.5|x=22.0|y=131.5|color=255|size=18|text=武器无数，今日你我相遇，只需提供<"黑铁矿石*6+12万金币"/FCOLOR=250>>
	<RText|ay=0.5|x=22.0|y=156.5|color=255|size=18|text=就可以试试我的手艺，每把武器最高可升级<10点主属性/FCOLOR=253>...>
	<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
	]]
	
	if getsysint("合区次数") < 1 then
		msg=msg.."<Text|ax=0.5|ay=0.5|x=264.0|y=214.5|color=250|size=18|text=点击 → 升级武器|link=@shengji>"
	else
		msg=msg.."<Text|ay=0.5|x=122.0|y=214.5|color=250|size=18|text=清空属性|link=@qingkong>"
		msg=msg.."<Text|ay=0.5|x=333.0|y=214.5|color=250|size=18|text=点击升级|link=@shengji>"
	end
	if getint(actor,"升过10点") == 1 and getlevel(actor) >= 58 then
		msg=msg.."<Button|x=13.0|y=205.0|nimg=zhangheng/8.png|pimg=zhangheng/8.png|link=@show,1>"
	end
	
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@show>"
		msg=msg..[[
		<Img|ay=0.5|x=48.0|y=154.0|width=280|height=160|scale9r=10|scale9t=10|scale9b=10|img=zh/7.png|scale9l=10|esc=0>
		<RText|x=59.0|y=82.0|width=344|color=251|size=16|text=武器介绍：>
		<RText|x=59.0|y=107.0|width=344|size=16|color=255|text=⒈当武器升级到<10点/FCOLOR=250>后可随机触发>
		<RText|x=76.0|y=132.0|width=344|color=255|size=16|text=<1-6点淬炼值/FCOLOR=250>, 配合幸运项链的淬炼>
		<RText|x=76.0|y=157.0|width=344|color=255|size=16|text=值可激活增伤属性>
		<RText|x=60.0|y=182.0|width=344|size=16|color=255|text=⒉淬炼值达到<4点激活PK增伤+2%/FCOLOR=254>>
		<RText|x=75.0|y=207.0|width=344|size=16|color=255|text=<9点激活PK增伤+6%/FCOLOR=253>>
		]]
	end
	say(actor,msg)
end

local shengji_t =  {50,30,20,20,10,10,5,5,5,5}
local wuqi_t = {
	["炼狱"]=2,["魔杖"]=3,["银蛇"]=4,["月神"]=2,["骨玉权杖"]=3,["无极棍"]=4,["裁决之杖"]=2,["血饮"]=3,["龙纹剑"]=4,["怒斩"]=2,["龙牙"]=3,["逍遥扇"]=4,["屠龙"]=2,["嗜魂法杖"]=3,["霸者之刃"]=4,
	["黄金裁决"]=2,["紫金嗜魂法杖"]=3,["赤金逍遥扇"]=4,["上古鬼炎"]=2,["火凤之舞"]=3,["绿玉无极"]=4,["鬼斧屠戮"]=2,["聚灵法杖"]=3,["毒龙刺"]=4,["暗黑审判者"]=2,["天行权杖"]=3,["太极羽扇"]=4,
	["传说:无影剑"]=2,["传说:易水寒"]=3,["传说:太乙扇"]=4,["游龙ぬ锥心斩"]=2,["咆哮ぬ怒吼杖"]=3,["契约ぬ神罚剑"]=4,["阿修罗ぬ命运之殇"]=2,["帝释天ぬ流星之陨"]=3,["迦楼罗ぬ万剑归宗"]=4,
	["开天"]=2,["镇天"]=3,["玄天"]=4,["行走的游龙"]=2,["无名的咆哮"]=3,["恶魔的契约"]=4,
}
function shengji(actor)
	local item = linkbodyitem(actor,1)
	if item == "0" then
		sendmsg9(actor,"请把要升级的武器佩戴在身上")
		return
	end
	
	local attid = 2
	local iname = getitemname(actor,item)
	if wuqi_t[iname] then
		attid = wuqi_t[iname]
	end
	local jipinzhi = getitemaddvalue(actor,item,1,attid) --极品属性值
	if jipinzhi >= 10 then
		sendmsg9(actor,"此武器已经升级了10点")
		return
	end
	if itemcount(actor,"黑铁矿石") < 6 then
		sendmsg9(actor,"黑铁矿石不足6个")
		return
	end
	
	if jipinzhi >= 5 then
		if getgold(actor) < 120000 then
			sendmsg9(actor,"您的非绑定金币不足12万")
			return
		end
		subgold(actor,120000)
	else
		if getbindgold(actor) < 120000 then
			sendmsg9(actor,"您的金币不足12万")
			return
		end
		subbindgold(actor,120000)
	end
	
	takeitem(actor,"黑铁矿石",6)
	if math.random(1,100) <= shengji_t[jipinzhi+1] then
		setitemaddvalue(actor,item,1,attid,jipinzhi+1)
		if jipinzhi == 9 then
			local maxzhi = 3
			if math.random(1,100) <= 10 then
				maxzhi = 6
			end	
			changecustomitemtext(actor,item,"[神秘属性]：",5)
			changecustomitemtextcolor(actor,item,154,5) --颜色
			changecustomitemabil(actor,item,0,1,209,5) --参数4  1为绑定att属性 
			changecustomitemabil(actor,item,0,2,31,5) --参数4  2为绑定自定属性表 显示用
			changecustomitemabil(actor,item,0,3,0,5) --参数4  3为绑定的值是否为百分比 0不是 1是
			changecustomitemabil(actor,item,0,4,0,5) --参数4  4为绑定属性显示位置哪一行
			changecustomitemvalue(actor,item,0,"=",math.random(1,maxzhi),5) --设置绑定att属性的值
			
			setcuilianzhishuxing(actor)
			setint(actor,"升过10点",1)
		end
		refreshitem(actor,item)
		sendmsg6(actor,"恭喜你，升级成功了","#008B45")
	else
		sendmsg6(actor,"很遗憾，升级失败了")
		return
	end
end

function qingkong(actor)
	messagebox(actor,"\n清空属性将会把升级到属性和淬炼值清零\n\n是否继续清洗？","@qingkong1","@kong")
end

function qingkong1(actor)
	local item = linkbodyitem(actor,1)
	if item == "0" then
		sendmsg9(actor,"请把要升级的武器佩戴在身上")
		return
	end
	
	local attid = 2
	local iname = getitemname(actor,item)
	if wuqi_t[iname] then
		attid = wuqi_t[iname]
	end
	
	local jipinzhi = getitemaddvalue(actor,item,1,attid) --极品属性值
	if jipinzhi < 10 then
		sendmsg9(actor,"武器升级10次才能清洗")
		return
	end
	
	setitemaddvalue(actor,item,1,attid,0)
	clearitemcustomabil(actor,item,5) --清理自定义组别
	callscriptex(actor, "CallLua", "wuqishengji", "@setcuilianzhishuxing") --设置淬炼值属性
	refreshitem(actor,item)
	sendmsg9(actor,"武器主属性已清空","#FF0000")
end

function setcuilianzhishuxing(actor)
	local cuilianzhi = getbaseinfo(actor,51,209)
	--sendmsg6(actor,"淬炼值"..cuilianzhi)
	if hasbuff(actor,10053) then
		delbuff(actor,10053)
	end
	if cuilianzhi >= 9 then
		addbuff(actor,10053,0,1,actor,{[76]=600})
	elseif cuilianzhi >= 4 then
		addbuff(actor,10053,0,1,actor,{[76]=200})
	end
end
