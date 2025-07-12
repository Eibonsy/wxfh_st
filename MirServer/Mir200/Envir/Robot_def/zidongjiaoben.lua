--卧龙山庄活动
function auto_wolongshanzhuang()
	setsysstr("押镖成功行会","")
	if getsysint("合区次数") > 0 then
		genmon("wlsz",69,52,"山庄护卫",0,1,249)
		sendmsg(nil, 2, '{"Msg":"隐藏在<卧龙山庄/FCOLOR=249>的卧龙宝藏活动已开启，击杀<山庄护卫/FCOLOR=250>可获得丰厚奖励...........","FColor":251,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"200"}')
		sendmsg(nil, 2, '{"Msg":"隐藏在<卧龙山庄/FCOLOR=249>的卧龙宝藏活动已开启，击杀<山庄护卫/FCOLOR=250>可获得丰厚奖励...........","FColor":251,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"250"}')
		sendmsg(nil, 2, '{"Msg":"隐藏在<卧龙山庄/FCOLOR=249>的卧龙宝藏活动已开启，击杀<山庄护卫/FCOLOR=250>可获得丰厚奖励...........","FColor":251,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"300"}')		
	end
	------押镖清理
end

function auto_wolongjiesu() --卧龙山庄结束杀夫人
	local guai_t = getobjectinmap("wlsz",120,120,200,2)
	for i = 1,#guai_t do
		local name = getbaseinfo(guai_t[i],1,1) --怪物名
		if name == "卧龙夫人" then
			killmonbyobj(0,guai_t[i],false,false,false)
		end
	end
end


function jisha_shijieboss(actor)
	mapmove(actor,"3",354,339,5)
	delbutton(actor,107,98)
end

function close_shijieboss(actor)
	delbutton(actor,107,98)
end

-----攻城段
function gongchengstart()
	local kaiquday = getkaiquday()
	if kaiquday < 3 or getsysint("合区次数") == 0 then
		return
	end
	if castleinfo(5) then --攻城状态中
		return
	end
	
	addattacksabakall()
	gmexecute(0,"gongcheng")
	if getsysint("首次攻城") == 0 then
		setsysint("沙城奖励元宝",50000)
		setsysint("首次攻城",1)
	else
		setsysint("沙城奖励元宝",0)
	end
end
----七星塔活动段
function auto_qxt_kaijiang() --七星塔开奖 产生幸运玩家
	local data = {}
	local data_str = getsysstr("七星塔投票数据")
	if data_str ~= "" then
		data=json2tbl(data_str)
	end
	if #data == 0 then
		if getsysstr("七星塔幸运玩家") ~= "" then
			local zhongjiangzhe = getsysstr("七星塔幸运玩家")
			sendmail("#"..zhongjiangzhe,1,"系统","七星塔幸运玩家奖励","金条#2")
			sendmsg0(grobalinfo(0),"恭喜玩家[".. zhongjiangzhe .."]成为幸运玩家，将享受官方赠于的大量福利！")
		end
		return
	end
	local zhongjiangdengji = 45 --中奖等级控制
	if getsysint("合区次数") >= 3 then
		zhongjiangdengji = 65
	elseif getsysint("合区次数") >= 2 then
		zhongjiangdengji = 60
	elseif getsysint("合区次数") >= 1 then
		zhongjiangdengji = 55
	end
	local t = {}
	for i = 1,#data do
		if data[i].level >= zhongjiangdengji then
			table.insert(t,data[i])
		end
	end
	if #t == 0 then
		t = data
	end
	local zhongjiangzhe = t[math.random(1,#t)].name
	setsysstr("七星塔幸运玩家",zhongjiangzhe)
	sendmail("#"..zhongjiangzhe,1,"系统","七星塔幸运玩家奖励","金条#2")
	sendmsg0(grobalinfo(0),"恭喜玩家[".. zhongjiangzhe .."]成为幸运玩家，将享受官方赠于的大量福利！")
	setsysstr("七星塔投票数据","")
end

function auto_qxt_fajiang() --七星塔开奖 产生幸运玩家
	local name = getsysstr("七星塔幸运玩家")
	if name == "" then
		return
	end
	local goldnum = getsysint("七星塔幸运奖池") --奖池金币
	local jiangligold = goldnum --奖励金币
	if jiangligold > 0 then
		sendmail("#"..name,1,"系统","七星塔幸运玩家奖励金币收益","绑定金币#"..jiangligold)
		setsysint("七星塔幸运奖池",0)
	end
end

local wjly_sgt={
	{"wjly","月魔蜘蛛4",40,255},
	{"wjly","火尾黑狐王",40,250},
	{"wjly","玉面素狐王",40,250},
	{"wjly","金爪赤狐王",40,250},
	{"wjly","魔龙战将",40,250},
	{"wjly","魔龙巨娥",40,250},
	{"wjly","魔龙力士",40,250},
	{"wjly","蚩尤之主",1,249},
	{"wjly","封魔冥界教父",1,249},
	{"wjly","远古祖玛教父",1,249},
	{"wjly","不朽帝皇",1,249},
	{"wjly","谛听兽",1,249},
	{"wjly","远古双头金刚",1,249},
	{"wjly","远古双头血魔",1,249},
	{"wjly","远古赤月恶魔",1,249},
	{"wjly","暗之魔龙教主",1,249},
	{"wjly","七星神王4",1,249},
	{"wjly","卧龙庄主4",1,249},
}
------无间炼狱洞口特效
function auto_wjly_kaiqi() --无间炼狱洞口特效
	if getkaiquday() < 2 then
		return
	end
	mapeffect(11,"11",174,334,2207,3600,0)
	genmon("11",174,334,"僵尸1",0,1,255)
	--sendmsg0(grobalinfo(0),"提示：通往无间炼狱的洞口已经打开，洞口1小时后关闭！！！")
	--sendmsg0(grobalinfo(0),"提示：通往无间炼狱的洞口已经打开，洞口1小时后关闭！！！")
	--sendmsg0(grobalinfo(0),"提示：通往无间炼狱的洞口已经打开，洞口1小时后关闭！！！")
	for i = 1,#wjly_sgt do
		local sl = checkrangemoncount('wjly',wjly_sgt[i][2],100,100,100) --已经有的数量
		--sendmsg0(0,wjly_sgt[i][2]..sl)
		local shuasl = wjly_sgt[i][3] - sl
		if shuasl > 0 then
			genmon('wjly',100,100,wjly_sgt[i][2],100,shuasl,wjly_sgt[i][4])
		end
	end
	
	sendmsg(actor,2,'{"Msg":"隐藏在<『白日门的无间炼狱』/FCOLOR=250>洞口已打开，大量<超级BOSS/FCOLOR=250>已刷新，60分钟后关闭....","FColor":251,"BColor":0,"Type":5,"Y":100}')
	sendmsg(actor,2,'{"Msg":"隐藏在<『白日门的无间炼狱』/FCOLOR=250>洞口已打开，大量<超级BOSS/FCOLOR=250>已刷新，60分钟后关闭....","FColor":251,"BColor":0,"Type":5,"Y":150}')
	sendmsg(actor,2,'{"Msg":"隐藏在<『白日门的无间炼狱』/FCOLOR=250>洞口已打开，大量<超级BOSS/FCOLOR=250>已刷新，60分钟后关闭....","FColor":251,"BColor":0,"Type":5,"Y":200}')
end

------谜之幻境切换五行属性
function auto_mzhj_qiehuan()
	local t = {1,2,3,4,5} --金木水火土
	local old1 = getsysint("谜之幻境进图属性")
	--local old2 = getsysint("卧龙山庄进图属性")
	for i = #t,1,-1 do
		if t[i] == old1 then
			table.remove(t,i)
		end
	end
	--sendmsg0(0,tbl2json(t))
	local shuxingid = t[math.random(1,#t)]
	setsysint("谜之幻境进图属性",shuxingid)
	setsysint("卧龙山庄进图属性",shuxingid)
	--sendmsg0(0,"谜之幻境 ".. getsysint("谜之幻境进图属性").."  卧龙山庄 "..getsysint("卧龙山庄进图属性") )
end

------骰王清理
function auto_touwangqingli()
	setsysint("骰王奖池",0)
	setsysint("骰王666领取",0)
	setsysint("骰王武林至尊领取",0)
	setsysint("骰王沙老大领取",0)
end

local diaoluoxilie = {
	"强化系列","屠龙雷霆衣服系列","S1首饰系列","S1特殊系列","S1衣服系列","S1武器系列","S2系列","S2特殊系列","S2衣服系列","S2武器系列","S3系列","S3特殊系列","S3衣服系列","S3武器系列","S4系列","S4特殊系列","S4衣服系列","S5系列","S5衣服系列",
	"S6系列","S6衣服系列","S7系列","S7衣服系列","12万经验卷","50万经验卷","兽魂蛋","书页","金矿石","神兽之血","虎骨","庄主令牌","聚合之心","技能神石","神秘水晶","魔龙之血","主宰凭证",
	}
	
local tongjibiaoti = {
	"开狂暴消耗的元宝","骰王消耗的元宝","买药消耗的元宝","买绳子消耗的元宝","买锤子消耗的元宝","砸蛋的次数","洗武穆遗书消耗的元宝","洗武穆遗书的次数","幸运项链消耗的元宝",
	"购买锄头消耗的元宝","购买武穆遗书的个数","购买金矿花费的元宝","购买紫水晶矿花费的元宝","须弥禅师消耗的元宝","免费福利金币兑换的元宝",
	"购买投资新秀的个数","购买投资大使的个数","购买投资达人的个数","购买投资专家的个数","领取首冲的个数","融合的次数",
	"砸蛋半兽统领","砸蛋祖玛教主","砸蛋虹魔教主","砸蛋牛魔王","砸蛋赤月恶魔","砸蛋魔龙教主","赏金猎人抽取的次数",
	"抽取震天箭","抽取日照香炉","抽取闪电五连鞭","抽取东皇钟","抽取昆仑镜","抽取玄武盾","抽取番天印","抽取玉净瓶",
	"抽取镇魂钟","抽取妖魄之瞳","抽取炼妖壶","抽取混元凤凰珠","抽取雷公锤","抽取琉璃佩","抽取崆峒印","抽取断玉钩",
	"购买泉水的元宝","真实充值元宝","后台充值元宝","购买周卡消耗元宝","客服部门","材料部门","场控部门","气氛部门","项目部门"
	}
function auto_newday()
	--sendmsg0(0,"每日清理")
	setsysstr("封魔殿地主","")
	setsysint("封魔殿捐献点",0)
	setsysstr("沃玛神庙地主","")
	setsysint("沃玛神庙捐献点",0)
	setsysstr("镜像殿堂地主","")
	setsysint("镜像殿堂捐献点",0)
	setsysstr("祖玛祭坛地主","")
	setsysint("祖玛祭坛捐献点",0)
	setsysstr("黄泉深渊地主","")
	setsysint("黄泉深渊捐献点",0)
	setsysstr("潜龙深渊地主","")
	setsysint("潜龙深渊捐献点",0)
	

	for i = 1,#diaoluoxilie do
		setsysint("每日掉落数量"..diaoluoxilie[i],0)
	end
	for i = 1,#tongjibiaoti do
		setsysint("每日"..tongjibiaoti[i],0)
	end

end

function auto_xinquhuodong()
	if getsysint("开区时间") ~= 0 then
		-- if os.time() - getsysint("开区时间") >= 60*60 and getsysint("顺天送宝活动") == 0 then
		-- 	auto_shuntiansongbao() --顺天送宝活动
		-- 	setsysint("顺天送宝活动",1)
		-- end
		if os.time() - getsysint("开区时间") >= 60*60*4 and getsysint("怪物攻城活动") == 0 then
			auto_guaiwugongcheng(1) --怪物攻城活动
			setsysint("怪物攻城活动",1)
		end
	end
end

function auto_shuntiansongbao() --顺天送宝活动
	genmon("3",360,347,"恭喜发财",1,1,253)
	local t=getplayerlst() --所有玩家列表
	--callscriptex(0, "sendcentermsg", 251, 0, "玩家列表"..tbl2json(t) , 1 ,5 )
	local pyx = -320
	local pyy = -130
	local msg = ""
	msg = msg..'<Img|children={2,3,5,4,6}|x='..  14 + pyx ..'|y='..  40 + pyy ..'|width=160|height=100|esc=0|bg=1|move=1|scale9t=10|scale9r=10|scale9l=10|scale9b=10|img=zhangheng/281.png>'
	msg = msg..[[
	<RText|id=2|ax=0.5|x=79.0|y=7.0|rotate=0|color=255|size=18|outline=1|text=<顺天送宝已开启/FCOLOR=250>>
	<RText|id=3|ax=0.5|x=79.0|y=30.0|rotate=0|color=255|size=18|outline=1|text=<是否前往？/FCOLOR=254>>
	<COUNTDOWN|ax=0.5|id=5|x=78.0|y=60.0|time=30|count=1|size=16|outline=1|color=250|link=@close_shijieboss>
	<Button|id=4|x=8.0|y=58.0|width=50|height=30|color=255|outline=1|nimg=zhangheng/71.png|size=18|text=是|link=@jisha_shijieboss>
	<Button|id=6|x=101.0|y=58.0|width=50|height=30|rotate=0|outline=1|color=255|size=18|nimg=zhangheng/71.png|text=否|link=@close_shijieboss>
	]]
    for k,v in ipairs(t) do
		if getmap(v) ~= "tuoji" and getmap(v) ~= "waigua" then
			addbutton(v,107,98,msg)
		end
    end
end
----怪物攻城小怪
local shuaxiaoguai = {
{"月魔蜘蛛",20},{"祖玛卫士[经典]",15},{"祖玛雕像[经典]",15},{"祖玛弓箭手[经典]",15},{"火焰沃玛",15},{"沃玛战将",15},{"沃玛勇士",15},{"牛魔将军",15},{"牛魔祭司",15},{"牛魔法师",15},
{"虹魔教主",5},{"黄泉教主",5},{"牛魔王",5},{"双头金刚",5},{"双头血魔",5},{"沃玛教主",5},{"沃玛教皇",1},{"石墓教皇",1},{"上古虹魔教主",1},{"祖玛教主",1},{"上古黄泉教主",1},{"上古牛魔王",1},
}
local chou1zhi = {"玛雅守护神4","万恶之主4","地藏魔王4","邪魔统帅4","烟花教主4","上古谛听4","不朽大帝4","玛法判官4","通天教主4","镜像之主4","盘丝大仙4","破面4","七星神王4","卧龙庄主4"}
local gwgc_dt = {
	{"0",329,268},{"5",141,334},{"11",177,326},{"4",242,201},{"6",124,154}
}
function auto_guaiwugongcheng(par) --怪物攻城活动
	local chou4zhi = {"蚩尤之主4","镜像魔王4","封魔冥界教父4","远古祖玛教父4","不朽帝皇4","谛听兽4","远古双头金刚4","远古双头血魔4"}
	if par ~= 1 then --不是新区活动
		if getkaiquday() < 2 then
			return
		end
	end
	local ditu_t = gwgc_dt[math.random(1,#gwgc_dt)] --要攻城的地图
	--sendmsg0(0,"刷新地图 "..ditu_t[1])
	local t=getplayerlst() --所有玩家列表
	if #t == 0 then
		return
	end
	setsysstr("怪物攻城地图",tostring(ditu_t[1]))
	setsysstr("怪物攻城x",tostring(ditu_t[2]))
	setsysstr("怪物攻城y",tostring(ditu_t[3]))
	for i = 1,#shuaxiaoguai do
		setsysstr("怪物攻城数量",tostring(shuaxiaoguai[i][2]))
		setsysstr("怪物攻城名字",tostring(shuaxiaoguai[i][1]))
		setsysstr("怪物攻城范围","100")
		if shuaxiaoguai[i][2] >=15 then
			setsysstr("怪物攻城颜色","255")
		elseif shuaxiaoguai[i][2] ==5 then
			setsysstr("怪物攻城颜色","250")
		elseif shuaxiaoguai[i][2] ==1 then
			setsysstr("怪物攻城颜色","249")
		end
		callscript(t[1], '怪物攻城','@刷小怪')
		--sendmsg0(0,"刷新完成")
	end
	setsysstr("怪物攻城数量","1")
	setsysstr("怪物攻城名字",chou1zhi[math.random(1,#chou1zhi)])
	setsysstr("怪物攻城范围","10")
	setsysstr("怪物攻城颜色","249")
	callscript(t[1], '怪物攻城','@刷小怪')
	
	for i = 1,4 do
		local id = math.random(1,#chou4zhi)
		setsysstr("怪物攻城数量","1")
		setsysstr("怪物攻城名字",chou4zhi[id])
		setsysstr("怪物攻城范围","20")
		setsysstr("怪物攻城颜色","249")
		callscript(t[1], '怪物攻城','@刷小怪')
		table.remove(chou4zhi,id)
	end
	
	local t=getplayerlst() --所有玩家列表
	--callscriptex(0, "sendcentermsg", 251, 0, "玩家列表"..tbl2json(t) , 1 ,5 )
	local pyx = -320
	local pyy = -130
	local msg = ""
	msg = msg..'<Img|children={2,3,5,4,6}|x='..  14 + pyx ..'|y='..  40 + pyy ..'|width=160|height=100|esc=0|bg=1|move=1|scale9t=10|scale9r=10|scale9l=10|scale9b=10|img=zhangheng/281.png>'
	msg = msg..[[
	<RText|id=2|ax=0.5|x=79.0|y=7.0|rotate=0|color=255|size=18|outline=1|text=<怪物攻城已开启/FCOLOR=250>>
	<RText|id=3|ax=0.5|x=79.0|y=30.0|rotate=0|color=255|size=18|outline=1|text=<是否前往？/FCOLOR=254>>
	<COUNTDOWN|ax=0.5|id=5|x=78.0|y=60.0|time=30|count=1|size=16|outline=1|color=250|link=@close_shijieboss>
	<Button|id=6|x=101.0|y=58.0|width=50|height=30|rotate=0|outline=1|color=255|size=18|nimg=zhangheng/71.png|text=否|link=@close_shijieboss>
	]]
	msg = msg..'<Button|id=4|x=8.0|y=58.0|width=50|height=30|color=255|outline=1|nimg=zhangheng/71.png|size=18|text=是|link=@guaiwu_goto,'.. ditu_t[1] ..','..ditu_t[2] ..','..ditu_t[3] ..'>'
    for k,v in ipairs(t) do
		if getmap(v) ~= "tuoji" and getmap(v) ~= "waigua" then
			addbutton(v,107,98,msg)
		end
    end
end

function guaiwu_goto(actor,mapid,x,y)
	x = tonumber(x)
	y = tonumber(y)
	mapmove(actor,mapid,x,y,5)
	delbutton(actor,107,98)
end

function auto_quanshuihuodong()
	if getsysint("合区次数") == 0 then
		return
	end
	
	local guai_t = genmon("3",354,337,"泉眼",1,1,253)
	local mon = guai_t[1]
	if mon then
		setcurrent(mon,"9",tostring(os.time())) --设置出生时间，1个小时没人采就消失
		setcurrent(mon,"8",tostring(20)) --可采集次数
	end
	
	local t=getplayerlst() --所有玩家列表
	--callscriptex(0, "sendcentermsg", 251, 0, "玩家列表"..tbl2json(t) , 1 ,5 )
	local pyx = -320
	local pyy = -130
	local msg = ""
	msg = msg..'<Img|children={2,3,5,4,6}|x='..  14 + pyx ..'|y='..  40 + pyy ..'|width=160|height=100|esc=0|bg=1|move=1|scale9t=10|scale9r=10|scale9l=10|scale9b=10|img=zhangheng/281.png>'
	msg = msg..[[
	<RText|id=2|ax=0.5|x=79.0|y=7.0|rotate=0|color=255|size=18|outline=1|text=<泉眼已刷新/FCOLOR=250>>
	<RText|id=3|ax=0.5|x=79.0|y=30.0|rotate=0|color=255|size=18|outline=1|text=<是否前往？/FCOLOR=254>>
	<COUNTDOWN|ax=0.5|id=5|x=78.0|y=60.0|time=30|count=1|size=16|outline=1|color=250|link=@close_shijieboss>
	<Button|id=4|x=8.0|y=58.0|width=50|height=30|color=255|outline=1|nimg=zhangheng/71.png|size=18|text=是|link=@jisha_shijieboss>
	<Button|id=6|x=101.0|y=58.0|width=50|height=30|rotate=0|outline=1|color=255|size=18|nimg=zhangheng/71.png|text=否|link=@close_shijieboss>
	]]
    for k,v in ipairs(t) do
		if getmap(v) ~= "tuoji" and getmap(v) ~= "waigua" then
			addbutton(v,107,98,msg)
		end
    end
end

function auto_gonggao()
	sendmsg(actor,2,'{"Msg":"如发现通过恶意诋毁 诱导 哄骗 拉人去其他服务器的玩家 一经查实 举报者可获得被举报者身上50%的货币 ","FColor":251,"BColor":0,"Type":5,"Y":0}')

end

function auto_gonggao1()
	sendmsg(actor,2,'{"Msg":"针对多个脚本号群控抢散人boss的行为以及拿沙行为 希望玩家能踊跃举报 一经核实 全部永久封禁","FColor":251,"BColor":0,"Type":5,"Y":0}')

end
