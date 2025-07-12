include("Robot_def/zidongjiaoben.lua") --机器人脚本
include("Market_Def/zh.lua") --个人封装函数
include("Market_Def/denglujiemian.lua") --登录后界面添加
include("Market_Def/UseItem.lua") --使用道具31类双击触发
include("Market_Def/GmBox.lua") --GM工具箱
include("Market_Def/youshangtubiao.lua") --右上图标
include("Market_Def/buffjiemian.lua") --buff界面
include("Market_Def/dingshiqi.lua") --定时器
include("Market_Def/shouhunshanghai.lua") --兽魂伤害处理
include("Market_Def/wumuyishuxiaoguochuli.lua") --武穆遗书效果处理
include("Market_Def/huishou.lua") --回收
include("Market_Def/renwuxitong.lua") --任务系统
----------------------------------------------------------------
function startup()
	release_print("系统启动")
	-----设置合区次数
	local hequcishu = getsysint("合区次数") --合区次数
	local lasthequtianshu = getsysint("最后合区天数") --最后合区天数
	local gfhequcishu = getsysint("官方合区次数") --系统存的官方合区次数
	local guanfanghequcishu = globalinfo(3) --获取的官方的合区次数
	local kaiqutianshu = getkaiquday() --开区天数
	
	if gfhequcishu ~= guanfanghequcishu then --存的次数和获取的官方合区次数不相等 表示今天合区了
		setsysint("官方合区次数",guanfanghequcishu)
		if lasthequtianshu ~= kaiqutianshu then --今天没设置过合区
			setsysint("最后合区天数",kaiqutianshu)
			setsysint("合区次数",hequcishu+1)
			
			local tongjibiaoti = {
			"开狂暴消耗的元宝","骰王消耗的元宝","买药消耗的元宝","买绳子消耗的元宝","买锤子消耗的元宝","砸蛋的次数","洗武穆遗书消耗的元宝","洗武穆遗书的次数","幸运项链消耗的元宝",
			"购买锄头消耗的元宝","购买武穆遗书的个数","购买金矿花费的元宝","购买紫水晶矿花费的元宝","须弥禅师消耗的元宝","免费福利金币兑换的元宝",
			"购买投资新秀的个数","购买投资大使的个数","购买投资达人的个数","购买投资专家的个数","领取首冲的个数","融合的次数",
			"砸蛋半兽统领","砸蛋祖玛教主","砸蛋虹魔教主","砸蛋牛魔王","砸蛋赤月恶魔","砸蛋魔龙教主","赏金猎人抽取的次数",
			"抽取震天箭","抽取日照香炉","抽取闪电五连鞭","抽取东皇钟","抽取昆仑镜","抽取玄武盾","抽取番天印","抽取玉净瓶",
			"抽取镇魂钟","抽取妖魄之瞳","抽取炼妖壶","抽取混元凤凰珠","抽取雷公锤","抽取琉璃佩","抽取崆峒印","抽取断玉钩",
			"购买泉水的元宝","真实充值元宝","后台充值元宝","购买周卡消耗元宝","客服部门","材料部门","场控部门","气氛部门","项目部门"
			}
			for i = 1,#tongjibiaoti do
				setsysint(tongjibiaoti[i],0)
			end
			
			local diaoluoxilie = {
			"强化系列","屠龙雷霆衣服系列","S1首饰系列","S1特殊系列","S1衣服系列","S1武器系列","S2系列","S2特殊系列","S2衣服系列","S2武器系列","S3系列","S3特殊系列","S3衣服系列","S3武器系列","S4系列","S4特殊系列","S4衣服系列","S5系列","S5衣服系列",
			"S6系列","S6衣服系列","S7系列","S7衣服系列","12万经验卷","50万经验卷","兽魂蛋","书页","金矿石","神兽之血","虎骨","庄主令牌","聚合之心","技能神石","神秘水晶","魔龙之血","主宰凭证","紫水晶矿",
			}
			for i = 1,#diaoluoxilie do
				setsysint("掉落数量"..diaoluoxilie[i],0)
			end
			for i = 1,6 do
				setsysstr("骰王"..i,"")
			end		
		end
	end
	-----
	--七星塔顶层刷怪
	setsysint("七星塔死亡时间",0)
	setsysint("七星塔BOSS死亡时间",0)
	setsysint("泉眼死亡时间",0)
	qixingtashuaiguai() --刷怪
	--qixingtashuaiboss() --刷大boss
	setsysstr("泉水数据","")
	quanshuishuaiguai()--泉水刷怪
	setsysint("泉眼刷新时间",os.time())
	setontimerex(1, 1, 0) --全局定时器
	
	genmon("hlsd",50,50,"秒人蝙蝠",50,2,253)
	
	setenvirontimer("hlsd",1,1,"@huolongshuaguai") --地图定时器
end

function huolongshuaguai()
	if #getobjectinmap("hlsd",37,53,6,1) > 0 and #getmapmon("hlsd","爆裂蜘蛛",50,50,50) < 150 then
		genmon("hlsd",37,54,"爆裂蜘蛛",0,2,255)
	end
	--sendmsg0(0,"计时器")
end

function ontimerex1() --全局定时器
	if os.time() - getsysint("七星塔死亡时间") == 3600*3 then
		qixingtashuaiguai()
	end

	if (os.time() - getsysint("泉眼刷新时间")) % (60*30) == 0 then
		quanshuishuaiguai()
	end
	
	quanshuijiance() --泉水1小时消失检测
end

function quanshuijiance()
	local data = getquanshuidata()
	for i = 1,#data do
		local mon = data[i] --泉水
		local chushengtime = tonumber(getcurrent(mon,"9")) --泉水消失时间
		if not chushengtime or os.time() - chushengtime >= 60*60 then
			killmonbyobj(globalinfo(0),mon,false,false,false) --杀怪
			table.remove(data,i)
			setsysstr("泉水数据",tbl2json(data))
			release_print("移除泉水",mon)
			break
		end
	end
end

function removequanshuidata(mon)
	local data = getquanshuidata()
	for i = 1,#data do
		local guai = data[i] --泉水
		if guai == mon then
			table.remove(data,i)
			setsysstr("泉水数据",tbl2json(data))
			release_print("移除泉水",mon)
			break
		end
	end
end

local quanshuiditu = {"mhyj1","mhyj2","mhyj3","lzsy1","lzsy2","lzsy3","txmk1","txmk2","txmk3","dlsy1",
					"dlsy2","dlsy3","dlsy4","thg1","thg2","thg3","thg4","ymgm1","ymgm2","ymgm3",
					"rydy1","rydy2","rydy3","rydy4"}
function quanshuishuaiguai()
	math.randomseed(tostring(os.time()):reverse():sub(1, 7)) --随机数种子
	local mapid = quanshuiditu[math.random(1,#quanshuiditu)]
	local guai_t = genmon(mapid,500,500,"泉眼",500,1,253)
	local mon = guai_t[1]
	if mon then
		setcurrent(mon,"9",tostring(os.time())) --设置出生时间，1个小时没人采就消失
		setcurrent(mon,"8",tostring(20)) --可采集次数
		release_print("刷新泉水",mon,mapid,getx(mon),gety(mon))
		local qs_t = getquanshuidata() --泉水数据
		table.insert(qs_t,mon)
		setsysstr("泉水数据",tbl2json(qs_t))
	end
end

function getquanshuidata()
	local t = {}
	local quanshuistr = getsysstr("泉水数据")
	if quanshuistr ~= "" then
		t = json2tbl(quanshuistr)
	end
	return t
end

local qxt_guai = {"盘丝大仙", "镜像之主", "通天教主", "玛法判官", "不朽大帝", "上古谛听", "烟花教主", "邪魔统帅"}
function qixingtashuaiguai()
	math.randomseed(tostring(os.time()):reverse():sub(1, 7)) --随机数种子
	local name = qxt_guai[math.random(1,#qxt_guai)]
	--release_print(name)
	genmon("qxt5",17,21,name,20,1,249)
end


local skilltab = {
	[0]={"基本剑术","攻杀剑术","刺杀剑术","野蛮冲撞","半月弯刀","烈火剑法"},
	{"诱惑之光","雷电术","火墙","疾光电影","地狱雷光","魔法盾","冰咆哮","抗拒火环","流星火雨"},
	{"治愈术","精神力战法","施毒术","灵魂火符","幽灵盾","神圣战甲术","隐身术","集体隐身术","群体治疗术","召唤神兽","困魔咒","心灵召唤","心灵启示"},
}


local function login(actor) --登录触发
	if hasbuff(actor,20117) then
		delbuff(actor,20117)
	end
	if getint(actor,"白嫖号") == 1 then
		setattackmode(actor,-1)
		setint(actor,"白嫖号",0)
	end	
	
	local zslv = getbaseinfo(actor,39) --转生等级
	if zslv >= 7 then
		setbaseinfo(actor,40,70)
	elseif zslv >= 6 then
		setbaseinfo(actor,40,75)
	elseif zslv >= 5 then
		setbaseinfo(actor,40,80)
	elseif zslv >= 4 then
		setbaseinfo(actor,40,85)
	elseif zslv >= 3 then
		setbaseinfo(actor,40,90)	
	end

	setint(actor,"gm权限",0)
	if getint(actor,"累计充值") >= 10 then
		gmexecute(actor,"ReleaseShutup",getname(actor))
	end
	--固定公告
	-- sendmsg(actor,1,'{"Msg":"180特色三职业.交易自由.金币靠打.轻松耐玩.官网www.st099.com歪歪频道80890找队友.游戏不懂的问题均可咨询","FColor":255,"BColor":252,"Type":8,"Time":999999}')
	-- sendmsg(actor,1,'{"Msg":"新手交易请查看攻略里面的防骗说明","FColor":116,"BColor":0,"Type":8,"Time":180}')
	-- sendmsg(actor,1,'{"Msg":"除了自己老婆.切勿将账号装备借给任何人","FColor":116,"BColor":0,"Type":8,"Time":180}')
	
	renwupanduan(actor) --任务系统判断接取任务
	setint(actor,"杀大怪数量",0)
	
	local beigong = 1+getbaseinfo(actor,51,67)/10000
	sendmsg6(actor,"[提示]：当前攻击力倍数"..beigong,"#035403")
	
	--------新人登录段
	if getbaseinfo(actor,47) then --新人登录
		setint(actor,"红量恢复百分比",90)
		setint(actor,"蓝量恢复百分比",80)
		setint(actor,"红量自动恢复",1)
		setint(actor,"蓝量自动恢复",1)
		setint(actor,"存储红量",500000)
		setint(actor,"存储蓝量",500000)
		
		setint(actor,"角色创建时间",os.time())
		giveonitem(actor,1,"木剑",1,370)
		if getsex(actor) == 0 then
			giveonitem(actor,0,"布衣(男)",1,370)
		else
			giveonitem(actor,0,"布衣(女)",1,370)
		end
		
		giveitem(actor,"药品设置卡",10,370)
		giveitem(actor,"经验宝典",1,370)
        --初次登陆添加技能

		local job = getbaseinfo(actor, 7) --获取职业 0战 1法 2道
        for _, skill_name in ipairs(skilltab[job]) do
            addskill(actor, getskillidbyname(skill_name), 3)
        end
		changestorage(actor, 24) --仓库格子  
        setbagcount(actor, 50) --背包格子
		setint(actor,"已开启背包格子数",50)
		--setsndaitembox(actor,1) --开启首饰盒
		-- sendmsg0(actor,"系统：★欢迎新玩家〖".. getname(actor) .."〗加入顺天传奇，从此纵横玛法，指日可待.....")	
		mapmove(actor,"xinshou",25,32,4) --飞到出生点
		--changeattackmode(actor,4) --修改为编组模式
		callscriptex(actor, "CLIENTSWITCH", 0, 1)
		callscriptex(actor, "CLIENTSWITCH", 2, 1)
	end
	-------新人登陆段结束
	
	if getsysint("开区时间") == 0 then	-----设置开区时间
		setsysint("开区时间",os.time())
	end
	addbuttons(actor) --添加按钮 在文件denglujiemian里
	tubiaoxianshi(actor) --右上功能图标
	buff_show(actor) --buff按钮 buffjiemian文件里
	
	if hasbuff(actor,20041) then --灰名buff 上线删除
		delbuff(actor,20041)
	end
	
	setontimer(actor, 1, 1, 0,1) --定时器id ,时间秒 ，次数，跨服是否继续 --这个主要控制兽魂buff
	setontimer(actor, 10, 60, 0,1) --1分钟定时器 检查武器祝福值
	setontimer(actor, 11, 30, 0,1) --30秒定时器 存储红蓝量检测
	if getlevel(actor) < 30 then
		setontimer(actor, 55, 1, 0,1) --定时器55 新人加经验定时器
	end
	chulizhufuzhi(actor) --处理祝福值 --在文件dingshiqi里面
	callscriptex(actor, "CallLua", "zhuangbeitansuo", "@jinengtexiao_sz") --设置技能特效
	callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --挖矿任务显示
	delbutton(actor,106,122) --删除手机死亡后出去断线
	
	delaygoto(actor,300,"hezichenghao") --盒子称号
	
	qixingta_buffchuli(actor) --七星塔buff检测
	touwangchuli(actor) --骰王buff检测
	wulinzhizunchuli(actor) --武林至尊检测
end
GlobalPreprocess.login = login

function hezichenghao(actor) --盒子称号
	if getlevel(actor) >= 38 or hasbuff(actor,10001) or hasbuff(actor,20083) then
		seticon(actor, 10, -1)
	end
end

--------升级触发段
local equ_tab1 = {
	[0] = {{"修罗",1},{"重盔甲(男)",0},{"蓝翡翠项链",3},{"魔力手镯",5},{"魔力手镯",6},{"骷髅戒指",7},{"骷髅戒指",8},{"武穆遗书",15}},
	[1] = {{"偃月",1},{"魔法长袍(男)",0},{"放大镜",3},{"魔法手镯",5},{"魔法手镯",6},{"蛇眼戒指",7},{"蛇眼戒指",8},{"武穆遗书",15}},
	[2] = {{"降魔",1},{"灵魂战衣(男)",0},{"竹笛",3},{"道士手镯",5},{"道士手镯",6},{"道德戒指",7},{"道德戒指",8},{"武穆遗书",15}}
	}

local equ_tab2 = {
	[0] = {{"修罗",1},{"重盔甲(女)",0},{"蓝翡翠项链",3},{"魔力手镯",5},{"魔力手镯",6},{"骷髅戒指",7},{"骷髅戒指",8},{"武穆遗书",15}},
	[1] = {{"偃月",1},{"魔法长袍(女)",0},{"放大镜",3},{"魔法手镯",5},{"魔法手镯",6},{"蛇眼戒指",7},{"蛇眼戒指",8},{"武穆遗书",15}},
	[2] = {{"降魔",1},{"灵魂战衣(女)",0},{"竹笛",3},{"道士手镯",5},{"道士手镯",6},{"道德戒指",7},{"道德戒指",8},{"武穆遗书",15}},
	}
	
local dengjijingyan = {[65]=60000000,[66]=80000000,[67]=100000000,[68]=120000000,[69]=150000000,[70]=200000000,[71]=250000000,[72]=300000000,[73]=400000000,[74]=500000000,
}
function playlevelup(actor)
	if getlevel(actor) >= 48 then
		setint(actor,"重大奖励红点",1)
	end
	if getlevel(actor) == 35 or getlevel(actor) == 40 then
		setint(actor,"客服红点显示",1)
	end
	setint(actor,"投资红点",0)
	hezichenghao(actor) --盒子称号
	local job = getbaseinfo(actor, 7) --获取职业 0战 1法 2道
	if not getskillinfo(actor,getskillidbyname(skilltab[job][1])) then
		for _, skill_name in ipairs(skilltab[job]) do
			addskill(actor, getskillidbyname(skill_name), 3)
		end
	end
	if getint(actor,"已开启背包格子数") < 50 then
		changestorage(actor, 24) --仓库格子  
		setbagcount(actor, 50) --背包格子
		setint(actor,"已开启背包格子数",50)
	end
	tubiaoxianshi(actor) --刷新顶部按钮红点
	if getint(actor,"完成任务id") == 0  then --当前任务id==1的时候
		shuaxinrenwu(actor)
	end
	if getlevel(actor) == 26 then
		local sex = getbaseinfo(actor, 8) --获取性别
		local job = getbaseinfo(actor, 7) --获取职业
		local t = {}
		if sex == 0 then
			t = equ_tab1
		else
			t = equ_tab2
		end
		local tab = t[job]
		for i=1,#tab do
			local guize = 370
			if tab[i][1] == "武穆遗书" then
				guize = 371
			end
			local item = giveitem(actor,tab[i][1],1,guize)
			takeonitem(actor,tab[i][2],getiteminfo(actor,item,1))
		end
		takeitem(actor,"木剑",1)
		takeitem(actor,"布衣(男)",1)
		takeitem(actor,"布衣(女)",1)
		giveitem(actor,"随机传送石",2,370)
		giveitem(actor,"盟重传送石",1,370)
		giveitem(actor,"强效太阳水包",6,370)
		callscriptex(actor, "CallLua", "wumuyishu", "@addwmysjy,0") --设置武穆遗书
		--giveitem(actor,"强效金创药",99,370)
		--giveitem(actor,"强效魔法药",99,370)
	end
	if getlevel(actor) == 30 then
		setofftimer(actor,55) --移除定时器新人泡点
		mapmove(actor,"3",333,333,5)
		local str = [[
			<Img|width=569|height=250|loadDelay=1|bg=1|scale9r=10|scale9t=10|show=4|scale9b=10|reset=1|move=0|img=public/bg_npc_01.png|esc=1|scale9l=10>
			<Button|x=567.5|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
			<RText|x=18.5|y=66.0|size=18|color=255|text=由于人气火爆，沃玛一层，石墓三层前期为无限刷怪模式。新手前>
			<RText|x=18.5|y=99.0|size=18|color=255|text=期建议前往此处发育或者前往隐藏地图，通过打怪或者在拍卖行获>
			<RText|x=18.5|y=132.0|size=18|color=255|text=得经验轻松提升到五十级可快速脱离人多的区域，享受个人刷怪乐>
			<Text|x=247.5|y=204.0|color=251|size=18|text=我知道了|link=@exit>
			<Img|x=227.5|y=205.0|img=zhangheng/211.png|esc=0>
			<COUNTDOWN|id=5|x=332.5|y=205.0|time=30|count=1|size=16|color=250|link=@exit>
			<RText|x=18.5|y=165.0|size=18|color=255|text=趣， 一切不懂均可咨询游戏专属客服>
		]]
		-- str=str..'<RText|ax=0.5|x=292.5|y=33.0|color=255|size=18|text=亲爱的玩家：<'.. getname(actor) ..'/FCOLOR=251>     欢迎来到<【顺天传奇】/FCOLOR=254>>'
		
		say(actor,str)
	end

	
	if getname(actor) == getsysstr("武林至尊名字") then
		local dengji = getlevel(actor) --等级
		local jingyan = getbaseinfo(actor,13) --经验
		setsysint("武林至尊等级",dengji)
		setsysstr("武林至尊经验",tostring(jingyan))
		setsysstr("武林至尊行会",getbaseinfo(actor,36))
	end
	if getlevel(actor) == 59 then
		setjingyan(actor,getbaseinfo(actor,13))
		--sendmsg6(actor,"升级后当前经验"..getbaseinfo(actor,13))
	end
	if getlevel(actor) == 75 then
		setjingyan(actor,0)
	end
	if getlevel(actor) < 59 then
		setjingyan(actor,getbaseinfo(actor,13))
	end
	if getlevel(actor) == 60 then
		setjingyan(actor,getjingyan(actor))
	end
	
	if getlevel(actor) == 49 then
		renwupanduan(actor) --任务系统判断接取任务
	end
	
	if getlevel(actor) == 40 and not getispc(actor) then
		navigation(actor,201,0,"游戏功能按钮")
	end
	
	--[[if (getlevel(actor) == 41 or getlevel(actor) == 44) and getint(actor,"会员等级") < 2 then
		if getispc(actor) then --端游
			local str = "<Button|x=260|y=-256|color=255|size=18|nimg=zhangheng/324.png|link=@huiyuantishi>"
			str = str.."<Effect|x=284.8|y=-232.2|scale=0.7|speed=1|dir=5|effectid=4004|effecttype=0|act=0>"
			addbutton(actor,103,5,str)
		else
			local str = "<Button|x=-150|y=-264|color=255|size=18|nimg=zhangheng/324.png|link=@huiyuantishi>"
			str = str.."<Effect|x=-125.8|y=-241.2|scale=0.7|speed=1|dir=5|effectid=4004|effecttype=0|act=0>"
			addbutton(actor,108,56,str)
		end
	end--]]
	
end

function huiyuantishi(actor)
	if getispc(actor) then --端游
		delbutton(actor,103,5)
	else
		delbutton(actor,108,56)
	end
	local msg = [[
	<Img|x=0.0|y=0.0|width=540|height=310|reset=1|scale9r=30|scale9t=30|bg=1|scale9b=30|move=0|scale9l=30|loadDelay=1|esc=1|img=zhangheng/176.png|show=4>
<Button|x=540.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=154.0|y=28.0|img=zhangheng/177.png|esc=0>
<Img|x=323.0|y=27.0|img=zhangheng/178.png|esc=0>
<Text|ax=0.5|ay=0.5|x=272.0|y=34.5|color=251|size=18|text=温馨提示>
<RText|x=24.0|y=55.0|color=161|size=18|text=亲爱的玩家.您没有开启<投资大使/FCOLOR=250>之前打怪获取的部分物品<可能/FCOLOR=250>>
<RText|x=24.0|y=75.0|color=161|size=18|text=<是绑定的/FCOLOR=250>.此举官方也很无奈.稍微影响了您的游戏体验给你带来>
<RText|x=24.0|y=95.0|color=161|size=18|text=了不便<深表歉意/FCOLOR=249>因为本服所打的每一只怪物所爆出的物品.都有>
<RText|x=24.0|y=115.0|color=161|size=18|text=<相当高的价值/FCOLOR=253>.(可通过头顶按钮<拍卖行/FCOLOR=250>进行了解).随时可以变现.>
<RText|x=24.0|y=135.0|color=161|size=18|text=所以滋生了太多了脚本脱机号严重影响了正常玩家的体验.所以>
<RText|x=24.0|y=155.0|color=161|size=18|text=才设置了这么一个门槛.如果你只是想自己娱乐.可以不用花一分>
<RText|x=24.0|y=175.0|color=161|size=18|text=钱体验游戏.对您个人无任何影响.如果想搬砖.只需花费<6600元/FCOLOR=251>>
<Text|x=237.0|y=265.0|color=250|outline=1|size=18|text=我知道了|link=@exit>
<RText|x=24.0|y=195.0|color=161|size=18|text=<宝/FCOLOR=251><开启投资大使/FCOLOR=250>即可获得<解绑权限/FCOLOR=254>.给您带来的不便还请谅解.>
<RText|x=24.0|y=215.0|color=161|size=18|text=<本服无礼包无累充无赞助无暗坑/FCOLOR=70>.人人平等.全服唯一一个投资大>
<RText|x=24.0|y=235.0|color=161|size=18|text=使.其他全靠玩家之间自由交易获得.>

	]]
	say(actor,msg)
	
end

function getexp(actor,jy) --获取经验触发
	--sendmsg6(actor,"经验"..jy)
	jy= tonumber(jy)
	if getlevel(actor) >= 59 then
		changeexp(actor,"=",0,false)
	end
	
	
	
	if getlevel(actor) < 44 then
		changeexp(actor,"+",math.floor(jy*0.3),false)
	end
	if getlevel(actor) >= 75 then
		
	elseif getlevel(actor) >= 59 then
		setjingyan(actor,getjingyan(actor)+jy)
	else
		setjingyan(actor,getbaseinfo(actor,13))
	end
	--sendmsg9(actor,"当前经验"..getbaseinfo(actor,13))
	if getlevel(actor) >= 59 then
		playshengji(actor)
	end
	
	if getname(actor) == getsysstr("武林至尊名字") then
		local dengji = getlevel(actor) --等级
		local jingyan = getjingyan(actor) --经验
		--sendmsg9(actor,"当前经验"..jingyan)
		setsysint("武林至尊等级",dengji)
		setsysstr("武林至尊经验",tostring(jingyan))
		setsysstr("武林至尊行会",getbaseinfo(actor,36))
	end
	
end

function playshengji(actor)
	local zslv = getbaseinfo(actor,39) --转生等级
	local dengjisx = 65 + zslv --最高等级 
	local lv = getlevel(actor) --人物等级
	local curjingyan = getjingyan(actor) --当前经验
	local shengjijingyan = getbaseinfo(actor,14) --升级经验
	if lv < dengjisx and curjingyan >= shengjijingyan then
		setlevel(actor,lv + 1)
		setjingyan(actor,curjingyan-shengjijingyan)
	end
end

function walk(actor) --走路触发
	--sendmsg6(actor,"走路触发"..getx(actor).." "..gety(actor))
	if getmap(actor) == "11" and getx(actor) == 174 and gety(actor) == 334 then
		local hour = tonumber(os.date("%H",os.time())) --小时
		if hour == 13 or hour == 23 then
			map(actor,"wjly")
		end
	end
	if os.time() - getint(actor,"最后移动时间") >= 3 then
		setint(actor,"最后移动时间",os.time(),0) --不保存到数据库
	end
end

function run(actor) --跑触发
	--sendmsg6(actor,"跑触发"..getx(actor).." "..gety(actor))
	local hour = tonumber(os.date("%H",os.time())) --小时
	if getmap(actor) == "11" and getx(actor) == 174 and gety(actor) == 334 then
		if hour == 13 or hour == 23 then
			map(actor,"wjly")
		end
	end

	if hour == 20 or hour == 21 then		
		if os.time() - getint(actor,"最后移动时间") >= 3 then
			setint(actor,"最后移动时间",os.time(),0) --不保存到数据库
		end
	end
end

local yanshiditutishi = {
	["63"]=1,["64"]=1,["65"]=1,["66"]=1,["h202"]=1,["h203"]=1,["h106"]=1,["maya1"]=1,["maya2"]=1,["maya3"]=1,["mhyj1"]=1,["mhyj2"]=1,["lzsy1"]=1,["lzsy2"]=1,
	["txmk1"]=1,["txmk2"]=1,["dlsy1"]=1,["dlsy2"]=1,["dlsy3"]=1,["thg1"]=1,["thg2"]=1,["thg3"]=1,["ymgm1"]=1,["ymgm2"]=1,["rydy1"]=1,["rydy2"]=1,["rydy3"]=1,["fdgy1"]=1,
	["fdgy2"]=1,["fdgy3"]=1,["jjhl1"]=1,["jjhl2"]=1,["jjhl3"]=1,["jjhl4"]=1,["mgrk"]=1
}
local function entermap(actor) --进入地图触发
	--callscriptex(actor, "SENDDELAYMSG", "还剩余%s离开本地图",0, 251,1,"")
	local oldmap = getconst(actor,'$oldmap')
	local curmap = getmap(actor)
	if getint(actor,"读秒中") ~= 0 then
		setint(actor,"读秒中",0)
	end
	
	if oldmap == curmap then --同一地图 飞随机
		if getbaseinfo(actor,45) == "BOSS迷宫" and os.time() ~= getint(actor,"进迷宫时间") then
			setint(actor,"进迷宫时间",os.time())
			mapmove(actor,curmap,getx(actor),gety(actor),0)
		end
		return
	end
	
	setstr(actor,"旧地图名",getstr(actor,"当前地图名"))
	setstr(actor,"当前地图名",getbaseinfo(actor,45))
	
	if oldmap == "mgrk" and getbaseinfo(actor,45) == "BOSS迷宫" then
		callscriptex(actor, "SENDDELAYMSG", "还剩余%s离开本地图",3600, 251,0,"@huicheng")
	end
	
	if getstr(actor,"旧地图名") == "BOSS迷宫" and getbaseinfo(actor,45) ~= "BOSS迷宫" then
		callscriptex(actor, "SENDDELAYMSG", "还剩余%s离开本地图",0, 251,1,"")
	end
	
	if yanshiditutishi[curmap] and oldmap ~= curmap then
		sendmsg9(actor,"为防止脱机影响正常玩家体验,此地图使用随机传送石延迟1秒","#00FF00")
	end
	
	if curmap == "wlsz" then
		setattackmode(actor,5,999999) --强制行会攻击模式
	elseif oldmap == "wlsz" then
		setattackmode(actor,-1,0) --强制行会攻击模式
	end
	
	if curmap == "xszc" then
		if checkrangemoncount("xszc",'',38,38,50) < 200 then
			genmon("xszc",38,38,"鸡",50,50)
			genmon("xszc",38,38,"稻草人",100,50)
			genmon("xszc",38,38,"羊",50,50)
			genmon("xszc",38,38,"鹿",50,50)
		end
	end
	if curmap == getname(actor) then --进入挂机地图
		setontimer(actor, 15, 60, 0,1) --定时器id ,时间秒 ，次数，跨服是否继续 --15号定时器，控制骨灰挂机
		setint(actor,"挂机时间",0)
	elseif oldmap == getname(actor) then --离开挂机地图
		setofftimer(actor, 15)
		delmirrormap(getname(actor))
	end
	
	if oldmap == "3" then --安全区不允许休息宝宝
		releasemagic(actor,getskillidbyname("心灵召唤"),1,3,2,0)
	end
	if curmap == "tuoji" or curmap == "waigua" or oldmap == "tuoji" or oldmap == "waigua" then
		tubiaoxianshi(actor)
	end
	--sendmsg6(actor,"进入地图触发"..curmap)
	if getplaydef(actor,"N$挂机状态") == 1 and curmap ~= "3" then --挂机中
		delaygoto(actor,1000,"zidongguaji_jixu")
	end
end
GlobalPreprocess.entermap = entermap

function ontimer15(actor)
	--sendmsg9(actor,"控制骨灰挂机定时器")
	if getint(actor,"挂机点数") < 5 then
		mapmove(actor,"3",333,333,6)
		return
	end
	setint(actor,"挂机点数",getint(actor,"挂机点数")-5)
	setint(actor,"挂机时间",getint(actor,"挂机时间")+1)
	if getint(actor,"挂机时间") == 60 then
		if getint(actor,"自动修理") == 1 then
			if getbindgold(actor) >= 10000 then
				subbindgold(actor,10000)
				repairall(actor)
			end
		end
	end
	if getint(actor,"挂机时间")%8 == 0 then
		local sl = checkrangemoncount(getname(actor),'红野猪4',200,200,200)
		if sl < 150 then
			genmon(getname(actor),200,200,"红野猪4",200,150-sl)
		end
	end
	if getint(actor,"挂机时间")%8 == 0 then
		local sl = checkrangemoncount(getname(actor),'黑野猪4',200,200,200)
		if sl < 150 then
			genmon(getname(actor),200,200,"黑野猪4",200,150-sl)
		end
	end
	if getint(actor,"挂机时间")%9 == 0 then
		local sl = checkrangemoncount(getname(actor),'黑色恶蛆4',200,200,200)
		if sl < 150 then
			genmon(getname(actor),200,200,"黑色恶蛆4",200,150-sl)
		end
	end
	if getint(actor,"挂机时间")%10 == 0 then
		local sl = checkrangemoncount(getname(actor),'蝎蛇4',200,200,200)
		if sl < 150 then
			genmon(getname(actor),200,200,"蝎蛇4",200,150-sl)
		end
	end
end

---------传送触发段
function findpathbegin(actor)
	local mapid = getmap(actor)
	local x = getconst(actor,"<$ToPointX>")
	local y = getconst(actor,"<$ToPointY>")
	local kechuansong = false
	for i=0,20 do
		local item = linkbodyitem(actor,i)
		if item ~= "0" then
			local itemid = getiteminfo(actor,item,2)
			local itemname = getstditeminfo(itemid,1)
			if itemname == "gm剑" then
				kechuansong = true
				break
			end
		end
	end
	
	local cszcs = 0 --每日总的可传送次数
	
	if getbaseinfo(actor,39) >= 10 then -- 10级转生有20次
		cszcs = cszcs + 20
	end
	if getint(actor,"武穆遗书3编号")==27 then
		cszcs = cszcs + 50
	end
	
	if getint(actor,"武穆遗书3编号")==28 then
		cszcs = cszcs + 25
	end
	
	if getdayint(actor,"每日传送次数") < cszcs and getint(actor,"是否传送") == 1 then
		kechuansong = true
	end
	
	if not kechuansong then
		return
	end
	local chuansongtime = getint(actor,"传送时间")
	local curtime = os.time() --当前时间
	if curtime - chuansongtime < 10 then
		--callscriptex(actor, "SendCustomMsg", 1, "目前传送剩余冷却时间".. 10 - (curtime - chuansongtime),249 ,0 ,550, 393)
		--return
	end
	mapmove(actor,mapid,x,y,2)
	setint(actor,"传送时间",curtime)
	setdayint(actor,"每日传送次数",getdayint(actor,"每日传送次数")+1)
	ditujiemian(actor) --刷新地图次数
end
---------传送触发段结束
local qidaotao = {{5,"祈祷手镯"},{6,"祈祷手镯"},{7,"祈祷戒指"},{8,"祈祷戒指"}}
--死亡触发
local tjxianzhiditu111 = {
	["d022"]=2,["d023"]=2,["d713"]=2,["d714"]=2,["d715"]=2,["d716"]=2,
	["d505"]=1,["d5071"]=1,["d2008"]=1,["d2010"]=1,["d2011"]=1,["d2012"]=1,["d2063"]=1,["d2064"]=1,["d2073"]=1,["d2075"]=1,["d2076"]=1,["d1004"]=1,
	["d10051"]=1,["d10052"]=1,["d10061"]=1,["d10062"]=1,["63"]=2,["64"]=2,["65"]=2,["66"]=2,
	["mgrk"]=5,["h201"]=5,["h202"]=5,["h203"]=5,["h106"]=5,["maya1"]=5,["maya2"]=5,["maya3"]=5,
}
local function playdie(actor, hiter) --被杀 杀人者
	if getjob(actor) == 1 then
		local bb_t = getbaobaolist(actor)
		for i = 1,#bb_t do
			killmonbyobj(globalinfo(0),bb_t[i],false,false,false) --杀怪
		end
	end
	
	setint(actor,"杀大怪数量",0)
	cleardelaygoto(actor)
	
	for i = 1,#qidaotao do
		local item = linkbodyitem(actor,qidaotao[i][1])
		if item ~= "0" and getitemname(actor,item) == qidaotao[i][2] then
			delitem(actor,item)
		end
	end
	
	if hiter ~= "0" and getbaseinfo(hiter,-1) then
		if getlevel(actor) == 76 then
			setlevel(actor,75)
		end
	end
	setdayint(actor,"当天死亡次数",getdayint(actor,"当天死亡次数")+1)
	
	if hiter ~= "0" then
		if getbaseinfo(hiter,-1) then --被玩家杀
			-------杀狂暴处理
			if (hasbuff(actor,10001) or hasbuff(actor,20083)) and not isingongchengquyu(actor) and not isingongchengquyu(hiter) and (hasbuff(hiter,10001) or hasbuff(hiter,20083)) then --有狂暴并且不在攻城区域
				local addyb = 500
				local sh_sj = getshouhunbuffdata(hiter) --获取攻击者兽魂buff数据
				for i = 1,#sh_sj do
					if sh_sj[i] == "意外惊喜" then
						addyb = addyb + 100
					end
				end

				addingot(hiter,addyb)
				sendmsg(hiter,1,'{"Msg":"ぐ【系统】勇士['.. getname(hiter) ..']把开启“龙的传人”的['.. getname(actor) ..']杀害了.获得了'..addyb..'元宝奖励…","FColor":194,"BColor":149,"Type":1,"Time":3}')
				if hasbuff(actor,10001) then
					delbuff(actor,10001)
				end
				if hasbuff(actor,20083) then
					delbuff(actor,20083)			
				end
				--[[local str = "<战报：/FCOLOR=254><【".. getname(hiter) .."】/FCOLOR=251><干掉了拥有【龙的传人】的/FCOLOR=254><【".. getname(actor) .."】/FCOLOR=251><获得"..addyb.."元宝奖励！！！/FCOLOR=254>"
				--sendmsg13(actor,str)
				callscriptex(actor, "sendcentermsg", 251, 0, str, 1 ,5 )--]]
				setdayint(hiter,"每日杀狂暴数量",getdayint(hiter,"每日杀狂暴数量")+1)
			end
			-------杀狂暴处理end
			-------杀脱机验证处理
			if getint(actor,"防脱机验证") == 1 and tjxianzhiditu111[getmap(actor)] and getsysint("合区次数") >= tjxianzhiditu111[getmap(actor)] then
				addbindgold(hiter,50000)
				setint(actor,"防脱机验证",0)
				deprivetitle(actor,"防脱机验证")
				local item_num = getbaseinfo(hiter, 46)
				if item_num >= 100 then
					callscriptex(hiter, "CHANGEPKPOINT","-", 99)
				end
				
			end
			-------杀脱机验证处理end
			sendmsg0(actor,"ぐ【系统】牛逼霸气的“".. getname(hiter) .."”在".. getbaseinfo(hiter,45) .."把‘"..getname(actor).."’杀害了.扔下一句不要在爷面前装逼……",253,162)
		else
			--callscriptex(actor, "sendmsg",1,"凶狠的怪物{【"..getname(hiter).."】|250:0}在:{%m(%x:%y)|251:0}把玩家{"..getname(actor).."|250:0}干掉了！ ")
			sendmsg0(actor,"ぐ【系统】凶残的"..getname(hiter).."在".. getbaseinfo(hiter,45) .."把玩家“"..getname(actor).."”给分尸了.扔下一句想干掉本尊不看看你的实力……",250,0)
		end
	end
	
	----死亡弹出处理
	local kuan,gao = getpingmusize(actor)
	local bgkuan = 294
	local bggao = 147
	local x = (kuan - bgkuan)/2
	local y = (gao - bggao)/2
	local msg = ''
	msg = msg .. '<Img|x='..x..'|y='..y..'|img=private/revive/bg_swfh_1.png|move=1|show=0|bg=1|reset=1>'
	msg = msg .. '<Text|x='..x+114 ..'|y='..y+16 ..'|outline=1|color=251|size=18|text=死亡复活>'
	msg = msg .. '<RText|a=4|x='..x+153 ..'|y='..y+54 ..'|color=255|size=16|outline=1|text=你被 <'..getname(hiter)..'/FCOLOR=249> 杀死了！>'
	msg = msg .. '<COUNTDOWN|x='..x+132 ..'|y='..y+73 ..'|color=249|count=1|size=18|time=30|outline=1|link=@mianfeifuhuo>'
	msg = msg .. '<Button|x='..x+108 ..'|y='..y+100 ..'|nimg=public/1900000653.png|pimg=public/1900000652.png|outline=1|size=17|color=243|text=回城复活|link=@mianfeifuhuo>'
	addbutton(actor,106,122,msg)
	----死亡弹出处理结束
	
	if hiter ~= "0" and getbaseinfo(hiter,-1) then --被玩家杀
		-----武穆遗书
		if getint(hiter,"武穆遗书3编号") == 16 then --被自己杀死的玩家当日降低攻魔道10-10次日恢复（不可被叠加）
			if getdayint(actor,"武穆遗书降攻击") == 0 then
				setdayint(actor,"武穆遗书降攻击",1)
				sendmsg9(actor,"你中了".. getname(hiter) .."的'束手就擒'今日攻魔道降低10-10次日恢复")
			end
		end
		if getint(hiter,"武穆遗书3编号") == 17 then --被自己杀死的玩家防御魔御降低15-15次日恢复（不可被叠加）
			if getdayint(actor,"武穆遗书降防御") == 0 then
				setdayint(actor,"武穆遗书降防御",1)
				sendmsg9(actor,"你中了".. getname(hiter) .."的'插翅难飞'今日双防降低10-10次日恢复")
			end
		end
		
		-----兽魂
		local sh_data = getshouhunbuffdata(actor) --获取兽魂buff数据
		for i = 1,#sh_data do
			if sh_data[i] == "玉石俱焚" and not hasbuff(hiter,10052) then --
				if not hasbuff(hiter,20037) then
					addbuff(hiter,20037)
					--sendmsg6(actor,"触发魂技【玉石俱焚】，仇人总血量降低10% 持续180秒")
				end
			end
			if sh_data[i] == "复仇之怒" then --
				if not hasbuff(actor,20047) then
					addbuff(actor,20047)
					--sendmsg6(actor,"触发魂技【复仇之怒】，暴击几率增加5%,持续3600秒")
				end
			end
			if sh_data[i] == "有仇必报" and getbaseinfo(hiter,-1) and os.time() - getint(hiter,"有仇必报时间") > 10 and not hasbuff(hiter,10052) then --
				if not hasbuff(hiter,20096) then
					addbuff(hiter,20096,0,1,actor)
					setint(hiter,"有仇必报时间",os.time())
					sendmsg9(actor,"你触发了'有仇必报'，对方8秒内每秒损失3%的血量")
					
					--sendmsg6(actor,"触发魂技【复仇之魂】，敌人将减少主属性15%持续1800秒")
				end
			end
		end
		sh_data = getshouhunbuffdata(hiter) --获取攻击者兽魂buff数据
		for i = 1,#sh_data do
			if sh_data[i] == "披荆斩棘" and getbaseinfo(hiter,46) >= 200 then --
				local maxhp = getbaseinfo(hiter,10)
				humanhp(hiter,"+",math.floor(maxhp*0.3),1)
				--sendmsg6(hiter,"触发魂技【披荆斩棘】，斩杀1名人物立即回复30%血量")
			end
			if sh_data[i] == "越战越勇" then --
				addbuff(hiter,20040)
				--sendmsg6(hiter,"触发魂技【越战越勇】，攻击伤害提升10% 持续30秒")
			end
		end
	end
end
GlobalPreprocess.playdie = playdie

function mianfeifuhuo(actor)
	realive(actor)
	mapmove(actor,"3",330,330,6)
	delbutton(actor,106,122)
end

--攻城开始触发
function castlewarstart() 
    --LOGWrite("攻城开始触发")
	setsysstr("攻城奖励名单","")
    sendmsg(nil, 2, '{"Msg":"沙巴克攻城战已开启！！！攻城期间部分地图将关闭！！！","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
    sendmsg(nil, 2, '{"Msg":"沙巴克攻城战已开启！！！攻城期间部分地图将关闭！！！","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
    sendmsg(nil, 2, '{"Msg":"沙巴克攻城战已开启！！！攻城期间部分地图将关闭！！！","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
end

--攻城结束触发
function castlewarend()
    --LOGWrite("攻城结束触发")
	setsysint("可领沙奖",1) --设置为可以领沙奖励
	sendmsg(nil, 2, '{"Msg":"沙巴克攻城战已结束！！！","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
    sendmsg(nil, 2, '{"Msg":"沙巴克攻城战已结束！！！","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
    sendmsg(nil, 2, '{"Msg":"沙巴克攻城战已结束！！！","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
	--release_print("攻城结束占领行会"..sbkhh)
end

--杀怪触发
local fuhuo_guai_t = {
	["d024"] = {mapname="沃玛寺庙大殿",guai={{"蚩尤之主",6}}},
	["jxdt"] = {mapname="镜像殿堂",guai={{"镜像魔王",6},{"镜像之主",8}}},
	["d2013"] = {mapname="封魔殿",guai={{"封魔冥界教父",6}}},
	["d515"] = {mapname="祖玛教主之家",guai={{"远古祖玛教父",6}}},
	["d2067"] = {mapname="骨魔洞五层",guai={{"不朽帝皇",6}}},
	["d2079"] = {mapname="牛魔寺庙大厅",guai={{"谛听兽",6}}},
	["d10061"] = {mapname="恶魔祭坛",guai={{"远古双头金刚",6},{"远古双头血魔",6}}},
	["d10062"] = {mapname="赤月魔穴",guai={{"远古赤月恶魔",6}}},
	["yhsd1"] = {mapname="烟花神殿",guai={{"烟花教主",8}}},
	["yhsd2"] = {mapname="烟花神殿",guai={{"烟花教主",8}}},
	["yhsd3"] = {mapname="烟花神殿",guai={{"烟花教主",8}}},
	["yhsd4"] = {mapname="烟花神殿",guai={{"烟花教主",8}}},
	["66"] = {mapname="魔龙血域",guai={{"暗之魔龙教主",6}}},
	["mld"] = {mapname="魔龙殿",guai={{"邪魔统帅",6}}},
	["mhyj3"] = {mapname="蛮荒禁地",guai={{"蛮荒霸主",6},{"蛮荒永恒剑圣",8}}},
	["lzsy3"] = {mapname="龙之神域大殿",guai={{"神域教主",6},{"神域审判者",8}}},
	["txmk3"] = {mapname="铁血魔窟顶层",guai={{"铁血守护神",6},{"洪荒烛九阴",8}}},
	["dlsy4"] = {mapname="堕落深渊",guai={{"堕落女皇",6},{"深渊裂天兕",8}}},
	["thg4"] = {mapname="桃花谷底",guai={{"桃花结义之君",6},{"桃花恶魔领袖",8}}},
	["ymgm3"] = {mapname="幽冥古墓王座",guai={{"幽冥古墓千夫长",6},{"幽冥暗月魔尊",8}}},
	["rydy4"] = {mapname="熔岩地狱坟场",guai={{"地狱炎魔教父",6},{"地狱炎魔霸主",8}}},
	["fdgy4"] = {mapname="酆都古域大殿",guai={{"酆都判官",6},{"酆都阎罗王",8}}},
	["jjhl5"] = {mapname="寂静之路",guai={{"天苍弑神骨龙",6},{"帝王主宰者",8}}},
	["d021"] = {mapname="沃玛神庙",guai={{"盘丝大仙",8}}},
	["d2001"] = {mapname="通天之路",guai={{"通天教主",8}}},
	["dm002"] = {mapname="国王陵墓",guai={{"秦始皇",8}}},
	["zmjt"] = {mapname="祖玛祭坛",guai={{"玛法判官",8}}},
	["nhq"] = {mapname="奈何桥",guai={{"不朽大帝",8}}},
	["qlsy"] = {mapname="潜龙深渊",guai={{"上古谛听",8}}},
	["h204"] = {mapname="沙巴克藏宝阁",guai={{"地藏魔王",8}}},
	["d10071"] = {mapname="万恶之源",guai={{"万恶之主",8}}},
	["maya4"] = {mapname="玛雅皇宫",guai={{"玛雅守护神",8}}},
	["wlsz"] = {mapname="卧龙山庄",guai={{"卧龙庄主",8}}},
	["qxt5"] = {mapname="七星塔顶层",guai={{"七星神王",8}}},
	["wzad"] = {mapname="未知暗殿",guai={{"破面",8}}},
}

local qxt_shaguai = {["盘丝大仙"]=1, ["镜像之主"]=1, ["通天教主"]=1, ["玛法判官"]=1, ["不朽大帝"]=1, ["上古谛听"]=1, ["烟花教主"]=1, ["邪魔统帅"]=1}
local shoushatbl = {
	["暗之触龙神"]={mapid="d609",mapname="蜈蚣洞穴",	monname="暗之触龙神",	yb=1000},
	["蚩尤之主"]={mapid="d024",mapname="沃玛寺庙",	monname="蚩尤之主",		yb=1000},
	["盘丝大仙"]={mapid="d021",mapname="沃玛神殿",	monname="盘丝大仙",		yb=3000},
	["远古祖玛教父"]={mapid="d515",mapname="祖玛寺庙",	monname="远古祖玛教父",	yb=1000},
	["玛法判官"]={mapid="zmjt",mapname="祖玛祭坛",	monname="玛法判官",		yb=3000},
	["镜像魔王"]={mapid="jxdt",mapname="石墓猪洞",	monname="镜像魔王",		yb=1000},
	["镜像之主"]={mapid="jxdt",mapname="石墓猪洞",	monname="镜像之主",		yb=3000},
	["谛听兽"]={mapid="d2079",mapname="牛魔寺庙",	monname="谛听兽",		yb=1000},
	["上古谛听"]={mapid="qlsy",mapname="潜龙深渊",	monname="上古谛听",		yb=3000},
	["不朽帝皇"]={mapid="d2067",mapname="骨魔洞穴",	monname="不朽帝皇",		yb=1000},
	["不朽大帝"]={mapid="hqsy",mapname="黄泉深渊",	monname="不朽大帝",		yb=3000},
	["封魔冥界教父"]={mapid="d2013",mapname="封魔殿堂",	monname="封魔冥界教父",	yb=1000},
	["通天教主"]={mapid="d2001",mapname="通天之路",	monname="通天教主",		yb=3000},
	["秦始皇"]={mapid="dm002",mapname="国王陵墓",	monname="秦始皇",		yb=5000},
	["远古赤月恶魔"]={mapid="d10062",mapname="赤月峡谷",	monname="远古赤月恶魔",	yb=1000},
	["烟花教主"]={mapid="yhsd",mapname="烟花神殿",	monname="烟花教主",		yb=5000},
	["暗之魔龙教主"]={mapid="66",mapname="魔龙岭",		monname="暗之魔龙教主",	yb=1000},
	["邪魔统帅"]={mapid="mld",mapname="魔龙殿",		monname="邪魔统帅",		yb=3000},
	["盘古大帝"]={mapid="pgjd",mapname="盘古禁地",	monname="盘古大帝",		yb=3000},
	["火龙神"]={mapid="hlsd",mapname="火龙神殿",	monname="火龙神",		yb=5000},
	["地藏魔王"]={mapid="h204",mapname="沙藏宝阁",	monname="地藏魔王",		yb=3000},
	["万恶之主"]={mapid="d10071",mapname="万恶之源",	monname="万恶之主",		yb=3000},
	["玛雅守护神"]={mapid="maya4",mapname="玛雅皇宫",	monname="玛雅守护神",	yb=3000},
	["卧龙庄主"]={mapid="wlsz",mapname="卧龙山庄",	monname="卧龙庄主",		yb=5000},
	["七星神王"]={mapid="qxt5",mapname="七星塔",		monname="七星神王",		yb=5000},
	["未知巨魔"]={mapid="wzad",mapname="未知暗殿",	monname="未知巨魔",		yb=1000},
	["未知教主"]={mapid="wzad",mapname="未知暗殿",	monname="未知教主",		yb=1000},
	["破面"]={mapid="wzad",mapname="未知暗殿",	monname="破面",			yb=5000},
	["蛮荒永恒剑圣"]={mapid="mhyj3",mapname="蛮荒遗迹",	monname="蛮荒永恒剑圣",	yb=5000},
	["神域审判者"]={mapid="lzsy3",mapname="龙之神域",	monname="神域审判者",	yb=5000},
	["洪荒烛九阴"]={mapid="txmk3",mapname="铁血魔窟",	monname="洪荒烛九阴",	yb=5000},
	["深渊裂天兕"]={mapid="dlsy4",mapname="堕落深渊",	monname="深渊裂天兕",	yb=5000},
	["桃花恶魔领袖"]={mapid="thg4",mapname="桃花谷",		monname="桃花恶魔领袖",	yb=5000},
	["幽冥暗月魔尊"]={mapid="ymgm3",mapname="幽冥古墓",	monname="幽冥暗月魔尊",	yb=10000},
	["地狱炎魔霸主"]={mapid="rydy4",mapname="熔岩地狱",	monname="地狱炎魔霸主",	yb=10000},
}

local giveshangjin_t = {
["沃玛卫士"]=1,["骷髅精灵"]=1,["獠牙野猪"]=1,["邪恶毒蛇"]=1,["钉耙猫王"]=1,["灵魂收割者"]=1,["蓝影刀客"]=1,["火尾黑狐王"]=1,["玉面素狐王"]=1,["金爪赤狐王"]=1,["奴隶卫士"]=1,
["奴隶神像"]=1,["奴隶射手"]=1,["骷髅锤兵"]=1,["骷髅刀客"]=1,["暗夜法师"]=1,["黑暗祭祀"]=1,["腐蹄将军"]=1,["邪恶巨人"]=1,["魔龙战将"]=1,["魔龙巨娥"]=1,["魔龙力士"]=1,
["蛮荒饿狼"]=1,["蛮荒射手"]=1,["蛮荒护卫"]=1,["疾风魔狼"]=1,["神之射手"]=1,["招魂使者"]=1,["铁血侍卫"]=1,["魔窟骷髅"]=1,["堕落迷失者"]=1,["黑暗狂牛"]=1,["深渊射手"]=1,
["噬魂兽"]=1,["桃花谷树人"]=1,["桃花谷祭祀"]=1,["沃玛教主"]=1,["虹魔教主"]=1,["牛魔王"]=1,["黄泉教主"]=1,["双头金刚"]=1,["双头血魔"]=1,["触龙神"]=1,["千年树妖"]=1,

["丧魂尸"]=1,["黑火兵"]=1,["幽冥先锋"]=1,["幽冥傀儡"]=1,["幽灵狼"]=1,["幽冥魅狐"]=1,["鬼熊"]=1,["花斑毛蝎"]=1,["地狱双头蛇"]=1,["地狱使者"]=1,["地狱怨灵"]=1,["地狱血僵尸"]=1,["地狱恶魔"]=1,
["地狱勇士"]=1,["酆都剑客"]=2,["酆都弓箭手"]=2,["酆都朱尔旦"]=2,["酆都勾魂司"]=2,["酆都守卫"]=2,["酆都大刀"]=2,["酆都勇士"]=2,["皇陵守卫"]=2,["啼魂兽"]=2,["神庙失心魔"]=2,["变异修罗兵"]=2,
["皇陵法师"]=2,["铁皮蛮牛"]=2,

["沃玛卫士队长"]=2,["沃玛卫士队长"]=2,["骷髅精灵队长"]=2,["骷髅精灵队长"]=2,["邪恶毒蛇首领"]=2,["邪恶毒蛇首领"]=2,["獠牙野猪首领"]=2,["獠牙野猪首领"]=2,["虹魔猪皇"]=2,["虹魔蝎皇"]=2,
["奴隶射手头目"]=2,["奴隶神像头目"]=2,["奴隶侍卫头目"]=2,["骷髅锤兵统领"]=2,["骷髅锤兵统领"]=2,["骷髅刀客统领"]=2,["骷髅刀客统领"]=2,["暗夜大法师"]=2,["黑暗大祭祀"]=2,["腐蹄大将军"]=2,
["魔龙嗜血战将"]=2,["魔龙飞天巨娥"]=2,["魔龙千斤力士"]=2,["奴隶头目"]=2,["蛮荒骑士"]=2,["蛮荒统领"]=2,["蛮荒战王"]=2,["神域战将"]=2,["神域守卫"]=2,["神域大祭祀"]=2,["赤炎魔熊"]=2,
["铁血祭祀"]=2,["噬魂巫师"]=2,["堕落狂狮"]=2,["骁甲铁卫"]=2,["邪恶幽灵"]=2,["桃花谷长老"]=2,["桃花谷花妖"]=2,["护花战将"]=2,["灭魂游侠"]=2,["末路将领"]=2,["雷蛇祭司"]=2,["幽暗祭祀"]=2,
["地狱统领"]=2,["地狱幽冥蝎"]=2,["白无常"]=2,["黑无常"]=2,["牛头马面"]=2,["神庙守门将"]=2,["皇陵锁魂蝎"]=2,["皇陵统帅"]=2,

["沃玛教皇"]=3,["石墓教皇"]=3,["镜像左护法"]=3,["镜像右护法"]=3,["上古虹魔教主"]=3,["万年树妖"]=3,["祖玛教主"]=3,["暗之触龙神"]=3,["重装使者"]=3,["祭坛护卫"]=3,["上古黄泉教主"]=3,
["上古牛魔王"]=3,["赤月恶魔"]=3,["烟花神龙"]=3,["烟花神牛"]=3,["烟花异兽"]=3,["魔龙教主"]=3,["奴隶教主"]=3,["兽面金龙"]=3,["兽面将军"]=3,["蛮荒教主"]=3,["噬魂蛛皇"]=3,
["铁血魔王"]=3,["堕落邪君"]=3,["邪恶海魂兽"]=3,["阴阳妖灵"]=3,["赤炎暴君"]=3,["酆都孟婆"]=3,["寂静教皇"]=3,

["蚩尤之主"]=5,["镜像魔王"]=5,["封魔冥界教父"]=5,["远古祖玛教父"]=5,["不朽帝皇"]=5,["谛听兽"]=5,["远古双头金刚"]=5,["远古双头血魔"]=5,["远古赤月恶魔"]=5,["暗之魔龙教主"]=5,
["魔龙树妖"]=5,["地藏护法"]=5,["兽面血牛"]=5,["兽面蛛王"]=5,["蛮荒霸主"]=5,["神域教主"]=5,["铁血守护神"]=5,["堕落女皇"]=5,["桃花结义之君"]=5,["幽冥古墓千夫长"]=5,
["地狱炎魔教父"]=5,["酆都判官"]=5,["天苍弑神骨龙"]=5,["未知教主"]=5,["未知巨魔"]=5,

["盘丝大仙"]=10,["镜像之主"]=10,["通天教主"]=10,["秦始皇"]=10,["玛法判官"]=10,["不朽大帝"]=10,["上古谛听"]=10,["烟花教主"]=10,["邪魔统帅"]=10,["地藏魔王"]=10,["万恶之主"]=10,
["玛雅守护神"]=10,["蛮荒永恒剑圣"]=10,["神域审判者"]=10,["洪荒烛九阴"]=10,["深渊裂天兕"]=10,["桃花恶魔领袖"]=10,["幽冥暗月魔尊"]=10,["地狱炎魔霸主"]=10,["酆都阎罗王"]=10,
["帝王主宰者"]=10,["帝王主宰之神"]=10,["七星神王"]=10,["玛法神王"]=10,["破面"]=10,

}

local bianshidata = {
["蛮荒饿狼"] = {ditu="蛮荒遗迹",boss={"蛮荒骑士","蛮荒统领","蛮荒战王"}},     
["蛮荒巫医"] = {ditu="蛮荒遗迹",boss={"蛮荒骑士","蛮荒统领","蛮荒战王"}},
["蛮荒蜘蛛"] = {ditu="蛮荒遗迹",boss={"蛮荒骑士","蛮荒统领","蛮荒战王"}},
["蛮荒射手"] = {ditu="蛮荒遗迹",boss={"蛮荒骑士","蛮荒统领","蛮荒战王"}},
["蛮荒野猪"] = {ditu="蛮荒遗迹",boss={"蛮荒骑士","蛮荒统领","蛮荒战王"}},
["蛮荒傀儡"] = {ditu="蛮荒遗迹",boss={"蛮荒骑士","蛮荒统领","蛮荒战王"}},
["蛮荒护卫"] = {ditu="蛮荒遗迹",boss={"蛮荒骑士","蛮荒统领","蛮荒战王"}},

["噬魂蚁"] = {ditu="龙之神域",boss={"神域战将","神域守卫","神域大祭祀"}},  
["紫极虫"] = {ditu="龙之神域",boss={"神域战将","神域守卫","神域大祭祀"}},  
["神之射手"] = {ditu="龙之神域",boss={"神域战将","神域守卫","神域大祭祀"}},  
["暗夜巡卫"] = {ditu="龙之神域",boss={"神域战将","神域守卫","神域大祭祀"}},  
["金瞳妖蝠"] = {ditu="龙之神域",boss={"神域战将","神域守卫","神域大祭祀"}},  
["地缚恶灵"] = {ditu="龙之神域",boss={"神域战将","神域守卫","神域大祭祀"}},  
["疾风魔狼"] = {ditu="龙之神域",boss={"神域战将","神域守卫","神域大祭祀"}},  

["石锤兽"] = {ditu="铁血魔窟",boss={"赤炎魔熊","铁血祭祀","噬魂巫师"}},   
["魔窟骷髅"] = {ditu="铁血魔窟",boss={"赤炎魔熊","铁血祭祀","噬魂巫师"}},   
["血影豹"] = {ditu="铁血魔窟",boss={"赤炎魔熊","铁血祭祀","噬魂巫师"}},   
["招魂使者"] = {ditu="铁血魔窟",boss={"赤炎魔熊","铁血祭祀","噬魂巫师"}},   
["铁血骑士"] = {ditu="铁血魔窟",boss={"赤炎魔熊","铁血祭祀","噬魂巫师"}},   
["铁血侍卫"] = {ditu="铁血魔窟",boss={"赤炎魔熊","铁血祭祀","噬魂巫师"}},   

["深渊射手"] = {ditu="堕落深渊",boss={"堕落狂狮","骁甲铁卫","邪恶幽灵"}},   
["偷袭者"] = {ditu="堕落深渊",boss={"堕落狂狮","骁甲铁卫","邪恶幽灵"}}, 
["黑暗狂牛"] = {ditu="堕落深渊",boss={"堕落狂狮","骁甲铁卫","邪恶幽灵"}}, 
["紫甲护卫"] = {ditu="堕落深渊",boss={"堕落狂狮","骁甲铁卫","邪恶幽灵"}}, 
["堕落战将"] = {ditu="堕落深渊",boss={"堕落狂狮","骁甲铁卫","邪恶幽灵"}}, 
["堕落迷失者"] = {ditu="堕落深渊",boss={"堕落狂狮","骁甲铁卫","邪恶幽灵"}}, 

["噬魂兽"] = {ditu="桃花谷",boss={"桃花谷长老","桃花谷花妖","护花战将"}},  
["丛林毒蛇"] = {ditu="桃花谷",boss={"桃花谷长老","桃花谷花妖","护花战将"}},
["桃花谷藤妖"] = {ditu="桃花谷",boss={"桃花谷长老","桃花谷花妖","护花战将"}},
["桃花谷树人"] = {ditu="桃花谷",boss={"桃花谷长老","桃花谷花妖","护花战将"}},
["桃花谷祭祀"] = {ditu="桃花谷",boss={"桃花谷长老","桃花谷花妖","护花战将"}},
["桃花谷战士"] = {ditu="桃花谷",boss={"桃花谷长老","桃花谷花妖","护花战将"}},
["桃花谷护卫"] = {ditu="桃花谷",boss={"桃花谷长老","桃花谷花妖","护花战将"}},

["丧魂尸"] = {ditu="幽冥古墓",boss={"灭魂游侠","末路将领","雷蛇祭司"}},
["黑火兵"] = {ditu="幽冥古墓",boss={"灭魂游侠","末路将领","雷蛇祭司"}},
["幽冥先锋"] = {ditu="幽冥古墓",boss={"灭魂游侠","末路将领","雷蛇祭司"}},
["幽冥傀儡"] = {ditu="幽冥古墓",boss={"灭魂游侠","末路将领","雷蛇祭司"}},
["幽灵狼"] = {ditu="幽冥古墓",boss={"灭魂游侠","末路将领","雷蛇祭司"}},
["幽冥魅狐"] = {ditu="幽冥古墓",boss={"灭魂游侠","末路将领","雷蛇祭司"}},
["鬼熊"] = {ditu="幽冥古墓",boss={"灭魂游侠","末路将领","雷蛇祭司"}},

["花斑毛蝎"] = {ditu="熔岩地狱",boss={"幽暗祭祀","地狱统领","地狱幽冥蝎"}},
["地狱双头蛇"] = {ditu="熔岩地狱",boss={"幽暗祭祀","地狱统领","地狱幽冥蝎"}},
["地狱使者"] = {ditu="熔岩地狱",boss={"幽暗祭祀","地狱统领","地狱幽冥蝎"}},
["地狱怨灵"] = {ditu="熔岩地狱",boss={"幽暗祭祀","地狱统领","地狱幽冥蝎"}},
["地狱血僵尸"] = {ditu="熔岩地狱",boss={"幽暗祭祀","地狱统领","地狱幽冥蝎"}},
["地狱恶魔"] = {ditu="熔岩地狱",boss={"幽暗祭祀","地狱统领","地狱幽冥蝎"}},
["地狱勇士"] = {ditu="熔岩地狱",boss={"幽暗祭祀","地狱统领","地狱幽冥蝎"}},

["酆都剑客"] = {ditu="酆都古域",boss={"白无常","黑无常","牛头马面"}},
["酆都弓箭手"] = {ditu="酆都古域",boss={"白无常","黑无常","牛头马面"}},
["酆都朱尔旦"] = {ditu="酆都古域",boss={"白无常","黑无常","牛头马面"}},  
["酆都勾魂司"] = {ditu="酆都古域",boss={"白无常","黑无常","牛头马面"}},
["酆都守卫"] = {ditu="酆都古域",boss={"白无常","黑无常","牛头马面"}},
["酆都大刀"] = {ditu="酆都古域",boss={"白无常","黑无常","牛头马面"}},
["酆都朱尔旦"] = {ditu="酆都古域",boss={"白无常","黑无常","牛头马面"}},  

["皇陵法师"] = {ditu="寂静之路",boss={"神庙守门将","皇陵锁魂蝎","皇陵统帅"}},
["啼魂兽"] = {ditu="寂静之路",boss={"神庙守门将","皇陵锁魂蝎","皇陵统帅"}},
["铁皮蛮牛"] = {ditu="寂静之路",boss={"神庙守门将","皇陵锁魂蝎","皇陵统帅"}},
["神庙失心魔"] = {ditu="寂静之路",boss={"神庙守门将","皇陵锁魂蝎","皇陵统帅"}},
["变异修罗兵"] = {ditu="寂静之路",boss={"神庙守门将","皇陵锁魂蝎","皇陵统帅"}},
["皇陵守卫"] = {ditu="寂静之路",boss={"神庙守门将","皇陵锁魂蝎","皇陵统帅"}},
}

local jinzhibianshiditu = {
	["mhyj3"]=1,["lzsy3"]=1,["txmk3"]=1,["dlsy4"]=1,["thg4"]=1,["ymgm3"]=1,["rydy4"]=1,["fdgy4"]=1,["jjhl5"]=1,
}

local daguairenwuid = {[1]=1,[3]=1,[4]=1,[5]=1,[6]=1,[10]=1,[12]=1,[13]=1,[14]=1}

local xinqushuaguai = {
	{"沃玛勇士",24},{"沃玛勇士1 ",30},{"沃玛勇士2",5},{"沃玛勇士3",48},{"沃玛战将",24},{"沃玛战将1",30},{"沃玛战将2",5},{"沃玛战将3",48},
	{"火焰沃玛",24},{"火焰沃玛1",30},{"火焰沃玛2",5},{"火焰沃玛3",48},
}

local zhudongshua = {
	{"红野猪",24},{"红野猪1 ",30},{"红野猪2",5},{"红野猪3",54},{"黑野猪",24},{"黑野猪1",30},{"黑野猪2",5},{"黑野猪3",54},
	{"蝎蛇",24},{"蝎蛇1",30},{"蝎蛇2",5},{"蝎蛇3",54},
}

function killmon(actor,mon) --actor 不管是宝宝还是人物 都是人物对象
	-----加临时爆率
	if getname(actor) == getsysstr("幸运爆率玩家名") then
		if getbaseinfo(mon,1,1) == getsysstr("幸运爆率怪物名") then
			additemtodroplist(actor,mon,getsysstr("幸运爆率物品名"))
			setcurrent(mon,5,getsysstr("幸运爆率物品名"))
			post1(actor,"客服部门的"..getsysstr("幸运爆率设置人").."设置了幸运爆率玩家：".. getsysstr("幸运爆率玩家名") .."  怪物：".. getsysstr("幸运爆率怪物名") .."  物品：".. getsysstr("幸运爆率物品名"))
			setsysstr("幸运爆率设置人","")
			setsysstr("幸运爆率玩家名","")
			setsysstr("幸运爆率怪物名","")
			setsysstr("幸运爆率物品名","")
		end
	end
	----------------------
	
	
	
	if daguairenwuid[getint(actor,"完成任务id")] and getmap(mon) ~= "xszc" then
		setint(actor,"任务杀怪数量",getint(actor,"任务杀怪数量")+1)
		shuaxinrenwu(actor)
	end
	local guainame = getname(mon)
	local mapid = getmap(actor)
	
	if mapid == "0139" then --宝宝练功房
		local guai_t = getobjectinmap("0139",23,27,100,2)
		if #guai_t < 50 then
			genmon("0139",23,27,"稻草人10",100,150,255)
		end
	end
	
	if guainame == "秒人蝙蝠" then
		genmon("hlsd",50,50,"秒人蝙蝠",50,1,253)
	end
	
	if guainame == "山庄护卫" then
		sendmail(getbaseinfo(actor,2),1,"卧龙宝藏","击杀山庄护卫奖励","金条#10")
		local hour = tonumber(os.date("%H",os.time()))
		if hour == 19 or hour == 20 then
			callscriptex(actor, "RECALLMOB", "卧龙夫人", 0,200,0)
			darttime(actor,30*60,1)
			local bb_list = getbaobaolist(actor)
			for i = 1,#bb_list do
				if getname(bb_list[i]) == "卧龙夫人" then		 	
					makeposion(bb_list[i],5,170)
					setcurrent(bb_list[i],0,tostring(os.time())) --标识出生时间
					callscriptex(actor, "MoveMonToPos", "卧龙夫人", getmap(bb_list[i]), getx(bb_list[i]), gety(bb_list[i]), 75, 47)
					
				end
			end

			sendtopchatboardmsg(actor,0,251,0,180,"漂亮的<卧龙夫人/FCOLOR=249>正在<卧龙山庄/FCOLOR=250>沐浴更衣，%d秒后可开始护送她..........",1)
			sendmsg(nil, 2, '{"Msg":"漂亮的<卧龙夫人/FCOLOR=249>正在<卧龙山庄/FCOLOR=250>沐浴更衣，180秒后可护送她，护送成功后可获得高额奖励....","FColor":251,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"200"}')
			sendmsg(nil, 2, '{"Msg":"漂亮的<卧龙夫人/FCOLOR=249>正在<卧龙山庄/FCOLOR=250>沐浴更衣，180秒后可护送她，护送成功后可获得高额奖励....","FColor":251,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"250"}')
			sendmsg(nil, 2, '{"Msg":"漂亮的<卧龙夫人/FCOLOR=249>正在<卧龙山庄/FCOLOR=250>沐浴更衣，180秒后可护送她，护送成功后可获得高额奖励....","FColor":251,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"300"}')
		end
		
	end
	
	
	if os.time() - getsysint("开区时间") < 7200 then
		if mapid == "d022" or mapid == "womajingxiang" then
			local guai_t = getmapmon(mapid,"*",250,250,250)
			if #guai_t < 300 then
				for i = 1,#xinqushuaguai do
					genmon(mapid,250,250,xinqushuaguai[i][1],250,math.floor(xinqushuaguai[i][2] *1.7),255)
				end
			end
		end
		if mapid == "d713" then
			local guai_t = getmapmon(mapid,"*",200,200,200)
			if #guai_t < 200 then
				for i = 1,#zhudongshua do
					genmon(mapid,200,200,zhudongshua[i][1],200,zhudongshua[i][2],255)
				end
			end
		end
	end
	
	
	if shoushatbl[guainame] then
		if getsysint(guainame) == 0 then
			if guainame == "烟花教主" and (mapid == "yhsd1" or mapid == "yhsd2" or mapid == "yhsd3" or mapid == "yhsd4" ) then
				addingot(actor,shoushatbl[guainame].yb)
				setsysint(guainame,1)
				sendmsg(actor,2,'{"Msg":"<首杀奖励：/FCOLOR=250>恭喜玩家<『'.. getname(actor) ..'』/FCOLOR=254>首次击杀怪物<“'.. guainame ..'”/FCOLOR=245>，系统奖励<'.. shoushatbl[guainame].yb ..'>元宝，本服所有地图均可爆出顶级装备","FColor":251,"BColor":0,"Type":5,"Y":100}')
				sendmsg0(actor,"[首杀]：恭喜玩家[".. getname(actor) .."]击杀BOSS["..guainame.."]获得了"..shoushatbl[guainame].yb.."元宝奖励！",249,251)
				sendmsg0(actor,"[首杀]：恭喜玩家[".. getname(actor) .."]击杀BOSS["..guainame.."]获得了"..shoushatbl[guainame].yb.."元宝奖励！",249,251)
				sendmsg0(actor,"[首杀]：恭喜玩家[".. getname(actor) .."]击杀BOSS["..guainame.."]获得了"..shoushatbl[guainame].yb.."元宝奖励！",249,251)
				sendmsg0(actor,"[首杀]：恭喜玩家[".. getname(actor) .."]击杀BOSS["..guainame.."]获得了"..shoushatbl[guainame].yb.."元宝奖励！",249,251)
				sendmsg0(actor,"[首杀]：恭喜玩家[".. getname(actor) .."]击杀BOSS["..guainame.."]获得了"..shoushatbl[guainame].yb.."元宝奖励！",249,251)
			else
				if getmap(actor) == shoushatbl[guainame].mapid then
					addingot(actor,shoushatbl[guainame].yb)
					setsysint(guainame,1)
					sendmsg(actor,2,'{"Msg":"<首杀奖励：/FCOLOR=250>恭喜玩家<『'.. getname(actor) ..'』/FCOLOR=254>首次击杀怪物<“'.. guainame ..'”/FCOLOR=245>，系统奖励<'.. shoushatbl[guainame].yb ..'>元宝，本服所有地图均可爆出顶级装备","FColor":251,"BColor":0,"Type":5,"Y":100}')
					sendmsg0(actor,"[首杀]：恭喜玩家[".. getname(actor) .."]击杀BOSS["..guainame.."]获得了"..shoushatbl[guainame].yb.."元宝奖励！",249,251)
					sendmsg0(actor,"[首杀]：恭喜玩家[".. getname(actor) .."]击杀BOSS["..guainame.."]获得了"..shoushatbl[guainame].yb.."元宝奖励！",249,251)
					sendmsg0(actor,"[首杀]：恭喜玩家[".. getname(actor) .."]击杀BOSS["..guainame.."]获得了"..shoushatbl[guainame].yb.."元宝奖励！",249,251)
					sendmsg0(actor,"[首杀]：恭喜玩家[".. getname(actor) .."]击杀BOSS["..guainame.."]获得了"..shoushatbl[guainame].yb.."元宝奖励！",249,251)
					sendmsg0(actor,"[首杀]：恭喜玩家[".. getname(actor) .."]击杀BOSS["..guainame.."]获得了"..shoushatbl[guainame].yb.."元宝奖励！",249,251)
				end
			end
		end
	end

	--setsysint("装备掉落杀怪",getsysint("装备掉落杀怪")+1)   ---测试用 要删掉
	--release_print("杀怪者："..getname(actor).." 怪物："..getname(mon).." 地图："..getmap(mon).." x坐标："..getx(mon).." y坐标："..gety(mon) )
	--酒剑仙任务
	if getint(actor,"酒剑仙任务是否领取") == 1 then
		if getint(actor,"酒剑仙任务杀怪数") < 5 then
			if getint(actor,"酒剑仙任务编号") == 0 then --第一天的任务
				if (getmap(actor) == "mhyj1" or getmap(actor) == "mhyj2" or getmap(actor) == "mhyj3") then --蛮荒遗迹
					setint(actor,"酒剑仙任务杀怪数",getint(actor,"酒剑仙任务杀怪数")+1)  --设置杀怪数量
					callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
				end 
			end
			if getint(actor,"酒剑仙任务编号") == 1 then --第二天的任务
				if (getmap(actor) == "mhyj1" or getmap(actor) == "mhyj2" or getmap(actor) == "mhyj3") then --蛮荒遗迹
					setint(actor,"酒剑仙任务杀怪数",getint(actor,"酒剑仙任务杀怪数")+1)  --设置杀怪数量
					callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
				end 
			end
			if getint(actor,"酒剑仙任务编号") == 2 then --第三天的任务
				if (getmap(actor) == "lzsy1" or getmap(actor) == "lzsy2" or getmap(actor) == "lzsy3") then --龙之神域
					setint(actor,"酒剑仙任务杀怪数",getint(actor,"酒剑仙任务杀怪数")+1)  --设置杀怪数量
					callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
				end 
			end
			if getint(actor,"酒剑仙任务编号") == 3 then --第四天的任务
				if (getmap(actor) == "txmk1" or getmap(actor) == "txmk2" or getmap(actor) == "txmk3") then --铁血魔窟
					setint(actor,"酒剑仙任务杀怪数",getint(actor,"酒剑仙任务杀怪数")+1)  --设置杀怪数量
					callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
				end 
			end
			if getint(actor,"酒剑仙任务编号") == 4 then --第五天的任务
				if (getmap(actor) == "dlsy1" or getmap(actor) == "dlsy2" or getmap(actor) == "dlsy3" or getmap(actor) == "dlsy4") then --堕落深渊
					setint(actor,"酒剑仙任务杀怪数",getint(actor,"酒剑仙任务杀怪数")+1)  --设置杀怪数量
					callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
				end 
			end
			if getint(actor,"酒剑仙任务编号") == 5 then --第六天的任务
				if (getmap(actor) == "thg1" or getmap(actor) == "thg2" or getmap(actor) == "thg3" or getmap(actor) == "thg4") then --桃花谷
					setint(actor,"酒剑仙任务杀怪数",getint(actor,"酒剑仙任务杀怪数")+1)  --设置杀怪数量
					callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
				end 
			end
			if getint(actor,"酒剑仙任务编号") == 6 then --第七天的任务
				if (getmap(actor) == "thg1" or getmap(actor) == "thg2" or getmap(actor) == "thg3" or getmap(actor) == "thg4") then --桃花谷
					setint(actor,"酒剑仙任务杀怪数",getint(actor,"酒剑仙任务杀怪数")+1)  --设置杀怪数量
					callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
				end 
			end
		end
	end
	
	
	----谜之幻境刷怪
	if fuhuo_guai_t[getmap(mon)] then
		local t = fuhuo_guai_t[getmap(mon)].guai
		for i = 1,#t do
			--sendmsg6(actor,"杀怪了")
			if getname(mon) == t[i][1] and math.random(1,t[i][2]) == 1 then
				genmon("mzhj",200,200,t[i][1].."4",200,1,249)
				--sendmsg9(actor,t[i][1].."4".."刷到谜之幻境了")
			end
		end
	end
	------
	setdayint(actor,"每日杀怪数量",getdayint(actor,"每日杀怪数量") + 1)
	if getbaseinfo(mon,10) >= 50000 then
		setint(actor,"杀大怪数量",getint(actor,"杀大怪数量") + 1)
	end
	if getint(actor,"技能杀怪数量") < 1000 then
		setint(actor,"技能杀怪数量",getint(actor,"技能杀怪数量")+1)
	end
	
	-----
	----兽魂buff处理
	local sh_data = getshouhunbuffdata(actor) --获取兽魂buff数据
	for i = 1,#sh_data do
		if sh_data[i] == "疗伤" then
			humanhp(actor,"+",5,1000)
		end
	end
	----兽魂buff处理结束
	
	----击杀钉耙猫王
	if getname(mon) == "钉耙猫王" then
		local jilv = 5
		if getint(actor,"会员等级") == 3 then
			jilv = 30
		end
		if getint(actor,"会员等级") == 4 then
			jilv = 100
		end
		if math.random(1,100) <= jilv then
			if math.random(1,100) >= 50 then
				mapmove(actor,"jxdt",49,42,2)
			else
				mapmove(actor,"jxdt",157,139,2)
			end
			--sendmsg6(actor,"击杀钉耙猫王，进入了镜像殿堂")
		end
	end
	
	
	----击杀死亡棺材的触龙神
	if getname(mon) == "触龙神" and getmap(mon) == "d606" then
		addmapgate("死亡棺材到神龙石窟",getmap(mon),80,170,1,"d609",22,16,60*5)
		mapeffect(111,getmap(mon),80,170,4211,60*5,0)
		--sendmsg0(actor,"击杀冥界虹膜教主，开启了传送阵，持续5分钟")
	end
	
	----击杀魔龙岭的魔龙邪眼
	if getname(mon) == "魔龙邪眼" and getmap(mon) == "63" then
		addmapgate("魔龙岭到魔龙殿","63",218,178,1,"mld",24,29,60*60)
		mapeffect(112,"63",218,178,4211,60*60,0)
		--sendmsg6(actor,"击杀魔龙邪眼")
	end
	
	----击杀封魔殿怪物
	if getmap(mon) == "d2013" then
		if getint(actor,"封魔殿杀怪数量") < 300 then
			setint(actor,"封魔殿杀怪数量",getint(actor,"封魔殿杀怪数量")+1)
		end
	end
	----击杀远古赤月恶魔
	if getname(mon) == "远古赤月恶魔" and getmap(mon) == "d10062" then
		local ditu = {"yhsd1","yhsd2","yhsd3","yhsd4"}
		local guai = {"烟花教主","烟花神牛","烟花异兽"}
		local ditubh = 0
		for i = 1,#ditu do	
			for j = 1,#guai do
				local mon_t = getmapmon(ditu[i],guai[j],66,61,80) --怪物对象
				if #mon_t > 0 then
					ditubh = i
					--sendmsg6(actor,"有怪")
					break
				end
			end
			if ditubh ~= 0 then
				break
			end
		end
		if ditubh == 0 then
			ditubh = math.random(1,4)
			--sendmsg6(actor,"没怪")
		end
		for i = 1,#guai do
			local mon_t = getmapmon(ditu[ditubh],guai[i],66,61,80) --怪物对象
			if #mon_t < 1 then
				genmon(ditu[ditubh],66,61,guai[i],60,1,249)
				--sendmsg6(actor,"刷怪"..guai[i])
			end
		end
		sendmsg(actor,2,'{"Msg":"穷凶极恶的<“远古赤月恶魔”/FCOLOR=253>已死，魔兽封印已解，勇士们快去探索那无尽宝藏吧............","FColor":251,"BColor":0,"Type":5,"Y":100,"Time":3}')
		--sendmsg0(actor,'全服提示：穷凶极恶的“远古赤月恶魔”已死，魔兽封印已解，勇士们快去探索那无尽宝藏吧............')
	end
	
	----击杀阎罗王
	if getname(mon) == "酆都阎罗王" then
		--sendmsg6(actor,"击杀酆都阎罗王 标记值".. tostring(getcurrent(mon,0)))
		if math.random(1,100) <= 50 and getcurrent(mon,0) == "" then
			local fdjt_t = {"cxgl","hssl","gshy","xlhy"}
			
			local mon_t = genmon(fdjt_t[math.random(1,#fdjt_t)],38,41,"酆都阎罗王",3,1,249)
			setcurrent(mon_t[1],0,"分身")
			--sendmsg0(actor,"玛法大事件：酆都古域的阎罗王战败，其分身降临于“酆都祭坛”............")
			sendmsg(actor,2,'{"Msg":"玛法大事件：酆都古域的<阎罗王/FCOLOR=254>战败，其分身降临于<“戳仙楼阁,海市蜃楼,隔世花园,西烈荒原”/FCOLOR=253>其中一个地图............","FColor":251,"BColor":0,"Type":5,"Y":100,"Time":3}')
		end
	end
	
	----击杀七星神王
	if getname(mon) == "七星神王" and getmap(mon) == "qxt5" then
		--sendmsg6(actor,"击杀酆都阎罗王 标记值".. tostring(getcurrent(mon,0)))
		
		local jiangchinum = getsysint("七星塔击杀奖池")
		if jiangchinum > 0 then
			sendmail("#"..getname(actor),1,"系统","七星塔击杀boss奖励","绑定金币#"..jiangchinum)
		end
		setsysstr("七星塔击杀者",getname(actor))
		setsysint("七星塔击杀奖池",0)
		local hanghuiming = getbaseinfo(actor,36)
		setsysstr("七星塔击杀者行会",hanghuiming)
		sendmsg(actor,2,'{"Msg":"恭喜玩家['..getname(actor)..']成功击杀七星塔顶层Boss“'..getname(mon)..'”将获得大量福利！","FColor":255,"BColor":0,"Type":5,"Y":100,"Time":3}')
		
		local t=getplayerlst()
		for k, v  in ipairs(t) do
			qixingta_buffchuli(v) --七星塔buff处理
		end
		--sendmsg0(actor,"恭喜玩家["..getname(actor).."]成功击杀七星塔顶层Boss“"..getname(mon).."”将获得大量福利！")
		--setsysint("七星塔BOSS死亡时间",os.time())
	end
	
	if getmap(mon) == "qxt5" and qxt_shaguai[getname(mon)] then
		setsysint("七星塔死亡时间",os.time())
	end
	
	if giveshangjin_t[guainame] then
		if getingot(actor) >= 100000 then
			addshangjinzhi(actor,giveshangjin_t[guainame]*2)
		else
			addshangjinzhi(actor,giveshangjin_t[guainame])
		end
	end
	
	----怪物死亡几率复活到谜之幻境
	
	----杀怪鞭尸出boss
	if bianshidata[guainame] and not jinzhibianshiditu[getmap(actor)] then
		local ditu = getmap(actor)
		local bosst = bianshidata[guainame].boss
		local hour = tonumber(os.date("%H",os.time()))
		if getsysint(ditu.."鞭尸小时") ~= 100+hour and (hasbuff(actor,10001) or hasbuff(actor,20083)) and math.random(1,600) == 1 then
			genmon(mapid,getx(mon),gety(mon),bosst[math.random(1,#bosst)],0,1,245)
			setsysint(ditu.."鞭尸小时",hour+100)
		end
	end
end

local huoxiskill = {[13]=1,[26]=1,[56]=1,[45]=1,[22]=1,[58]=1}
--[[
--暴击触发
function crittrigger(actor,shoujizhe,hp,MagicId) --玩家对象，受击对象，暴击后伤害值
	--sendmsg6(actor,"暴击触发")
	setint(actor,"此刀暴击",1,0)
	if getbaseinfo(shoujizhe,-1) and getint(shoujizhe,"武穆遗书3编号") == 34 and huoxiskill[MagicId] then
		--sendmsg0(0,"防火系暴击前伤害"..hp)
		hp = math.floor(hp/1.8)
		--sendmsg0(0,"防火系暴击后伤害"..hp)
		setattackefftype(actor,1)
	else	
		if getbaseinfo(shoujizhe,-1) then --人打人
			if getint(shoujizhe,"武穆遗书3编号") == 26 then
				if not hasbuff(shoujizhe,20074) then
					addbuff(shoujizhe,20074)
				end
			end
			if getint(shoujizhe,"武穆遗书3编号") == 41 then
				if not hasbuff(shoujizhe,20092) then
					addbuff(shoujizhe,20092)
				end
			end
			
			local baojishanhai = getbaseinfo(actor,51,22) --暴击伤害
			local baojijianmian = getbaseinfo(shoujizhe,51,24) --暴击减免
			if baojijianmian > 0 then
				local baojibaifenbi = 80 + baojishanhai - baojijianmian
				if baojibaifenbi < 0 then
					baojibaifenbi = 0
				end
				hp = math.floor(hp/1.8) --基础血量
				hp = hp + math.floor(hp * (baojibaifenbi/100))
			end
		end

		playeffect(shoujizhe,20002,0,0,1,0,0)
	end
	
	return hp
end
--]]

--local daoshu = 0
--玩家攻击掉血前   只有玩家攻击掉血前触发 不包含玩家宝宝 即 actor始终等于 gongjizhe   如出现引擎问题再加限制

local shabakewuqi_t = {
	["裁决之杖"]=2,["血饮"]=3,["龙纹剑"]=4,["怒斩"]=2,["龙牙"]=3,["逍遥扇"]=4,["屠龙"]=2,["嗜魂法杖"]=3,["霸者之刃"]=4,["骨玉权杖"]=3,
}
--三次合区 以下怪物包含带数字的 攻击力增加 20-20	五次合区增加 35-35	七次合区以后 50-50 	  九次合区后60-60
local jiagongji1 = {["蚩尤之主"]=1,["盘丝大仙"]=1,["封魔冥界教父"]=1,["通天教主"]=1,["秦始皇"]=1,["远古祖玛教父"]=1,["玛法判官"]=1,
["不朽帝皇"]=1,["不朽大帝"]=1,["谛听兽"]=1,["上古谛听"]=1,["远古双头金刚"]=1,["远古双头血魔"]=1,["远古赤月恶魔"]=1,
["烟花异兽"]=1,["烟花教主"]=1,["暗之魔龙教主"]=1,["邪魔统帅"]=1,["地藏魔王"]=1,["万恶之主"]=1,["玛雅守护神"]=1,
["卧龙庄主"]=1,["七星神王"]=1,["未知教主"]=1,["未知巨魔"]=1,["破面"]=1,}
--五次合区以后 以下地图以下怪物攻击力增加20-20  七次合区以后增加35-35	九次合区增加50-50	   十一次合区后60-60
local jiagongji2 = {["蛮荒霸主"]=1,["蛮荒永恒剑圣"]=1,["神域教主"]=1,["神域审判者"]=1,["铁血守护神"]=1,["洪荒烛九阴"]=1,["堕落女皇"]=1,["深渊裂天兕"]=1,
["桃花结义之君"]=1,["桃花恶魔领袖"]=1,["幽冥古墓千夫长"]=1,["幽冥暗月魔尊"]=1,["地狱炎魔教父"]=1,["地狱炎魔霸主"]=1,["酆都判官"]=1,
["酆都阎罗王"]=1,["天苍弑神骨龙"]=1,["帝王主宰者"]=1,}
local gongshakedaguai = {["wlsz"]=1,["0"]=1,["3"]=1,["0150"]=1,["aqgj1"]=1,["aqgj2"]=1,["aqgj3"]=1,["aqgj4"]=1} --攻城期间可打怪地图

-- function attackdamage(actor,shoujizhe,gongjizhe,skillid,hp) --触发对象，受击者，攻击者，技能id，伤害值
-- 	--sendmsg6(actor,"此刀暴击"..getint(actor,"此刀暴击"))
-- 	--sendmsg6(actor,"攻击触发初始伤害"..hp.."  是否有魔法盾"..tostring(callcheckscriptex(shoujizhe,"checkHumanState",1)))
-- 	--sendmsg6(actor,"触发对象"..actor .."  受击者"..shoujizhe.."  攻击者"..gongjizhe.."  技能id"..skillid)
-- 	--sendmsg6(actor,"受击者"..getmap(actor).."x坐标"..getx(actor).."y坐标"..gety(actor))
	
-- 	--sendmsg6(shoujizhe,"触发对象："..getname(actor) .."  受击者："..getname(shoujizhe).."  攻击者："..getname(gongjizhe).."  血量："..hp)
-- 	--sendmsg0(0,"修改前攻击"..getbaseinfo(shoujizhe,19).."-"..getbaseinfo(shoujizhe,20))
-- 	if not getbaseinfo(shoujizhe,-1) then --怪物
-- 		local hqcs = getsysint("合区次数")
-- 		if jiagongji1[getname(shoujizhe)] then
-- 			local addshuxing = 0
-- 			if not hasbuff(shoujizhe,20116) then
-- 				if hqcs >= 9 then
-- 					addshuxing = 60
-- 				elseif hqcs >= 7 then
-- 					addshuxing = 50
-- 				elseif hqcs >= 5 then
-- 					addshuxing = 35
-- 				elseif hqcs >= 3 then
-- 					addshuxing = 20
-- 				end 
-- 				if addshuxing > 0 then
-- 					addbuff(shoujizhe,20116,0,1,shoujizhe,{[3]=addshuxing,[4]=addshuxing})
-- 				end
-- 			end
-- 		end
-- 		if jiagongji2[getname(shoujizhe)] then
-- 			local addshuxing = 0
-- 			if not hasbuff(shoujizhe,20116) then
-- 				if hqcs >= 11 then
-- 					addshuxing = 60
-- 				elseif hqcs >= 9 then
-- 					addshuxing = 50
-- 				elseif hqcs >= 7 then
-- 					addshuxing = 35
-- 				elseif hqcs >= 5 then
-- 					addshuxing = 20
-- 				end 
-- 				if addshuxing > 0 then
-- 					addbuff(shoujizhe,20116,0,1,shoujizhe,{[3]=addshuxing,[4]=addshuxing})
-- 				end
-- 			end
-- 		end
-- 	end
-- 	--sendmsg0(0,"修改后攻击"..getbaseinfo(shoujizhe,19).."-"..getbaseinfo(shoujizhe,20))
-- 	--haoshistart(actor) --耗时开始
	
	
-- 	if not getbaseinfo(shoujizhe,-1) and getbaseinfo(shoujizhe,59) == "0" and castleinfo(5) and not gongshakedaguai[getmap(actor)] then --打怪
-- 		stopautoattack(actor)
-- 		mapmove(actor,"0",289,617,10)
-- 		messagebox(actor,"攻城期间部分地图禁止打怪")
-- 		setint(actor,"此刀暴击",0,0)
-- 		return 0
-- 	end
-- 	---试刀
-- 	local item = linkbodyitem(actor,1)
-- 	if item ~= "0" then
-- 		if getitem_shabake(actor,item) == 1 and skillid == 0 then
-- 			local iname = getitemname(actor,item)
-- 			if shabakewuqi_t[iname] then
-- 				local attid = 2
-- 				if shabakewuqi_t[iname] then
-- 					attid = shabakewuqi_t[iname]
-- 				end
-- 				if math.random(1,100) < 50 then
-- 					setitemaddvalue(actor,item,1,attid,getitemaddvalue(actor,item,1,attid)+1) 
-- 					setitem_shabake(actor,item,0)
-- 					refreshitem(actor, item)
-- 					sendmsg(actor,1,'{"Msg":"武器升级成功.","FColor":255,"BColor":56,"Type":1}')
-- 				else
-- 					delitem(actor,item)
-- 					sendmsg(actor,1,'{"Msg":"武器升级破碎.","FColor":255,"BColor":56,"Type":1}')
-- 				end
-- 			end
-- 		end
-- 	end
-- 	--试刀结束
	
-- 	local gudingshanghai = 0 --固定伤害 人物等下做减免
	
-- 	if getbaseinfo(shoujizhe,-1) and skillid==getskillidbyname("刺杀剑术") and getjob(shoujizhe) == 1 then
-- 		if getlevel(shoujizhe) < 55 then
-- 			hp = math.floor(hp*0.8)
-- 		elseif getlevel(shoujizhe) < 70 then
-- 			hp = math.floor(hp*0.9)
-- 		end
-- 	end
	
-- 	if not getbaseinfo(shoujizhe,-1) then --人打怪 对怪增伤属性暗控
-- 		local dgzs = getbaseinfo(actor,51,75) --对怪增伤属性
-- 		if dgzs > 0 then
-- 			if getbaseinfo(shoujizhe,10) < 200000 then
-- 				local yshp = math.floor(hp/(1+dgzs/10000))
-- 				hp = hp - math.floor( (yshp*dgzs/10000)/2 )
-- 			end
-- 		end
-- 	end
	
-- --[[	if getint(actor,"麻痹测试") == 1 then
-- 		makeposion(shoujizhe,5,5)
-- 	end
-- 	if getint(actor,"蛛网测试") == 1 then
-- 		makeposion(shoujizhe,13,5)
-- 	end
-- 	if getint(actor,"冰冻测试") == 1 then
-- 		makeposion(shoujizhe,12,5)
-- 	end--]]
	
-- --[[	if getname(shoujizhe) == "练功师" then
-- 		daoshu = daoshu + 1
-- 		if daoshu == 1 then
-- 			setint(actor,"第一刀时间",os.time())
-- 			sendmsg6(actor,"第一刀时间"..os.time())
-- 		end
-- 		if os.time() - getint(actor,"第一刀时间") == 60 then
-- 			sendmsg6(actor,"60秒刀数"..daoshu,"#FF0000")
-- 		end
-- 	end--]]
	
-- 	if getint(actor,"套装转生伤害") > 0 and getbaseinfo(shoujizhe,-1) then
-- 		if getbaseinfo(actor,39) <= getbaseinfo(shoujizhe,39) then
-- 			hp = hp + math.floor(hp* getint(actor,"套装转生伤害")/100 )
-- 		end
-- 	end
	
-- 	if getskillidbyname("烈火剑法") == skillid and getskillinfo(actor,getskillidbyname("烈火剑法"),1) == 4 then
-- 		hp = math.floor(hp/1.4*1.13)
-- 	end
-- 	if getskillidbyname("开天斩") == skillid and getskillinfo(actor,getskillidbyname("开天斩"),1) == 4 then
-- 		hp = math.floor(hp/1.2*1.1)
-- 	end
-- 	if getskillidbyname("逐日剑法") == skillid and getskillinfo(actor,getskillidbyname("逐日剑法"),1) == 4 then
-- 		hp = math.floor(hp/1.2*1.1)
-- 	end
-- 	if getskillidbyname("流星火雨") == skillid and getskillinfo(actor,getskillidbyname("流星火雨"),1) == 4 then
-- 		hp = math.floor(hp/1.04*1.10)
-- 	end
-- 	if getskillidbyname("火墙") == skillid and getskillinfo(actor,getskillidbyname("火墙"),1) == 4 then
-- 		hp = math.floor(hp*1.10)
-- 	end
-- 	if getskillidbyname("噬血术") == skillid and getskillinfo(actor,getskillidbyname("噬血术"),1) == 4 then
-- 		hp = math.floor(hp/1.04*1.10)
-- 	end
-- 	if os.time() - getint(actor,"最后出刀时间") >= 3 then
-- 		setint(actor,"最后出刀时间",os.time(),0)
-- 	end
-- 	if not getbaseinfo(shoujizhe,-1) and getname(shoujizhe) == "玛法神王" and getmap(shoujizhe) == "mfzd" then
-- 		if not hasbuff(actor,10055) then
-- 			setint(actor,"此刀暴击",0,0)
-- 			return 0
-- 		end
-- 	end

-- 	if not getbaseinfo(shoujizhe,-1) and getbaseinfo(gongjizhe,-1) then
-- 		if ((getsysint("合区次数") < 2 and getint(gongjizhe,"首充领取") > 0) or getdayint(gongjizhe,"日充") == 1 ) and getbaseinfo(shoujizhe,10) >= 10000 then
-- 			------带毒素攻击 
-- 			if getjob(gongjizhe) ~= 2 then
-- 				--makeposion(shoujizhe,1,30) --红毒
-- 				makeposion(shoujizhe,0,30,10) --绿毒30秒 每秒掉10点
-- 			else
-- 				hp = hp*1.1
-- 			end
-- 			------带毒素攻击段end	
-- 		end
-- 	end
	
-- 	if not getbaseinfo(shoujizhe,-1) and (getname(shoujizhe) == "火龙神" or getname(shoujizhe) == "秒人蝙蝠") then
-- 		if skillid~=getskillidbyname("刺杀剑术") then
-- 			setint(actor,"此刀暴击",0,0)
-- 			return 0
-- 		end
-- 		if getname(shoujizhe) == "火龙神" then
-- 			if #getmapmon("hlsd","",50,50,50) < 80 then
-- 				setint(actor,"此刀暴击",0,0)
-- 				return 0
-- 			end
-- 		end
-- 	end
	
-- 	if not getbaseinfo(shoujizhe,-1) and getname(shoujizhe) == "卧龙夫人" then
-- 		if os.time() - tonumber(getcurrent(shoujizhe,0)) < 180 then
-- 			setint(actor,"此刀暴击",0,0)
-- 			return 0
-- 		end
-- 	end
	
-- 	if not getbaseinfo(shoujizhe,-1) and getbaseinfo(actor,36) == "" and (getname(shoujizhe) == "卧龙夫人" or getname(shoujizhe) == "山庄护卫") then
-- 		setint(actor,"此刀暴击",0,0)
-- 		return 0
-- 	end
	
-- 	local zhansha = 0 --斩杀百分比
-- 	if hasbuff(actor,10057) then --骰王
-- 		zhansha = zhansha + 8
-- 	end
-- 	local sh_data = getshouhunbuffdata(actor) --获取兽魂buff数据
-- 	for i = 1,#sh_data do
-- 		if sh_data[i] == "雷霆一击" and getbaseinfo(shoujizhe,-1) and zhansha == 0 and not hasbuff(shoujizhe,10052) then
-- 			zhansha = zhansha + 5
-- 		end
-- 	end
-- 	if zhansha > 0 then
-- 		if getbaseinfo(shoujizhe,9) == getbaseinfo(shoujizhe,10) then --满血
-- 			local delhp = math.floor(getbaseinfo(shoujizhe,10) * zhansha/100)
-- 			gudingshanghai = gudingshanghai + delhp
-- 			hp = hp + delhp
-- 			--humanhp(shoujizhe,"-",delhp,1)
-- 			--sendmsg6(actor,"斩杀满血"..zhansha.."%")
-- 		end
-- 	end
	
-- 	local zhongjilv = getbaseinfo(actor,51,201) --重击几率万分比
-- 	local zhongjish = getbaseinfo(actor,51,202) --重击伤害加成
-- 	local zhongjijm = getbaseinfo(shoujizhe,51,208) --重击伤害减免
-- 	if zhongjilv > 0 and getint(actor,"此刀暴击") == 0 then 
-- 		if math.random(1,10000) <= zhongjilv then
-- 			if getbaseinfo(shoujizhe,-1) and getint(shoujizhe,"武穆遗书3编号") == 34 and huoxiskill[skillid] then
-- 			else
-- 				--sendmsg0(actor,"重击伤害加成"..zhongjish.. "  重击伤害减免"..zhongjijm)
-- 				hp = math.floor(hp* (2.4+zhongjish/10000 - zhongjijm/10000)) --重击伤害
-- 				--sendmsg6(actor,"重击伤害"..hp)
-- 				sendattackeff(shoujizhe,201,hp,"*")
-- 				--setattackefftype(gongjizhe,201)
-- 			end
-- 		end
-- 	end
	
-- 	setint(actor,"此刀暴击",0,0)
	
-- 	if hasbuff(actor,10055) then
-- 		if not hasbuff(shoujizhe,10056) then
-- 			addbuff(shoujizhe,10056) --回城延迟
-- 		end
-- 	end
	
-- 	--减蓝属性处理
-- 	local jianlanzhi = getbaseinfo(actor,51,205) --减蓝万分比
-- 	if jianlanzhi > 0 and getbaseinfo(shoujizhe,-1) and getint(shoujizhe,"武穆遗书3编号")~=47 and not hasbuff(shoujizhe,10052)  then
-- 		local curmp = getbaseinfo(shoujizhe,11) --当前蓝量
-- 		local maxmp = getbaseinfo(shoujizhe,12) --蓝量
-- 		local delmp = math.floor(maxmp * jianlanzhi/10000)
-- 		if delmp > curmp then
-- 			delmp = curmp
-- 		end
-- 		humanmp(shoujizhe,"-",delmp)
-- 		humanmp(actor,"+",delmp)
-- 		--sendmsg6(actor,"扣除血量"..hp.." 扣除蓝量"..delmp)
-- 	end
	
	
-- 	if getbaseinfo(shoujizhe,-1) then --人打人
-- 		if getint(gongjizhe,"官运等级") < getint(shoujizhe,"官运等级") then
-- 			hp = math.floor(hp*0.95)
-- 		end

-- 		----五行相克
-- 		if getint(gongjizhe,"五行当前属性") > 0 then
-- 			if getint(gongjizhe,"五行当前属性") + 1 == getint(shoujizhe,"五行当前属性") or ( getint(gongjizhe,"五行当前属性") == 5 and getint(shoujizhe,"五行当前属性") == 1 ) then
-- 				hp = math.floor(hp*1.06)
-- 				--sendmsg6(actor,"克了")
-- 			end
-- 		end
-- 	end
-- 	if not getbaseinfo(shoujizhe,-1) then --人打怪
-- 		local sxzl = getint(gongjizhe,"四象之力总值")
-- 		local sxzl_jc = getbaseinfo(actor,51,200)
-- 		if sxzl > 0 then
-- 			local sxzlsh = math.floor(sxzl*(1+sxzl_jc/10000))
-- 			if getbaseinfo(shoujizhe,10) <= 5000 then
-- 				sxzlsh = math.floor(sxzlsh/2)
-- 			end
-- 			hp = hp + sxzlsh
-- 			--sendmsg6(gongjizhe,"四象之力伤害".. sxzlsh)
-- 		end
-- 	end
	
-- 	----兽魂buff处理
-- 	if getbaseinfo(shoujizhe,-1) and hasbuff(shoujizhe,10052) then
-- 	else
-- 		local sh_data = getshouhunbuffdata(actor) --获取兽魂buff数据
-- 		for i = 1,#sh_data do
-- 			if sh_data[i] ~= "" and shouhun_gongjicl[sh_data[i]] then
-- 				local addhp,gushang = shouhun_gongjicl[sh_data[i]](gongjizhe,shoujizhe,hp,skillid,gudingshanghai)
-- 				hp = hp + addhp
-- 				if gushang then
-- 					gudingshanghai = gudingshanghai + gushang
-- 				end
-- 			end
-- 		end
-- 	end
-- 	--
-- 	----兽魂buff处理结束
-- 	----武穆遗书buff处理----------------------------------------------------------------------------
-- 	----武穆遗书buff处理----------------------------------------------------------------------------
-- 	----武穆遗书buff处理----------------------------------------------------------------------------
-- 	if getbaseinfo(shoujizhe,-1) and hasbuff(shoujizhe,10052) then
-- 	else
-- 		if getbaseinfo(shoujizhe,-1) then --打人
-- 			local yinji = linkbodyitem(actor,14) --印记
-- 			if yinji ~= "0" then
-- 				if getitemname(actor,yinji) == "断玉钩" or getitem_fabaozhi(actor,yinji) == 1 then
-- 					if getlevel(shoujizhe) - getlevel(actor) <= 3 and math.random(1,100) < 2 then
-- 						if getint(shoujizhe,"武穆遗书3编号") == 35 then
-- 						elseif getint(shoujizhe,"武穆遗书3编号") == 5 then
-- 							if math.random(1,100) < 50 then
-- 								makeposion(shoujizhe,5,3)
-- 							end
-- 						else
-- 							makeposion(shoujizhe,5,3)
-- 						end
-- 					end
-- 				end
-- 			end
-- 		end
-- 		if getint(actor,"武穆遗书2编号") == 19 and skillid == getskillidbyname("火墙") then --火墙
-- 			if getbaseinfo(shoujizhe,-1) and getint(shoujizhe,"武穆遗书3编号")==34 then
-- 			else
-- 				if math.random(1,100) < 10 then
-- 					hp = math.floor(hp*1.8)
-- 					setattackefftype(actor,2)
-- 					--sendmsg6(actor,"火墙暴击触发")
-- 				end
-- 			end
-- 		end

-- 		if getbaseinfo(shoujizhe,-1) and getint(actor,"武穆遗书2编号") == 20 and skillid == getskillidbyname("疾光电影") then --疾光电影
-- 			local maxhp = getbaseinfo(shoujizhe,10)
-- 			hp = hp + math.floor(maxhp*0.02)
-- 			--sendmsg6(actor,"触发闪电穿行 释放疾光电影额外造成目标人物3%最大血量伤害")
-- 		end
		
-- 		if getbaseinfo(shoujizhe,-1) and getint(actor,"武穆遗书2编号")==21 and skillid==getskillidbyname("灭天火") and gethumnewvalue(shoujizhe,11)==0 and gethumnewvalue(shoujizhe,12)==0 then
-- 			local mfxx = getbaseinfo(shoujizhe,17) --魔防下限
-- 			local mfsx = getbaseinfo(shoujizhe,18) --魔防上限	
-- 			local xxz = -10
-- 			local sxz = -15
-- 			if mfxx + xxz < 0 then
-- 				xxz = -mfxx
-- 			end
-- 			if mfsx + sxz < 0 then
-- 				sxz = -mfsx
-- 			end
-- 			changehumnewvalue(shoujizhe,11,xxz,10)
-- 			changehumnewvalue(shoujizhe,12,sxz,10)
-- 			--sendmsg6(actor,"降低对方魔防20-20 10秒 ".. xxz .." "..sxz)
-- 		end
		
-- 		if getbaseinfo(shoujizhe,-1) and getint(actor,"武穆遗书2编号")==25 and skillid==getskillidbyname("灭天火") then
-- 			if getbaseinfo(actor,9) / getbaseinfo(actor,10) > 0.9 and math.random(1,100) <= 3 then
-- 				local maxhp = getbaseinfo(shoujizhe,10)
-- 				hp = hp + math.floor(maxhp*0.06)
-- 				playeffect(shoujizhe,105,0,0,1,0,0)
-- 				--sendmsg6(actor,"触发末日审判,斩杀敌对目标人物总血量6%")
-- 			end
-- 		end
		
-- 		if getbaseinfo(shoujizhe,-1) and getint(actor,"武穆遗书2编号")==26 and (skillid==getskillidbyname("灭天火") or skillid==getskillidbyname("流星火雨")) then
-- 			if math.random(1,100) <= 6 then
-- 				local mofa = getbaseinfo(actor,22)
-- 				hp = hp + math.floor(mofa*0.6)	
-- 				playeffect(shoujizhe,56,0,0,1,0,0)
-- 				gudingshanghai = gudingshanghai + math.floor(mofa*0.6)
-- 				--sendmsg6(actor,"使用灭天火或者流星火雨时10%概率召唤雷电,造成自身魔法上限60%的固定伤害")
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书2编号")==27 and skillid==getskillidbyname("冰咆哮") and os.time() - getint(actor,"上次聚魔时间") >= 300 then
-- 				local mofa = getbaseinfo(actor,22)
-- 				hp = hp + mofa
-- 				gudingshanghai = gudingshanghai + mofa
-- 				setint(actor,"上次聚魔时间",os.time())
-- 				--sendmsg6(actor,"每300秒获得一次聚魔效果.使用冰咆哮造成自身魔法上限100%的固定伤害")
-- 		end
		
-- 		if getint(actor,"武穆遗书2编号")==30 and skillid==getskillidbyname("烈火剑法") and getbaseinfo(shoujizhe,-1) then
-- 				local maxhp = getbaseinfo(shoujizhe,10)
-- 				hp = hp + math.floor(maxhp*0.05)
-- 				--sendmsg6(actor,"释放烈火剑法每次命中将额外斩杀目标人物5%总血量")
-- 		end
		
-- 		if getint(actor,"武穆遗书2编号")==31 and skillid==getskillidbyname("半月弯刀")  then
-- 			local gongji = getbaseinfo(actor,20)
-- 			hp = hp + math.floor(gongji*0.1)
-- 			gudingshanghai = gudingshanghai + math.floor(gongji*0.1)
-- 			--sendmsg6(actor,"使用半月弯刀攻击每次附带攻击上限10%的额外固定伤害")
-- 		end
		
-- 		if getbaseinfo(shoujizhe,-1) and getint(actor,"武穆遗书2编号")==32 and skillid==getskillidbyname("刺杀剑术") then
-- 			local cishajianmian = getbaseinfo(shoujizhe,51,87) --刺杀减免比例
-- 			if cishajianmian > 0 then
-- 				hp = math.floor(hp / (1-cishajianmian/10000))
-- 				--sendmsg6(actor,"刺杀剑术忽视目标一切刺杀抵抗效果")
-- 			end
-- 		end

-- 		if getint(actor,"武穆遗书2编号")==33 and skillid==getskillidbyname("攻杀剑术")  then
-- 			hp = hp + 50
-- 			gudingshanghai = gudingshanghai + 50
-- 			--sendmsg6(actor,"释放攻杀剑术每次攻击附带50点固定伤害")
-- 		end
		
-- 		if getint(actor,"武穆遗书2编号")==34 and skillid==getskillidbyname("烈火剑法")  then
-- 			if math.random(1,100) <= 25 and getint(actor,"双烈火") == 0 then
-- 				setint(actor,"双烈火",1)
-- 				releasemagic(actor,skillid,1,getskilllevel(actor,"烈火剑法"),1,1)
-- 				--sendmsg6(actor,"使用烈火剑法后有20%几率清除CD形成双烈火")
-- 			elseif getint(actor,"双烈火") == 1 then
-- 				setint(actor,"双烈火",0)
-- 			end
-- 		end

-- 		if getint(actor,"武穆遗书2编号")==36 and skillid==getskillidbyname("开天斩") and getbaseinfo(shoujizhe,-1)  then
-- 			if math.random(1,100) <= 18 then
-- 				playeffect(shoujizhe,10066,10,0,1,0,0)
-- 				makeposion(shoujizhe,12,2)
-- 				--sendmsg6(actor,"释放开天斩时有18%几率使目标冰冻2秒")
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==6 and getbaseinfo(shoujizhe,-1) then
-- 			if getbaseinfo(shoujizhe,9)/getbaseinfo(shoujizhe,10) < 0.5 then
-- 				hp = math.floor(hp*1.03)
-- 				--sendmsg6(actor,"攻击血量低于50%的目标时.额外增加3%的伤害")
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==7 and getbaseinfo(shoujizhe,-1) then
-- 			if getbaseinfo(shoujizhe,9)/getbaseinfo(shoujizhe,10) < 0.5 then
-- 				hp = math.floor(hp*1.06)
-- 				--sendmsg6(actor,"攻击血量低于50%的目标时.额外增加6%的伤害")
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==10 then
-- 			if math.random(1,100) <= 2 and getbaseinfo(shoujizhe,-1) then
-- 				callscriptex(shoujizhe, "changespeedex", 1, -50,5)
-- 				--sendmsg6(actor,"攻击时有2%的概率使对方移动速度降低50%持续5秒")
-- 				sendmsg9(shoujizhe,"你受到了".. getname(gongjizhe) .."的'寸步难移'当前移动速度降低50%持续5秒")
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==12 then
-- 			if getbaseinfo(shoujizhe,-1) and not hasbuff(shoujizhe,20069) then
-- 				addbuff(shoujizhe,20069)
-- 				--sendmsg6(actor,"攻击时降低目标10%的药品疗效,持续30秒")
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==13 then
-- 			if getbaseinfo(shoujizhe,-1) and not hasbuff(shoujizhe,20070) then
-- 				addbuff(shoujizhe,20070)
-- 				--sendmsg6(actor,"攻击时降低目标20%的药品疗效,持续30秒")
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==18 and getbaseinfo(shoujizhe,-1) then  --被攻击者MP低于50% 将受到15%的额外伤害
-- 			if getbaseinfo(shoujizhe,11)/getbaseinfo(shoujizhe,12) < 0.5 then
-- 				hp = math.floor(hp*1.15)
-- 				--sendmsg6(actor,"被攻击者MP低于60% 将受到15%的额外伤害")
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==20 and getbaseinfo(shoujizhe,-1) then  --使被攻击者降低10%体力上限,持续20秒(不可叠加)
-- 			if not hasbuff(shoujizhe,20072) then
-- 				addbuff(shoujizhe,20072)
-- 				--sendmsg6(actor,"使被攻击者降低10%体力上限,持续20秒(不可叠加)")
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==21 and getbaseinfo(shoujizhe,-1) then  --攻击比自己等级高的玩家时，每相差1级，造成1%的额外伤害
-- 			if getlevel(actor) < getlevel(shoujizhe) then
-- 				hp = hp + math.floor(hp * (getlevel(shoujizhe)-getlevel(actor))/100)
-- 				--sendmsg6(actor,"攻击比自己等级高的玩家时，每相差1级，造成1%的额外伤害")
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==24 and getbaseinfo(shoujizhe,-1) then  --目标人物低于8%的血量直接斩杀
-- 			if getbaseinfo(shoujizhe,9)/getbaseinfo(shoujizhe,10) < 0.08 then
-- 				--sendmsg6(actor,"目标人物低于5%的血量直接斩杀")
-- 				return math.floor(getbaseinfo(shoujizhe,10) * 0.1)
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==39 and getbaseinfo(shoujizhe,-1) then  --目标人物低于15%的血量直接斩杀
-- 			if getbaseinfo(shoujizhe,9)/getbaseinfo(shoujizhe,10) < 0.16 then
-- 				--sendmsg6(actor,"目标人物低于15%的血量直接斩杀")
-- 				return math.floor(getbaseinfo(shoujizhe,10) * 0.16) + 100
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==14 and getbaseinfo(shoujizhe,-1) then  
-- 			if math.random(1,100) <= 5 then
-- 				if not hasbuff(shoujizhe,20075) then
-- 					addbuff(shoujizhe,20075)
-- 					--sendmsg6(actor,"攻击时3%的概率让对方诅咒+2持续12秒")
-- 				end
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==42 and getbaseinfo(shoujizhe,-1) then  --目标受到自己攻击时.降低目标幸运两点.持续10秒	
-- 			if not hasbuff(shoujizhe,20079) then
-- 				addbuff(shoujizhe,20079)
-- 				--sendmsg6(actor,"目标受到自己攻击时.降低目标幸运两点.持续10秒")
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==30 and getbaseinfo(shoujizhe,-1) then  
-- 			if getbaseinfo(shoujizhe,9)/getbaseinfo(shoujizhe,10) > 0.75 then
-- 				hp = math.floor(hp * 1.1)
-- 				--sendmsg6(actor,"对血量高于百分之80的目标造成1.1倍伤害")
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==31 and getbaseinfo(shoujizhe,-1) then  --痛击人物灵魂对目标人物造成本职业主属性上限10%的额外固定伤害
-- 			local gongji = getbaseinfo(actor,20)
-- 			local mofa = getbaseinfo(actor,22)
-- 			local daoshu = getbaseinfo(actor,24)
-- 			--sendmsg6(actor,"攻击"..gongji.." 魔法"..mofa.." 道术"..daoshu)
-- 			local job = getjob(actor)
-- 			if job == 0 then
-- 				hp = hp + math.floor(gongji*0.1)
-- 				gudingshanghai = gudingshanghai + math.floor(gongji*0.1)
-- 			end
-- 			if job == 1 then
-- 				hp = hp + math.floor(mofa*0.1)
-- 				gudingshanghai = gudingshanghai + math.floor(mofa*0.1)
-- 			end
-- 			if job == 2 then
-- 				hp = hp + math.floor(daoshu*0.1)
-- 				gudingshanghai = gudingshanghai + math.floor(daoshu*0.1)
-- 			end
-- 			--sendmsg6(actor,"痛击人物灵魂对目标人物造成本职业主属性上限10%的额外固定伤害")
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==32 and getbaseinfo(shoujizhe,-1) then  --痛击人物灵魂对目标人物造成本职业主属性上限20%的额外固定伤害
-- 			local gongji = getbaseinfo(actor,20)
-- 			local mofa = getbaseinfo(actor,22)
-- 			local daoshu = getbaseinfo(actor,24)
-- 			--sendmsg6(actor,"攻击"..gongji.." 魔法"..mofa.." 道术"..daoshu)
-- 			local job = getjob(actor)
-- 			if job == 0 then
-- 				hp = hp + math.floor(gongji*0.15)
-- 				gudingshanghai = gudingshanghai + math.floor(gongji*0.15)
-- 			end
-- 			if job == 1 then
-- 				hp = hp + math.floor(mofa*0.15)
-- 				gudingshanghai = gudingshanghai + math.floor(mofa*0.15)
-- 			end
-- 			if job == 2 then
-- 				hp = hp + math.floor(daoshu*0.15)
-- 				gudingshanghai = gudingshanghai + math.floor(daoshu*0.15)
-- 			end
-- 			--sendmsg6(actor,"痛击人物灵魂对目标人物造成本职业主属性上限15%的额外固定伤害")
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==36 and getbaseinfo(shoujizhe,-1) then --攻击时有2%的概率使敌人变色.降低攻击速度3点,主属性降低15%,持续5秒
-- 			if math.random(1,100) <= 2 then
-- 				--callscriptex(shoujizhe, "changespeedex", 2, -30,5) --攻击速度
-- 				--callscriptex(shoujizhe, "changespeedex", 3, -30,10) --魔法速度
-- 				setbaseinfo(shoujizhe,58,146,5) --设置身体颜色
				
-- 				local gongji = getbaseinfo(shoujizhe,20)
-- 				local mofa = getbaseinfo(shoujizhe,22)
-- 				local daoshu = getbaseinfo(shoujizhe,24)
-- 				--sendmsg6(actor,"攻击"..gongji.." 魔法"..mofa.." 道术"..daoshu)
-- 				local job = getjob(shoujizhe)
-- 				local zhushuxing = gongji
-- 				if job == 1 then
-- 					zhushuxing = mofa
-- 				elseif job == 2 then
-- 					zhushuxing = daoshu
-- 				end
-- 				local zhi = math.floor(zhushuxing*0.15)
-- 				if not hasbuff(shoujizhe,20091) then
-- 					addbuff(shoujizhe,20091,0,zhi)
-- 					addbuff(shoujizhe,20103,0)
-- 					sendmsg9(shoujizhe,getname(gongjizhe).."对你使用了'嗜血魔功'，当前攻速减少5点主属性降低15%持续5秒")
-- 				end
-- 				--sendmsg6(shoujizhe,"攻击时有2%的概率使敌人变色.降低攻击速度3点,主属性降低15%,持续5秒")
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书3编号")==37 and getbaseinfo(shoujizhe,-1) then  --被攻击者MP低于60% 将受到15%的额外伤害
-- 			if getbaseinfo(shoujizhe,11)/getbaseinfo(shoujizhe,12) < 0.5 then
-- 				hp = math.floor(hp*1.3)
-- 				--sendmsg6(actor,"被攻击者MP低于50%,将受到30%的额外伤害")
-- 			end
-- 		end
-- 		if getint(actor,"武穆遗书3编号")==47 then
-- 			if getbaseinfo(shoujizhe,-1) and not hasbuff(shoujizhe,20094) then
-- 				addbuff(shoujizhe,20094)
-- 				--sendmsg6(actor,"降低目标魔法躲避50%,无视对方吸蓝以及降蓝BUFF效果")
-- 			end
-- 		end
-- 		if getint(actor,"武穆遗书3编号")==48 and not getbaseinfo(shoujizhe,-1) and getbaseinfo(shoujizhe,10) >= 100000 then
-- 			if getbaseinfo(shoujizhe,9)/getbaseinfo(shoujizhe,10) < 0.1 then
-- 				return getbaseinfo(shoujizhe,9) + 100
-- 			end
			
-- 			if math.random(1,100) <= 2 and os.time() - getint(actor,"武穆遗书3编号48时间") > 180 then
-- 				hp = hp + math.floor(getbaseinfo(shoujizhe,9)*0.02)
-- 				setint(actor,"武穆遗书3编号48时间",os.time())
-- 			end
-- 		end
-- 	end
-- 	----武穆遗书buff处理结束----------------------------------------------------------------------------
-- 	----武穆遗书buff处理结束----------------------------------------------------------------------------
-- 	----武穆遗书buff处理结束----------------------------------------------------------------------------
	
	
-- 	local gushangjianmian = getbaseinfo(shoujizhe,51,214) 
-- 	if gudingshanghai > 0 and gushangjianmian > 0 and getbaseinfo(shoujizhe,-1) then	
-- 		if gushangjianmian > gudingshanghai then --如果固伤减免大于固定伤害时
-- 			gushangjianmian = gudingshanghai
-- 		end
-- 		hp = hp - gushangjianmian
-- 	end
-- 	--sendmsg0(0,"固定伤害"..gudingshanghai.."  固伤减免"..gushangjianmian)
	
-- 	--haoshiend(actor) --耗时结束
-- 	return hp
-- end


--攻击前流程完成后 进入 玩家受击掉血前

--玩家受击掉血前
-- function struckdamage(actor,gongjizhe,shoujizhe,skillid,hp)
	
-- 	--haoshistart(actor) --耗时开始
-- 	--sendmsg6(actor,"触发对象"..getname(actor) .."  受击者"..getname(shoujizhe).."  攻击者"..getname(gongjizhe).."  技能id"..skillid)
-- 	if skillid == getskillidbyname("流星火雨") and getbaseinfo(actor,48) then
-- 		return 0
-- 	end
	
-- 	if not getbaseinfo(gongjizhe,-1) and getname(gongjizhe) == "爆裂蜘蛛" then
-- 		killmonbyobj(actor,gongjizhe,false,false,true)
-- 		if hasbuff(actor,20105) or hasbuff(actor,20107) then --无敌模式	
-- 			return 0
-- 		else
-- 			return math.floor(getbaseinfo(actor,10) * 0.05)
-- 		end
-- 	end
	
-- 	if not getbaseinfo(gongjizhe,-1) and getname(gongjizhe) == "秒人蝙蝠" then
-- 		killmonbyobj(actor,gongjizhe,false,false,true)
-- 		genmon("hlsd",50,50,"秒人蝙蝠",50,1,253)
-- 	end
	
-- 	if hasbuff(actor,20105) or hasbuff(actor,20107) then --无敌模式
-- 		return 0
-- 	end
	
-- 	---受怪物触发
-- 	if not getbaseinfo(gongjizhe,-1) and not hasbuff(actor,20111) then
-- 		if getname(gongjizhe) == "天苍弑神骨龙" then
-- 			if math.random(1,100) < 10 then
-- 				makeposion(actor,12,3)
-- 				sendmsg9(actor,"你被天苍弑神骨龙释放的永恒冰封，冰冻3秒","#FFD700")
-- 				playeffect(actor,10066,10,0,1,0,0)
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "盘丝大仙" then
-- 			local lasttime = getguaigongjitime(gongjizhe) --最后攻击时间
-- 			if os.time() - lasttime >= 60 then
-- 				local suijizhi = math.random(1,100)
-- 				hp = hp + math.floor(getbaseinfo(actor,10) * 0.1)
-- 				sendmsg9(actor,"你受到了怪物盘丝大仙的秒血伤害","#FFD700")
-- 				setguaigongjitime(gongjizhe,os.time())
-- 				playeffect(actor,11021,0,0,1,0,0)
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "通天教主" then
-- 			if skillid == -138 then
-- 				if math.random(1,100) < 70 then
-- 					makeposion(actor, 1, 60)
-- 					sendmsg9(actor,"你受到了通天教主的毒素伤害","#FFD700")
-- 				else
-- 					makeposion(actor, 5, 5)
-- 					sendmsg9(actor,"你被通天教主定身了持续5秒","#FFD700")
-- 				end
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "蛮荒永恒剑圣" then
-- 			if skillid == -126 then
-- 				local lasttime = tonumber(getcurrent(gongjizhe,7)) or 0 --最后攻击时间
-- 				if os.time() - lasttime >= 60 or os.time() == lasttime then
-- 					if math.random(1,100) < 70 then
-- 						changespeed(actor,1,-5,15)
-- 						sendmsg9(actor,"你中了蛮荒永恒剑圣的烈焰灼烧，移动速度降低50%持续15秒","#FFD700")
-- 					else
-- 						addbuff(actor,20097,10)
-- 						sendmsg9(actor,"你中了蛮荒永恒剑圣的烈焰灼烧双防清零持续10秒","#FFD700")
-- 					end
-- 					setcurrent(gongjizhe,7,tostring(os.time()))
-- 				end
-- 			end
-- 		end
		
-- 		if getname(gongjizhe) == "邪魔统帅" then
-- 			local texiaoid = {20030,20031,20032,20033,20034}
-- 			for i = 1,10 do
-- 				mapeffect(1000+i,getmap(actor),getx(actor)+math.random(-6,6),gety(actor)+math.random(-4,4),texiaoid[math.random(1,5)],2,0) 
-- 			end
-- 			if skillid == -140 then
-- 				setsysint("统帅拉人",0)
-- 				setsysint("统帅麻痹",0)
-- 			end
			
-- 			if skillid == -141 then
-- 				if getsysint("统帅拉人") == 0 then
-- 					if math.random(1,100) < 50 then
-- 						setsysint("统帅拉人",1)
-- 						if math.random(1,100) < 50 then
-- 							setsysint("统帅麻痹",1)
-- 						end
-- 					end
-- 				end
-- 				if getsysint("统帅拉人") == 1 then
-- 					mapmove(actor,getmap(gongjizhe),getx(gongjizhe),gety(gongjizhe),3)
-- 					if getsysint("统帅麻痹") == 1 then
-- 						makeposion(actor, 5, 2)
-- 					end
-- 				end
-- 			end
-- 		end
		
-- 		if getname(gongjizhe) == "山庄护卫" then
-- 			local texiaoid = {20030,20031,20032,20033,20034}
-- 			for i = 1,10 do
-- 				mapeffect(1000+i,getmap(actor),getx(actor)+math.random(-6,6),gety(actor)+math.random(-4,4),texiaoid[math.random(1,5)],2,0) 
-- 			end
-- 			if skillid == -140 then
-- 				setsysint("山庄护卫拉人",0)
-- 				setsysint("山庄护卫麻痹",0)
-- 			end
			
-- 			if skillid == -141 then
-- 				if getsysint("山庄护卫拉人") == 0 then
-- 					if math.random(1,100) < 50 then
-- 						setsysint("山庄护卫拉人",1)
-- 						if math.random(1,100) < 50 then
-- 							setsysint("山庄护卫麻痹",1)
-- 						end
-- 					end
-- 				end
-- 				if getsysint("山庄护卫拉人") == 1 then
-- 					mapmove(actor,getmap(gongjizhe),getx(gongjizhe),gety(gongjizhe),3)
-- 					if getsysint("山庄护卫麻痹") == 1 then
-- 						makeposion(actor, 5, 2)
-- 					end
-- 				end
-- 			end
-- 		end
		
-- 		if getname(gongjizhe) == "桃花恶魔领袖" then
-- 			if skillid == -120 then
-- 				local lasttime = getguaigongjitime(gongjizhe) --最后攻击时间
-- 				if os.time() - lasttime >= 60 or os.time() == lasttime then
-- 					hp = hp*2
-- 					sendmsg9(actor,"你受到了桃花恶魔领袖的飞火流星对你造成重击伤害","#FFD700")
-- 					setguaigongjitime(gongjizhe,os.time())
-- 				end
-- 			end
-- 			if skillid == -121 then 
-- 				local lasttime = tonumber(getcurrent(gongjizhe,7)) or 0 --最后攻击时间
-- 				if os.time() - lasttime >= 30 or os.time() == lasttime then
-- 					addbuff(actor,20097,5)
-- 					sendmsg9(actor,"你受到了桃花恶魔领袖的风影束缚双防清零持续5秒","#FFD700")
-- 					setcurrent(gongjizhe,7,tostring(os.time()))
-- 				end
-- 			end
-- 			if skillid == -122 then 
-- 				local lasttime = tonumber(getcurrent(gongjizhe,8)) or 0 --最后攻击时间
-- 				if os.time() - lasttime >= 90 or os.time() == lasttime then
-- 					hp = math.floor(getbaseinfo(actor,10) * 0.1)
-- 					sendmsg9(actor,"你中了桃花恶魔领袖的裂地突刺掉血10%","#FFD700")
-- 					setcurrent(gongjizhe,8,tostring(os.time()))
-- 				end
-- 			end
-- 		end
		
-- 		if getname(gongjizhe) == "镜像之主" then
-- 			if skillid == -132 then
-- 				local lasttime = getguaigongjitime(gongjizhe) --最后攻击时间
-- 				if os.time() - lasttime >= 40 then
-- 					addbuff(actor,20113)
-- 					sendmsg9(actor,"你受到了镜像之主的灼伤每秒掉血3%持续5秒","#FFD700")
-- 					setguaigongjitime(gongjizhe,os.time())
-- 				end
-- 			end
-- 			if skillid == -133 then 
-- 				local lasttime = tonumber(getcurrent(gongjizhe,7)) or 0 --最后攻击时间
-- 				if os.time() - lasttime >= 120 or os.time() == lasttime then
-- 					makeposion(actor, 1, 60)
-- 					sendmsg9(actor,"你受到了镜像之主的毒素伤害","#FFD700")
-- 					setcurrent(gongjizhe,7,tostring(os.time()))
-- 				end
-- 			end
-- 			if skillid == -131 then 
-- 				local lasttime = tonumber(getcurrent(gongjizhe,8)) or 0 --最后攻击时间
-- 				if os.time() - lasttime >= 90 or os.time() == lasttime then
-- 					changespeed(actor,1,-5,8)
-- 					sendmsg9(actor,"你受到了镜像之主的怒吼移动速度降低50%持续8秒","#FFD700")
-- 					setcurrent(gongjizhe,8,tostring(os.time()))
-- 				end
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "玛法判官" then
-- 			if skillid == -132 then
-- 				local lasttime = getguaigongjitime(gongjizhe) --最后攻击时间
-- 				if os.time() - lasttime >= 30 then
-- 					hp = hp*3
-- 					sendmsg9(actor,"你受到了玛法判官的重击伤害","#FFD700")
-- 					setguaigongjitime(gongjizhe,os.time())
-- 				end
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "上古谛听" then
-- 			if skillid == -135 then
-- 				hp = hp*2
-- 				sendmsg9(actor,"你受到了上古谛听的重击伤害","#FFD700")
-- 			end
-- 		end
		
-- 		if getname(gongjizhe) == "秦始皇" then
-- 			if skillid == -106 then
-- 				local lasttime = getguaigongjitime(gongjizhe) --最后攻击时间
-- 				if os.time() - lasttime >= 30 then
-- 					hp = hp*3
-- 					sendmsg9(actor,"你受到了秦始皇的重击伤害","#FFD700")
-- 					setguaigongjitime(gongjizhe,os.time())
-- 				end
-- 			end
-- 			if skillid == -107 then 
-- 				local lasttime = tonumber(getcurrent(gongjizhe,7)) or 0 --最后攻击时间
-- 				if os.time() - lasttime >= 60 or os.time() == lasttime then
-- 					addbuff(actor,20114)
-- 					sendmsg9(actor,"你中了秦始皇的火暴之环每秒掉血2%持续10秒","#FFD700")
-- 					setcurrent(gongjizhe,7,tostring(os.time()))
-- 				end
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "七星神王" then
-- 			if skillid == -105 then
-- 				if math.random(1,100) < 20 then
-- 					hp = hp*3
-- 					sendmsg9(actor,"你受到了七星神王的灵魂攻击受到了大量的伤害","#FFD700")
-- 				end	
				
-- 			end
-- 			if skillid == -106 then
-- 				local lasttime = getguaigongjitime(gongjizhe) --最后攻击时间
-- 				if os.time() - lasttime >= 30 then
-- 					hp = math.floor(getbaseinfo(actor,10) * 0.2)
-- 					sendmsg9(actor,"你受到了七星神王的灵魂穿透总体血量减少20%","#FFD700")
-- 					setguaigongjitime(gongjizhe,os.time())
-- 				end
-- 			end
-- 			if skillid == -107 then 
-- 				local lasttime = tonumber(getcurrent(gongjizhe,7)) or 0 --最后攻击时间
-- 				if os.time() - lasttime >= 40 or os.time() == lasttime then
-- 					local sjz = math.random(1,100)
-- 					if sjz <= 30 then
-- 						makeposion(actor, 1, 60)
-- 						sendmsg9(actor,"你受到了七星神王的毒素伤害","#FFD700")
-- 					elseif sjz <= 50 then
-- 						addbuff(shoujizhe,20013,5)
-- 						sendmsg9(actor,"你受到了七星神王的眩晕伤害持续5秒","#FFD700")
-- 					else
-- 						addbuff(actor,20115)
-- 						sendmsg9(actor,"你受到了七星神王的灼伤每秒掉血5%持续5秒","#FFD700")
-- 					end			
-- 					setcurrent(gongjizhe,7,tostring(os.time()))
					
-- 				end
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "玛雅守护神" then
-- 			if skillid == -103 then
-- 				local lasttime = getguaigongjitime(gongjizhe) --最后攻击时间
-- 				if os.time() - lasttime >= 30 then
-- 					hp = math.floor(hp*2.5)
-- 					sendmsg9(actor,"你受到了玛雅守护神的重击伤害","#FFD700")
-- 					setguaigongjitime(gongjizhe,os.time())
-- 				end
-- 			end
-- 			if skillid == -104 then
-- 				local lasttime = tonumber(getcurrent(gongjizhe,7)) or 0 --最后攻击时间
-- 				if os.time() - lasttime >= 60 or os.time() == lasttime then
-- 					addbuff(actor,20111,10)
-- 					sendmsg9(actor,"你受到了玛雅守护神的雷霆之怒双防降低50%持续10秒","#FFD700")
-- 					setcurrent(gongjizhe,7,tostring(os.time()))
-- 				end
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "帝王主宰者" then
-- 			if skillid == -103 then
-- 				local lasttime = getguaigongjitime(gongjizhe) --最后攻击时间
-- 				if os.time() - lasttime >= 30 then
-- 					hp = math.floor(hp*2.5)
-- 					sendmsg9(actor,"你受到了帝王主宰者的重击伤害","#FFD700")
-- 					setguaigongjitime(gongjizhe,os.time())
-- 				end
-- 			end
-- 			if skillid == -104 then
-- 				local lasttime = tonumber(getcurrent(gongjizhe,7)) or 0 --最后攻击时间
-- 				if os.time() - lasttime >= 60 or os.time() == lasttime then
-- 					addbuff(actor,20111,10)
-- 					sendmsg9(actor,"你受到了帝王主宰者的雷霆之怒双防降低50%持续10秒","#FFD700")
-- 					setcurrent(gongjizhe,7,tostring(os.time()))
-- 				end
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "烟花教主" then
-- 			if skillid == -126 then
-- 				local lasttime = tonumber(getcurrent(gongjizhe,7)) or 0 --最后攻击时间
-- 				if os.time() - lasttime >= 60 or os.time() == lasttime then
-- 					if math.random(1,100) < 70 then
-- 						addbuff(actor,20097,5)
-- 						sendmsg9(actor,"你中了烟花教主的烈焰灼烧双防清零持续5秒","#FFD700")
-- 					else
-- 						addbuff(actor,20114,5)
-- 						sendmsg9(actor,"你中了烟花教主的烈焰灼烧每秒掉血2%持续5秒","#FFD700")
-- 					end
-- 					setcurrent(gongjizhe,7,tostring(os.time()))
-- 				end
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "万恶之主" then
-- 			if skillid == -114 then
-- 				addbuff(actor,20111,15)
-- 				sendmsg9(actor,"你中了万恶之主的精魂缠绕双防降低50%持续15秒","#FFD700")
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "神域审判者" then
-- 			if skillid == -114 then
-- 				addbuff(actor,20111,15)
-- 				sendmsg9(actor,"你中了神域审判者的精魂缠绕双防降低50%持续15秒","#FFD700")
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "招魂使者" then
-- 			if math.random(1,100) < 50 then
-- 				if not hasbuff(actor,20111) then
-- 					addbuff(actor,20111,3)
-- 				end
-- 			end
-- 		end
		
-- 		if getname(gongjizhe) == "偷袭者" then
-- 			if math.random(1,100) < 20 then
-- 				if not hasbuff(actor,20111) then
-- 					addbuff(actor,20111,5)
-- 				end
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "幽冥傀儡" then
-- 			if math.random(1,100) < 10 then
-- 				if not hasbuff(actor,20111) then
-- 					addbuff(actor,20111,5)
-- 				end
-- 			end
-- 		end
		
-- 		if getname(gongjizhe) == "蛮荒霸主" then
-- 			if math.random(1,100) < 20 then
-- 				hp = math.floor(hp*2)
-- 				playeffect(actor,11066,0,0,1,0,0)
-- 				sendmsg9(actor,"你受到了蛮荒霸主的重击伤害","#FFD700")
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "铁血魔王" then
-- 			if math.random(1,100) < 20 then
-- 				hp = math.floor(hp*2)
-- 				playeffect(actor,11066,0,0,1,0,0)
-- 				sendmsg9(actor,"你受到了铁血魔王的重击伤害","#FFD700")
-- 			end
-- 		end
-- 		if getname(gongjizhe) == "神域战将" then
-- 			if math.random(1,100) < 5 then
-- 				hp = math.floor(hp*2)
-- 				playeffect(actor,11066,0,0,1,0,0)
-- 				sendmsg9(actor,"神域战将对你造成了重击伤害","#FFD700")
-- 			end
-- 		end
		
-- 		if getname(gongjizhe) == "地狱使者" then
-- 			if math.random(1,100) < 20 then
-- 				changespeed(actor,1,-5,3)
-- 			end
-- 		end
-- 	end
	
-- 	if not getbaseinfo(gongjizhe,-1) and getname(gongjizhe) == "玉面素狐王" and not hasbuff(actor,20111) then --降低防御50%
-- 		addbuff(actor,20111)
-- 		sendmsg6(shoujizhe,"您受到玉面素狐王攻击，防御魔御降低10秒")
-- 	end
	
-- 	if not getbaseinfo(gongjizhe,-1) and getname(gongjizhe) == "神域大祭祀" and not hasbuff(actor,20111) then --降低防御50%
-- 		addbuff(actor,20111)
-- 		sendmsg6(shoujizhe,"您受到神域大祭祀攻击，防御魔御降低10秒")
-- 	end
	
-- 	if not getbaseinfo(gongjizhe,-1) and getname(gongjizhe) == "酆都勾魂司" and not hasbuff(actor,20111) then --降低防御50%
-- 		addbuff(actor,20111)
-- 		sendmsg6(shoujizhe,"您受到酆都勾魂司攻击，防御魔御降低10秒")
-- 	end
	
-- 	if getbaseinfo(shoujizhe,9)/getbaseinfo(shoujizhe,10) < 0.6 then
-- 		if hasbuff(shoujizhe,10054) or hasbuff(shoujizhe,10055) then --有酒气值
-- 			local item = linkbodyitem(shoujizhe,16) --盾位置装备 酒葫芦
-- 			if item ~= "0" then
-- 				local jiuqizhi = getitem_jiuqizhi(shoujizhe,item) --酒气值
-- 				local dikangzhi = math.floor(hp * 0.2) --抵抗值
-- 				if jiuqizhi < dikangzhi*2 then
-- 					dikangzhi = math.floor(jiuqizhi/2)
-- 				end
-- 				addhulujiuqizhi(shoujizhe,-dikangzhi*2)
-- 				hp = hp - dikangzhi
-- 				--sendmsg6(shoujizhe,"酒气护体，抵抗伤害"..dikangzhi)
-- 				--sendmsg6(actor,"抵抗后重击伤害"..hp)
-- 			end
-- 		end
-- 	end

	
	
-- 	if skillid == -126 and not hasbuff(actor,10052) then
-- 		if not hasbuff(actor,20108) then
-- 			addbuff(actor,20108)
-- 		end
-- 	end
-- 	if skillid == -107 and not hasbuff(actor,10052) then
-- 		if not hasbuff(actor,20108) then
-- 			addbuff(actor,20108,5)
-- 		end
-- 	end
-- 	if skillid == -114 and not hasbuff(actor,10052) then
-- 		if not hasbuff(actor,20109) then
-- 			addbuff(actor,20109)
-- 		end
-- 	end
	
-- 	if not getbaseinfo(gongjizhe,-1) and getname(gongjizhe) == "末路将领" and math.random(1,100) <= 20 and not hasbuff(actor,10052) then
-- 		hp = math.floor(hp*2)
-- 	end
	
-- 	if not getbaseinfo(gongjizhe,-1) and getname(gongjizhe) == "地藏护法" and math.random(1,100) <= 10 and not hasbuff(actor,10052) then
-- 		makeposion(actor, 5, 3)
-- 	end
	
-- 	if not getbaseinfo(gongjizhe,-1) and getname(gongjizhe) == "蛮荒巫医" and math.random(1,100) <= 10 and not hasbuff(actor,10052) then
-- 		makeposion(actor, 0, 20,30)
-- 	end
	
-- 	if not getbaseinfo(gongjizhe,-1) and getname(gongjizhe) == "噬魂蚁" and math.random(1,100) <= 10 and not hasbuff(actor,10052) then
-- 		makeposion(actor, 0, 20,30)
-- 	end
	
-- 	if not getbaseinfo(gongjizhe,-1) and getname(gongjizhe) == "桃花谷树人" and math.random(1,100) <= 10 and not hasbuff(actor,10052) then
-- 		makeposion(actor, 0, 20,30)
-- 	end
	
-- 	if not getbaseinfo(gongjizhe,-1) and getname(gongjizhe) == "兽面蛛王" and math.random(1,100) <= 20 and not hasbuff(actor,10052) then
-- 		makeposion(actor, 13, 3)
-- 	end
	
-- 	if not getbaseinfo(gongjizhe,-1) and getname(gongjizhe) == "远古祖玛教父" and math.random(1,100) <= 10 then
-- 		hp = math.floor(hp*1.5)
-- 	end
	
-- 	if getbaseinfo(gongjizhe,-1) and getjob(gongjizhe) == 0 then
-- 		local bili = getbaseinfo(actor,51,210) --受战减伤万分比
-- 		if bili > 0 then
-- 			hp = math.floor(hp * (1 - bili/10000))
-- 		end
-- 	end
-- 	if getbaseinfo(gongjizhe,-1) and getjob(gongjizhe) == 1 then
-- 		local bili = getbaseinfo(actor,51,211) --受法减伤万分比
-- 		if bili > 0 then
-- 			hp = math.floor(hp * (1 - bili/10000))
-- 		end
-- 	end
-- 	if getbaseinfo(gongjizhe,-1) and getjob(gongjizhe) == 2 then
-- 		local bili = getbaseinfo(actor,51,212) --受道减伤万分比
-- 		if bili > 0 then
-- 			hp = math.floor(hp * (1 - bili/10000))
-- 		end
-- 	end
	
	
-- 	if skillid ~= getskillidbyname("刺杀剑术") and callcheckscriptex(actor,"CheckHumanState",1) and getskillinfo(actor,getskillidbyname("魔法盾"),1) == 4 then
-- 		hp = math.floor(hp*1.1/1.36)
-- 		--sendmsg6(actor,"4级盾处理后"..hp)
-- 	end
-- 	----兽魂buff处理
-- 	local sh_data = getshouhunbuffdata(actor) --获取兽魂buff数据
-- 	for i = 1,#sh_data do
-- 		if sh_data[i] == "躲避术" and not getbaseinfo(gongjizhe,-1) then --怪打人
-- 			if math.random(1,100) <= 3 then
-- 				--sendmsg6(shoujizhe,"触发魂技【躲避术】，闪避本次伤害")
-- 				return 0
-- 			end
-- 		end
		
-- 		if sh_data[i] == "绝处逢生" then 
-- 			if  getbaseinfo(shoujizhe,9)/getbaseinfo(shoujizhe,10) < 0.3 and math.random(1,100) <= 10 then
-- 				--sendmsg6(shoujizhe,"触发魂技【绝处逢生】，闪避本次伤害")
-- 				return 0
-- 			end
-- 		end
		
-- 		if sh_data[i] ~= "" and shouhun_shoujicl[sh_data[i]] then
-- 			hp = hp + shouhun_shoujicl[sh_data[i]](gongjizhe,shoujizhe,hp,skillid)
-- 		end
-- 	end
-- 	----兽魂buff处理结束
	
-- 	----武穆遗书buff处理----------------------------------------------------------------------------
-- 	----武穆遗书buff处理----------------------------------------------------------------------------
-- 	----武穆遗书buff处理----------------------------------------------------------------------------
-- 	if getint(actor,"武穆遗书2编号") == 23 then --法师在无魔法盾情况下所受伤害减免30%
-- 		if getjob(actor) == 1 then
-- 			if not callcheckscriptex(actor,"checkHumanState",1) then --无魔法盾
-- 				hp = math.floor(hp*0.7)
-- 				--sendmsg6(shoujizhe,"无魔法盾减免30%")
-- 			end
-- 		end
-- 	end
	
-- 	--[[if getint(actor,"武穆遗书3编号") == 11 and getbaseinfo(gongjizhe,-1) then --每次所受到的固伤伤害减免60点(只减少额外附带的固定伤害)
-- 		local shz = getbaseinfo(gongjizhe,51,68) --对人固定伤害值
-- 		local del = 60
-- 		if shz < 60 then
-- 			del = shz
-- 		end
-- 		hp = hp - del
-- 	end--]]
	
-- 	if getint(actor,"武穆遗书3编号") == 43 then
-- 		if hasbuff(actor,10054) or hasbuff(actor,10055) and getbaseinfo(gongjizhe,-1) then
-- 			local shz = getbaseinfo(gongjizhe,51,68) --对人固定伤害值
-- 			local del = 50
-- 			if shz < 50 then
-- 				del = shz
-- 			end
-- 			hp = hp - del
-- 		end
-- 	end
	
-- 	if getint(actor,"武穆遗书3编号") == 15 then --受到单次最大伤害不超过自身总血量25%
-- 		local maxhp = getbaseinfo(actor,10) --总血量
-- 		local hp_4fen1 = math.floor(maxhp*0.20)
-- 		if hp > hp_4fen1 and os.time() - getint(actor,"武穆遗书3编号时间") > 15 then
-- 			--sendmsg6(shoujizhe,"受到单次最大伤害不超过自身总血量25%")
-- 			hp = hp_4fen1
-- 			setint(actor,"武穆遗书3编号时间",os.time())
-- 		end
-- 	end
	
-- 	if getint(actor,"武穆遗书3编号") == 19 then --自身血量低于40%将获得每秒2%的自身恢复.持续10秒 CD60秒
-- 		if getbaseinfo(actor,9)/getbaseinfo(actor,10) < 0.4 and os.time() - getint(actor,"武穆遗书3编号19时间") >= 60 then
-- 			setontimer(actor,19,1,10) --1秒加血 持续10秒
-- 			--sendmsg6(shoujizhe,"自身血量低于40%将获得每秒2%的自身恢复.持续10秒 CD60秒")
-- 			setint(actor,"武穆遗书3编号19时间",os.time())
-- 		end
-- 	end
	
-- 	if getint(actor,"武穆遗书3编号") == 22 then --被攻击时,将有2%的概率格挡本次所受伤害
-- 		if math.random(1,100) <= 2 then
-- 			--sendmsg6(shoujizhe,"被攻击时,将有2%的概率格挡本次所受伤害")
-- 			return 0
-- 		end
-- 	end
	
-- 	if getint(actor,"武穆遗书3编号") == 23 then --被攻击时,将有5%的概率格挡本次所受伤害
-- 		if math.random(1,100) <= 5 then
-- 			--sendmsg6(shoujizhe,"被攻击时,将有5%的概率格挡本次所受伤害")
-- 			return 0
-- 		end
-- 	end
	
-- 	if getint(actor,"武穆遗书3编号") == 38 then --血量低于30%,将获得对人对怪持续隐身3秒(CD120秒)
-- 		if getbaseinfo(actor,9)/getbaseinfo(actor,10) < 0.3 and os.time() - getint(actor,"武穆遗书3编号38时间") >= 120 then
-- 			changemode(actor,2,3)
-- 			setint(actor,"武穆遗书3编号38时间",os.time())
-- 			sendmsg9(actor,"进入隐身状态，持续3秒")
-- 			--sendmsg6(shoujizhe,"血量低于30%,将获得对人对怪持续隐身3秒(CD120秒)")
-- 		end
-- 	end
	
-- 	if getint(actor,"武穆遗书3编号") == 44 then --每120秒获得一次护盾,2秒内所受伤害可直接被无视(做成被第一次攻击触发)
-- 		if os.time() - getint(actor,"武穆遗书3编号44时间") >= 120 then
-- 			setint(actor,"武穆遗书3编号44时间",os.time())
-- 			--sendmsg6(shoujizhe,"每120秒获得一次护盾,2秒内所受伤害可直接被无视")
-- 			--changemode(actor, 1, 2) --无敌2秒
-- 			addbuff(actor,20107)
-- 		end
-- 	end
-- 	----武穆遗书buff处理结束----------------------------------------------------------------------------
-- 	----武穆遗书buff处理结束----------------------------------------------------------------------------
-- 	----武穆遗书buff处理结束----------------------------------------------------------------------------
	
-- 	if getbaseinfo(gongjizhe,-1) and skillid == getskillidbyname("十步一杀") and not hasbuff(actor,10052) then
-- 		local roles = getobjectinmap(getmap(gongjizhe),getx(gongjizhe),gety(gongjizhe),3,1)
-- 		--sendmsg6(gongjizhe,tbl2json(roles))
-- 		if #roles < 3 then
-- 			if math.random(1,100) < 50 and getlevel(actor) < getlevel(gongjizhe) then			
-- 				callscriptex(actor, "SetFeature", 0, 50001,3,0,3)
-- 				callscriptex(actor, "SetFeature", 1, 9999,3,0,3)
-- 				callscriptex(actor, "SetFeature", 2, 9999,3,0,3)
-- 				callscriptex(actor, "SetFeature", 3, 9999,3,0,3)
-- 				makeposion(actor,13,3)
-- 				addbuff(actor,10038,3)
-- 				--sendmsg6(gongjizhe,"对方变羊子")
-- 			end
-- 		end
-- 	end
	
-- 	if getbaseinfo(gongjizhe,-1) and skillid == getskillidbyname("冰霜群雨") then
-- 		if math.random(1,100) < 20 and getlevel(actor) <= getlevel(gongjizhe) and not hasbuff(actor,10052) then	
-- 			callscriptex(actor,"ChangeModeEx",11,3,1)	
-- 			--sendmsg6(gongjizhe,"对方被禁锢")
-- 			addbuff(actor,10040,3)
-- 		end
-- 		local maxhp = getbaseinfo(actor,10)
-- 		local addhp = math.floor(maxhp*0.08) --减血量
-- 		hp = addhp
-- 	end
	
-- 	--护身效果处理
-- 	local hushenhp = getint(actor,"护身血量") --护身血量百分比
-- 	if hushenhp > 0 then
-- 		local curmp = getbaseinfo(actor,11) --当前蓝量
-- 		local delmp = math.floor(hp * hushenhp/100)
-- 		if delmp > curmp then
-- 			delmp = curmp
-- 		end
-- 		hp = hp - delmp
-- 		if delmp > 0 then
-- 			humanmp(actor,"-",delmp)
-- 		end
-- 		--sendmsg6(actor,"扣除血量"..hp.." 扣除蓝量"..delmp)
-- 	end
-- 	--haoshiend(actor)  --耗时结束
-- 	return hp
-- end

----宝宝死亡触发
function killslave(actor,baobao) --攻击者 宝宝
	--release_print("宝宝死亡触发"..getname(actor),getname(baobao))
	
	local player = getbaseinfo(baobao,59) --主人
	if player and getint(player,"武穆遗书2编号") == 44 then
		mapeffect(44,getmap(baobao),getx(baobao),gety(baobao),121,1,0)
		local players = getobjectinmap(getmap(baobao),getx(baobao),gety(baobao),2,1)
		--release_print("几个人"..#players)
		for i = 1,#players do
			if player ~= players[i] then
				if ispropertarget(player,players[i]) and not hasbuff(players[i],10052) then --可攻击并且没有玄武之力
					local maxhp = getbaseinfo(players[i],10)
					local delhp = math.floor(maxhp*0.15) --掉血量
					humanhp(players[i],"-",delhp,1)
					--sendmsg6(players[i],"被炸了 掉10%的血")
					sendmsg9(players[i],getname(player).."的宝宝死亡触发了<font color='#00FF00'>'两败俱伤'</font>，你当前血量减少15%")
					
				end
			end
		end
	end
	
	if getname(baobao) == "卧龙夫人" then
		callscriptex(actor, "RECALLMOB", "卧龙夫人", 0,200,0)
		darttime(actor,30*60,1)
		local bb_list = getbaobaolist(actor)
		for i = 1,#bb_list do
			if getname(bb_list[i]) == "卧龙夫人" then		 	
				makeposion(bb_list[i],5,170)
				setcurrent(bb_list[i],0,tostring(os.time())) --标识出生时间
				callscriptex(actor, "MoveMonToPos", "卧龙夫人", getmap(bb_list[i]), getx(bb_list[i]), gety(bb_list[i]), 75, 47)		
			end
		end
		sendtopchatboardmsg(actor,0,251,0,180,"漂亮的<卧龙夫人/FCOLOR=249>正在<卧龙山庄/FCOLOR=250>沐浴更衣，%d秒后可开始护送她..........",1)
		sendmsg(nil, 2, '{"Msg":"由玩家<【'.. getname(actor) ..'】/FCOLOR=249>带领的绿林好汉截杀了<卧龙夫人/FCOLOR=250>获得了归属权，卧龙夫人将在起始点复活，<180秒/FCOLOR=253>后可护送.....","FColor":161,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"200"}')
		sendmsg(nil, 2, '{"Msg":"由玩家<【'.. getname(actor) ..'】/FCOLOR=249>带领的绿林好汉截杀了<卧龙夫人/FCOLOR=250>获得了归属权，卧龙夫人将在起始点复活，<180秒/FCOLOR=253>后可护送.....","FColor":161,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"250"}')
		sendmsg(nil, 2, '{"Msg":"由玩家<【'.. getname(actor) ..'】/FCOLOR=249>带领的绿林好汉截杀了<卧龙夫人/FCOLOR=250>获得了归属权，卧龙夫人将在起始点复活，<180秒/FCOLOR=253>后可护送.....","FColor":161,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"300"}')
		
	end
end
--死亡之眼地图定时器
function ditudingshiqi(mapobj,actor,id,mapid,x,y)
	--haoshistart(actor)
	id = tonumber(id)
	x = tonumber(x)
	y = tonumber(y)
	--sendmsg0(0,"哪个玩家释放的"..getname(actor).."定时器id"..id.."地图id"..mapid.."坐标x"..x.."坐标y"..y)
	--sendmsg0(0,"对象是否存在"..tostring(isnotnull(actor)))
	local sec = getsysint("定时器"..id.."时间")
	if sec >= 10 or not isnotnull(actor) then
		local id_t = {}
		local id_tstr = getsysstr("死亡之眼定时器id表")
		if id_tstr ~= "" then
			id_t = json2tbl(id_tstr)
		end
		id_t[tostring(id)] = nil
		setsysstr("死亡之眼定时器id表",tbl2json(id_t))
		setenvirofftimer(mapid,id)
		return
	end
	setsysint("定时器"..id.."时间",sec+1)
	
	local players = getobjectinmap(mapid,x,y,3,1)
	for i = 1,#players do
		if ispropertarget(actor,players[i]) and not hasbuff(players[i],10052) then --可以攻击
			if getint(players[i],"死亡之眼掉血时间") < os.time() then		
				setint(players[i],"死亡之眼掉血时间",os.time())	
				local maxhp = getbaseinfo(players[i],10)
				local addhp = math.floor(maxhp*0.03) --减血量
				humanhp(players[i],"-",addhp,1000)
				--sendmsg6(players[i],"持续减血2% ")
			end
		end
	end
	
	--获取地图上指定范围内的对象
	--haoshiend(actor)
	--setenvirofftimer("3",1)
	--setenvirofftimer("3",2)
end
function xiaochudu(actor)
	detoxifcation(actor,-1)
end

-- --使用技能前触发
-- function beginmagic(actor,skillid,skillname,TargetActor,x,y) --触发玩家 技能ID 技能名称 鼠标选择对象，有可能空 	鼠标X  	鼠标Y
-- 	--sendmsg6(actor,"技能"..skillname.."  目标"..tostring(TargetActor).. "  鼠标X"..tostring(x).. "  鼠标Y"..tostring(y))
-- 	if (getname(TargetActor) == "卧龙夫人" or getname(TargetActor) == "山庄护卫") and not getbaseinfo(TargetActor,-1) then
-- 		if getbaseinfo(actor,36) == "" then
-- 			sendmsg9(actor,"无行会无法对此目标施毒")
-- 			return false
-- 		end
-- 	end
	
-- 	if skillname == "诱惑之光" and TargetActor ~= "0" and not getbaseinfo(TargetActor,-1) and getname(TargetActor) == "虎卫" then
-- 		if getlevel(actor) < 46 then
-- 			sendmsg9(actor,"诱惑虎卫需等级达到46级")
-- 			return false
-- 		end
-- 	end

-- 	if skillname == "诱惑之光" and TargetActor ~= "0" and not getbaseinfo(TargetActor,-1) and ( getname(TargetActor) == "卧龙庄主" or getname(TargetActor) == "盘古大帝" ) then
-- 		sendmsg9(actor,"目标禁止诱惑")
-- 		return false
-- 	end
-- 	if skillname == "施毒术" and TargetActor ~= "0" and getbaseinfo(TargetActor,-1) and hasbuff(TargetActor,10052) then
-- 		sendmsg9(actor,"目标处于玄武之力状态中，禁止施毒")
-- 		return false
-- 	end
-- 	if skillname == "玄武之力" then
-- 		if os.time() - getint(actor,"玄武之力CD") < 150 then
-- 			local str = "还需".. 150 - (os.time() - getint(actor,"玄武之力CD")) .."秒才能释放玄武之力"
-- 			sendmsg(actor,1,'{"Msg":"'..str..'","FColor":255,"BColor":56,"Type":1,"Time":3}')
-- 			return false
-- 		end
-- 		local jichutime = 15
-- 		local addtime = 0
-- 		if getint(actor,"武穆遗书3编号") == 29 then
-- 			addtime = 5
-- 		elseif getint(actor,"武穆遗书3编号") == 45 then
-- 			addtime = 12
-- 		end
-- 		addbuff(actor,10052,jichutime+addtime) --玄武之力buff
-- 		callscriptex(actor, "SHOWPHANTOM", 100, jichutime+addtime)
-- 		detoxifcation(actor,-1)
-- 		delaygoto(actor,1000,"@xiaochudu")
-- 		sendmsg6(actor,"释放玄武之力成功，持续时间"..jichutime+addtime.."秒")
-- 		setint(actor,"玄武之力CD",os.time())
-- 	end
-- 	if skillname == "死亡之眼" then
-- 		local id_t = {}
-- 		local id_tstr = getsysstr("死亡之眼定时器id表")
-- 		if id_tstr ~= "" then
-- 			id_t = json2tbl(id_tstr)
-- 		end
-- 		local id = 1
-- 		for i = 1,1000 do
-- 			local sijiid = math.random(1,100000)
-- 			if id_t[tostring(sijiid)] == nil then
-- 				id = sijiid
-- 				id_t[tostring(sijiid)] = 1
-- 				break
-- 			end
-- 		end
-- 		setsysstr("死亡之眼定时器id表",tbl2json(id_t))
-- 		setsysint("定时器"..id.."时间",0)
-- 		setenvirontimer(getmap(actor),id,1,"ditudingshiqi,"..actor..","..id..","..getmap(actor)..","..x..","..y)
-- 	end
	
-- 	--[[if skillid == 28 and getint(actor,"武穆遗书2编号") == 45 then
-- 		local curtime = os.time()
-- 		local sctime = getint(actor,"放心灵启示时间")
-- 		local chazhi = curtime - sctime
-- 		if chazhi < 60 then
-- 			sendmsg6(actor,"cd时间还有".. 60 - chazhi.."秒")
-- 			return false
-- 		end
-- 		if TargetActor ~= "0" and not getbaseinfo(TargetActor,-1) and getlevel(actor) > getlevel(TargetActor) then
-- 			--sendmsg6(actor,"啦啦啦啦")
-- 			callscriptex(actor, "MoveMonToPos", getbaseinfo(TargetActor,1,1),getmap(TargetActor),getx(TargetActor),gety(TargetActor),getx(actor),gety(actor))
-- 			setint(actor,"放心灵启示时间",curtime)
-- 		else
-- 			return false
-- 		end
-- 	end--]]

	
	
-- 	if getint(actor,"武穆遗书2编号") == 37 and skillid == 2 then --治愈术
-- 		local curtime = os.time()
-- 		local sctime = getint(actor,"放治愈术时间")
-- 		local chazhi = curtime - sctime
-- 		if chazhi < 60 then
-- 			sendmsg6(actor,"cd时间还有".. 60 - chazhi.."秒")
-- 			return false
-- 		end
-- 		setint(actor,"放治愈术时间",curtime)
-- 	end
	
	
-- 	if skillname == "诱惑之光" and TargetActor ~= "0" and not getbaseinfo(TargetActor,-1) and getint(actor,"武穆遗书2编号") == 24 then --使用诱惑之光可将人物宝宝诱惑20s无法动弹(不判断等级)
-- 		if getbaseinfo(TargetActor,59) ~= "0" then
-- 			makeposion(TargetActor,5,30)
-- 			--sendmsg6(actor,"定住60秒")
-- 		end
-- 	end
-- 	local duimian = getoppositeobj(actor)
-- 	if skillname == "野蛮冲撞" and duimian ~= "0" and getbaseinfo(duimian,-1) then
		
-- 		if not ispropertarget(actor,duimian) then
-- 			return false
-- 		end
		
-- 		if hasbuff(duimian,20088) then
-- 			--sendmsg9(actor,"对方3秒内禁止被野蛮")
-- 			return false
-- 		end
-- 		local fangxiang_t = {[0]={0,-2},[1]={2,-2},[2]={2,0},[3]={2,2},[4]={0,2},[5]={-2,2},[6]={-2,0},[7]={-2,-2}}
-- 		local fangxiang_t1 = {[0]={0,-3},[1]={3,-3},[2]={3,0},[3]={3,3},[4]={0,3},[5]={-3,3},[6]={-3,0},[7]={-3,-3}}
-- 		local fangxiang = tonumber(getconst(actor,"<$DIR>")) --当前方向 (上0 上右1 右2 右下3 下4 左下5 左6 左上7)
-- 		local x = getx(actor)
-- 		local y = gety(actor)
-- 		if getlevel(duimian) > getlevel(actor) then
-- 			--sendmsg6(actor,"等级低于对方 野蛮失败")
-- 			return false
-- 		end
		
-- 		local player_t = getobjectinmap(getmap(actor),x+fangxiang_t[fangxiang][1],y+fangxiang_t[fangxiang][2],0,1) --玩家列表
-- 		if #player_t > 0 then --有玩家
-- 			if getlevel(player_t[1]) == getlevel(actor) then
-- 				if getint(actor,"武穆遗书2编号") ~= 28 or hasbuff(player_t[1],10052) then
-- 					--sendmsg6(actor,"同等级我没有28编号 野蛮失败")
-- 					sendmsg(actor,1,'{"Msg":"系统：冲撞力不足","FColor":255,"BColor":56,"Type":1,"Time":5}')
-- 					return false
-- 				end
-- 			end
-- 		end
-- 		player_t = getobjectinmap(getmap(actor),x+fangxiang_t1[fangxiang][1],y+fangxiang_t1[fangxiang][2],0,1) --玩家列表
-- 		if #player_t > 0 then --有玩家
-- 			if getlevel(player_t[1]) == getlevel(actor) then
-- 				if getint(actor,"武穆遗书2编号") ~= 28 or hasbuff(player_t[1],10052) then
-- 					--sendmsg6(actor,"同等级我没有28编号 野蛮失败")
-- 					sendmsg(actor,1,'{"Msg":"系统：冲撞力不足","FColor":255,"BColor":56,"Type":1,"Time":5}')
-- 					return false
-- 				end
-- 			end
-- 		end
		
-- 		if getlevel(duimian) == getlevel(actor) then
-- 			if getint(actor,"武穆遗书2编号") ~= 28 or hasbuff(duimian,10052) then
-- 				--sendmsg6(actor,"同等级我没有28编号 野蛮失败")
-- 				sendmsg(actor,1,'{"Msg":"冲撞力不足","FColor":255,"BColor":56,"Type":1,"Time":5}')
-- 				return false
-- 			end
-- 		end
		
		
		
-- 		if getint(actor,"武穆遗书2编号") == 29 and not hasbuff(duimian,10052) then --有防麻痹几率的 后面加
			
			
-- 			if isemptyinmap(getmap(actor),x+fangxiang_t[fangxiang][1],y+fangxiang_t[fangxiang][2]) then
-- 				if getint(shoujizhe,"武穆遗书3编号") == 35 then
-- 				elseif getint(duimian,"武穆遗书3编号") == 5 then
-- 					if math.random(1,100) < 50 then
-- 						makeposion(duimian,5,3)
-- 						sendmsg9(duimian,"你受到了".. getname(actor) .."的'横冲直撞'被麻痹3秒")
-- 					end
-- 				else
-- 					makeposion(duimian,5,3)
-- 					sendmsg9(duimian,"你受到了".. getname(actor) .."的'横冲直撞'被麻痹3秒")
-- 				end		
-- 			end
-- 		end
		
-- 		if getint(actor,"武穆遗书2编号") == 35 and getbaseinfo(duimian,-1) and not hasbuff(duimian,10052) then
-- 			if isemptyinmap(getmap(actor),x+fangxiang_t[fangxiang][1],y+fangxiang_t[fangxiang][2]) then
-- 				local maxhp = getbaseinfo(duimian,10)
-- 				local delhp = math.floor(maxhp*0.1) --掉血量
-- 				humanhp(duimian,"-",delhp,1)
-- 			--sendmsg6(actor,"野蛮冲撞使被撞目标损失10%总血量")
-- 			end
-- 		end
-- 		if getint(actor,"武穆遗书2编号") == 28 then
-- 			if not hasbuff(actor,20088) then
-- 				addbuff(actor,20088)
-- 			end
-- 		end
-- 		local sh_data = getshouhunbuffdata(actor) --获取兽魂buff数据
-- 		for i = 1,#sh_data do
-- 			if sh_data[i] == "横行霸道" then
-- 				--sendmsg0(0,"横行霸道触发"..getname(duimian)) 
-- 				if isemptyinmap(getmap(actor),x+fangxiang_t[fangxiang][1],y+fangxiang_t[fangxiang][2]) and not hasbuff(duimian,20076) and not hasbuff(duimian,10052) then
-- 					if not hasbuff(duimian,20102) then
-- 						addbuff(duimian,20102)
-- 						--sendmsg0(0,"5秒禁止吃药玩家"..getname(duimian))
-- 						sendmsg9(duimian,"你受到了".. getname(actor) .."的'横行霸道'禁止使用特殊药品5秒")
-- 					end
-- 				end
-- 			end
-- 		end

-- 	end
	
-- 	return true
-- end

--[[
--宝宝攻击前触发
function attackdamagebb(actor,shoujizhe,gongjizhe,skillid,hp)
	if not getbaseinfo(shoujizhe,-1) and getbaseinfo(shoujizhe,59) == "0" and castleinfo(5) and  not gongshakedaguai[getmap(actor)]  then --打怪
		mapmove(actor,"0",289,617,10)
		messagebox(actor,"攻城期间部分地图禁止打怪")
		return 0
	end
	
	--sendmsg6(actor,"改变前伤害"..hp)
	local bbsh = getbaseinfo(actor,51,204) --宝宝伤害加成
	if bbsh > 0 then
		hp = math.floor(hp*(1+bbsh/10000))
	end
	
	if getint(actor,"武穆遗书2编号") == 15 then
		hp = math.floor(hp*(1+getint(actor,"武穆遗书2值")/100))
	end
	if getint(actor,"武穆遗书2编号") == 41 then
		hp = math.floor(hp*1.3)
	end
	
	if getbaseinfo(shoujizhe,-1) then --宝宝攻击人
		if getint(shoujizhe,"武穆遗书3编号") == 8 and not hasbuff(actor,10052) then
			humanhp(actor,"-",math.floor(hp*0.3),100)
		end
		if getint(shoujizhe,"武穆遗书3编号") == 9 and not hasbuff(actor,10052) then
			humanhp(actor,"-",math.floor(hp*0.6),100)
		end
	end
	--sendmsg6(actor,"计算4级技能前"..hp)
	if getskilllevel(actor,getskillidbyname("召唤神兽")) == 4 then
		local minf = getbaseinfo(shoujizhe,15) --防御下线
		local maxf = getbaseinfo(shoujizhe,16) --防御上线
		--sendmsg6(actor,"防 "..maxf)
		local fang = math.floor(math.random(minf,maxf)/2) --防
		hp = hp + fang
		hp = math.floor(hp*1.1)
	end
	if getbaseinfo(shoujizhe,-1) and getjob(shoujizhe) == 1 then
		hp = math.floor(hp*0.5)
	end
	
	--sendmsg6(actor,"改变后伤害"..hp)
	return hp
end
--]]

function getshouhunbuffdata(actor) --获取兽魂buff数据
	local data = {"","","","","",""}
	local sh_str = getstr(actor,"兽魂buff数据")
	if sh_str ~= "" then
		data=json2tbl(sh_str)
	end
	return data
end

--充值触发
function recharge(actor,money,chanpinid,moneyid,zj) --人物，金额，产品id，货币id 真充还是假充
	money = tonumber(money)
	chanpinid = tonumber(chanpinid)
	moneyid = tonumber(moneyid)
	--release_print(actor,"充值触发 数量：".. money .. "产品ID："..chanpinid.."货币ID：".. moneyid)
	--sendmsg6(actor,"充值触发 数量：".. money .. "产品ID："..chanpinid.."货币ID：".. moneyid)
	if moneyid == 12 and money == 28 then
		richong_giveitem(actor)
		setdayint(actor,"日充",1)
		setint(actor,"日充次数",getint(actor,"日充次数")+1)
	else
		local ewyb = 0
		if money >= 10000 then
			ewyb = money*100*0.3
		elseif money >= 5000 then
			ewyb = money*100*0.2
		elseif money >= 1000 then
			ewyb = money*100*0.1
		end
		if ewyb > 0 then
			addingot(actor,ewyb)
		end
		setint(actor,"累计充值",getint(actor,"累计充值") + money )
		setdayint(actor,"今日充值",getdayint(actor,"今日充值") + money )
		sendmsg0(actor,"系统：玩家【".. getname(actor) .."】充值了".. money*100+ewyb .."元宝。")
		chongzhijiemian(actor)
		if moneyid == 10 then
			setsysint("后台充值元宝",getsysint("后台充值元宝")+money*100+ewyb)
			setsysint("每日后台充值元宝",getsysint("每日后台充值元宝")+money*100+ewyb)
		else
			setsysint("真实充值元宝",getsysint("真实充值元宝")+money*100+ewyb)
			setsysint("每日真实充值元宝",getsysint("每日真实充值元宝")+money*100+ewyb)
		end
	end
	--[[if getdayint(actor,"今日充值") >= 10 and getdayint(actor,"日充天数已增加") == 0 then
		setint(actor,"日充天数",getint(actor,"日充天数")%7 + 1)
		setdayint(actor,"日充天数已增加",1)
		setint(actor,"最后充值天数",math.ceil(os.time()/86400))
	end--]]
	if moneyid == 12 then
		changemoney(actor,12,"=",0,"清零日充货币",true)
	end
end


function moneychange2(actor) --元宝改变
	bagxianshi(actor)
	if getingot(actor) >= 100000 then
		if not checktitle(actor,"鸿运当头") then --没有称号
			confertitle(actor, "鸿运当头")
		end
	else
		if checktitle(actor,"鸿运当头") then --有称号
			deprivetitle(actor, "鸿运当头")
		end
	end
end
function moneychange7(actor) --金币改变
	bagxianshi(actor)
	changemoney(actor,1,"=",getgold(actor),"金币改变",true)
end
function moneychange8(actor) --绑定金币改变
	bagxianshi(actor)
	changemoney(actor,3,"=",getbindjinbi(actor),"绑定金币改变",true)
end

--穿装备触发
function takeonex(actor,item,weizhi,iname,weiyiid)
	--sendmsg6(actor,"穿装备触发")
	callscriptex(actor, "CallLua", "zhuangbeishengxing", "@shengxing_sz") --设置升星属性
	callscriptex(actor, "CallLua", "zhuangbeikaifeng", "@kaifeng_sz") --设置开封属性
	callscriptex(actor, "CallLua", "zhuangbeitansuo", "@setjineng") --设置装备探索技能等级
	if weizhi == 15 then
		callscriptex(actor, "CallLua", "wumuyishu", "@setbuff") --设置武穆遗书buff
	end
	if weizhi == 1 or weizhi == 3 then
		xingyunwuqi(actor)
		callscriptex(actor, "CallLua", "wuqishengji", "@setcuilianzhishuxing") --设置淬炼值属性
	end
	if weizhi == 16 then
		setjiuhulubuff(actor)--设置酒葫芦buff
		--callscriptex(actor, "CallLua", "UseItem", "@setjiuhulubuff") --设置酒葫芦buff
	end
	setfuhuocd(actor) --设置复活护身
	setbbsudu(actor) --设置宝宝速度
end
--脱装备触发
function takeoffex(actor,item,weizhi,iname,weiyiid)
	--sendmsg6(actor,"脱装备触发")
	callscriptex(actor, "CallLua", "zhuangbeishengxing", "@shengxing_sz") --设置升星属性
	callscriptex(actor, "CallLua", "zhuangbeikaifeng", "@kaifeng_sz") --设置开封属性
	callscriptex(actor, "CallLua", "zhuangbeitansuo", "@setjineng") --设置装备探索技能等级
	if weizhi == 15 then
		callscriptex(actor, "CallLua", "wumuyishu", "@setbuff") --设置武穆遗书buff
	end
	if weizhi == 1 or weizhi == 3 then
		xingyunwuqi(actor)
		callscriptex(actor, "CallLua", "wuqishengji", "@setcuilianzhishuxing") --设置淬炼值属性
	end
	if weizhi == 16 then
		setjiuhulubuff(actor)--设置酒葫芦buff
		--callscriptex(actor, "CallLua", "UseItem", "@setjiuhulubuff") --设置酒葫芦buff
	end
	setfuhuocd(actor) --设置复活护身
	setbbsudu(actor) --设置宝宝速度
end

local fuhuo_zb = 	{["涅槃菩提戒"]=1,["涅槃菩提镯"]=1,["涅槃菩提靴"]=1,["涅槃菩提带"]=1,["涅槃菩提盔"]=1,["涅槃菩提链"]=1}
local hushen_zb = 	{["聚魔觉醒戒"]=1,["聚魔觉醒镯"]=1,["聚魔觉醒靴"]=1,["聚魔觉醒带"]=1,["聚魔觉醒盔"]=1,["聚魔觉醒链"]=1}
local fuhuo_zbwz = {"3","4","5","6","7","8","10","11"}
function setfuhuocd(actor)
	local fuhuosl = 0 --复活套装数量
	local hushensl = 0 --护身套装数量
	for i = 1,#fuhuo_zbwz do
		local item = linkbodyitem(actor,fuhuo_zbwz[i])
		if item ~= "0" then
			local name = getitemname(actor,item)
			if fuhuo_zb[name] then
				fuhuosl = fuhuosl + 1
			end
			if hushen_zb[name] then
				hushensl = hushensl + 1
			end
		end
	end
	--sendmsg6(actor,"复活套装数量"..fuhuosl.."  护身套装数量"..hushensl)
	if fuhuosl >= 4 then
		setint(actor,"复活几率",100)
		setint(actor,"复活血量",60)
		setint(actor,"复活CD",180)
	elseif fuhuosl >= 3 then
		setint(actor,"复活几率",100)
		setint(actor,"复活血量",30)
		setint(actor,"复活CD",240)
	elseif fuhuosl >= 2 then
		setint(actor,"复活几率",50)
		setint(actor,"复活血量",30)
		setint(actor,"复活CD",300)
	else
		setint(actor,"复活几率",0)
		setint(actor,"复活血量",0)
		setint(actor,"复活CD",0)
	end
	if hushensl >= 4 then
		setint(actor,"护身血量",50)
	elseif hushensl >= 3 then
		setint(actor,"护身血量",30)
	elseif hushensl >= 2 then
		setint(actor,"护身血量",10)
	else
		setint(actor,"护身血量",0)
	end
	
end
--死亡前复活触发
function nextdie(actor)
	local fuhuojilv = getint(actor,"复活几率")
	local fuhuotime = getint(actor,"复活时间")
	local fuhuocd = getint(actor,"复活CD")
	if os.time() - fuhuotime >= fuhuocd and math.random(1,100) <= fuhuojilv then
		realive(actor)
		local fuhuoHP =  math.floor(getbaseinfo(actor,10) * getint(actor,"复活血量")/100)
		setbaseinfo(actor,9, fuhuoHP)
		healthspellchanged(actor)
		sendmsg6(actor,"复活生效")
		setint(actor,"复活时间",os.time())
	end
end


----离线挂机
function playoffline(actor)
	setint(actor,"离线时间",os.time())
	setofftimer(actor,1) --移除定时器
	setofftimer(actor,10) --移除检查武器的定时器
	setofftimer(actor,11) --移除红蓝检测定时器
	if getconst(actor,"<$SERVERNAME>") ~= "" and getmap(actor) == "3" and getbaseinfo(actor,48) and getlevel(actor) >= 30 then --在土城安全区
		--sendmsg0(0,"离线挂机")
		local players = getobjectinmap(3,330,330,9,1) --获取玩家列表
		if #players < 100 then
			callscriptex(actor, "KILLSLAVE")
			callscriptex(actor,"OFFLINEPLAY",999999)
			return false
		end
	end
	return true
end

--小退触发
function playreconnection(actor)
	setint(actor,"离线时间",os.time())
	setofftimer(actor,1) --移除定时器
	setofftimer(actor,10) --移除检查武器的定时器
	return true
end


local jianding_t = {
	--战神
	["战神头盔"]=5,["战神项链"]=5,["战神手镯"]=5,["战神戒指"]=5,["战神腰带"]=5,["战神圣靴"]=5,["圣魔头盔"]=5,["圣魔项链"]=5,["圣魔手镯"]=5,["圣魔戒指"]=5,["圣魔腰带"]=5,
	["圣魔法靴"]=5,["真魂头盔"]=5,["真魂项链"]=5,["真魂手镯"]=5,["真魂戒指"]=5,["真魂腰带"]=5,["真魂道靴"]=5,["奔雷战甲(男)"]=10,["奔雷战甲(女)"]=10,["怒焰魔衣(男)"]=10,["怒焰魔衣(女)"]=10,
	["极光道袍(男)"]=10,["极光道袍(女)"]=10,
	--狂战
	["真龙战甲"]=30,["真龙战衣"]=30,["狂战头盔"]=15,["狂战项链"]=15,["狂战手镯"]=15,["狂战戒指"]=15,["狂战腰带"]=15,["狂战圣靴"]=15,["狂魔披风"]=30,["狂魔雨衣"]=30,["混世头盔"]=15,
	["混世项链"]=15,["混世手镯"]=15,["混世戒指"]=15,["混世腰带"]=15,["混世法靴"]=15,["皓尊道袍"]=30,["皓尊长袍"]=30,["太极头盔"]=15,["太极项链"]=15,["太极手镯"]=15, ["太极戒指"]=15, 
	["太极腰带"]=15,["太极道靴"]=15,
	--玄铁
	["圣龙战甲"]=60,["圣龙战衣"]=60,["玄铁战盔"]=30,["玄铁项链"]=30,["玄铁手镯"]=30,["玄铁戒指"]=30,["玄铁腰带"]=30,["玄铁战靴"]=30,["魔龙披风"]=60,["魔龙羽衣"]=60,["风雷魔盔"]=30,
	["风雷项链"]=30,["风雷手镯"]=30,["风雷戒指"]=30,["风雷腰带"]=30,["风雷魔靴"]=30,["御龙道袍"]=60,["御龙道衣"]=60,["蓝灵道盔"]=30,["蓝灵项链"]=30,["蓝灵手镯"]=30, ["蓝灵戒指"]=30, 
	["蓝灵腰带"]=30,["蓝灵道靴"]=30,
	--傲天
	["狂野战甲"]=100,["狂野战衣"]=100,["傲天々圣盔"]=50,["傲天々圣链"]=50,["傲天々圣镯"]=50,["傲天々圣戒"]=50,["傲天々圣带"]=50,["傲天々圣靴"]=50,["火凤之铠"]=100,["火凰之铠"]=100,
	["幻天々魔盔"]=50,["幻天々魔链"]=50,["幻天々魔镯"]=50,["幻天々魔戒"]=50,["幻天々魔带"]=50,["幻天々魔靴"]=50,["天使之羽"]=100,["天使之翼"]=100,["玄天々道盔"]=50,["玄天々道链"]=50,
	["玄天々道镯"]=50, ["玄天々道戒"]=50, ["玄天々道带"]=50,["玄天々道靴"]=50,
	--赤影
	["鬼浮屠(男)"]=100,["鬼浮屠(女)"]=100,["赤影★圣盔"]=80,["赤影★圣链"]=80,["赤影★圣镯"]=80,["赤影★圣戒"]=80,["赤影★圣带"]=80,["赤影★圣靴"]=80,["冥火(男)"]=100,
	["冥火(女)"]=100,["焚天★魔盔"]=80,["焚天★魔链"]=80,["焚天★魔镯"]=80,["焚天★魔戒"]=80,["焚天★魔带"]=80,["焚天★魔靴"]=80,["天罚(男)"]=100,["天罚(女)"]=100,
	["远古★道盔"]=80,["远古★道链"]=80,["远古★道镯"]=80,["远古★道戒"]=80,["远古★道带"]=80,["远古★道靴"]=80,
	--游龙
	["游龙ぬ锥心甲"]=100,["游龙ぬ锥心袍"]=100,["游龙ぬ锥心盔"]=100,["游龙ぬ锥心链"]=100,["游龙ぬ锥心镯"]=100,["游龙ぬ锥心戒"]=100,["游龙ぬ锥心带"]=100,["游龙ぬ锥心靴"]=100,
	["咆哮ぬ怒吼甲"]=100,["咆哮ぬ怒吼袍"]=100,["咆哮ぬ怒吼盔"]=100,["咆哮ぬ怒吼链"]=100,["咆哮ぬ怒吼镯"]=100,["咆哮ぬ怒吼戒"]=100,["咆哮ぬ怒吼带"]=100,["咆哮ぬ怒吼靴"]=100,
	["契约ぬ神罚甲"]=100,["契约ぬ神罚袍"]=100,["契约ぬ神罚盔"]=100,["契约ぬ神罚链"]=100,["契约ぬ神罚镯"]=100,["契约ぬ神罚戒"]=100,["契约ぬ神罚带"]=100,["契约ぬ神罚靴"]=100,
	--阿修罗
	["阿修罗ぬ神甲"]=100,["阿修罗ぬ神袍"]=100,["阿修罗ぬ神盔"]=100,["阿修罗ぬ神链"]=100,["阿修罗ぬ神镯"]=100,["阿修罗ぬ神戒"]=100,["阿修罗ぬ神带"]=100,["阿修罗ぬ神靴"]=100,
	["帝释天ぬ神甲"]=100,["帝释天ぬ神袍"]=100,["帝释天ぬ神盔"]=100,["帝释天ぬ神链"]=100,["帝释天ぬ神镯"]=100,["帝释天ぬ神戒"]=100,["帝释天ぬ神带"]=100,["帝释天ぬ神靴"]=100,
	["迦楼罗ぬ神甲"]=100,["迦楼罗ぬ神袍"]=100,["迦楼罗ぬ神盔"]=100,["迦楼罗ぬ神链"]=100,["迦楼罗ぬ神镯"]=100,["迦楼罗ぬ神戒"]=100,["迦楼罗ぬ神带"]=100,["迦楼罗ぬ神靴"]=100,
	--特殊
	["虹魔戒指"]=5,["虹魔手镯"]=5,["虹魔项链"]=5,["吸血戒指"]=30,["吸血手镯"]=30,["吸血项链"]=30,["怒血戒指"]=30,["怒血手镯"]=30,["怒血项链"]=30,["重击头盔"]=15,["重击靴子"]=15,
	["重击腰带"]=15,["坚固的阎罗手套"]=15,["1.1倍防御盔"]=5,["1.2倍防御盔"]=50,["破甲指环"]=15,["打野盔"]=30,["暴君头盔"]=5,["暴君腰带"]=5,["暴君靴子"]=5,
	["上帝之吻"]=5,["后羿之光"]=50,["死神戒指"]=5,["龙渊戒指"]=15,["狂风项链"]=5,["狂风戒指"]=5,["白色虎齿项链"]=5,
	["辟邪手镯"]=5,["躲避手链"]=5,["夏普尔手镯"]=5,["幽灵戒指"]=5,["神秘头盔"]=5,["神秘腰带"]=5,["神秘戒指"]=5,["炼狱手镯"]=5,["记忆手镯"]=5,
	["恶魔手镯"]=5,["黑铁手镯"]=5,["降妖除魔戒"]=30,
	
}

local diaoluoceshi = {
["天之圣龙盔"]="强化系列",
["天之雷霆项链"]="强化系列",
["天之雷霆护腕"]="强化系列",
["天之雷霆战戒"]="强化系列",
["天之雷霆腰带"]="强化系列",
["天之雷霆战靴"]="强化系列",
["天之魔龙盔"]="强化系列",
["天之烈焰项链"]="强化系列",
["天之烈焰护腕"]="强化系列",
["天之烈焰魔戒"]="强化系列",
["天之烈焰魔靴"]="强化系列",
["天之烈焰腰带"]="强化系列",
["天之天龙盔"]="强化系列",
["天之光芒项链"]="强化系列",
["天之光芒护腕"]="强化系列",
["天之光芒道戒"]="强化系列",
["天之光芒道靴"]="强化系列",
["天之光芒腰带"]="强化系列",

["屠龙"]="屠龙雷霆衣服系列",
["嗜魂法杖"]="屠龙雷霆衣服系列",
["霸者之刃"]="屠龙雷霆衣服系列",
["雷霆战甲(男)"]="屠龙雷霆衣服系列",
["雷霆战甲(女)"]="屠龙雷霆衣服系列",
["烈焰魔衣(男)"]="屠龙雷霆衣服系列",
["烈焰魔衣(女)"]="屠龙雷霆衣服系列",
["光芒道袍(男)"]="屠龙雷霆衣服系列",
["光芒道袍(女)"]="屠龙雷霆衣服系列",

["战神头盔"]="S1首饰系列",
["战神项链"]="S1首饰系列",
["战神手镯"]="S1首饰系列",
["战神戒指"]="S1首饰系列",
["战神腰带"]="S1首饰系列",
["战神圣靴"]="S1首饰系列",
["圣魔头盔"]="S1首饰系列",
["圣魔项链"]="S1首饰系列",
["圣魔手镯"]="S1首饰系列",
["圣魔戒指"]="S1首饰系列",
["圣魔腰带"]="S1首饰系列",
["圣魔法靴"]="S1首饰系列",
["真魂头盔"]="S1首饰系列",
["真魂项链"]="S1首饰系列",
["真魂手镯"]="S1首饰系列",
["真魂戒指"]="S1首饰系列",
["真魂腰带"]="S1首饰系列",
["真魂道靴"]="S1首饰系列",

["虹魔戒指"]="S1特殊系列",
["虹魔手镯"]="S1特殊系列",
["虹魔项链"]="S1特殊系列",
["1.1倍防御盔"]="S1特殊系列",
["暴君头盔"]="S1特殊系列",
["暴君腰带"]="S1特殊系列",
["暴君靴子"]="S1特殊系列",
["上帝之吻"]="S1特殊系列",
["死神戒指"]="S1特殊系列",
["狂风项链"]="S1特殊系列",
["狂风戒指"]="S1特殊系列",
["白色虎齿项链"]="S1特殊系列",
["辟邪手镯"]="S1特殊系列",
["躲避手链"]="S1特殊系列",
["夏普尔手镯"]="S1特殊系列",
["幽灵戒指"]="S1特殊系列",
["炼狱手镯"]="S1特殊系列",
["记忆手镯"]="S1特殊系列",
["恶魔手镯"]="S1特殊系列",
["黑铁手镯"]="S1特殊系列",

["奔雷战甲(男)"]="S1衣服系列",
["奔雷战甲(女)"]="S1衣服系列",
["怒焰魔衣(男)"]="S1衣服系列",
["怒焰魔衣(女)"]="S1衣服系列",
["极光道袍(男)"]="S1衣服系列",
["极光道袍(女)"]="S1衣服系列",

["开天"]="S1武器系列",
["玄天"]="S1武器系列",
["镇天"]="S1武器系列",

["狂战头盔"]="S2系列",
["狂战项链"]="S2系列",
["狂战手镯"]="S2系列",
["狂战戒指"]="S2系列",
["狂战腰带"]="S2系列",
["狂战圣靴"]="S2系列",
["混世头盔"]="S2系列",
["混世项链"]="S2系列",
["混世手镯"]="S2系列",
["混世戒指"]="S2系列",
["混世腰带"]="S2系列",
["混世法靴"]="S2系列",
["太极头盔"]="S2系列",
["太极项链"]="S2系列",
["太极手镯"]="S2系列",
["太极戒指"]="S2系列",
["太极腰带"]="S2系列",
["太极道靴"]="S2系列",
["龙渊戒指"]="S2特殊系列",
["破甲指环"]="S2特殊系列",
["祈祷手镯"]="S2特殊系列",
["祈祷戒指"]="S2特殊系列",
["重击头盔"]="S2特殊系列",
["重击靴子"]="S2特殊系列",
["重击腰带"]="S2特殊系列",
["坚固的阎罗手套"]="S2特殊系列",

["真龙战甲"]="S2衣服系列",
["真龙战衣"]="S2衣服系列",
["狂魔披风"]="S2衣服系列",
["狂魔雨衣"]="S2衣服系列",
["皓尊道袍"]="S2衣服系列",
["皓尊长袍"]="S2衣服系列",

["上古鬼炎"]="S2武器系列",
["火凤之舞"]="S2武器系列",
["绿玉无极"]="S2武器系列",

["玄铁战盔"]="S3系列",
["玄铁项链"]="S3系列",
["玄铁手镯"]="S3系列",
["玄铁戒指"]="S3系列",
["玄铁腰带"]="S3系列",
["玄铁战靴"]="S3系列",
["风雷魔盔"]="S3系列",
["风雷项链"]="S3系列",
["风雷手镯"]="S3系列",
["风雷戒指"]="S3系列",
["风雷腰带"]="S3系列",
["风雷魔靴"]="S3系列",
["蓝灵道盔"]="S3系列",
["蓝灵项链"]="S3系列",
["蓝灵手镯"]="S3系列",
["蓝灵戒指"]="S3系列",
["蓝灵腰带"]="S3系列",
["蓝灵道靴"]="S3系列",
["吸血戒指"]="S3特殊系列",
["吸血手镯"]="S3特殊系列",
["吸血项链"]="S3特殊系列",
["怒血戒指"]="S3特殊系列",
["怒血手镯"]="S3特殊系列",
["怒血项链"]="S3特殊系列",
["降妖除魔戒"]="S3特殊系列",
["打野盔"]="S3特殊系列",
["祝福项链(封印)"]="S3特殊系列",

["圣龙战甲"]="S3衣服系列",
["圣龙战衣"]="S3衣服系列",
["魔龙披风"]="S3衣服系列",
["魔龙羽衣"]="S3衣服系列",
["御龙道袍"]="S3衣服系列",
["御龙道衣"]="S3衣服系列",

["鬼斧屠戮"]="S3武器系列",
["聚灵法杖"]="S3武器系列",
["毒龙刺"]="S3武器系列",

["傲天々圣盔"]="S4系列",
["傲天々圣链"]="S4系列",
["傲天々圣镯"]="S4系列",
["傲天々圣戒"]="S4系列",
["傲天々圣带"]="S4系列",
["傲天々圣靴"]="S4系列",
["幻天々魔盔"]="S4系列",
["幻天々魔链"]="S4系列",
["幻天々魔镯"]="S4系列",
["幻天々魔戒"]="S4系列",
["幻天々魔带"]="S4系列",
["幻天々魔靴"]="S4系列",
["玄天々道盔"]="S4系列",
["玄天々道链"]="S4系列",
["玄天々道镯"]="S4系列",
["玄天々道戒"]="S4系列",
["玄天々道带"]="S4系列",
["玄天々道靴"]="S4系列",
["后羿之光"]="S4特殊系列",
["疾风项链(封印)"]="S4特殊系列",
["疾风戒指(封印)"]="S4特殊系列",
["恶魔之靴(封印)"]="S4特殊系列",
["恶魔之带(封印)"]="S4特殊系列",
["1.2倍防御盔"]="S4特殊系列",

["狂野战甲"]="S4衣服系列",
["狂野战衣"]="S4衣服系列",
["火凤之铠"]="S4衣服系列",
["火凰之铠"]="S4衣服系列",
["天使之羽"]="S4衣服系列",
["天使之翼"]="S4衣服系列",

["赤影★圣盔"]="S5系列",
["赤影★圣链"]="S5系列",
["赤影★圣镯"]="S5系列",
["赤影★圣戒"]="S5系列",
["赤影★圣带"]="S5系列",
["赤影★圣靴"]="S5系列",
["焚天★魔盔"]="S5系列",
["焚天★魔链"]="S5系列",
["焚天★魔镯"]="S5系列",
["焚天★魔戒"]="S5系列",
["焚天★魔带"]="S5系列",
["焚天★魔靴"]="S5系列",
["远古★道盔"]="S5系列",
["远古★道链"]="S5系列",
["远古★道镯"]="S5系列",
["远古★道戒"]="S5系列",
["远古★道带"]="S5系列",
["远古★道靴"]="S5系列",

["鬼浮屠(男)"]="S5衣服系列",
["鬼浮屠(女)"]="S5衣服系列",
["冥火(男)"]="S5衣服系列",
["冥火(女)"]="S5衣服系列",
["天罚(男)"]="S5衣服系列",
["天罚(女)"]="S5衣服系列",

["游龙ぬ锥心盔"]="S6系列",
["游龙ぬ锥心链"]="S6系列",
["游龙ぬ锥心镯"]="S6系列",
["游龙ぬ锥心戒"]="S6系列",
["游龙ぬ锥心带"]="S6系列",
["游龙ぬ锥心靴"]="S6系列",
["咆哮ぬ怒吼盔"]="S6系列",
["咆哮ぬ怒吼链"]="S6系列",
["咆哮ぬ怒吼镯"]="S6系列",
["咆哮ぬ怒吼戒"]="S6系列",
["咆哮ぬ怒吼带"]="S6系列",
["咆哮ぬ怒吼靴"]="S6系列",
["契约ぬ神罚盔"]="S6系列",
["契约ぬ神罚链"]="S6系列",
["契约ぬ神罚镯"]="S6系列",
["契约ぬ神罚戒"]="S6系列",
["契约ぬ神罚带"]="S6系列",
["契约ぬ神罚靴"]="S6系列",

["游龙ぬ锥心甲"]="S6衣服系列",
["游龙ぬ锥心袍"]="S6衣服系列",
["咆哮ぬ怒吼甲"]="S6衣服系列",
["咆哮ぬ怒吼袍"]="S6衣服系列",
["契约ぬ神罚甲"]="S6衣服系列",
["契约ぬ神罚袍"]="S6衣服系列",

["阿修罗ぬ神盔"]="S7系列",
["阿修罗ぬ神链"]="S7系列",
["阿修罗ぬ神镯"]="S7系列",
["阿修罗ぬ神戒"]="S7系列",
["阿修罗ぬ神带"]="S7系列",
["阿修罗ぬ神靴"]="S7系列",
["帝释天ぬ神盔"]="S7系列",
["帝释天ぬ神链"]="S7系列",
["帝释天ぬ神镯"]="S7系列",
["帝释天ぬ神戒"]="S7系列",
["帝释天ぬ神带"]="S7系列",
["帝释天ぬ神靴"]="S7系列",
["迦楼罗ぬ神盔"]="S7系列",
["迦楼罗ぬ神链"]="S7系列",
["迦楼罗ぬ神镯"]="S7系列",
["迦楼罗ぬ神戒"]="S7系列",
["迦楼罗ぬ神带"]="S7系列",
["迦楼罗ぬ神靴"]="S7系列",

["阿修罗ぬ神甲"]="S7衣服系列",
["阿修罗ぬ神袍"]="S7衣服系列",
["帝释天ぬ神甲"]="S7衣服系列",
["帝释天ぬ神袍"]="S7衣服系列",
["迦楼罗ぬ神甲"]="S7衣服系列",
["迦楼罗ぬ神袍"]="S7衣服系列",

["12万经验卷"]="12万经验卷",
["50万经验卷"]="50万经验卷",
["兽魂蛋"]="兽魂蛋",
["书页"]="书页",
["金矿石"]="金矿石",
["神兽之血"]="神兽之血",
["虎骨"]="虎骨",
["庄主令牌"]="庄主令牌",
["聚合之心"]="聚合之心",
["技能神石"]="技能神石",
["神秘水晶"]="神秘水晶",
["魔龙之血"]="魔龙之血",
["主宰凭证"]="主宰凭证",
["紫水晶矿"]="紫水晶矿",
}

----合区前禁止爆出物品
local hequqianjinzhibao = {
["吸血戒指"]=1,["吸血手镯"]=1,["吸血项链"]=1,["怒血戒指"]=1,["怒血手镯"]=1,["怒血项链"]=1,["降妖除魔戒"]=1,["打野盔"]=1,["祝福项链(封印)"]=1,["后羿之光"]=1,
["疾风项链(封印)"]=1,["疾风戒指(封印)"]=1,["恶魔之靴(封印)"]=1,["恶魔之带(封印)"]=1,["1.2倍防御盔"]=1,

["鬼斧屠戮"]=1,["聚灵法杖"]=1,["毒龙刺"]=1,
["狂野战甲"]=1,["狂野战衣"]=1,["火凤之铠"]=1,["火凰之铠"]=1,["天使之羽"]=1,["天使之翼"]=1,["鬼浮屠(男)"]=1,["鬼浮屠(女)"]=1,["冥火(男)"]=1,["冥火(女)"]=1,["天罚(男)"]=1,["天罚(女)"]=1,
["赤影★圣盔"]=1,["赤影★圣链"]=1,["赤影★圣镯"]=1,["赤影★圣戒"]=1,["赤影★圣带"]=1,["赤影★圣靴"]=1,["焚天★魔盔"]=1,["焚天★魔链"]=1,["焚天★魔镯"]=1,["焚天★魔戒"]=1,["焚天★魔带"]=1,
["焚天★魔靴"]=1,["远古★道盔"]=1,["远古★道链"]=1,["远古★道镯"]=1,["远古★道戒"]=1,["远古★道带"]=1,["远古★道靴"]=1,
["傲天々圣盔"]=1,["傲天々圣链"]=1,["傲天々圣镯"]=1,["傲天々圣戒"]=1,["傲天々圣带"]=1,["傲天々圣靴"]=1,["幻天々魔盔"]=1,["幻天々魔链"]=1,["幻天々魔镯"]=1,["幻天々魔戒"]=1,["幻天々魔带"]=1,
["幻天々魔靴"]=1,["玄天々道盔"]=1,["玄天々道链"]=1,["玄天々道镯"]=1,["玄天々道戒"]=1,["玄天々道带"]=1,["玄天々道靴"]=1,

["游龙ぬ锥心甲"]=1,["游龙ぬ锥心袍"]=1,["咆哮ぬ怒吼甲"]=1,["咆哮ぬ怒吼袍"]=1,
["契约ぬ神罚甲"]=1,["契约ぬ神罚袍"]=1,["游龙ぬ锥心盔"]=1,["游龙ぬ锥心链"]=1,["游龙ぬ锥心镯"]=1,["游龙ぬ锥心戒"]=1,["游龙ぬ锥心带"]=1,["游龙ぬ锥心靴"]=1,["咆哮ぬ怒吼盔"]=1,["咆哮ぬ怒吼链"]=1,
["咆哮ぬ怒吼镯"]=1,["咆哮ぬ怒吼戒"]=1,["咆哮ぬ怒吼带"]=1,["咆哮ぬ怒吼靴"]=1,["契约ぬ神罚盔"]=1,["契约ぬ神罚链"]=1,["契约ぬ神罚镯"]=1,["契约ぬ神罚戒"]=1,["契约ぬ神罚带"]=1,["契约ぬ神罚靴"]=1,
["阿修罗ぬ神甲"]=1,["阿修罗ぬ神袍"]=1,["帝释天ぬ神甲"]=1,["帝释天ぬ神袍"]=1,["迦楼罗ぬ神甲"]=1,["迦楼罗ぬ神袍"]=1,["阿修罗ぬ神盔"]=1,["阿修罗ぬ神链"]=1,["阿修罗ぬ神镯"]=1,["阿修罗ぬ神戒"]=1,
["阿修罗ぬ神带"]=1,["阿修罗ぬ神靴"]=1,["帝释天ぬ神盔"]=1,["帝释天ぬ神链"]=1,["帝释天ぬ神镯"]=1,["帝释天ぬ神戒"]=1,["帝释天ぬ神带"]=1,["帝释天ぬ神靴"]=1,["迦楼罗ぬ神盔"]=1,["迦楼罗ぬ神链"]=1,
["迦楼罗ぬ神镯"]=1,["迦楼罗ぬ神戒"]=1,["迦楼罗ぬ神带"]=1,["迦楼罗ぬ神靴"]=1,
}

local erhejinzhibao = {
["狂野战甲"]=1,["狂野战衣"]=1,["火凤之铠"]=1,["火凰之铠"]=1,["天使之羽"]=1,["天使之翼"]=1,
["鬼浮屠(男)"]=1,["鬼浮屠(女)"]=1,["冥火(男)"]=1,["冥火(女)"]=1,["天罚(男)"]=1,["天罚(女)"]=1,
["赤影★圣盔"]=1,["赤影★圣链"]=1,["赤影★圣镯"]=1,["赤影★圣戒"]=1,["赤影★圣带"]=1,["赤影★圣靴"]=1,["焚天★魔盔"]=1,["焚天★魔链"]=1,["焚天★魔镯"]=1,["焚天★魔戒"]=1,["焚天★魔带"]=1,
["焚天★魔靴"]=1,["远古★道盔"]=1,["远古★道链"]=1,["远古★道镯"]=1,["远古★道戒"]=1,["远古★道带"]=1,["远古★道靴"]=1,
["游龙ぬ锥心甲"]=1,["游龙ぬ锥心袍"]=1,["咆哮ぬ怒吼甲"]=1,["咆哮ぬ怒吼袍"]=1,["契约ぬ神罚甲"]=1,["契约ぬ神罚袍"]=1,
["游龙ぬ锥心盔"]=1,["游龙ぬ锥心链"]=1,["游龙ぬ锥心镯"]=1,["游龙ぬ锥心戒"]=1,["游龙ぬ锥心带"]=1,["游龙ぬ锥心靴"]=1,
["咆哮ぬ怒吼盔"]=1,["咆哮ぬ怒吼链"]=1,["咆哮ぬ怒吼镯"]=1,["咆哮ぬ怒吼戒"]=1,["咆哮ぬ怒吼带"]=1,["咆哮ぬ怒吼靴"]=1,
["契约ぬ神罚盔"]=1,["契约ぬ神罚链"]=1,["契约ぬ神罚镯"]=1,["契约ぬ神罚戒"]=1,["契约ぬ神罚带"]=1,["契约ぬ神罚靴"]=1,
["阿修罗ぬ神甲"]=1,["阿修罗ぬ神袍"]=1,["帝释天ぬ神甲"]=1,["帝释天ぬ神袍"]=1,["迦楼罗ぬ神甲"]=1,["迦楼罗ぬ神袍"]=1,
["阿修罗ぬ神盔"]=1,["阿修罗ぬ神链"]=1,["阿修罗ぬ神镯"]=1,["阿修罗ぬ神戒"]=1,["阿修罗ぬ神带"]=1,["阿修罗ぬ神靴"]=1,
["帝释天ぬ神盔"]=1,["帝释天ぬ神链"]=1,["帝释天ぬ神镯"]=1,["帝释天ぬ神戒"]=1,["帝释天ぬ神带"]=1,["帝释天ぬ神靴"]=1,
["迦楼罗ぬ神盔"]=1,["迦楼罗ぬ神链"]=1,["迦楼罗ぬ神镯"]=1,["迦楼罗ぬ神戒"]=1,["迦楼罗ぬ神带"]=1,["迦楼罗ぬ神靴"]=1,
}

local sanhejinzhibao = {
["狂野战甲"]=1,["狂野战衣"]=1,
["鬼浮屠(男)"]=1,["鬼浮屠(女)"]=1,["冥火(男)"]=1,["冥火(女)"]=1,["天罚(男)"]=1,["天罚(女)"]=1,
["游龙ぬ锥心甲"]=1,["游龙ぬ锥心袍"]=1,["咆哮ぬ怒吼甲"]=1,["咆哮ぬ怒吼袍"]=1,["契约ぬ神罚甲"]=1,["契约ぬ神罚袍"]=1,
["游龙ぬ锥心盔"]=1,["游龙ぬ锥心链"]=1,["游龙ぬ锥心镯"]=1,["游龙ぬ锥心戒"]=1,["游龙ぬ锥心带"]=1,["游龙ぬ锥心靴"]=1,
["咆哮ぬ怒吼盔"]=1,["咆哮ぬ怒吼链"]=1,["咆哮ぬ怒吼镯"]=1,["咆哮ぬ怒吼戒"]=1,["咆哮ぬ怒吼带"]=1,["咆哮ぬ怒吼靴"]=1,
["契约ぬ神罚盔"]=1,["契约ぬ神罚链"]=1,["契约ぬ神罚镯"]=1,["契约ぬ神罚戒"]=1,["契约ぬ神罚带"]=1,["契约ぬ神罚靴"]=1,
["阿修罗ぬ神甲"]=1,["阿修罗ぬ神袍"]=1,["帝释天ぬ神甲"]=1,["帝释天ぬ神袍"]=1,["迦楼罗ぬ神甲"]=1,["迦楼罗ぬ神袍"]=1,
["阿修罗ぬ神盔"]=1,["阿修罗ぬ神链"]=1,["阿修罗ぬ神镯"]=1,["阿修罗ぬ神戒"]=1,["阿修罗ぬ神带"]=1,["阿修罗ぬ神靴"]=1,
["帝释天ぬ神盔"]=1,["帝释天ぬ神链"]=1,["帝释天ぬ神镯"]=1,["帝释天ぬ神戒"]=1,["帝释天ぬ神带"]=1,["帝释天ぬ神靴"]=1,
["迦楼罗ぬ神盔"]=1,["迦楼罗ぬ神链"]=1,["迦楼罗ぬ神镯"]=1,["迦楼罗ぬ神戒"]=1,["迦楼罗ぬ神带"]=1,["迦楼罗ぬ神靴"]=1,
}

local sihejinzhibao = {
["鬼浮屠(男)"]=1,["鬼浮屠(女)"]=1,["冥火(男)"]=1,["冥火(女)"]=1,["天罚(男)"]=1,["天罚(女)"]=1,
["游龙ぬ锥心甲"]=1,["游龙ぬ锥心袍"]=1,["咆哮ぬ怒吼甲"]=1,["咆哮ぬ怒吼袍"]=1,["契约ぬ神罚甲"]=1,["契约ぬ神罚袍"]=1,
["游龙ぬ锥心盔"]=1,["游龙ぬ锥心链"]=1,["游龙ぬ锥心镯"]=1,["游龙ぬ锥心戒"]=1,["游龙ぬ锥心带"]=1,["游龙ぬ锥心靴"]=1,
["咆哮ぬ怒吼盔"]=1,["咆哮ぬ怒吼链"]=1,["咆哮ぬ怒吼镯"]=1,["咆哮ぬ怒吼戒"]=1,["咆哮ぬ怒吼带"]=1,["咆哮ぬ怒吼靴"]=1,
["契约ぬ神罚盔"]=1,["契约ぬ神罚链"]=1,["契约ぬ神罚镯"]=1,["契约ぬ神罚戒"]=1,["契约ぬ神罚带"]=1,["契约ぬ神罚靴"]=1,
["阿修罗ぬ神甲"]=1,["阿修罗ぬ神袍"]=1,["帝释天ぬ神甲"]=1,["帝释天ぬ神袍"]=1,["迦楼罗ぬ神甲"]=1,["迦楼罗ぬ神袍"]=1,
["阿修罗ぬ神盔"]=1,["阿修罗ぬ神链"]=1,["阿修罗ぬ神镯"]=1,["阿修罗ぬ神戒"]=1,["阿修罗ぬ神带"]=1,["阿修罗ぬ神靴"]=1,
["帝释天ぬ神盔"]=1,["帝释天ぬ神链"]=1,["帝释天ぬ神镯"]=1,["帝释天ぬ神戒"]=1,["帝释天ぬ神带"]=1,["帝释天ぬ神靴"]=1,
["迦楼罗ぬ神盔"]=1,["迦楼罗ぬ神链"]=1,["迦楼罗ぬ神镯"]=1,["迦楼罗ぬ神戒"]=1,["迦楼罗ぬ神带"]=1,["迦楼罗ぬ神靴"]=1,
}

local bahejinzhibao = {
["游龙ぬ锥心甲"]=1,["游龙ぬ锥心袍"]=1,["咆哮ぬ怒吼甲"]=1,["咆哮ぬ怒吼袍"]=1,["契约ぬ神罚甲"]=1,["契约ぬ神罚袍"]=1,
["阿修罗ぬ神甲"]=1,["阿修罗ぬ神袍"]=1,["帝释天ぬ神甲"]=1,["帝释天ぬ神袍"]=1,["迦楼罗ぬ神甲"]=1,["迦楼罗ぬ神袍"]=1,
["阿修罗ぬ神盔"]=1,["阿修罗ぬ神链"]=1,["阿修罗ぬ神镯"]=1,["阿修罗ぬ神戒"]=1,["阿修罗ぬ神带"]=1,["阿修罗ぬ神靴"]=1,
["帝释天ぬ神盔"]=1,["帝释天ぬ神链"]=1,["帝释天ぬ神镯"]=1,["帝释天ぬ神戒"]=1,["帝释天ぬ神带"]=1,["帝释天ぬ神靴"]=1,
["迦楼罗ぬ神盔"]=1,["迦楼罗ぬ神链"]=1,["迦楼罗ぬ神镯"]=1,["迦楼罗ぬ神戒"]=1,["迦楼罗ぬ神带"]=1,["迦楼罗ぬ神靴"]=1,
}

----单独怪物掉落合区降爆率
local danduguaiwu_t ={
["钳虫"]=1,["蜈蚣"]=1,["黑色恶蛆"]=1,["跳跳蜂"]=1,["巨型蠕虫"]=1,["邪恶钳虫"]=1,["暗黑战士"]=1,["沃玛勇士"]=1,["沃玛战将"]=1,["火焰沃玛"]=1,["沃玛卫士"]=1,["骷髅精灵"]=1,
["红野猪"]=1,["黑野猪"]=1,["白野猪"]=1,["蝎蛇"]=1,["楔蛾"]=1,["獠牙野猪"]=1,["邪恶毒蛇"]=1,["灵魂收割者"]=1,["蓝影刀客"]=1,["大老鼠"]=1,["祖玛弓箭手"]=1,["祖玛雕像"]=1,
["祖玛卫士"]=1,["奴隶卫士"]=1,["奴隶神像"]=1,["奴隶射手"]=1,["骷髅弓箭手"]=1,["骷髅长枪兵"]=1,["骷髅刀斧手"]=1,["骷髅锤兵"]=1,["骷髅刀客"]=1,["牛头魔"]=1,["牛魔侍卫"]=1,
["牛魔斗士"]=1,["牛魔祭司"]=1,["牛魔将军"]=1,["牛魔法师"]=1,["暗夜法师"]=1,["黑暗祭祀"]=1,["腐蹄将军"]=1,
["花吻蜘蛛"]=1,["天狼蜘蛛"]=1,["暴牙蜘蛛"]=1,["黑锷蜘蛛"]=1,["血僵尸"]=1,["邪恶巨人"]=1,["虹魔教主"]=1,["黄泉教主"]=1,["牛魔王"]=1,["双头金刚"]=1,
["双头血魔"]=1,["沃玛教主"]=1,["沃玛卫士队长"]=1,["骷髅精灵队长"]=1,["邪恶毒蛇首领"]=1,["獠牙野猪首领"]=1,["虹魔猪皇"]=1,["虹魔蝎皇"]=1,["奴隶射手头目"]=1,
["奴隶神像头目"]=1,["奴隶卫士头目"]=1,["骷髅刀客统领"]=1,["骷髅锤兵统领"]=1,["暗夜大法师"]=1,["黑暗大祭祀"]=1,["腐蹄大将军"]=1,

}
local jiangbaolv_wupin = {
["圣战头盔"]=1,["圣战项链"]=1,["圣战手镯"]=1,["圣战戒指"]=1,["法神头盔"]=1,["法神项链"]=1,["法神手镯"]=1,["法神戒指"]=1,["天尊头盔"]=1,["天尊项链"]=1,["天尊手镯"]=1,
["天尊戒指"]=1,["天魔神甲"]=1,["圣战宝甲"]=1,["血饮"]=1,["法神披风"]=1,["霓裳羽衣"]=1,["天尊道袍"]=1,["天师长袍"]=1,["圣战腰带"]=1,["圣战靴子"]=1,["法神腰带"]=1,
["法神靴子"]=1,["天尊腰带"]=1,["天尊靴子"]=1,["怒斩"]=1,["龙牙"]=1,["逍遥扇"]=1,["雷霆腰带"]=1,["雷霆战靴"]=1,["烈焰魔靴"]=1,["烈焰腰带"]=1,["光芒道靴"]=1,["光芒腰带"]=1,
["圣龙盔"]=1,["雷霆项链"]=1,["雷霆护腕"]=1,["雷霆战戒"]=1,["魔龙盔"]=1,["烈焰项链"]=1,["烈焰护腕"]=1,["烈焰魔戒"]=1,["天龙盔"]=1,["光芒项链"]=1,["光芒护腕"]=1,["光芒道戒"]=1,
["屠龙"]=1,["嗜魂法杖"]=1,["霸者之刃"]=1,["雷霆战甲(男)"]=1,["雷霆战甲(女)"]=1,["烈焰魔衣(男)"]=1,["烈焰魔衣(女)"]=1,["光芒道袍(男)"]=1,["光芒道袍(女)"]=1,["天之圣龙盔"]=1,
["天之雷霆项链"]=1,["天之雷霆护腕"]=1,["天之雷霆战戒"]=1,["天之雷霆腰带"]=1,["天之雷霆战靴"]=1,["天之魔龙盔"]=1,["天之烈焰项链"]=1,["天之烈焰护腕"]=1,["天之烈焰魔戒"]=1,
["天之烈焰魔靴"]=1,["天之烈焰腰带"]=1,["天之天龙盔"]=1,["天之光芒项链"]=1,["天之光芒护腕"]=1,["天之光芒道戒"]=1,["天之光芒道靴"]=1,["天之光芒腰带"]=1,
}

local kz_ditu={
["d609"]=1,["womajingxiang"]=1,["d022"]=1,["d023"]=1,["d024"]=1,["d021"]=1,["d713"]=1,["d714"]=1,["d715"]=1,["d716"]=1,["d717"]=1,["jxdt"]=1,["d2008"]=1,["d2010"]=1,["d2011"]=1,
["d2012"]=1,["d2013"]=1,["d2001"]=1,["d505"]=1,["d5071"]=1,["d5072"]=1,["d5073"]=1,["d5074"]=1,["d515"]=1,["zmjt"]=1,["d2063"]=1,["d2064"]=1,["d2067"]=1,["nhq"]=1,["hqsy"]=1,
["niumojingxiang"]=1,["d2073"]=1,["d2075"]=1,["d2076"]=1,["d2078"]=1,["d2079"]=1,["qlsy"]=1,["d1004"]=1,["d10051"]=1,["d10052"]=1,
}
local kz_guaiwu={
["暗之触龙神"]=1,["沃玛卫士队长"]=1,["骷髅精灵队长"]=1,["沃玛教皇"]=1,["邪恶毒蛇首领"]=1,["獠牙野猪首领"]=1,["石墓教皇"]=1,["镜像左护法"]=1,["镜像右护法"]=1,["虹魔猪皇"]=1,
["虹魔蝎皇"]=1,["上古虹魔教主"]=1,["奴隶射手头目"]=1,["奴隶神像头目"]=1,["奴隶卫士头目"]=1,["祖玛教主"]=1,["万年树妖"]=1,["祭坛护卫"]=1,
["骷髅刀客统领"]=1,["骷髅锤兵统领"]=1,["上古黄泉教主"]=1,["万年树妖"]=1,["暗夜大法师"]=1,["黑暗大祭祀"]=1,["腐蹄大将军"]=1,["上古牛魔王"]=1,["赤月恶魔"]=1,
}
local kz_wupin={
["上古鬼炎"]=1,["绿玉无极"]=1,["火凤之舞"]=1,["真龙战甲"]=1,["真龙战衣"]=1,["狂魔披风"]=1,["狂魔雨衣"]=1,["皓尊道袍"]=1,["皓尊长袍"]=1,["狂战头盔"]=1,["狂战项链"]=1,["狂战手镯"]=1,
["狂战戒指"]=1,["狂战腰带"]=1,["狂战圣靴"]=1,["混世头盔"]=1,["混世项链"]=1,["混世手镯"]=1,["混世戒指"]=1,["混世腰带"]=1,["混世法靴"]=1,["太极头盔"]=1,["太极项链"]=1,["太极手镯"]=1,
["太极戒指"]=1,["太极腰带"]=1,["太极道靴"]=1,["鬼斧屠戮"]=1,["聚灵法杖"]=1,["毒龙刺"]=1,["圣龙战甲"]=1,["圣龙战衣"]=1,["魔龙披风"]=1,["魔龙羽衣"]=1,["御龙道袍"]=1,["御龙道衣"]=1,
["玄铁战盔"]=1,["玄铁项链"]=1,["玄铁手镯"]=1,["玄铁戒指"]=1,["玄铁腰带"]=1,["玄铁战靴"]=1,["风雷魔盔"]=1,["风雷项链"]=1,["风雷手镯"]=1,["风雷戒指"]=1,["风雷腰带"]=1,["风雷魔靴"]=1,
["蓝灵道盔"]=1,["蓝灵项链"]=1,["蓝灵手镯"]=1,["蓝灵戒指"]=1,["蓝灵腰带"]=1,["蓝灵道靴"]=1,
}
local kz_jyguaiwu={
["暗之触龙神"]=1,["沃玛卫士队长"]=1,["骷髅精灵队长"]=1,["沃玛教皇"]=1,["邪恶毒蛇首领"]=1,["獠牙野猪首领"]=1,["石墓教皇"]=1,["虹魔猪皇"]=1,
["虹魔蝎皇"]=1,["上古虹魔教主"]=1,["奴隶射手头目"]=1,["奴隶神像头目"]=1,["奴隶卫士头目"]=1,["祖玛教主"]=1,
["骷髅刀客统领"]=1,["骷髅锤兵统领"]=1,["上古黄泉教主"]=1,["暗夜大法师"]=1,["黑暗大祭祀"]=1,["腐蹄大将军"]=1,["上古牛魔王"]=1,["赤月恶魔"]=1,
}

local jykz_guai = {["魔龙战将"]=1,["魔龙巨娥"]=1,["魔龙力士"]=1,}

local jiluwupin = {["开天"]=249,["玄天"]=249,["镇天"]=249,["奔雷战甲(男)"]=249,["奔雷战甲(女)"]=249,["怒焰魔衣(男)"]=249,["怒焰魔衣(女)"]=249,["极光道袍(男)"]=249,["极光道袍(女)"]=249,
["战神头盔"]=70,["战神项链"]=70,["战神手镯"]=70,["战神戒指"]=70,["战神腰带"]=70,["战神圣靴"]=70,["圣魔头盔"]=70,["圣魔项链"]=70,["圣魔手镯"]=70,["圣魔戒指"]=70,["圣魔腰带"]=70,["圣魔法靴"]=70,
["真魂头盔"]=70,["真魂项链"]=70,["真魂手镯"]=70,["真魂戒指"]=70,["真魂腰带"]=70,["真魂道靴"]=70,["上古鬼炎"]=249,["火凤之舞"]=249,["绿玉无极"]=249,["真龙战甲"]=249,["真龙战衣"]=249,["狂魔披风"]=249,
["狂魔雨衣"]=249,["皓尊道袍"]=249,["皓尊长袍"]=249,["狂战头盔"]=249,["狂战项链"]=249,["狂战手镯"]=249,["狂战戒指"]=249,["狂战腰带"]=249,["狂战圣靴"]=249,["混世头盔"]=249,["混世项链"]=249,
["混世手镯"]=249,["混世戒指"]=249,["混世腰带"]=249,["混世法靴"]=249,["太极头盔"]=249,["太极项链"]=249,["太极手镯"]=249,["太极戒指"]=249,["太极腰带"]=249,["太极道靴"]=249,["鬼斧屠戮"]=249,
["聚灵法杖"]=249,["毒龙刺"]=249,["圣龙战甲"]=249,["圣龙战衣"]=249,["魔龙披风"]=249,["魔龙羽衣"]=249,["御龙道袍"]=249,["御龙道衣"]=249,["玄铁战盔"]=249,["玄铁项链"]=249,["玄铁手镯"]=249,
["玄铁戒指"]=249,["玄铁腰带"]=249,["玄铁战靴"]=249,["风雷魔盔"]=249,["风雷项链"]=249,["风雷手镯"]=249,["风雷戒指"]=249,["风雷腰带"]=249,["风雷魔靴"]=249,["蓝灵道盔"]=249,["蓝灵项链"]=249,
["蓝灵手镯"]=249,["蓝灵戒指"]=249,["蓝灵腰带"]=249,["蓝灵道靴"]=249,["狂野战甲"]=249,["狂野战衣"]=249,["火凤之铠"]=249,["火凰之铠"]=249,["天使之羽"]=249,["天使之翼"]=249,["傲天々圣盔"]=249,
["傲天々圣链"]=249,["傲天々圣镯"]=249,["傲天々圣戒"]=249,["傲天々圣带"]=249,["傲天々圣靴"]=249,["幻天々魔盔"]=249,["幻天々魔链"]=249,["幻天々魔镯"]=249,["幻天々魔戒"]=249,["幻天々魔带"]=249,
["幻天々魔靴"]=249,["玄天々道盔"]=249,["玄天々道链"]=249,["玄天々道镯"]=249,["玄天々道戒"]=249,["玄天々道带"]=249,["玄天々道靴"]=249,["鬼浮屠(男)"]=249,["鬼浮屠(女)"]=249,["冥火(男)"]=249,
["冥火(女)"]=249,["天罚(男)"]=249,["天罚(女)"]=249,["赤影★圣盔"]=249,["赤影★圣链"]=249,["赤影★圣镯"]=249,["赤影★圣戒"]=249,["赤影★圣带"]=249,["赤影★圣靴"]=249,["焚天★魔盔"]=249,
["焚天★魔链"]=249,["焚天★魔镯"]=249,["焚天★魔戒"]=249,["焚天★魔带"]=249,["焚天★魔靴"]=249,["远古★道盔"]=249,["远古★道链"]=249,["远古★道镯"]=249,["远古★道戒"]=249,["远古★道带"]=249,
["远古★道靴"]=249,["游龙ぬ锥心甲"]=249,["游龙ぬ锥心袍"]=249,["咆哮ぬ怒吼甲"]=249,["咆哮ぬ怒吼袍"]=249,["契约ぬ神罚甲"]=249,["契约ぬ神罚袍"]=249,["游龙ぬ锥心盔"]=249,["游龙ぬ锥心链"]=249,
["游龙ぬ锥心镯"]=249,["游龙ぬ锥心戒"]=249,["游龙ぬ锥心带"]=249,["游龙ぬ锥心靴"]=249,["咆哮ぬ怒吼盔"]=249,["咆哮ぬ怒吼链"]=249,["咆哮ぬ怒吼镯"]=249,["咆哮ぬ怒吼戒"]=249,["咆哮ぬ怒吼带"]=249,
["咆哮ぬ怒吼靴"]=249,["契约ぬ神罚盔"]=249,["契约ぬ神罚链"]=249,["契约ぬ神罚镯"]=249,["契约ぬ神罚戒"]=249,["契约ぬ神罚带"]=249,["契约ぬ神罚靴"]=249,["阿修罗ぬ神甲"]=249,["阿修罗ぬ神袍"]=249,
["帝释天ぬ神甲"]=249,["帝释天ぬ神袍"]=249,["迦楼罗ぬ神甲"]=249,["迦楼罗ぬ神袍"]=249,["阿修罗ぬ神盔"]=249,["阿修罗ぬ神链"]=249,["阿修罗ぬ神镯"]=249,["阿修罗ぬ神戒"]=249,["阿修罗ぬ神带"]=249,
["阿修罗ぬ神靴"]=249,["帝释天ぬ神盔"]=249,["帝释天ぬ神链"]=249,["帝释天ぬ神镯"]=249,["帝释天ぬ神戒"]=249,["帝释天ぬ神带"]=249,["帝释天ぬ神靴"]=249,["迦楼罗ぬ神盔"]=249,["迦楼罗ぬ神链"]=249,
["迦楼罗ぬ神镯"]=249,["迦楼罗ぬ神戒"]=249,["迦楼罗ぬ神带"]=249,["迦楼罗ぬ神靴"]=249,
["虹魔戒指"]=70,["虹魔手镯"]=70,["虹魔项链"]=70,["1.1倍防御盔"]=70,["暴君头盔 "]=70,["暴君腰带 "]=70,["暴君靴子"]=70,["上帝之吻"]=70,["死神戒指"]=70,["狂风项链"]=70,["狂风戒指"]=70,
["白色虎齿项链"]=70,["辟邪手镯"]=70,["躲避手链"]=70,["夏普尔手镯"]=70,["幽灵戒指"]=70,["神秘头盔"]=70,["神秘腰带"]=70,["神秘戒指"]=70,["炼狱手镯"]=70,["记忆手镯"]=70,["恶魔手镯"]=70,["黑铁手镯"]=70,
["龙渊戒指"]=249,["破甲指环"]=249,["祈祷手镯"]=249,["祈祷戒指"]=249,["重击头盔"]=249,["重击靴子"]=249,["重击腰带"]=249,["坚固的阎罗手套"]=249,
["吸血戒指"]=249,["吸血手镯"]=249,["吸血项链"]=249,["怒血戒指"]=249,["怒血手镯"]=249,["怒血项链"]=249,["降妖除魔戒"]=249,["打野盔"]=249,["祝福项链(封印)"]=249,
["后羿之光"]=249,["疾风项链(封印)"]=249,["疾风戒指(封印)"]=249,["恶魔之靴(封印)"]=249,["恶魔之带(封印)"]=249,["1.2倍防御盔"]=249,}

local teshukz_guai = {["虹魔教主"]=1,["黄泉教主"]=1,["牛魔王"]=1,["双头金刚"]=1,["双头血魔"]=1,["沃玛教主"]=1,["魔龙战将"]=1,["魔龙巨娥"]=1,["魔龙力士"]=1,}

local teshukz_wupin = {
["虹魔戒指"]=1,["虹魔手镯"]=1,["虹魔项链"]=1,["1.1倍防御盔"]=1,["暴君头盔"]=1,["暴君腰带"]=1,["暴君靴子"]=1,["上帝之吻"]=1,["死神戒指"]=1,
["狂风项链"]=1,["狂风戒指"]=1,["白色虎齿项链"]=1,["辟邪手镯"]=1,["躲避手链"]=1,["夏普尔手镯"]=1,["幽灵戒指"]=1,["神秘头盔"]=1,["神秘腰带"]=1,
["神秘戒指"]=1,["炼狱手镯"]=1,["记忆手镯"]=1,["恶魔手镯"]=1,["黑铁手镯"]=1,
}

local xinkz_wupin={
["开天"]=1,["玄天"]=1,["镇天"]=1,["奔雷战甲(男)"]=1,["奔雷战甲(女)"]=1,["怒焰魔衣(男)"]=1,["怒焰魔衣(女)"]=1,["极光道袍(男)"]=1,["极光道袍(女)"]=1,
["战神头盔"]=1,["战神项链"]=1,["战神手镯"]=1,["战神戒指"]=1,["战神腰带"]=1,["战神圣靴"]=1,["圣魔头盔"]=1,["圣魔项链"]=1,["圣魔手镯"]=1,["圣魔戒指"]=1,
["圣魔腰带"]=1,["圣魔法靴"]=1,["真魂头盔"]=1,["真魂项链"]=1,["真魂手镯"]=1,["真魂戒指"]=1,["真魂腰带"]=1,["真魂道靴"]=1,}

local xinkz_guai = {["蚩尤之主"]=1,["镜像魔王"]=1,["封魔冥界教父"]=1,["远古祖玛教父"]=1,["不朽帝皇"]=1,["谛听兽"]=1,["远古双头金刚"]=1,["远古双头血魔"]=1,["远古赤月恶魔"]=1,}


local xinjykzguai = {["虹魔教主"]=1,["黄泉教主"]=1,["牛魔王"]=1,["双头金刚"]=1,["双头血魔"]=1,["沃玛教主"]=1,}
--怪物掉落前触发
function mondropitemex(actor,item,mon,x,y)
	--sendmsg0(0,"掉落"..getname(actor))
	local monname = getname(mon)
	local name = getitemname(actor,item)
	local mapid = getmap(mon)
	if xinkz_guai[monname] and xinkz_wupin[name] then
		if getsysint("合区次数") > 3 then
			if math.random(1,100) <= 30 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif getsysint("合区次数") > 2 then
			if math.random(1,100) <= 20 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif getsysint("合区次数") > 1 then
			if math.random(1,100) <= 10 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		end
	end
	
	
	if kz_ditu[mapid] and kz_guaiwu[monname] and xinkz_wupin[name] then
		if getsysint("合区次数") > 3 then
			if math.random(1,100) <= 80 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif getsysint("合区次数") > 2 then
			if math.random(1,100) <= 60 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif getsysint("合区次数") > 1 then
			if math.random(1,100) <= 40 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif getsysint("合区次数") > 0 then
			if math.random(1,100) <= 20 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		end
	end
	
	if teshukz_guai[monname] and teshukz_wupin[name] then
		if getsysint("合区次数") > 1 then
			return false
		elseif getsysint("合区次数") > 0 then
			if math.random(1,100) <= 50 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		end
	end
	
	
	if kz_ditu[mapid] and kz_guaiwu[monname] and kz_wupin[name] then
		if getsysint("合区次数") > 1 then
			if math.random(1,100) <= 70 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
			if name == "上古鬼炎" or name == "绿玉无极" then
				return false
			end
		elseif getsysint("合区次数") > 0 then
			if math.random(1,100) <= 50 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
			if name == "上古鬼炎" or name == "绿玉无极" then
				return false
			end
		end
	end
	if kz_ditu[mapid] and kz_jyguaiwu[monname] and name == "12万经验卷" then
		if getsysint("合区次数") > 1 then
			if math.random(1,100) <= 50 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif getsysint("合区次数") > 0 then
			if math.random(1,100) <= 25 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		end
	end
	
	if jykz_guai[getbaseinfo(mon,1,1)] and name == "12万经验卷" then
		if getsysint("合区次数") > 2 then
			if math.random(1,100) <= 50 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif getsysint("合区次数") > 1 then
			if math.random(1,100) <= 20 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		end
	end
	
	if xinjykzguai[monname] and name == "12万经验卷" then
		if getsysint("合区次数") > 3 then
			return false
		elseif	getsysint("合区次数") > 2 then
			if math.random(1,100) <= 80 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif	getsysint("合区次数") > 1 then
			if math.random(1,100) <= 60 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif getsysint("合区次数") > 0 then
			if math.random(1,100) <= 50 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		end
	end
	
	
	
	--------------幸运爆率的物品控制
	local biaojiitem = getcurrent(mon,5)
	local baochubiaoji = getcurrent(mon,4) --已爆出标记
	--sendmsg6(actor,biaojiitem)
	--sendmsg6(actor,baochubiaoji)
	if name == biaojiitem then
		if baochubiaoji == "yibao" then
			--sendmsg9(actor,"已经爆出过")
			return false
		else
			setcurrent(mon,4,"yibao")
		end
	end
	--------------
	setsysint("应掉"..name,getsysint("应掉"..name)+1,0)
	if bahejinzhibao[name] and getsysint("合区次数") < 8 then
		return false
	end
	if sihejinzhibao[name] and getsysint("合区次数") <=6 then
		return false
	end
	if sanhejinzhibao[name] and getsysint("合区次数") <=3 then
		return false
	end
	if erhejinzhibao[name] and getsysint("合区次数") <=2 then
		return false
	end
	if hequqianjinzhibao[name] and getsysint("合区次数") < 1 then
		return false
	end
	
	if danduguaiwu_t[monname] and jiangbaolv_wupin[name] then
		if getsysint("合区次数") >= 6 then
			if math.random(1,100) <= 50 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif getsysint("合区次数") >= 4 then
			if math.random(1,100) <= 40 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif getsysint("合区次数") >= 3 then
			if math.random(1,100) <= 30 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif getsysint("合区次数") >= 2 then
			if math.random(1,100) <= 20 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif getsysint("合区次数") >= 1 then
			if math.random(1,100) <= 10 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		end
	end
	
	if name == "紫水晶矿" and getsysint("合区次数") >= 1 then
		if math.random(1,100) <= 50 then
			--sendmsg6(actor,name.."禁止爆出")
			return false
		end
	end
	if name == "金矿石" then
		if getsysint("合区次数") >= 2 then
			if math.random(1,100) <= 90 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		elseif getsysint("合区次数") >= 1 then
			if math.random(1,100) <= 90 then
				--sendmsg6(actor,name.."禁止爆出")
				return false
			end
		end
	end
	
	callscriptex(actor, "LINKPICKUPITEM") --关联掉落物品
	if jianding_t[name] ~= nil then
		if math.random(1,100) <= jianding_t[name] then
			callscriptex(actor, "CHANGEITEMNAMECOLOR", -1, 249)
		end
	end
	----测试用 后面删掉
	if diaoluoceshi[name] then
		local bianliang = diaoluoceshi[name] --变量
		setsysint("掉落数量"..bianliang,getsysint("掉落数量"..bianliang) + 1,0 )
		setsysint("每日掉落数量"..bianliang,getsysint("每日掉落数量"..bianliang) + 1,0 )
	end
	callscriptex(actor, "SetItemFlag",-1,4,1) --设置是否怪物爆出
	
	setsysint("实掉"..name,getsysint("实掉"..name)+1,0)
	
	if name == "金矿石" then
		post(actor,"金矿石产出*1 怪物："..getbaseinfo(mon,1,1) .. "地图："..getbaseinfo(mon,45))
	end
	if name == "猎魔人★斗笠" or name == "猎魔人★勋章" then
		post(actor,name.."产出*1 怪物："..getbaseinfo(mon,1,1) .. "地图："..getbaseinfo(mon,45))
	end
	
	if jiluwupin[name] then
		local t = getdiaoluodata()
		local biao = {shijian=os.date("%d日%H:%M:%S", os.time()),ditu=getbaseinfo(mon,45),guaiwu=getname(mon),wupin=name,yanse=jiluwupin[name],name=getname(actor)}
		table.insert(t,1,biao)
		for i = #t,501,-1 do
			table.remove(t,i)
		end
		setsysstr("掉落查询数据",tbl2json(t))
	end
	
	return true
end



--人物掉落身上装备前触发
function checkdropuseitems(actor,weizhi,idx) --装备位置，物品idx
	if weizhi == 14 then --法宝位置
		local item = linkbodyitem(actor,weizhi) --法宝
		if getitem_fabaozhi(actor,item) > 0 then --融合过的
			setisjianqu(actor,item,1) --设置禁止捡取
		end
	end
	return true
end


--拾取前触发
local bangdingdaoju = {
["一级金针"]=1,["二级金针"]=1,["三级金针"]=1,["疏筋活络丸"]=1,["玛法结晶"]=1,["1点声望卷"]=1,["2点声望卷"]=1,["5点声望卷"]=1,["10点声望卷"]=1,["紫水晶矿"]=1,["兽魂蛋"]=1,["书页"]=1,
["祝福油"]=1,["沃玛密函"]=1,["孟婆汤"]=1,["祖玛头像"]=1,["牛魔王的推荐信"]=1,["九珠连环炮"]=1,["承包凭证"]=1,["金矿石"]=1,["神兽之血"]=1,["超级祝福油"]=1,["鹤顶红"]=1,["断肠草"]=1,
["高粱酒"]=1,["虎骨"]=1,["通关文牒"]=1,["魔教信物"]=1,["火把"]=1,["庄主令牌"]=1,["金锭"]=1,["1万经验卷"]=1,["12万经验卷"]=1,["50万经验卷"]=1,["聚合之心"]=1,["猎魔人★斗笠"]=1,
["猎魔人★勋章"]=1,["技能神石"]=1,["神秘水晶"]=1,["魔龙之血"]=1,["主宰凭证"]=1,["行走的游龙"]=1,["无名的咆哮"]=1,["恶魔的契约"]=1,["一星龙珠"]=1,["二星龙珠"]=1,["三星龙珠"]=1,
["四星龙珠"]=1,["五星龙珠"]=1,}

function pickupitemfrontex(actor,item)
	if getisjianqu(actor,item) == 1 then
		sendmsg9(actor,"此物品禁止拾取")
		return false
	end
	if getisguaibao(actor,item) == 1 then --是怪物爆出物品
		--sendmsg6(actor,"怪物爆出")
		if getint(actor,"会员等级") < 2 then
			setitemaddvalue(actor,item,2,1,370)
		end
		setisguaibao(actor,item,0) --清除怪物爆出
	end
	if getitemname(actor,item) == "1万经验卷" then
		setitemaddvalue(actor,item,2,1,370)
	end
	if getlevel(actor) >= 45 then
		local iname = getitemname(actor,item)
		nothintitem(actor,3,iname)
	end
	--sendmsg9(actor,"装备入包"..getitemname(actor,item))
	
	return true
end

--挖矿触发
function wakuangchufa(actor)
	--sendmsg6(actor,"挖矿触发")
	if math.random(1,100) <= 20 then
		if itemcount(actor,"铜矿石") < 50 then
			giveitem(actor,"铜矿石",1,371)
			callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --挖矿任务显示
		end
	end
end

----刷怪触发
function shuaguaichufa(mon)
	--local str = "系统提示：【".. getname(mon) .."】刷新在地图《".. getbaseinfo(mon,45) .."》！！！"
	--release_print(str)
end

local tzsh_t = {[16]=3,[17]=3,[18]=3,[19]=6,[20]=6,[21]=6,[22]=10,[23]=10,[24]=10} --套装对转生等级的伤害
local jineng_tao = {[80] = {job=0,name="十步一杀"},[81] = {job=1,name="冰霜群雨"},[82] = {job=2,name="死亡之眼"}, }
function groupitemonex(actor,id)
	id = tonumber(id)
	if tzsh_t[id] then
		setint(actor,"套装转生伤害",tzsh_t[id])
	end
	
	if jineng_tao[id] then
		if getjob(actor) == jineng_tao[id].job then
			addskill(actor, getskillidbyname(jineng_tao[id].name),3)
		end
	end
	--sendmsg6(actor,"穿套装"..id)
end

function groupitemoffex(actor,id)
	id = tonumber(id)
	if tzsh_t[id] then
		setint(actor,"套装转生伤害",0)
	end
	
	if jineng_tao[id] then
		if getjob(actor) == jineng_tao[id].job then
			delskill(actor, getskillidbyname(jineng_tao[id].name))
		end
	end
	--sendmsg6(actor,"脱下套装"..id)
end

---捡取触发									给的属性 					对应每个属性的min与max
local pickitems = {
					["虹魔戒指"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{6,10},jilv=90},{{0,0},{6,13},jilv=10}}},
					["虹魔手镯"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{3,6},jilv=90},{{0,0},{3,8},jilv=10}}},
					["虹魔项链"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{6,9},jilv=90},{{0,0},{6,12},jilv=10}}},
					
					["吸血戒指"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{12,15},jilv=90},{{0,0},{12,19},jilv=10}}},
					["吸血手镯"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{7,10},jilv=90},{{0,0},{7,13},jilv=10}}},
					["吸血项链"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{11,14},jilv=90},{{0,0},{11,18},jilv=10}}},
					
					["魔血戒指"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{4,7},jilv=100},{{0,0},{4,7},jilv=0}}},
					["魔血手镯"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{2,4},jilv=100},{{0,0},{2,4},jilv=0}}},
					["魔血项链"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{4,8},jilv=100},{{0,0},{4,8},jilv=0}}},
					
					["怒血戒指"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{7,12},jilv=100},{{0,0},{7,12},jilv=0}}},
					["怒血手镯"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{4,9},jilv=100},{{0,0},{4,9},jilv=0}}},
					["怒血项链"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{8,13},jilv=100},{{0,0},{8,13},jilv=0}}},
					
					["祈祷项链"]={shuxing={{5,6},{7,8}},zhi={{{0,0},{5,9},jilv=80},{{0,0},{5,12},jilv=20}}},
					["祈祷手镯"]={shuxing={{5,6},{7,8}},zhi={{{0,0},{7,10},jilv=80},{{0,0},{7,13},jilv=20}}},
					["祈祷戒指"]={shuxing={{5,6},{7,8}},zhi={{{0,0},{11,14},jilv=80},{{0,0},{11,17},jilv=20}}},
					
					["重击头盔"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{3,5},jilv=90},{{0,0},{3,7},jilv=10}}},
					["重击靴子"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{3,5},jilv=90},{{0,0},{3,7},jilv=10}}},
					["重击腰带"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{3,5},jilv=90},{{0,0},{3,7},jilv=10}}},
					
					["坚固的阎罗手套"]={shuxing={{9,10},{11,12}},zhi={{{8,8},{8,12},jilv=60},{{8,8},{8,16},jilv=40}}},
					
					["1.1倍防御盔"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{0,2},jilv=80},{{0,0},{0,3},jilv=20}}},
					["1.2倍防御盔"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{3,4},jilv=80},{{0,0},{3,6},jilv=20}}},
					
					["破甲指环"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{9,13},jilv=90},{{0,0},{9,16},jilv=10}}},
					
					["降妖除魔镯"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{3,5},jilv=90},{{0,0},{3,7},jilv=10}}},
					["降妖除魔戒"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{12,15},jilv=90},{{0,0},{12,19},jilv=10}}},
					
					--["打野盔"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{3,5},jilv=80},{{0,0},{3,7},jilv=20}}},
					
					["魔鬼头盔"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{0,2},jilv=90},{{0,0},{0,3},jilv=10}}},
					["魔鬼腰带"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{0,2},jilv=90},{{0,0},{0,3},jilv=10}}},
					["魔鬼靴子"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{0,2},jilv=90},{{0,0},{0,3},jilv=10}}},
					
					["暴君头盔"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{2,3},jilv=90},{{0,0},{2,5},jilv=10}}},
					["暴君腰带"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{2,3},jilv=90},{{0,0},{2,5},jilv=10}}},
					["暴君靴子"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{2,3},jilv=90},{{0,0},{2,5},jilv=10}}},
					
					["上帝之吻"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{3,6},jilv=90},{{0,0},{3,8},jilv=10}}},
					["后羿之光"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{8,12},jilv=90},{{0,0},{8,15},jilv=10}}},
					
					["死神戒指"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{6,10},jilv=80},{{0,0},{6,13},jilv=20}}},
					["龙渊戒指"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{9,13},jilv=80},{{0,0},{9,16},jilv=20}}},
					
					["狂风项链"]={shuxing={{3,4}},zhi={{{0,0},{5,8},jilv=90},{{0,0},{5,10},jilv=10}}},
					["狂风戒指"]={shuxing={{3,4}},zhi={{{0,0},{7,10},jilv=90},{{0,0},{7,13},jilv=10}}},
					
					["白色虎齿项链"]={shuxing={{3,4,15},{5,6,15},{7,8,15}},zhi={{{0,0},{5,7},{1,1},jilv=70},{{0,0},{5,10},{1,1},jilv=20},{{0,0},{5,10},{1,2},jilv=10},{{0,0},{5,10},{3,3},jilv=1}}},
					
					["辟邪手镯"]={shuxing={{3,4,14},{5,6,14},{7,8,14}},zhi={{{0,0},{3,6},{3,5},jilv=80},{{0,0},{3,8},{3,5},jilv=10},{{0,0},{3,8},{3,8},jilv=10}}},
					
					["躲避手链"]={shuxing={{3,4,14},{5,6,14},{7,8,14}},zhi={{{0,0},{6,9},{3,6},jilv=80},{{0,0},{6,12},{3,6},jilv=10},{{0,0},{6,12},{3,9},jilv=10}}},
					
					["夏普尔手镯"]={shuxing={{3,4,13}},zhi={{{0,0},{3,6},{4,7},jilv=80},{{0,0},{3,8},{4,7},jilv=10},{{0,0},{3,8},{4,10},jilv=10}}},
					
					["幽灵戒指"]={shuxing={{5,6},{7,8}},zhi={{{0,0},{7,10},jilv=90},{{0,0},{7,13},jilv=10}}},
					
					["神秘头盔"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{2,4},jilv=90},{{0,0},{2,6},jilv=10}}},
					["神秘腰带"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{2,4},jilv=90},{{0,0},{2,6},jilv=10}}},
					["神秘戒指"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{7,11},jilv=90},{{0,0},{7,15},jilv=10}}},
					
					["炼狱戒指"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{6,9},jilv=90},{{0,0},{6,11},jilv=10}}},
					["记忆戒指"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{6,9},jilv=90},{{0,0},{6,11},jilv=10}}},
					["恶魔戒指"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{6,9},jilv=90},{{0,0},{6,11},jilv=10}}},
					
					["炼狱手镯"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{4,6},jilv=90},{{0,0},{4,9},jilv=10}}},
					["记忆手镯"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{4,6},jilv=90},{{0,0},{4,9},jilv=10}}},
					["恶魔手镯"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{4,6},jilv=90},{{0,0},{4,9},jilv=10}}},
					
					["黑铁项链"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{6,8},jilv=60},{{0,0},{6,9},jilv=40}}},
					["黑铁戒指"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{6,8},jilv=60},{{0,0},{6,9},jilv=40}}},
					["黑铁手镯"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{4,7},jilv=90},{{0,0},{4,9},jilv=10}}},
					
					["天威ぁ龙源戒"]={shuxing={{3,4}},zhi={{{1,1},{14,18},jilv=50},{{1,1},{14,21},jilv=50}}},
					["天威ぁ龙源镯"]={shuxing={{3,4}},zhi={{{1,1},{9,12},jilv=50},{{1,1},{9,14},jilv=50}}},
					["天威ぁ龙源靴"]={shuxing={{3,4}},zhi={{{1,1},{5,7},jilv=50},{{1,1},{5,9},jilv=50}}},
					["天威ぁ龙源带"]={shuxing={{3,4}},zhi={{{1,1},{5,7},jilv=50},{{1,1},{5,9},jilv=50}}},
					["天威ぁ龙源盔"]={shuxing={{3,4}},zhi={{{1,1},{5,7},jilv=50},{{1,1},{5,9},jilv=50}}},
					["天威ぁ龙源链"]={shuxing={{3,4}},zhi={{{1,1},{13,16},jilv=50},{{1,1},{13,18},jilv=50}}},

					["天命ぁ赤霄戒"]={shuxing={{5,6}},zhi={{{1,1},{13,17},jilv=50},{{1,1},{13,20},jilv=50}}},
					["天命ぁ赤霄镯"]={shuxing={{5,6}},zhi={{{1,1},{10,13},jilv=50},{{1,1},{10,15},jilv=50}}},
					["天命ぁ赤霄靴"]={shuxing={{5,6}},zhi={{{1,1},{5,7},jilv=50},{{1,1},{5,9},jilv=50}}},
					["天命ぁ赤霄带"]={shuxing={{5,6}},zhi={{{1,1},{5,7},jilv=50},{{1,1},{5,9},jilv=50}}},
					["天命ぁ赤霄盔"]={shuxing={{5,6}},zhi={{{1,1},{5,7},jilv=50},{{1,1},{5,9},jilv=50}}},
					["天命ぁ赤霄链"]={shuxing={{5,6}},zhi={{{1,1},{15,18},jilv=50},{{1,1},{15,20},jilv=50}}},
					
					["天机ぁ无尘戒"]={shuxing={{7,8}},zhi={{{1,1},{14,18},jilv=50},{{1,1},{14,21},jilv=50}}},
					["天机ぁ无尘镯"]={shuxing={{7,8}},zhi={{{1,1},{10,13},jilv=50},{{1,1},{10,15},jilv=50}}},
					["天机ぁ无尘靴"]={shuxing={{7,8}},zhi={{{1,1},{5,7},jilv=50},{{1,1},{5,9},jilv=50}}},
					["天机ぁ无尘带"]={shuxing={{7,8}},zhi={{{1,1},{5,7},jilv=50},{{1,1},{5,9},jilv=50}}},
					["天机ぁ无尘盔"]={shuxing={{7,8}},zhi={{{1,1},{5,7},jilv=50},{{1,1},{5,9},jilv=50}}},
					["天机ぁ无尘链"]={shuxing={{7,8}},zhi={{{1,1},{14,17},jilv=50},{{1,1},{14,19},jilv=50}}},

					["涅槃菩提戒"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{1,1},{17,21},jilv=50},{{1,1},{17,26},jilv=50}}},
					["涅槃菩提镯"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{1,1},{11,15},jilv=50},{{1,1},{11,19},jilv=50}}},
					["涅槃菩提靴"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{1,1},{7,9},jilv=50},{{1,1},{7,12},jilv=50}}},
					["涅槃菩提带"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{1,1},{7,9},jilv=50},{{1,1},{7,12},jilv=50}}},
					["涅槃菩提盔"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{1,1},{7,9},jilv=50},{{1,1},{7,12},jilv=50}}},
					["涅槃菩提链"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{1,1},{17,20},jilv=50},{{1,1},{17,24},jilv=50}}},

					["聚魔觉醒戒"]={shuxing={{5,6},{7,8}},zhi={{{1,1},{17,21},jilv=50},{{1,1},{17,26},jilv=50}}},
					["聚魔觉醒镯"]={shuxing={{5,6},{7,8}},zhi={{{1,1},{11,15},jilv=50},{{1,1},{11,19},jilv=50}}},
					["聚魔觉醒靴"]={shuxing={{5,6},{7,8}},zhi={{{1,1},{7,9},jilv=50},{{1,1},{7,12},jilv=50}}},
					["聚魔觉醒带"]={shuxing={{5,6},{7,8}},zhi={{{1,1},{7,9},jilv=50},{{1,1},{7,12},jilv=50}}},
					["聚魔觉醒盔"]={shuxing={{5,6},{7,8}},zhi={{{1,1},{7,9},jilv=50},{{1,1},{7,12},jilv=50}}},
					["聚魔觉醒链"]={shuxing={{5,6},{7,8}},zhi={{{1,1},{17,20},jilv=50},{{1,1},{17,24},jilv=50}}},
					
					["祝福项链(封印)"]={shuxing={{3,4,39},{5,6,39},{7,8,39}},zhi={{{0,0},{8,13},{1,1},jilv=80},{{0,0},{8,18},{1,2},jilv=20}}},
					
					["疾风项链(封印)"]={shuxing={{3,4,20},},zhi={{{0,0},{11,14},{2,2},jilv=70},{{0,0},{11,16},{2,2},jilv=30}}},
					["疾风戒指(封印)"]={shuxing={{3,4,20},},zhi={{{0,0},{12,16},{1,1},jilv=70},{{0,0},{12,20},{1,1},jilv=30}}},
					
					["恶魔之靴(封印)"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{4,6},jilv=70},{{0,0},{4,9},jilv=30}}},
					["恶魔之带(封印)"]={shuxing={{3,4},{5,6},{7,8}},zhi={{{0,0},{4,6},jilv=70},{{0,0},{4,9},jilv=30}}},
					}
										
function pickupitemex(actor,item,jiefeng)
	jiefeng = tonumber(jiefeng) or 0
	local itemname = getitemname(actor,item) --物品名
	if itemname == "庄主令牌" then
		if getitem_daoqishijian(actor,item) == 0 then
			--sendmsg6(actor,"设置到期时间")
			local daoqishijian = 0 --到期时间
			local hour = tonumber(os.date("%H",os.time()))
			local fen = tonumber(os.date("%M",os.time()))
			local miao = tonumber(os.date("%S",os.time()))
			local jtygsj = hour*3600 + fen*60 + miao --今天已经过的时间
			--sendmsg6(actor,"今天时间 "..hour..":"..fen..":"..miao .."  总时间 "..jtygsj)
			if hour < 22 then
				daoqishijian = os.time() + 3600*22 - jtygsj --到期时间
				--sendmsg6(actor,"今天已经过的时间"..os.time()%86400)
			else
				daoqishijian = os.time() + 86400 - jtygsj + 3600*22
			end
			setitem_daoqishijian(actor,item,daoqishijian)
			refreshitem(actor, item)
		end
	end
	
	
	if pickitems[itemname] and getisjianquguo(actor,item) == 0 then
		if (itemname == "祝福项链(封印)" or itemname == "疾风项链(封印)" or itemname == "疾风戒指(封印)" or itemname == "恶魔之靴(封印)" or itemname == "恶魔之带(封印)") and jiefeng == 0 then
		else
			changecustomitemtext(actor,item,"",4)
			local t = pickitems[itemname]
			local shuxing = t.shuxing[math.random(1,#t.shuxing)]
			local zhi_t = t.zhi --{{{6,6},{6,10},jilv=80},{{6,6},{6,13},jilv=20},}
			local zongfazhi = 0 --几率总阈值
			for i = 1,#zhi_t do
				zongfazhi = zongfazhi + zhi_t[i].jilv
			end
			local attzhi_t = {}
			local jilvzhi = math.random(1,zongfazhi)
			local bijiaozhi = 0
			for i = 1,#zhi_t do
				bijiaozhi = bijiaozhi + zhi_t[i].jilv
				if jilvzhi <= bijiaozhi then
					attzhi_t = zhi_t[i]
					break
				end
			end
			--sendmsg6(actor,tbl2json(shuxing))
			--sendmsg6(actor,tbl2json(attzhi_t))
			for i = 1,#shuxing do
				changecustomitemabil(actor,item,i,1,shuxing[i],4) --参数4  1为绑定att属性
				changecustomitemvalue(actor,item,i,"=",math.random(attzhi_t[i][1],attzhi_t[i][2]),4) --设置绑定att属性的值
			end
			setisjianquguo(actor,item,1)
		end
	end
	----自动回收
	if getint(actor,"自动回收") == 1 and getbagblank(actor) < 8 then
		huishoucaozuo(actor)
	end
end
	


-----------------------------------------------------采集功能
function caijiwancheng(actor)
	giveitem(actor,getstr(actor,"采集物"),1,371)
	callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
	sendmsg9(actor,"采集完成")
end

function caijihuxinlian(actor) --蜀山长老文件回调过来的采集条
	giveitem(actor,"护心莲",1,371)
	callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
	sendmsg9(actor,"采集完成")
end

--采集触发
function collectmon773(actor) --任务5
	if getint(actor,"酒剑仙任务是否领取") == 1 and getint(actor,"酒剑仙任务编号") == 4 then 
		if itemcount(actor,"不死草") < 5 then
			setstr(actor,"采集物","不死草")
			showprogressbardlg(actor,5,"@caijiwancheng","正在采集,进度%d%...",1)
		end
	end
	--sendmsg9(actor,"不死草触发")
end

function collectmon775(actor) --任务2
	if getint(actor,"酒剑仙任务是否领取") == 1 and getint(actor,"酒剑仙任务编号") == 1 then 
		if itemcount(actor,"怀梦草") < 5 then
			setstr(actor,"采集物","怀梦草")
			showprogressbardlg(actor,5,"@caijiwancheng","正在采集,进度%d%...",1)
		end
	end
	--sendmsg9(actor,"怀梦草触发")
end

function collectmon776(actor) --任务1
	if getint(actor,"酒剑仙任务是否领取") == 1 and getint(actor,"酒剑仙任务编号") == 0 then 
		if itemcount(actor,"九穗禾") < 5 then
			setstr(actor,"采集物","九穗禾")
			showprogressbardlg(actor,5,"@caijiwancheng","正在采集,进度%d%...",1)
		end
	end
	--sendmsg9(actor,"九穗禾触发")
end

function collectmon777(actor) --任务6
	if getint(actor,"酒剑仙任务是否领取") == 1 and getint(actor,"酒剑仙任务编号") == 5 then 
		if itemcount(actor,"人参果树") < 5 then
			setstr(actor,"采集物","人参果树")
			showprogressbardlg(actor,5,"@caijiwancheng","正在采集,进度%d%...",1)
		end
	end
	--sendmsg9(actor,"人参果树触发")
end

function collectmon778(actor) --任务4
	if getint(actor,"酒剑仙任务是否领取") == 1 and getint(actor,"酒剑仙任务编号") == 3 then 
		if itemcount(actor,"幽冥花") < 5 then
			setstr(actor,"采集物","幽冥花")
			showprogressbardlg(actor,5,"@caijiwancheng","正在采集,进度%d%...",1)
		end
	end
	--sendmsg9(actor,"幽冥花触发")
end

function collectmon779(actor) --任务3
	if getint(actor,"酒剑仙任务是否领取") == 1 and getint(actor,"酒剑仙任务编号") == 2 then 
		if itemcount(actor,"紫罗兰") < 5 then
			setstr(actor,"采集物","紫罗兰")
			showprogressbardlg(actor,5,"@caijiwancheng","正在采集,进度%d%...",1)
		end
	end
	--sendmsg9(actor,"紫罗兰触发")
end

function collectmon780(actor) --采集泉眼
	local listmon = getmapmon(getmap(actor),"泉眼",getx(actor),gety(actor),1)
	local mon = listmon[1]
	if mon then
		showprogressbardlg(actor,15,"@caijiquanshui","正在采集,进度%d%...",1)
	end
end

function caijiquanshui(actor)
	local listmon = getmapmon(getmap(actor),"泉眼",getx(actor),gety(actor),1)
	local mon = listmon[1]
	if mon then
	else
		sendmsg9(actor,"泉眼已被采集一空")
		return
	end
	
	local cishu = tonumber(getcurrent(mon,"8")) --可采集次数
	if not cishu then --防止出错 直接删除
		killmonbyobj(globalinfo(0),mon,false,false,false) --杀怪
		return
	end
	
	if cishu < 1 then
		sendmsg9(actor,"泉眼已被采集一空")
		return
	end
	
	giveitem(actor,"泉水")
	setcurrent(mon,"8",tostring(cishu - 1))
	if cishu - 1 <= 0 then
		killmonbyobj(globalinfo(0),mon,false,false,false) --杀怪
		removequanshuidata(mon)
		sendmsg9(actor,"采集成功，泉眼已被采集一空")
		sendmsg6(actor,"采集成功，泉眼已被采集一空")
	else
		sendmsg9(actor,"采集成功，泉眼剩余泉水".. cishu - 1 .."/20")
		sendmsg6(actor,"采集成功，泉眼剩余泉水".. cishu - 1 .."/20")
		sendmsg0(actor,"玩家<font color='#FF00FF'>".. getname(actor) .."</font>在<font color='#00ff00'>".. getbaseinfo(actor,45) .."</font>地图采集了大量泉水，收益颇丰",251,0)
	end
end

--退出行会前
function guilddelmemberbefore(actor)
	local ncount=getbaseinfo(actor,38) --获得宝宝列表
    for i = 0 ,ncount-1 do
        local mon =  getslavebyindex(actor, i) --获得宝宝对象
		if getname(mon) == "卧龙夫人" then
			sendmsg9(actor,"护送夫人期间禁止退出行会")
			return false
		end
    end
	return true
end

--解散行会前
function guildclosebefore(actor)
	local ncount=getbaseinfo(actor,38) --获得宝宝列表
    for i = 0 ,ncount-1 do
        local mon =  getslavebyindex(actor, i) --获得宝宝对象
		if getname(mon) == "卧龙夫人" then
			sendmsg9(actor,"护送夫人期间禁止解散行会")
			return false
		end
    end
	return true
end


--buff改变触发
function buffchange(actor,buffid,buffzu,caozuo) --buffid buffzu 操作 1增加2更新4删除 
	--sendmsg6(actor,tostring(a)..tostring(b)..tostring(c))
	if buffid == 10068 and caozuo== 4 then
		sendmsg6(actor,"道术恢复正常","#024502")
	end
end

--接收客户端传递过来的消息
local function handlerequest(actor,msgid,n1,n2,n3,msg)
	--sendmsg6(actor,"自动无极真气"..msg.."  自动召唤神兽"..n3)
	if msgid == 111 and getjob(actor) == 2 then
		if getint(actor,"自动无极真气") ~= tonumber(msg) then
			setint(actor,"自动无极真气",tonumber(msg))
		end
		if getint(actor,"自动召唤神兽") ~= tonumber(n3) then
			setint(actor,"自动召唤神兽",tonumber(n3))
		end
	end
	if msgid == 112 then
		if itemcount(actor,"随机传送石") > 0 then
			eatitem(actor,"随机传送石",1)
		elseif itemcount(actor,"永久随机石") > 0 then
			eatitem(actor,"永久随机石",1)
		end
		--sendmsg6(actor,"接收消息自动使用随机")
	end
end
GlobalPreprocess.handlerequest = handlerequest


--带装备前
local jinzhi_dai = {["疾风项链(封印)"]=1,["疾风戒指(封印)"]=1,["恶魔之靴(封印)"]=1,["恶魔之带(封印)"]=1,["祝福项链(封印)"]=1,}
function takeonbeforeex(actor,item)
	local name = getitemname(actor,item)
	if jinzhi_dai[name] == 1 and getisjianquguo(actor,item) == 0 then
		sendmsg9(actor,"此装备需解开封印才能穿戴","#00FF00")
		return false
	end
	return true
end
--脱装备前
function takeoffbeforeex(actor,item)
	local name = getitemname(actor,item)
	if name == "仙剑·酒葫芦" then
		sendmsg9(actor,"此装备禁止取下","#00FF00")
		return false
	end
	return true
end

--商铺
function canshowshopitem17(actor)
	if getint(actor,"累计充值") >= 1000 or getint(actor,"武穆遗书金砖可见") == 1 or getint(actor,"经脉等级") >= 8 then
		notallowshow(actor,0)
	else
		notallowshow(actor,1)
	end
end

function canshowshopitem18(actor)
	if getbaseinfo(actor,39) >= 1 or getlevel(actor) >= 65 then
		notallowshow(actor,0)
	else
		notallowshow(actor,1)
	end
end

function canshowshopitem11(actor) --紫水晶矿商铺显示条件
	if getlevel(actor) >= 45 then
		notallowshow(actor,0)
	else
		notallowshow(actor,1)
	end
end

function magselffunc8(actor)
	local sh_data = getshouhunbuffdata(actor) --获取兽魂buff数据
	local you = false
	for i = 1,#sh_data do
		if sh_data[i] == "横行霸道" then
			you = true
			break
		end
	end
	if not you then
		return
	end
	local fangxiang_t = {[0]={0,-2},[1]={2,-2},[2]={2,0},[3]={2,2},[4]={0,2},[5]={-2,2},[6]={-2,0},[7]={-2,-2}}
	--sendmsg6(actor,"抗拒")
	--获取周围一个范围内的玩家
	local x = getx(actor)
	local y = gety(actor)
	local players = getobjectinmap(getmap(actor),x,y,1,1)
	for i = 1,#players do
		local player = players[i]
		if ispropertarget(actor,player) and ( getx(actor) ~= getx(player) or gety(actor) ~= gety(player) ) and getlevel(actor) > getlevel(player) and not hasbuff(player,20076) and not hasbuff(player,10052) then --能被攻击的
			--sendmsg6(actor,"附近玩家"..getname(player))
			local fangxiang = getxiangduifangxiang(actor,player)
			if isemptyinmap(getmap(actor),x+fangxiang_t[fangxiang][1],y+fangxiang_t[fangxiang][2]) then
				if not hasbuff(player,20102) then
					addbuff(player,20102)
					sendmsg9(player,"你受到了".. getname(actor) .."的'横行霸道'禁止使用特殊药品5秒")
					--sendmsg0(0,"5秒禁止吃药玩家"..getname(player))
				end
			end
		end
	end
end

function magselffunc48(actor)
	local sh_data = getshouhunbuffdata(actor) --获取兽魂buff数据
	local you = false
	for i = 1,#sh_data do
		if sh_data[i] == "横行霸道" then
			you = true
			break
		end
	end
	if not you then
		return
	end
	local fangxiang_t = {[0]={0,-2},[1]={2,-2},[2]={2,0},[3]={2,2},[4]={0,2},[5]={-2,2},[6]={-2,0},[7]={-2,-2}}
	--sendmsg0(actor,"气功波")
	--获取周围一个范围内的玩家
	local x = getx(actor)
	local y = gety(actor)
	local players = getobjectinmap(getmap(actor),x,y,1,1)
	for i = 1,#players do
		local player = players[i]
		if ispropertarget(actor,player) and ( getx(actor) ~= getx(player) or gety(actor) ~= gety(player) ) and getlevel(actor) >= getlevel(player) and not hasbuff(player,20076) and not hasbuff(player,10052) then --能被攻击的
			--sendmsg6(actor,"附近玩家"..getname(player))
			local fangxiang = getxiangduifangxiang(actor,player)
			if isemptyinmap(getmap(actor),x+fangxiang_t[fangxiang][1],y+fangxiang_t[fangxiang][2]) then
				if not hasbuff(player,20102) then
					addbuff(player,20102)
					--sendmsg0(0,"5秒禁止吃药玩家"..getname(player))
					
					sendmsg9(player,"你受到了".. getname(actor) .."的'横行霸道'禁止使用特殊药品5秒")
				end
			end
		end
	end
end

function getxiangduifangxiang(actor,player)
	local x = getx(actor)
	local y = gety(actor)
	local x1 = getx(player)
	local y1 = gety(player)
	if x == x1 and y1 < y then
		return 0
	end
	if x1 > x and y1 < y then
		return 1
	end
	if x1 > x and y == y1 then
		return 2
	end
	if x1 > x and y1 > y then
		return 3
	end
	if x1 == x and y1 > y then
		return 4
	end
	if x1 < x and y1 > y then
		return 5
	end
	if x1 < x and y1 == y then
		return 6
	end
	if x1 < x and y1 < y then
		return 7
	end
	return nil
end

function sendability(actor) --属性改变触发
	--haoshistart(actor)
	xinyunbeigong(actor) --运10 运11 幸运倍攻设置
	xueliangjisuan(actor)
	baolvjisuan(actor)
	--haoshiend(actor)
end

function xueliangjisuan(actor)
	local tiliyuansu = getbaseinfo(actor,51,213) --体力元素
	local smz = getusebonuspoint(actor,11) --生命值永久属性
	local maxhp = getbaseinfo(actor,10) --人物生命值上限
	local jichuzhi = maxhp - smz  --没有计算体力元素时候的值
	local jisuanzhi = math.ceil(jichuzhi * (1+tiliyuansu/10000)) --计算后的值
	if jisuanzhi == maxhp or jisuanzhi-jichuzhi < 0 then
		return
	end
	--setusebonuspoint(actor,11,jisuanzhi-jichuzhi)
	setusebonuspoint(actor,11,jisuanzhi-jichuzhi)
	recalcabilitys(actor)
	--release_print(getname(actor),"体力元素"..tiliyuansu,"生命永久值"..smz,"现在上限"..maxhp,"没有计算时候的值"..jichuzhi,"计算后的值"..jisuanzhi )
end

function baolvjisuan(actor)
	local shijibaolv = getbaseinfo(actor,51,65) --实际爆率
	--sendmsg6(actor,"实际爆率"..shijibaolv)
	local xianshibaolv = getbaseinfo(actor,51,215) --显示爆率
	local givebaolv = math.floor(xianshibaolv/300)*100 --需要给的爆率
	if givebaolv == shijibaolv then
		return
	end
	if hasbuff(actor,20110) then
		delbuff(actor,20110)
	end
	if givebaolv > 0 then
		addbuff(actor,20110,0,1,actor,{[65]=givebaolv})
	end
	recalcabilitys(actor)
end

function canbuyshopitem21(actor)
	if getint(actor,"累计充值") < 300 then
		sendmsg9(actor,"当今骗子横行 为防止玩家上当受骗 沃玛号角购买需充值达到三百")
		notallowbuy(actor,1)
	else
		notallowbuy(actor,0)
	end
end

function canbuyshopitem5(actor)
	if getgold(actor) < 300000 then
		sendmsg9(actor,"非绑定金币不足","#FFFF00")
		notallowbuy(actor,1)
	else
		notallowbuy(actor,0)
	end
end

function buyshopitem(actor)
	local itemname = getplaydef(actor,"S0")
	local shuliang = getplaydef(actor,"N0")
	local jiage = getplaydef(actor,"M0")
	local huobiid = getplaydef(actor,"M1")
	--release_print("名字"..itemname,"数量"..shuliang,"总价"..jiage,"货币"..huobiid)

	if huobiid == 7 or huobiid == 0 then
		setint(actor,"金币购买锤子个数",getint(actor,"金币购买锤子个数")+shuliang)
		post(actor,"商城购买".. itemname .."*"..shuliang.."|金币消耗*"..jiage)
	elseif huobiid == 2 then
		post(actor,"商城购买".. itemname .."*"..shuliang.."|元宝消耗*"..jiage)
		if itemname == "药品捆绳" then
			setsysint("买绳子消耗的元宝",getsysint("买绳子消耗的元宝")+jiage)
			setsysint("每日买绳子消耗的元宝",getsysint("每日买绳子消耗的元宝")+jiage)
		elseif itemname == "鸿运之锤" then
			setsysint("买锤子消耗的元宝",getsysint("买锤子消耗的元宝")+jiage)
			setsysint("每日买锤子消耗的元宝",getsysint("每日买锤子消耗的元宝")+jiage)
		elseif itemname == "金矿石" then
			setsysint("购买金矿花费的元宝",getsysint("购买金矿花费的元宝")+jiage)
			setsysint("每日购买金矿花费的元宝",getsysint("每日购买金矿花费的元宝")+jiage)
		elseif itemname == "紫水晶矿" then
			setsysint("购买紫水晶矿花费的元宝",getsysint("购买紫水晶矿花费的元宝")+jiage)
			setsysint("每日购买紫水晶矿花费的元宝",getsysint("每日购买紫水晶矿花费的元宝")+jiage)
		end
	end
	
end


-- function struck(actor,gongjizhe,shoujizhe,skillid)
-- 	local sh_data = getshouhunbuffdata(actor) --获取兽魂buff数据
-- 	local you = false
-- 	for i = 1,#sh_data do
-- 		if sh_data[i] == "百战之躯" then
-- 			if getbaseinfo(gongjizhe,-1) then --是人物
-- 				if os.time() - getint(shoujizhe,"百战之躯时间") >= 1 then
-- 					local addhp = math.floor(getbaseinfo(shoujizhe,10)*0.005)
-- 					if addhp > 0 then
-- 						humanhp(shoujizhe,"+",addhp,0)
-- 						--sendmsg0(actor,"百战之躯加血"..addhp)
-- 					end
-- 					setint(shoujizhe,"百战之躯时间",os.time())
-- 				end
-- 			end
-- 			break
-- 		end
-- 	end
-- end

--行会编辑前触发
function updateguildnotice(actor)
	if getlevel(actor) < 55 then
		sendmsg9(actor,"编辑行会公告需要55级")
		return false
	end
	return true
end

--拍卖上架前
function canpaimaiitem(actor)
	if getmap(actor) == "tuoji" or getmap(actor) == "waigua" then
		callscriptex(actor, "ALLOWPAIMAI",1)
		sendmsg9(actor,"此地图无法上架")
		return false
	end
	callscriptex(actor, "ALLOWPAIMAI",0)
	return true
end

function buypaimaiitem(actor)

	if getmap(actor) == "tuoji" or getmap(actor) == "waigua" then
		callscriptex(actor, "ALLOWPAIMAI",1)
		sendmsg9(actor,"此地图无法购买")
		return false
	end
	
	if os.time() - getint(actor,"拍卖购买时间") < 1 then
		callscriptex(actor, "ALLOWPAIMAI",1)
		sendmsg9(actor,"1秒钟内只能购买一次")
		return false
	end
	callscriptex(actor, "ALLOWPAIMAI",0)
	setint(actor,"拍卖购买时间",os.time())
	return true
end

function triggerchat(actor, sMsg, chat) --2喊话 3私聊 6附近 4行会
	if getmap(actor) == "waigua" or getmap(actor) == "tuoji" then
		sendmsg9(actor, "此地图禁止发言，请联系客服")
		return false
	end
	
	if getint(actor,"会员等级") >= 2 then
		return true
	end
	
	if getint(actor,"禁言") == 1 then
		sendmsg9(actor, "你因为重复发言可能涉及虚假广告宣传.需开通投资大使解除禁言.或联系客服")
		return false
	end
	
	if chat == 6 or chat == 3 or chat == 2 then
		if getint(actor,"累计充值") < 10 and getlevel(actor) < 48 then
			sendmsg9(actor, "为防止玩家受骗子蛊惑.此频道发言需达到48级或者领取开荒豪礼")
			return false
		end
    end
	
	if chat == 6 and getmap(actor) == "3" then --附近在安全区
		local liaotianlist = getliaotianlist(actor)
		local cs = 1
		for i = 1,#liaotianlist do
			if liaotianlist[i] == sMsg then
				cs = cs + 1
			end
		end
		
		if cs >= 10 then
			setint(actor,"禁言",1)
			sendmsg9(actor, "你因为重复发言可能涉及虚假广告宣传.需开通投资大使解除禁言.或联系客服")
			return false
		end
		
		table.insert(liaotianlist,sMsg)
		--sendmsg6(actor,liaotianlist[1])
		for i = #liaotianlist,101,-1 do
			table.remove(liaotianlist,i)
		end
		setstr(actor,"聊天内容列表",tbl2json(liaotianlist))
	end
	
	if chat == 3 then --私聊
		local liaotianlist = getsiliaolist(actor)
		local cs = 1
		for i = 1,#liaotianlist do
			if liaotianlist[i] == sMsg then
				cs = cs + 1
			end
		end
		
		if cs >= 20 then
			setint(actor,"禁言",1)
			sendmsg9(actor, "你因为重复发言可能涉及虚假广告宣传.需开通投资大使解除禁言.或联系客服")
			return false
		end
		
		table.insert(liaotianlist,sMsg)
		--sendmsg6(actor,liaotianlist[1])
		for i = #liaotianlist,101,-1 do
			table.remove(liaotianlist,i)
		end
		setstr(actor,"私聊内容列表",tbl2json(liaotianlist))
	end 
	
	if chat == 2 then --喊话
		local liaotianlist = gethanhualist(actor)
		local cs = 1
		for i = 1,#liaotianlist do
			if liaotianlist[i] == sMsg then
				cs = cs + 1
			end
		end
		
		if cs >= 10 then
			setint(actor,"禁言",1)
			sendmsg9(actor, "你因为重复发言可能涉及虚假广告宣传.需开通投资大使解除禁言.或联系客服")
			return false
		end
		
		table.insert(liaotianlist,sMsg)
		--sendmsg6(actor,liaotianlist[1])
		for i = #liaotianlist,101,-1 do
			table.remove(liaotianlist,i)
		end
		setstr(actor,"喊话内容列表",tbl2json(liaotianlist))
	end
	
	
	if chat == 4 then
		if getint(actor,"累计充值") < 10 and getlevel(actor) < 45 then
			sendmsg9(actor, "为防止玩家上当受骗.行会发言需达到45级或者领取开荒豪礼.")
			return false
		end
    end
	if chat == 4 then --行会
		local liaotianlist = gethanghuilist(actor)
		local cs = 1
		for i = 1,#liaotianlist do
			if liaotianlist[i] == sMsg then
				cs = cs + 1
			end
		end
		
		if cs >= 20 then
			setint(actor,"禁言",1)
			sendmsg9(actor, "你因为重复发言可能涉及虚假广告宣传.需开通投资大使解除禁言.或联系客服")
			return false
		end
		
		table.insert(liaotianlist,sMsg)
		--sendmsg6(actor,liaotianlist[1])
		for i = #liaotianlist,101,-1 do
			table.remove(liaotianlist,i)
		end
		setstr(actor,"行会内容列表",tbl2json(liaotianlist))
	end
	
	
    return true
end

function gethanghuilist(actor)
	local t = {}
	local str = getstr(actor,"行会内容列表")
	if str ~= "" then
		t = json2tbl(str)
	end
	return t
end

function gethanhualist(actor)
	local t = {}
	local str = getstr(actor,"喊话内容列表")
	if str ~= "" then
		t = json2tbl(str)
	end
	return t
end

function getsiliaolist(actor)
	local t = {}
	local str = getstr(actor,"私聊内容列表")
	if str ~= "" then
		t = json2tbl(str)
	end
	return t
end

function getliaotianlist(actor)
	local t = {}
	local str = getstr(actor,"聊天内容列表")
	if str ~= "" then
		t = json2tbl(str)
	end
	return t
end

local function resetday(actor) --跨天触发
	--sendmsg0(actor,"跨天触发")
	if hasbuff(actor,19996) then
		delbuff(actor,19996)
	end
	if hasbuff(actor,19997) then
		delbuff(actor,19997)
	end
	
	songhonglan(actor) --每天送红蓝储量
	callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
end
GlobalPreprocess.resetday = resetday

function inivitguild(actor)
	--sendmsg9(actor,"此功能已禁止")
	return false
end
