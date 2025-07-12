include("Market_Def/zh.lua") --个人封装函数


function show(actor,weizhi,wyid,xianshi)
	if itemcount(actor,"技能神石") < 1 then
		sendmsg9(actor,"你没有技能神石....")
		return
	end
	--[[if getkaiquday() < 7 then
		sendmsg9(actor,"开区7天后再来找老夫吧....")
		return
	end--]]
	
	--haoshistart(actor)
	--sendmsg9(actor,tostring(weizhi)..tostring(wyid))
	weizhi = tonumber(weizhi) or 1 --人物还是背包 1是人物
	wyid = tonumber(wyid) or 0
	xianshi = tonumber(xianshi) or 0
	msg = [[
	<Img|x=0|width=643|height=457|show=4|bg=1|move=1|reset=0|img=zhangheng/1.png|esc=1>
	<Button|x=639.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	<Img|x=16.5|y=40.5|img=zhangheng/100.png|esc=0>
	<Img|x=386.5|y=39.5|img=zhangheng/161.png|esc=0>
	<Text|ay=0.5|x=469.5|y=59.0|outline=1|color=94|size=18|text=装备展示>
	<Img|x=388.5|y=117.5|width=230|height=310|scale9l=3|scale9b=3|img=zh/36.png|scale9r=3|esc=0|scale9t=3>
	<ListView|id=1999|children={2000}|x=389.5|y=122.5|width=230|height=300|direction=1|margin=0>
	<Img|x=159.5|y=70.5|width=88|height=88|esc=0|img=zhangheng/101.png>

	]]
	msg=msg.."<Text|ay=0.5|x=47.5|y=310|color=116|size=18|text=技能神石：>"
	msg=msg.."<ItemShow|ay=0.5|x=116.5|y=310|width=70|height=70|itemid=".. getidbyname("技能神石") .."|itemcount=1|showtips=1|scale=0.75|bgtype=0>"
	msg=msg.."<RText|ay=0.5|x=172.5|y=310|color=255|size=18|text=<".. itemcount(actor,"技能神石") .."/FCOLOR=249>/<2/FCOLOR=250>>"
	msg=msg.."<Text|ay=0.5|x=232.5|y=310|size=18|color=251|text=金条：>"
	msg=msg.."<ItemShow|ay=0.5|x=265.5|y=310|width=70|height=70|itemid=".. getidbyname("金条") .."|itemcount=1|showtips=1|scale=0.75|bgtype=0>"
	msg=msg.."<RText|ay=0.5|x=320.5|y=310|color=255|size=18|text=<".. itemcount(actor,"金条") .."/FCOLOR=249>/<2/FCOLOR=250>>"
	
	msg = msg ..'<Button|x=18.5|y=396.5|nimg=zhangheng/8.png|pimg=zhangheng/8.png|mimg=zhangheng/8.png|link=@show,'..weizhi..','..wyid..',1>'
	local ketansuo = {0,4,3,5,6,7,8,10,11,} --可探索的装备位置	
	local tansuo_t = {[10]=1,[11]=1,[15]=1,[19]=1,[20]=1,[21]=1,[24]=1,[26]=1,[22]=1,[23]=1,[54]=1,[64]=1,[52]=1,[62]=1,}
	local t = {}
	if weizhi == 1 then
		msg=msg.."<Button|x=398.5|y=79.5|width=100|size=16|color=103|nimg=zhangheng/163.png|text=人物>"
		msg=msg.."<Button|x=510.5|y=79.5|width=100|size=16|color=7|nimg=zhangheng/162.png|pimg=zhangheng/162.png|text=背包|link=@show,2>"
		for i =1,#ketansuo do
			local item = linkbodyitem(actor,ketansuo[i]) --关联装备
			if item ~= "0" then
				table.insert(t,item)
			end
		end
	else
		msg=msg.."<Button|x=398.5|y=79.5|width=100|size=16|color=7|nimg=zhangheng/162.png|pimg=zhangheng/162.png|text=人物|link=@show,1>"
		msg=msg.."<Button|x=510.5|y=79.5|width=100|size=16|color=103|nimg=zhangheng/163.png|text=背包>"
		local list = getbaglist(actor) --获取背包道具列表
		for i = 1,#list do
			--local name = getitemname(actor,list[i])
			local itemid = getiteminfo(actor,list[i],2) --获取物品id
			local std = getstditeminfo(itemid,2)
			if tansuo_t[std] then
				table.insert(t,list[i])
			end
		end
	end
	
	local ziids = ""
	for i = 2002,2002+#t+30 do
		ziids = ziids .. i .. ","
	end
	
	local ziid = 2002
	local ysxx = -2
	local ysyy = -6
	local gaodu = (math.floor((#t-1)/3) + 1) * 60 + 3
	msg = msg ..'<Layout|id=2000|children={2001}|height='.. gaodu ..'>' --设置底框宽 高
	msg = msg ..'<Layout|id=2001|children={'.. ziids ..'}|height='.. gaodu ..'>' --设置底框宽 高
	for i = 1,15 do
		msg = msg ..'<Img|id='..ziid..'|x='.. ysxx+19 + (i-1)%3*70 ..'|y='.. ysyy+9+math.floor((i-1)/3) * 60 ..'|width=52|height=52|scale9t=3|scale9b=3|img=zh/36.png|scale9r=3|scale9l=3>'
		ziid = ziid + 1		
	end
	
	for i = 1,#t do
		msg = msg ..'<Img|id='..ziid..'|children={wuping'..i..',liangkuang'..i..'}||x='.. ysxx+19 + (i-1)%3*70 ..'|y='.. ysyy+9+math.floor((i-1)/3) * 60 ..'|width=52|height=52|scale9t=3|scale9b=3|img=zh/36.png|scale9r=3|scale9l=3>'
		ziid = ziid + 1
		local makeid = getiteminfo(actor,t[i],1)
		msg = msg ..'<DBItemShow|id=wuping'..i..'|x=-8|y=-8|makeindex='..makeid..'|link=@show,'.. weizhi ..','.. makeid ..'>'
		if makeid == wyid then
			msg = msg ..'<Img|id=liangkuang'..i..'|x=-1|y=-1|img=zh/71.png|esc=0>'
			msg = msg ..'<DBItemShow|x=168.5|y=80.5|width=70|height=70|makeindex='..makeid..'|itemcount=1|showtips=1|bgtype=0>'
			local shuoming = {
				[54]="对战增伤",[210]="受战减伤",[56]="对法增伤",[211]="受法减伤",[58]="对道增伤",[212]="受道减伤",
				[1001]="烈火剑法技能点",[1002]="开天斩技能点",[1003]="逐日剑法技能点",[1004]="流星火雨技能点",
				[1005]="火墙技能点",[1006]="魔法盾技能点",[1007]="噬血术技能点",[1008]="无极真气技能点",[1009]="召唤神兽技能点",
			}
			local jsonstr = getitemcustomabil(actor,t[i])
			if jsonstr ~= "" then
				--sendmsg6(actor,jsonstr)
				local tbl = json2tbl(jsonstr) --转成表
				if tbl.abil[1].v[1] then
					local attid = tbl.abil[1].v[1][2]
					local attzhi = tbl.abil[1].v[1][3]
					msg=msg..'<Text|ax=0.5|x=204.5|y=207.5|size=18|color=250|text='.. shuoming[attid] ..'+'.. attzhi/100 ..'%>'				
					attid = tbl.abil[1].v[2][2]
					attzhi = tbl.abil[1].v[2][3]
					msg=msg..'<Text|ax=0.5|x=202.5|y=233.5|size=18|color=250|text='.. shuoming[attid] ..'+'.. attzhi ..'>' 
				end
			end
		end
	end
	msg = msg ..'<Button|x=157.5|y=379.5|color=10051|nimg=zhangheng/13.png|size=18|clickInterval=500|text=确定淬炼|link=@tansuo,'..weizhi..','..wyid..'>'
	if xianshi == 1 then
		msg=msg..'<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@show,'..weizhi..','..wyid..'>'
		msg=msg..[[
		<Img|ay=0.5|x=50.5|y=337.5|width=314|height=180|scale9r=10|scale9l=10|esc=0|img=zh/7.png|scale9b=10|scale9t=10>
		<RText|x=64.5|y=282.5|size=16|color=255|text=⒈通过对装备淬炼,可随机获得<技能点/FCOLOR=250>>
		<RText|x=80.5|y=304.5|size=16|color=255|text=以及<神秘属性/FCOLOR=70>,如果对淬炼的技能点>
		<RText|x=80.5|y=326.5|size=16|color=255|text=数不满意,可重新淬炼>
		<RText|x=64.5|y=352.5|size=16|color=255|text=⒉每件装备的技能点数<最高可加3点/FCOLOR=250>,当>
		<RText|x=80.5|y=374.5|size=16|color=255|text=相同的技能点数达到<9/FCOLOR=250>时,可激活<四级/FCOLOR=253>>
		<RText|x=80.5|y=396.5|size=16|color=255|text=<技能/FCOLOR=253>,前提是<激活的技能需达到3级/FCOLOR=254>>
		<RText|x=63.5|y=257.5|size=16|color=251|text=淬炼介绍：>

		]]
	end
	--haoshiend(actor)
	say(actor,msg)
end
local duiyingbiao = {
	[54]=1013,[210]=1010,[56]=1014,[211]=1011,[58]=1015,[212]=1012,
	[1001]=1001,[1002]=1002,[1003]=1003,[1004]=1004,
	[1005]=1005,[1006]=1006,[1007]=1007,[1008]=1008,[1009]=1009,
}
local shanghai1 = {54,56,58} --增伤 30%
local shanghai2 = {210,211,212} --减伤 70%
local jinengt = {1001,1002,1003,1004,1005,1006,1007,1008,1009}
function tansuo(actor,weizhi,wyid)
	weizhi = tonumber(weizhi)
	wyid = tonumber(wyid)
	if wyid == 0 then
		sendmsg9(actor,"请选择要淬炼的装备")
		return
	end
	local item = getitembymakeindex(actor,wyid) --物品对象
	if item == "0" then
		sendmsg9(actor,"你没有这件装备")
		return show(actor,weizhi,wyid)
	end
	--sendmsg6(actor,"物品对象"..tostring(item))
	if weizhi == 1 and not isinrole(actor,wyid) then
		sendmsg9(actor,"物品已经不在身上")
		return show(actor,weizhi,wyid)
	end
	if weizhi == 2 and not isinbag(actor,item) then
		sendmsg9(actor,"物品已经不在背包")
		return show(actor,weizhi,wyid)
	end
	
	if itemcount(actor,"技能神石") < 2 then
		sendmsg9(actor,"技能神石不足")
		return
	end
	if itemcount(actor,"金条") < 2 then
		sendmsg9(actor,"金条不足")
		return
	end
	takeitem(actor, "技能神石", 2,0)
	takeitem(actor, "金条", 2,0)
	
	local att_t = shanghai2
	if math.random(1,100) <= 30 then
		att_t = shanghai1
	end
	local att = att_t[math.random(1,#att_t)] --给的属性
	local zhi = 100
	local sjz = math.random(1,100)
	if sjz <= 1 then
		zhi = 400
	elseif sjz <= 6 then
		zhi = 300
	elseif sjz <= 36 then
		zhi = 200
	end
	changecustomitemtext(actor,item,"[淬炼属性]：",0)
	changecustomitemtextcolor(actor,item,31,0) --颜色
	
	changecustomitemabil(actor,item,0,1,att,0) --参数4  1为绑定att属性 
	changecustomitemabil(actor,item,0,2,duiyingbiao[att],0) --参数4  2为绑定自定属性表 显示用
	changecustomitemabil(actor,item,0,3,1,0) --参数4  3为绑定的值是否为百分比 0不是 1是
	changecustomitemabil(actor,item,0,4,0,0) --参数4  4为绑定属性显示位置哪一行
	changecustomitemvalue(actor,item,0,"=",zhi,0) --设置绑定att属性的值
	
	local att1 = jinengt[math.random(1,#jinengt)] --给的属性
	local zhi1 = 1
	local sjz1 = math.random(1,100)
	if sjz1 <= 5 then
		zhi1 = 3
	elseif sjz1 <= 25 then
		zhi1 = 2
	end
	changecustomitemabil(actor,item,1,1,att1,0) --参数4  1为绑定att属性 
	changecustomitemabil(actor,item,1,2,duiyingbiao[att1],0) --参数4  2为绑定自定属性表 显示用
	changecustomitemabil(actor,item,1,3,0,0) --参数4  3为绑定的值是否为百分比 0不是 1是
	changecustomitemabil(actor,item,1,4,1,0) --参数4  4为绑定属性显示位置哪一行
	changecustomitemvalue(actor,item,1,"=",zhi1,0) --设置绑定att属性的值
	
	refreshitem(actor, item)
	setjineng(actor)
	sendmsg9(actor,"恭喜你，当前装备淬炼成功")
	return show(actor,weizhi,wyid)
end
local zbw = {0,4,3,5,6,7,8,10,11,}
local skillt = {
		[1001]="烈火剑法",[1002]="开天斩",[1003]="逐日剑法",[1004]="流星火雨",
		[1005]="火墙",[1006]="魔法盾",[1007]="噬血术",[1008]="无极真气",[1009]="召唤神兽",
	}
	
local duiyingtexiao = {
		[1001]=2604,[1002]=0,[1003]=5604,[1004]=5804,[1005]=2204,[1006]=3104,[1007]=5704,[1008]=661,[1009]=3004,
	}
function setjineng(actor)
	--haoshistart(actor)
	local t = {
	[1001]=0,[1002]=0,[1003]=0,[1004]=0,[1005]=0,[1006]=0,[1007]=0,[1008]=0,[1009]=0,
	}
	for i = 1,#zbw do
		local item = linkbodyitem(actor,zbw[i]) --关联装备
		if item ~= "0" then
			local jsonstr = getitemcustomabil(actor,item)
			if jsonstr ~= "" then
				--sendmsg6(actor,jsonstr)
				local tbl = json2tbl(jsonstr) --转成表
				if tbl.abil[1].v[2] then
					local attid = tbl.abil[1].v[2][2]
					local attzhi = tbl.abil[1].v[2][3]
					t[attid] = t[attid] + attzhi
				end
			end 
		end
	end
	--sendmsg6(actor,""..tbl2json(t))
	for k,v in pairs(t) do
		local dengji = getskillinfo(actor,getskillidbyname(skillt[k]),1)
		if dengji ~= nil then --有技能
			if v >= 9 and dengji == 3 then --大于9并且是3级
				setskillinfo(actor,getskillidbyname(skillt[k]),1,4)
				if skillt[k] == "火墙" then
					callscriptex(actor, "SETMAGICSKILLEFFT", skillt[k], duiyingtexiao[k],11003)
				elseif skillt[k] == "魔法盾" then
					callscriptex(actor, "SETMAGICSKILLEFFT", skillt[k], duiyingtexiao[k],12)	
				else
					callscriptex(actor, "SETMAGICSKILLEFFT", skillt[k], duiyingtexiao[k])
				end
				--sendmsg6(actor,"修改".. skillt[k] .."特效")
			end
			if v < 9 and dengji == 4 then --小于9并且是4级
				setskillinfo(actor,getskillidbyname(skillt[k]),1,3)
				callscriptex(actor, "SETMAGICSKILLEFFT", skillt[k], 0)
				--sendmsg6(actor,"还原".. skillt[k] .."特效")
			end
		end
		--sendmsg6(actor,  skillt[k].."等级"..tostring(dengji))
	end
	--haoshiend(actor)
end

function jinengtexiao_sz(actor)
	for k,v in pairs(skillt) do
		local dengji = getskillinfo(actor,getskillidbyname(v),1)
		if dengji == 4 then --有技能
			if skillt[k] == "火墙" then
				callscriptex(actor, "SETMAGICSKILLEFFT", v, duiyingtexiao[k],11003)
			elseif skillt[k] == "魔法盾" then
				callscriptex(actor, "SETMAGICSKILLEFFT", v, duiyingtexiao[k],12)
			else
				callscriptex(actor, "SETMAGICSKILLEFFT", v, duiyingtexiao[k])
			end
			--sendmsg6(actor,"修改".. v .."特效")
		end
		--sendmsg6(actor,  skillt[k].."等级"..tostring(dengji))
	end
end