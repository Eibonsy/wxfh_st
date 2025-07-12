include("Market_Def/zh.lua") --个人封装函数

function show(actor)

	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=武器升级>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<Text|a=0|x=32|y=60|tipsx=10|tipsy=80|color=255|size=18|text=没有一个人来光顾，顾客，请进>
	<Text|a=0|x=32.0|y=90.0|tipsx=10|tipsy=80|color=255|size=18|text=我的自尊使我不允许对这个物品的价格再要求打折>
	<Text|a=0|x=32.0|y=135.0|tipsx=10|tipsy=80|color=251|size=18|text=开始武器升级|link=@startshengji>
	<Text|a=0|x=32.0|y=180.0|tipsx=10|tipsy=80|color=251|size=18|text=返回武器升级|link=@quhuiwuqi>
	]]
	
	say(actor,msg)
end

function startshengji(actor)
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=武器升级>
<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
<Text|a=0|x=32|y=60|tipsx=10|tipsy=80|color=255|size=18|text=你像是想要升级你的武器>
<Text|a=0|x=32.0|y=82.0|tipsx=10|tipsy=80|color=255|size=18|text=给我看你的武器,升级价格是10000金币>
<Text|a=0|x=32.0|y=104.0|tipsx=10|tipsy=80|color=255|size=18|text=修炼这个武器需要原料>
<Text|a=0|x=215.0|y=104.0|tipsx=10|tipsy=80|color=251|size=18|text=黑铁矿石*2>
<Text|a=0|x=311.0|y=104.0|tipsx=10|tipsy=80|color=255|size=18|text=,>
<Text|a=0|x=321.0|y=104.0|tipsx=10|tipsy=80|color=251|size=18|text=饰品>
<Text|a=0|x=361.0|y=104.0|tipsx=10|tipsy=80|color=255|size=18|text=,>
<Text|a=0|x=371.0|y=104.0|tipsx=10|tipsy=80|color=251|size=18|text=武器>
<Text|a=0|x=413.0|y=104.0|tipsx=10|tipsy=80|color=255|size=18|text=和>
<Text|a=0|x=435.0|y=104.0|tipsx=10|tipsy=80|color=251|size=18|text=金币>
<Text|a=0|x=32.0|y=126.0|tipsx=10|tipsy=80|color=255|size=18|text=你确定要修炼它吗？>
<Text|a=0|x=32.0|y=148.0|tipsx=10|tipsy=80|color=250|size=18|text=开始升级武器会收走背包所有首饰>
<Text|a=0|x=32.0|y=170.0|tipsx=10|tipsy=80|color=250|size=18|text=请务必将贵重物品放至仓库>
<Text|a=0|x=32.0|y=202.0|tipsx=10|tipsy=80|color=251|size=18|text=确认修炼|link=@shengji>

	]]
	
	say(actor,msg)
end

local wuqi_t = {
	["裁决之杖"]=2,["血饮"]=3,["龙纹剑"]=4,["怒斩"]=2,["龙牙"]=3,["逍遥扇"]=4,["屠龙"]=2,["嗜魂法杖"]=3,["霸者之刃"]=4,["骨玉权杖"]=3,
}
local shoushi_t = {
	["灯笼项链"]=1,["蛇眼戒指"]=1,["魔力手镯"]=1,["魔法手镯"]=1,["坚固手套"]=1,["竹笛"]=1,["蓝翡翠项链"]=1,["凝霜"]=1,["银手镯"]=1,
	["死神手套"]=1,["金手镯"]=1,["黑檀手镯"]=1,["魅力戒指"]=1,["珊瑚戒指"]=1,["降妖除魔戒指"]=1,
	["骷髅戒指"]=1,["放大镜"]=1,["道士手镯"]=1,["道德戒指"]=1,
	["生命项链"]=2,["思贝儿手镯"]=2,["红宝石戒指"]=2,["天珠项链"]=2,["心灵手镯"]=2,["铂金戒指"]=2,["幽灵项链"]=2,["幽灵手套"]=2,["龙之戒指"]=2,
	["绿色项链"]=3,["骑士手镯"]=3,["力量戒指"]=3,	["恶魔铃铛"]=3,["龙之手镯"]=3,["紫碧螺"]=3,["灵魂项链"]=3,["三眼手镯"]=3,["泰坦戒指"]=3,
	["圣战项链"]=4,["圣战手镯"]=4,["圣战戒指"]=4,["法神项链"]=4,["法神手镯"]=4,["法神戒指"]=4,["天尊头盔"]=4,["天尊项链"]=4,["天尊手镯"]=4,["天尊戒指"]=4,["天尊腰带"]=4,
}
function shengji(actor)
	local item = linkbodyitem(actor,1)
	if item == "0" then
		sendmsg9(actor,"请把要升级的武器佩戴在身上")
		return
	end
	if getitem_shabake(actor,item) == 1 then
		sendmsg9(actor,"此武器还没有试刀")
		return
	end
	
	if getint(actor,"沙巴克武器状态") == 1 then
		sendmsg9(actor,"你已经有正在升级的武器.请先选择返回武器升级")
		return
	end
	
	local iname = getitemname(actor,item)
	if not wuqi_t[iname] then
		sendmsg9(actor,"此武器无法在这里升级")
		return
	end
	
	local attid = 2
	if wuqi_t[iname] then
		attid = wuqi_t[iname]
	end
	local jipinzhi = getitemaddvalue(actor,item,1,attid) --极品属性值
	if jipinzhi >= 7 then
		sendmsg9(actor,"此武器已经升级了7点")
		return
	end
	if itemcount(actor,"黑铁矿石") < 2 then
		sendmsg9(actor,"黑铁矿石不足2个")
		return
	end
	if getbindgold(actor) < 10000 then
		sendmsg9(actor,"您的金币不足1万")
		return
	end
	
	local youshoushi = false
	local t = getbagitems(actor) --背包物品
	for i = 1,#t do
		local itemname = getitemname(actor,t[i])
		if shoushi_t[itemname] then
			delitem(actor,t[i])
			youshoushi = true
		end
	end
	
	if not youshoushi then
		sendmsg9(actor,"首饰不足")
		return
	end
	
	subbindgold(actor,10000)
	takeitem(actor,"黑铁矿石",2)
	setint(actor,"沙巴克武器极品属性id",attid)
	setint(actor,"沙巴克武器极品值",jipinzhi)
	setint(actor,"沙巴克武器幸运值",getitemaddvalue(actor,item,1,5))
	local jsonstr = getitemjson(item) --获取武器的json串
	--sendmsg6(actor,"武器json串"..jsonstr)
	setstr(actor,"沙巴克武器json",jsonstr)
	delitem(actor,item) --删除武器
	setint(actor,"沙巴克武器状态",1) --0 未练 1 练中
	setint(actor,"沙巴克炼武器时间",os.time()) --沙巴克炼武器时间
	return show_lianzhong(actor)
end

function show_lianzhong(actor)
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=武器升级>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<Text|a=0|x=32.0|y=81.0|tipsx=10|tipsy=80|color=255|size=18|text=我会把它弄得像新的一样，>
	<Text|a=0|x=32.0|y=133.0|tipsx=10|tipsy=80|color=255|size=18|text=你稍等就可以取回武器，请等待一分钟>
	<Text|x=32.0|y=193.0|color=251|size=18|text=我知道了|link=@exit>
	]]
	say(actor,msg)
end

function quhuiwuqi(actor)
	if getint(actor,"沙巴克武器状态") == 0 then
		sendmsg9(actor,"你没有武器可取回")
		return
	end
	if os.time() - getint(actor,"沙巴克炼武器时间") < 60 then
		sendmsg9(actor,"这个工作正忙着呢，请稍等片刻...")
		return
	end
	setint(actor,"沙巴克武器状态",0)
	local item = giveitembyjson(actor,getstr(actor,"沙巴克武器json"))
	setitemaddvalue(actor,item,1,getint(actor,"沙巴克武器极品属性id"),getint(actor,"沙巴克武器极品值"))
	setitemaddvalue(actor,item,1,5,getint(actor,"沙巴克武器幸运值"))
	setitem_shabake(actor,item,1) --设置沙巴克标识
	refreshitem(actor, item)
	return show_chenggong(actor)
end

function show_chenggong(actor)
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=武器升级>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<Text|a=0|x=32.0|y=77.0|tipsx=10|tipsy=80|color=255|size=18|text=就这样了,我尽我最大努力精炼了你的武器,>
	<RText|a=0|x=32.0|y=115.0|tipsx=10|tipsy=80|color=255|size=18|text=结果是否<成功/FCOLOR=250>只有在你使用过一次后才知道，出去试试吧。>
	<Text|x=32.0|y=193.0|color=251|size=18|text=退出|link=@exit>

	]]
	say(actor,msg)
end
