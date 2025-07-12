include("Market_Def/zh.lua") --个人封装函数
--1 客服部 2 材料组 3 场控组 4 气氛组 5 项目部
local fangjiahao = {
	["12407275"] = {"hao1","黄峰","客服部门"},["13216418"] = {"hao1","汪荣丽","客服部门"},["18936379"] = {"hao1","舒泰","客服部门"},
	["30497613"] = {"hao2","汪朗新","材料部门"},
	["19313238"] = {"hao3","魏亚伟","场控部门"},
	["7586169"] = {"hao4","汪成","气氛部门"},
	["25891743"] = {"hao5","张恒","项目部门"}, ["9071622"] = {"hao5","杜鹏","项目部门"}, ["5225660"] = {"hao5","祁玮","项目部门"}, ["10202743"] = {"hao5","李金伦","项目部门"},
}

--dhf403 客服部 场控 437500 材料    971205 气氛   110611


local atts = {
{1,"生命值",1},
{2,"魔法值",1},
{3,"攻击下限",1},
{4,"攻击上限",1},
{5,"魔法下限",1},
{6,"魔法上限",1},
{7,"道术下限",1},
{8,"道术上限",1},
{9,"防御下限",1},
{10,"防御上限",1},
{11,"魔防下限",1},
{12,"魔防上限",1},
{13,"准确",1},
{14,"敏捷",1},
{15,"魔法躲避",3},
{16,"毒物躲避",3},
{17,"中毒恢复",3},
{18,"体力恢复",3},
{19,"魔法恢复",3},
{20,"攻击速度",1},
{21,"暴击几率增加",3},
{22,"暴击伤害增加",3},
{23,"暴击几率抵抗",3},
{24,"暴击伤害减免",3},
{25,"增加攻击伤害",3},
{26,"物理伤害减少",3},
{27,"魔法伤害减少",3},
{28,"忽视目标防御",3},
{29,"所有伤害反弹",3},
{30,"人物体力增加",3},
{31,"人物魔力增加",3},
{32,"增加目标爆率",3},
{33,"死亡爆率降低",3},
{34,"吸血",2},
{35,"攻魔道伤",2},
{36,"防御加成",2},
{37,"魔防加成",2},
{39,"幸运",1},
{45,"防止麻痹",2},
{46,"防止护身",2},
{47,"防止复活",2},
{48,"防止全毒",2},
{49,"防止诱惑",2},
{50,"防止火墙",2},
{51,"防止冰冻",2},
{52,"防止蛛网",2},
{54,"对战增伤",2},
{55,"受战减伤",2},
{56,"对法增伤",2},
{57,"受法减伤",2},
{58,"对道增伤",2},
{59,"受道减伤",2},
{60,"生命加成",2},
{61,"生命恢复",1},
{62,"魔法恢复",1},
{63,"格挡概率",2},
{64,"格挡伤害",2},
{65,"掉落概率",2},
{66,"经验倍率",2},
{67,"基础倍攻",2},
{68,"对人伤害",1},
{69,"冰冻概率",2},
{70,"蛛网概率",2},
{71,"生命恢复",1},
{72,"对怪暴击率",3},
{73,"攻击加成",2},
{74,"对怪伤害",1},
{75,"对怪增伤",2},
{76,"PK增伤",2},
{77,"PK减伤",2},
{78,"穿透",1},
{79,"神圣一击",2},
{80,"神圣伤害",1},
{81,"对怪吸血",2},
{82,"受怪减伤",2},
{83,"药品恢复加成",2},
{84,"吸血抵抗",2},
{85,"破防抵抗",2},
{86,"烈火减免",2},
{87,"刺杀减免",2},
{88,"攻杀减免",2},
{89,"HP加成",2},
{90,"神圣抵抗",2},
{91,"每秒回蓝",1},
{200,"四象之力加成",2},
{201,"重击几率",2},
{202,"重击伤害",2},
{203,"回收比例",3},
{204,"宝宝攻击伤害",2},
{205,"目标减蓝",2},
{206,"宝宝攻击速度",1},
{207,"施法速度",1},
{208,"重击伤害减免",2},
{209,"淬炼值",1},
{210,"受战减伤",2},
{211,"受法减伤",2},
{212,"受道减伤",2},
{213,"体力元素",2},
{214,"固伤减免",1},
{215,"掉落概率显示",2},

}



function guanli_show1(actor,mima,player) --客服部
	mima = tonumber(mima) or 0 --密码是否通过
	if not fangjiahao[getconst(actor,"<$USERACCOUNT>")] then
		return
	end
	if fangjiahao[getconst(actor,"<$USERACCOUNT>")][3] ~= "客服部门" then
		return
	end
	local msg = [[
		<Img|x=0|width=700|height=494|bg=1|scale9l=50|scale9r=50|scale9t=50|scale9b=50|move=1|reset=0|loadDelay=0|esc=1|img=zhangheng/1.png|show=4>
		<Button|x=697.0|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	]]
	if mima == 0 then
		msg=msg..[[
			<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
			<Text|x=193.0|y=226.0|size=18|color=255|text=输入密码>
			<Img|x=300.0|y=219.0|img=zh/30.png|esc=0>
			<Input|x=304.0|y=221.0|width=180|height=25|type=0|inputid=1|size=16|color=255>
			<Button|x=341.0|y=329.0|color=255|size=18|nimg=zh/3.png|submitInput=1|text=确定|link=@queding1>
		]]
	end
	if mima == 1 then
		msg=msg..[[
			<Text|x=38.0|y=62.0|color=255|size=18|text=玩家名>
			<Img|x=117.0|y=55.0|img=zh/30.png|esc=0>
			<Input|x=121.0|y=57.0|width=180|height=25|color=255|type=0|size=16|inputid=1>
			<Button|x=210.0|y=297.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=GM权限|link=@quanxian>
			<Button|x=330.0|y=297.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=日充发放|link=@richong>
			<Button|x=450.0|y=297.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=自己等级48级|link=@tiaodengji,48>
			<Button|x=570.0|y=297.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=自己等级35级|link=@tiaodengji,35>
			<Button|x=34.0|y=92.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=查询属性|link=@chashuxing>
			<Text|x=302.0|y=396.0|color=255|size=18|text=怪物名>
			<Img|x=381.0|y=389.0|img=zh/30.png|esc=0>
			<Input|x=385.0|y=391.0|width=180|height=25|color=255|type=0|size=16|inputid=2>
			<Text|x=302.0|y=436.0|color=255|size=18|text=物品名>
			<Img|x=381.0|y=429.0|img=zh/30.png|esc=0>
			<Input|x=385.0|y=431.0|width=180|height=25|color=255|type=0|size=16|inputid=3>
			<Button|x=571.0|y=379.0|color=255|size=18|nimg=zh/3.png|submitInput=1,2,3|text=设置幸运爆率|link=@setxingyunbaolv>
			<Button|x=572.0|y=424.0|color=255|size=18|nimg=zh/3.png|text=清除幸运爆率|link=@clearxingyunbaolv>
			<Img|x=570.0|y=171.0|width=100|img=zh/30.png|esc=0>
			<Input|x=573.0|y=174.0|width=100|height=25|color=255|type=1|size=16|inputid=4>
			
			<Img|x=167.0|y=385.0|width=120|img=zh/30.png|esc=0>
			<Input|x=171.0|y=387.0|width=120|height=25|color=255|type=0|size=16|inputid=5>
			<Button|x=174.0|y=422.0|color=255|size=18|submitInput=1,5|nimg=zh/3.png|text=人物改名|link=@gaiming>
		]]
		
		
		msg = msg ..'<Text|x=330.0|y=227.0|color=255|size=18|text=开区时间：'.. os.date("%Y年%m月%d日 %H:%M:%S",getsysint("开区时间")) ..'>'
		msg = msg ..'<Text|x=330.0|y=247.0|color=255|size=18|text=当前开区天数：'.. getkaiquday() ..'>'
		msg = msg ..'<Text|x=330.0|y=267.0|color=255|size=18|text=当前合区次数：'.. getsysint("合区次数") ..'>'
		
		msg=msg.."<Text|x=301.0|y=352.0|color=255|size=14|text=幸运爆率玩家：".. getsysstr("幸运爆率玩家名") .."  怪物：".. getsysstr("幸运爆率怪物名") .."  物品：".. getsysstr("幸运爆率物品名")..">"
		
		local chongzhi_t = {10,50,100,500,1000,5000,10000}
		for i = 1,#chongzhi_t do
			msg=msg.."<Button|x=".. 330 + (i-1)%3*120 .."|y=".. 48+math.floor((i-1)/3) * 55 .."|color=255|size=18|submitInput=1|nimg=zh/3.png|clickInterval=2000|text=充值".. chongzhi_t[i] .."元|link=@chong,".. chongzhi_t[i] ..",1>"
		end
		
		msg=msg.."<Button|x=".. 330 + (8-1)%3*120 .."|y=".. 48+math.floor((8-1)/3) * 55 .."|color=255|size=18|submitInput=1,4|nimg=zh/3.png|clickInterval=2000|text=自定义金额元|link=@zidingyichong>"
		
		if player then
			local ids = ""
			for i = 2,300 do
				ids = ids..i..","
			end
			local ziid = 2
			msg=msg.."<ListView|id=1|direction=1|children={".. ids .."}|x=34.0|y=139.0|margin=2|width=240|height=320>"
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=玩家名：".. getname(player) ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=账号：".. getconst(player,"<$USERACCOUNT>") ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=地图：".. getbaseinfo(player,45) .."（"..getx(player) .. "," ..gety(player) .."）>"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=等级：".. getlevel(player) .."    经验：".. getjingyan(actor) ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=累计充值：".. getint(player,"累计充值") ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=今日充值：".. getdayint(player,"今日充值") ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=元宝：".. getingot(player) ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=金币：".. getgold(player) ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=绑金：".. getbindjinbi(player) ..">"
			ziid = ziid + 1
			for i = 1,#atts do
				local zhi = getbaseinfo(player,51,atts[i][1])
				--sendmsg6(actor,"id"..atts[i][1].." 值"..zhi)
				if zhi > 0 then
					local str = atts[i][2] .. "："
					if atts[i][3] == 3 then
						str = str .. zhi .."%"
					elseif atts[i][3] == 2 then
						str = str .. zhi/100 .."%"
					else
						str = str .. zhi
					end
					msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=".. str ..">"
					ziid = ziid + 1
				end
			end
		end
	end
	say(actor,msg)
end
function gaiming(actor)
	local player = ""
	local name = getconst(actor,'<$NPCINPUT(1)>')
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	else
		sendmsg9(actor,"请输入玩家名称")
		return
	end
	if getingot(player) < 10000 then
		sendmsg9(actor,"他身上元宝不足一万","#00ff00")
		return
	end
	
	local newname = getconst(actor,'<$NPCINPUT(5)>') --新名字
	if #newname < 4 or #newname > 20 then
		sendmsg9(actor,"输入名称长度不正确")
		return
	end
	if changehumname(player,newname) == 0 then
		subingot(player,10000)
		sendmsg9(player,"改名成功")
		sendmsg6(player,"改名成功")
		post(actor,getname(player).."改名为"..newname)
	else
		sendmsg9(actor,"改名失败，请输入新的名称")
		sendmsg6(actor,"改名失败，请输入新的名称")
		return
	end

end


function chashuxing(actor,par)
	local player = ""
	local name = getconst(actor,'<$NPCINPUT(1)>')
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	else
		sendmsg9(actor,"请输入玩家名称")
		return
	end
	if par == "5" then
		return guanli_show5(actor,1,player)
	elseif par == "3" then
		return guanli_show3(actor,1,player)
	else
		return guanli_show1(actor,1,player)
	end
end
function setxingyunbaolv(actor)
	if fangjiahao[getconst(actor,"<$USERACCOUNT>")][2] ~= "黄峰"  then
		sendmsg9(actor,"无权限使用")
		return
	end
	local name = getconst(actor,'<$NPCINPUT(1)>') --要设置的玩家名
	local monname = getconst(actor,'<$NPCINPUT(2)>') --要设置的怪物名
	local itemname = getconst(actor,'<$NPCINPUT(3)>') --要设置的物品名
	if name == "" or monname == "" or itemname == "" then
		sendmsg9(actor,"请输入完整人物名，怪物名，物品名")
		return
	end
	setsysstr("幸运爆率设置人","黄峰")
	setsysstr("幸运爆率玩家名",name)
	setsysstr("幸运爆率怪物名",monname)
	setsysstr("幸运爆率物品名",itemname)
	sendmsg9(actor,"设置幸运爆率成功")
	return guanli_show1(actor,1)
end

function clearxingyunbaolv(actor)
	if fangjiahao[getconst(actor,"<$USERACCOUNT>")][2] ~= "王伟" and fangjiahao[getconst(actor,"<$USERACCOUNT>")][2] ~= "黄峰"  then
		sendmsg9(actor,"无权限使用")
		return
	end
	setsysstr("幸运爆率设置人","")
	setsysstr("幸运爆率玩家名","")
	setsysstr("幸运爆率怪物名","")
	setsysstr("幸运爆率物品名","")
	sendmsg9(actor,"清除成功")
	return guanli_show1(actor,1)
end

function tiaodengji(actor,lv)
	if os.time() - getsysint("开区时间") < 3600*6 then
		sendmsg9(actor,"6小时后才可调整")
		return
	end
	setlevel(actor,tonumber(lv))
	sendmsg9(actor,"调整成功")
	local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
	post1(actor,t[3].."的"..t[2].."调整等级到"..lv.."级")
end

function richong(actor,zhi)
	local player = ""
	local name = getconst(actor,'<$NPCINPUT(1)>')
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	else
		sendmsg9(actor,"请输入玩家名称")
		return
	end
	if player == "" then
		sendmsg9(actor,"请输入正确的名字")
		return
	end
	if getdayint(player,"日充福利") ~= 0 then
		sendmsg9(actor,"他今日已经领取过了")
		return
	end
	
	callscriptex(player, "CallLua", "QFunction-0", "@recharge,28,1,12") --充值触发
	local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
	post1(actor,t[3].."的"..t[2].."给"..name.."充了日充")
	--recharge(player,zhi,1,10,1)
	messagebox(actor,"领取日冲成功")
	return
end

function chong(actor,zhi,mianbanid)
	local player = ""
	local name = getconst(actor,'<$NPCINPUT(1)>')
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	else
		sendmsg9(actor,"请输入玩家名称")
		return
	end
	messagebox(actor,"\\是否确定给玩家《<font color=\'#ff00ff\'>".. name .."</font>》充值 <font color=\'#00ff00\'>".. zhi .."</font> 元？","@chong1,"..zhi..",".. mianbanid ..","..name,"@buchong")
end

function zidingyichong(actor)
	local player = ""
	local name = getconst(actor,'<$NPCINPUT(1)>')
	local sl = tonumber(getconst(actor,'<$NPCINPUT(4)>'))
	if sl > 10000 then
		sendmsg9(actor,"请输入1万以下数值")
		return 
	end
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	else
		sendmsg9(actor,"请输入玩家名称")
		return
	end
	messagebox(actor,"\\是否确定给玩家《<font color=\'#ff00ff\'>".. name .."</font>》充值 <font color=\'#00ff00\'>".. sl .."</font> 元？","@chong1,"..sl..",".. 1 ..","..name,"@buchong")
end

function buchong()
end

function chong1(actor,zhi,mianbanid,wanjiname)
	local mianbanid = tonumber(mianbanid)
	local zhi = tonumber(zhi)
	local name = wanjiname
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	else
		sendmsg9(actor,"请输入玩家名称")
		return
	end
	addingot(player,zhi*100)
	callscriptex(player, "CallLua", "QFunction-0", "@recharge,"..zhi..",1,10") --充值触发
	--recharge(player,zhi,1,10,1)
	messagebox(actor,"充值成功")
	local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
	
	setsysint(t[3],getsysint(t[3])+zhi)
	setsysint("每日"..t[3],getsysint("每日"..t[3])+zhi)
	
	post1(actor,t[3].."的"..t[2].."给"..name.."充值了"..zhi.."元")
	if mianbanid == 1 then
		return guanli_show1(actor,1)
	elseif mianbanid == 2 then
		return guanli_show2(actor,1)
	elseif mianbanid == 3 then
		return guanli_show3(actor,1)
	elseif mianbanid == 4 then
		return guanli_show4(actor,1)
	elseif mianbanid == 5 then
		return guanli_show5(actor,1)
	end

end

function queding1(actor)
	local mima = getconst(actor,'<$NPCINPUT(1)>')
	if mima ~= "dhf403" then
		sendmsg9(actor,"请输入正确的密码")
		return
	end

	return guanli_show1(actor,1)
end
----------------------------------------------------------------------------------------------------------
------------------------------------------------材料组---------------------------------------------------
----------------------------------------------------------------------------------------------------------
function guanli_show2(actor,mima) --材料组
	mima = tonumber(mima) or 0 --密码是否通过
	if not fangjiahao[getconst(actor,"<$USERACCOUNT>")] then
		return
	end
	if fangjiahao[getconst(actor,"<$USERACCOUNT>")][3] ~= "材料部门" then
		return
	end
	local msg = [[
		<Img|x=0|width=700|height=494|bg=1|scale9l=50|scale9r=50|scale9t=50|scale9b=50|move=1|reset=0|loadDelay=0|esc=1|img=zhangheng/1.png|show=4>
		<Button|x=697.0|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	]]
	if mima == 0 then
		msg=msg..[[
			<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
			<Text|x=193.0|y=226.0|size=18|color=255|text=输入密码>
			<Img|x=300.0|y=219.0|img=zh/30.png|esc=0>
			<Input|x=304.0|y=221.0|width=180|height=25|type=0|inputid=1|size=16|color=255>
			<Button|x=341.0|y=329.0|color=255|size=18|nimg=zh/3.png|submitInput=1|text=确定|link=@queding2>
		]]
	end
	if mima == 1 then
		msg=msg..[[
			<Text|x=38.0|y=62.0|color=255|size=18|text=玩家名>
			<Img|x=117.0|y=55.0|img=zh/30.png|esc=0>
			<Input|x=121.0|y=57.0|width=180|height=25|color=255|type=0|size=16|inputid=1>	
			<Button|x=130.0|y=297.0|color=255|size=18|nimg=zh/3.png|text=元宝清理|submitInput=1,2|link=@yuanbaoqingli>	
			
			<Text|x=38.0|y=362.0|color=255|size=18|text=清理元宝数：>
			<Img|x=137.0|y=355.0|img=zh/30.png|esc=0>
			<Input|x=141.0|y=357.0|width=180|height=25|color=255|type=1|size=16|inputid=2>	
				
			<Button|x=330.0|y=297.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=日充发放|link=@richong>
			<Button|x=450.0|y=397.0|color=255|size=18|submitInput=1|width=200|nimg=zh/3.png|text=发绑定金币100万|link=@fabangdingjinbi>
			<Button|x=570.0|y=297.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=领取金条*1|link=@lingjintiao>			
		]]

		local chongzhi_t = {10,50,69,300,100,500,1000,5000,10000}
		for i = 1,#chongzhi_t do
			msg=msg.."<Button|x=".. 330 + (i-1)%3*120 .."|y=".. 48+math.floor((i-1)/3) * 55 .."|color=255|size=18|submitInput=1|nimg=zh/3.png|clickInterval=2000|text=充值".. chongzhi_t[i] .."元|link=@chong,".. chongzhi_t[i] ..",2>"
		end
		
		msg=msg .. "<Text|x=".. 30 .."|y=".. 210 .."|color=255|size=18|submitInput=1|text=12万经验卷*1|link=@lingjingyanjuan,12万经验卷>"
		msg=msg .. "<Text|x=".. 160 .."|y=".. 210 .."|color=255|size=18|submitInput=1|text=50点声望卷*1|link=@lingjingyanjuan,50点声望卷>"
		msg=msg .. "<Text|x=".. 290 .."|y=".. 210 .."|color=255|size=18|submitInput=1|text=100点声望卷*1|link=@lingjingyanjuan,100点声望卷>"
		msg=msg .. "<Text|x=".. 130 .."|y=".. 268 .."|color=255|size=18|text=此区清理元宝数量："..getsysint("材料组清理元宝")..">"
	end
	say(actor,msg)
end

function yuanbaoqingli(actor)
	local player = ""
	local name = getconst(actor,'<$NPCINPUT(1)>')
	local sl = tonumber(getconst(actor,'<$NPCINPUT(2)>')) or 0
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	else
		sendmsg9(actor,"请输入玩家名称")
		return
	end
	
	local yuanbao = getingot(player)
	if yuanbao < 1 then
		sendmsg9(actor,"他没有元宝")
		return
	end
	
	if yuanbao < sl then
		sendmsg9(actor,"他元宝不足")
		return
	end
	
	subingot(player,sl)
	setsysint("材料组清理元宝",getsysint("材料组清理元宝")+sl)
	local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
	post1(actor,t[3].."的"..t[2].."清理了".. name .."的元宝*".. sl .."个")
	return guanli_show2(actor,1)
end

function lingjingyanjuan(actor,name)
	giveitem(actor,name,1)
	sendmsg9(actor,"领取成功")
	local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
	post1(actor,t[3].."的"..t[2].."领取了"..name.."*1个")
end

function lingjingyanjuan5(actor)
	giveitem(actor,"12万经验卷",5)
	sendmsg9(actor,"领取成功")
	local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
	post1(actor,t[3].."的"..t[2].."领取了12万经验卷*5个")
end

function queding2(actor)
	local mima = getconst(actor,'<$NPCINPUT(1)>')
	if mima ~= "971205" then
		sendmsg9(actor,"请输入正确的密码")
		return
	end
	return guanli_show2(actor,1)
end

function fabangdingjinbi(actor)
	local player = ""
	local name = getconst(actor,'<$NPCINPUT(1)>')
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	else
		sendmsg9(actor,"请输入玩家名称")
		return
	end
	addbindgold(player,1000000)
	messagebox(actor,"给".. name .."发放100万绑定金币成功")
	local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
	post1(actor,t[3].."的"..t[2].."给"..name.."发放了100万绑定金币")
end

function fabangdingjinbi500(actor)
	local player = ""
	local name = getconst(actor,'<$NPCINPUT(1)>')
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	else
		sendmsg9(actor,"请输入玩家名称")
		return
	end
	addbindgold(player,5000000)
	messagebox(actor,"给".. name .."发放500万绑定金币成功")
	local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
	post1(actor,t[3].."的"..t[2].."给"..name.."发放了500万绑定金币")
end

function lingjintiao(actor)
	if os.time() - getsysint("开区时间") < 3600*3 then
		sendmsg9(actor,"3小时后才可领取")
		return
	end
	giveitem(actor,"金条",1)
	sendmsg9(actor,"领取金条成功")
	local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
	post1(actor,t[3].."的"..t[2].."领取了金条*1".."个")
end

----------------------------------------------------------------------------------------------------------
------------------------------------------------场控部门---------------------------------------------------
----------------------------------------------------------------------------------------------------------
function guanli_show3(actor,mima,player) --场控部门
	mima = tonumber(mima) or 0 --密码是否通过
	if not fangjiahao[getconst(actor,"<$USERACCOUNT>")] then
		return
	end
	if fangjiahao[getconst(actor,"<$USERACCOUNT>")][3] ~= "场控部门" then
		return
	end
	local msg = [[
		<Img|x=0|width=700|height=494|bg=1|scale9l=50|scale9r=50|scale9t=50|scale9b=50|move=1|reset=0|loadDelay=0|esc=1|img=zhangheng/1.png|show=4>
		<Button|x=697.0|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		
	]]
	if mima == 0 then
		msg=msg..[[
			<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
			<Text|x=193.0|y=226.0|size=18|color=255|text=输入密码>
			<Img|x=300.0|y=219.0|img=zh/30.png|esc=0>
			<Input|x=304.0|y=221.0|width=180|height=25|type=0|inputid=1|size=16|color=255>
			<Button|x=341.0|y=329.0|color=255|size=18|nimg=zh/3.png|submitInput=1|text=确定|link=@queding3>
		]]
	end
	if mima == 1 then
		msg=msg..[[
			<Text|x=38.0|y=62.0|color=255|size=18|text=玩家名>
<Img|x=117.0|y=55.0|img=zh/30.png|esc=0>
<Input|x=121.0|y=57.0|width=180|height=25|color=255|type=0|inputid=1|size=16>
<Button|x=313.0|y=297.0|color=255|size=18|submitInput=1,2|nimg=zh/3.png|text=元宝清理|link=@yuanbaoqingli>
<Text|x=313.0|y=366.0|color=255|size=18|text=清理元宝数：>
<Img|x=412.0|y=359.0|img=zh/30.png|esc=0>
<Input|x=416.0|y=361.0|width=180|height=25|color=255|type=1|inputid=2|size=16>
<Button|x=34.0|y=92.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=查询属性|link=@chashuxing,3>
<Button|x=441.0|y=297.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=日充发放|link=@richong>
<Button|x=470.0|y=416.0|width=200|size=18|color=255|nimg=zh/3.png|submitInput=1|text=发绑定金币100万|link=@fabangdingjinbi>
<Button|x=570.0|y=297.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=领取金条*1|link=@lingjintiao>
		
		]]

		local chongzhi_t = {10,50,100,300,500,1000,2000}
		for i = 1,#chongzhi_t do
			msg=msg.."<Button|x=".. 330 + (i-1)%3*120 .."|y=".. 48+math.floor((i-1)/3) * 55 .."|color=255|size=18|submitInput=1|nimg=zh/3.png|clickInterval=2000|text=充值".. chongzhi_t[i] .."元|link=@chong,".. chongzhi_t[i] ..",3>"
		end
		msg=msg .. "<Text|x=".. 330 .."|y=".. 238 .."|color=255|size=18|text=12万经验卷*1|submitInput=1|link=@changkonglingjingyan,1>"
		msg=msg .. "<Text|x=".. 460 .."|y=".. 238 .."|color=255|size=18|text=12万经验卷*5|submitInput=1|link=@changkonglingjingyan,5>"
		
		if player then
			local ids = ""
			for i = 2,300 do
				ids = ids..i..","
			end
			local ziid = 2
			msg=msg.."<ListView|id=1|direction=1|children={".. ids .."}|x=34.0|y=139.0|margin=2|width=240|height=320>"
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=玩家名：".. getname(player) ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=账号：".. getconst(player,"<$USERACCOUNT>") ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=地图：".. getbaseinfo(player,45) .."（"..getx(player) .. "," ..gety(player) .."）>"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=等级：".. getlevel(player) .."    经验：".. getjingyan(actor) ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=累计充值：".. getint(player,"累计充值") ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=今日充值：".. getdayint(player,"今日充值") ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=元宝：".. getingot(player) ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=金币：".. getgold(player) ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=绑金：".. getbindjinbi(player) ..">"
			ziid = ziid + 1
			for i = 1,#atts do
				local zhi = getbaseinfo(player,51,atts[i][1])
				--sendmsg6(actor,"id"..atts[i][1].." 值"..zhi)
				if zhi > 0 then
					local str = atts[i][2] .. "："
					if atts[i][3] == 3 then
						str = str .. zhi .."%"
					elseif atts[i][3] == 2 then
						str = str .. zhi/100 .."%"
					else
						str = str .. zhi
					end
					msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=".. str ..">"
					ziid = ziid + 1
				end
			end
		end
	end
	say(actor,msg)
end

function changkonglingjingyan(actor,sl)
	sl = tonumber(sl)
	local player = ""
	local name = getconst(actor,'<$NPCINPUT(1)>')
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	else
		sendmsg9(actor,"请输入玩家名称")
		return
	end

	
	if getbagblank(player) < 5 then
		sendmsg9(actor,"玩家背包空格不足5格")
		return
	end
	
	giveitem(player,"12万经验卷",sl,0)
	sendmsg9(actor,"发送成功")
	local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
	post1(actor,t[3].."的"..t[2].."给"..name.."发送了物品绑定12万经验卷*"..sl.."个")
end

function queding3(actor)
	local mima = getconst(actor,'<$NPCINPUT(1)>')
	if mima ~= "437500" then
		sendmsg9(actor,"请输入正确的密码")
		return
	end
	return guanli_show3(actor,1)
end

----------------------------------------------------------------------------------------------------------
------------------------------------------------气氛部门---------------------------------------------------
----------------------------------------------------------------------------------------------------------
function guanli_show4(actor,mima) --气氛部门
	mima = tonumber(mima) or 0 --密码是否通过
	if not fangjiahao[getconst(actor,"<$USERACCOUNT>")] then
		return
	end
	if fangjiahao[getconst(actor,"<$USERACCOUNT>")][3] ~= "气氛部门" then
		return
	end
	local msg = [[
		<Img|x=0|width=700|height=494|bg=1|scale9l=50|scale9r=50|scale9t=50|scale9b=50|move=1|reset=0|loadDelay=0|esc=1|img=zhangheng/1.png|show=4>
		<Button|x=697.0|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	]]
	if mima == 0 then
		msg=msg..[[
			<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
			<Text|x=193.0|y=226.0|size=18|color=255|text=输入密码>
			<Img|x=300.0|y=219.0|img=zh/30.png|esc=0>
			<Input|x=304.0|y=221.0|width=180|height=25|type=0|inputid=1|size=16|color=255>
			<Button|x=341.0|y=329.0|color=255|size=18|nimg=zh/3.png|submitInput=1|text=确定|link=@queding4>
		]]
	end
	if mima == 1 then
		msg=msg..[[
			<Text|x=38.0|y=62.0|color=255|size=18|text=玩家名>
			<Img|x=117.0|y=55.0|img=zh/30.png|esc=0>
			<Input|x=121.0|y=57.0|width=180|height=25|color=255|type=0|size=16|inputid=1>			
			<Button|x=450.0|y=297.0|color=255|size=18|submitInput=1|width=200|nimg=zh/3.png|text=发绑定金币100万|link=@fabangdingjinbi>		
			<Button|x=450.0|y=397.0|color=255|size=18|submitInput=1|width=200|nimg=zh/3.png|text=发绑定金币500万|link=@fabangdingjinbi500>	
		]]

		local chongzhi_t = {10,50,100,300}
		for i = 1,#chongzhi_t do
			msg=msg.."<Button|x=".. 330 + (i-1)%3*120 .."|y=".. 48+math.floor((i-1)/3) * 55 .."|color=255|size=18|submitInput=1|nimg=zh/3.png|clickInterval=2000|text=充值".. chongzhi_t[i] .."元|link=@chong,".. chongzhi_t[i] ..",4>"
		end
	end
	say(actor,msg)
end

function queding4(actor)
	local mima = getconst(actor,'<$NPCINPUT(1)>')
	if mima ~= "755959" then
		sendmsg9(actor,"请输入正确的密码")
		return
	end
	return guanli_show4(actor,1)
end


---------------------------------------------------------------------------------------
--------------------------------------项目部-------------------------------------------------
---------------------------------------------------------------------------------------
local items={
{"金条",10,0},
{"兽魂蛋",50,0},
{"书页",50,0},
{"聚合之心",5,0},
{"技能神石",5,0},
{"神秘水晶",5,0},
{"500点声望卷",1,0},
{"疏筋活络丸",2,0},
{"神兽之血",5,0},
{"沃玛密函",2,0},
{"孟婆汤",2,0},
{"祖玛头像",2,0},
{"牛魔王的推荐信",2,0},
{"一级金针",50,0},
{"祝福油",50,0},
{"12万经验卷",1,0},
{"50万经验卷",10,0},
{"祝福油",50,0},
{"高粱酒",20,2},
{"虎骨",10,2},
{"魔龙之血",2,2},
{"猎魔人★斗笠",1,3},
{"猎魔人★勋章",1,3},
{"主宰凭证",1,5},
{"永恒之泪",1,2},
}
function guanli_show5(actor,mima,player) --项目部
	mima = tonumber(mima) or 0 --密码是否通过
	if not fangjiahao[getconst(actor,"<$USERACCOUNT>")] then
		return
	end
	if fangjiahao[getconst(actor,"<$USERACCOUNT>")][3] ~= "项目部门" then
		return
	end
	local msg = [[
		<Img|x=0|width=700|height=494|bg=1|scale9l=50|scale9r=50|scale9t=50|scale9b=50|move=1|reset=0|loadDelay=0|esc=1|img=zhangheng/1.png|show=4>
		<Button|x=697.0|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	]]
	if mima == 0 then
		msg=msg..[[
			<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
			<Text|x=193.0|y=226.0|size=18|color=255|text=输入密码>
			<Img|x=300.0|y=219.0|img=zh/30.png|esc=0>
			<Input|x=304.0|y=221.0|width=180|height=25|type=0|inputid=1|size=16|color=255>
			<Button|x=341.0|y=329.0|color=255|size=18|nimg=zh/3.png|submitInput=1|text=确定|link=@queding5>
		]]
	end
	if mima == 1 then
		msg=msg..[[
			<Text|x=38.0|y=62.0|color=255|size=18|text=玩家名>
			<Img|x=117.0|y=55.0|img=zh/30.png|esc=0>
			<Input|x=121.0|y=57.0|width=180|height=25|color=255|type=0|size=16|inputid=1>
			<Button|x=200|y=102|size=18|nimg=zh/3.png|color=255|outline=2|text=清理背包|link=@gm_clearbag>
			<Button|x=210.0|y=397.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=GM权限|link=@quanxian>
			<Button|x=330.0|y=397.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=日充发放|link=@richong>
			<Button|x=450.0|y=397.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=自己等级48级|link=@tiaodengji,48>
			<Button|x=570.0|y=397.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=自己等级35级|link=@tiaodengji,35>
			<Button|x=34.0|y=92.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=查询属性|link=@chashuxing,5>
			<Button|x=330.0|y=347.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=加1万元宝|link=@jiayuanbao,10000>
			<Button|x=450.0|y=347.0|color=255|size=18|submitInput=1|nimg=zh/3.png|text=加10万元宝|link=@jiayuanbao,100000>
		]]
		local chongzhi_t = {10,100,300,500,1000}
		for i = 1,#chongzhi_t do
			msg=msg.."<Button|x=".. 330 + (i-1)%3*120 .."|y=".. 48+math.floor((i-1)/3) * 55 .."|color=255|size=18|submitInput=1|nimg=zh/3.png|clickInterval=2000|text=充值".. chongzhi_t[i] .."元|link=@chong,".. chongzhi_t[i] ..",5>"
		end

		for i = 1,#items do
			msg=msg .. "<Text|x=".. 210 + (i-1)%4*120 .."|y=".. 168+math.floor((i-1)/4) * 30 .."|color=255|size=14|submitInput=1|text="..items[i][1].."*"..items[i][2].."|link=@lingquitem,"..i..">"
		end
		if player then
			local ids = ""
			for i = 2,300 do
				ids = ids..i..","
			end
			local ziid = 2
			msg=msg.."<ListView|id=1|direction=1|children={".. ids .."}|x=34.0|y=139.0|margin=2|width=240|height=320>"
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=玩家名：".. getname(player) ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=账号：".. getconst(player,"<$USERACCOUNT>") ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=地图：".. getbaseinfo(player,45) .."（"..getx(player) .. "," ..gety(player) .."）>"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=等级：".. getlevel(player) .."    经验：".. getjingyan(actor) ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=累计充值：".. getint(player,"累计充值") ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=今日充值：".. getdayint(player,"今日充值") ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=元宝：".. getingot(player) ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=金币：".. getgold(player) ..">"
			ziid = ziid + 1
			msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=绑金：".. getbindjinbi(player) ..">"
			ziid = ziid + 1
			for i = 1,#atts do
				local zhi = getbaseinfo(player,51,atts[i][1])
				--sendmsg6(actor,"id"..atts[i][1].." 值"..zhi)
				if zhi > 0 then
					local str = atts[i][2] .. "："
					if atts[i][3] == 3 then
						str = str .. zhi .."%"
					elseif atts[i][3] == 2 then
						str = str .. zhi/100 .."%"
					else
						str = str .. zhi
					end
					msg=msg .. "<Text|id="..ziid.."|x=0|y=0|color=255|size=12|text=".. str ..">"
					ziid = ziid + 1
				end
			end
			local baglist = getbagitems(player)
			for i = 1,#baglist do
				local item = baglist[i]
				local djsl = getiteminfo(player,item,5)
				if djsl == 0 then
					djsl = 1
				end				
				msg=msg .. "<RText|id="..ziid.."|x=0|y=0|color=255|size=12|text=<".. getitemname(player,item) .. "/FCOLOR=250> " .. djsl ..">"
				ziid = ziid + 1
			end
			
			local cangkulist = getstorageitems(player)
			for i = 1,#cangkulist do
				local item = cangkulist[i]
				local djsl = getiteminfo(player,item,5)
				if djsl == 0 then
					djsl = 1
				end				
				msg=msg .. "<RText|id="..ziid.."|x=0|y=0|color=255|size=12|text=<".. getitemname(player,item) .. "/FCOLOR=251> " .. djsl ..">"
				ziid = ziid + 1
			end
		end
	end
	say(actor,msg)
end

function jiayuanbao(actor,sl)
	sl = tonumber(sl)
	local player = ""
	local name = getconst(actor,'<$NPCINPUT(1)>')
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	else
		sendmsg9(actor,"请输入玩家名称")
		return
	end
	messagebox(actor,"\\是否确定给玩家《<font color=\'#ff00ff\'>".. name .."</font>》发送元宝 <font color=\'#00ff00\'>".. sl .."</font> 个？","@jiayuanbao1,"..sl..",".. 5 ..","..name,"@kong")
	
end

function jiayuanbao1(actor,sl,mianbanid,wanjiname)
	local mianbanid = tonumber(mianbanid)
	local sl = tonumber(sl)
	local name = wanjiname
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	else
		sendmsg9(actor,"请输入玩家名称")
		return
	end

	addingot(player,sl,"后台加元宝")
	messagebox(actor,"成功给"..name.."发加元宝*"..sl.."个")
	local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
	post1(actor,t[3].."的"..t[2].."给"..name.."发加元宝*"..sl.."个")
end

function queding5(actor)
	local mima = getconst(actor,'<$NPCINPUT(1)>')
	if mima ~= "232319" then
		sendmsg9(actor,"请输入正确的密码")
		return
	end

	return guanli_show5(actor,1)
end

function lingquitem(actor,par)
	local player = ""
	local name = getconst(actor,'<$NPCINPUT(1)>')
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	else
		sendmsg9(actor,"请输入玩家名称")
		return
	end
	par = tonumber(par)
	if getsysint("合区次数") < items[par][3] then
		sendmsg9(actor,items[par][3].."次合区后才能领取")
		return
	end
	
	if getbagblank(player) < 5 then
		sendmsg9(actor,"玩家背包空格不足5格")
		return
	end
	
	giveitem(player,items[par][1],items[par][2])
	sendmsg9(actor,"发送成功")
	local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
	post1(actor,t[3].."的"..t[2].."给"..name.."发送了物品"..items[par][1].."*"..items[par][2].."个")
	
end

function quanxian(actor)
	if getint(actor,"gm权限") ==1 then
		sendmsg9(actor,"已是gm权限")
		return
	end
	
	gmexecute(actor,"1")
	gmexecute(actor,"2")
	gmexecute(actor,"3")
	setgmlevel(actor,10)
	setint(actor,"gm权限",1)
	sendmsg9(actor,"设置成功")
end

function gm_clearbag(actor)
	local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
	for i = 1,#items do
		local sl = itemcount(actor, items[i][1])
		if sl > 0 then
			takeitem(actor,items[i][1],sl)
			post1(actor,t[3].."的"..t[2].."清理了物品"..items[i][1].."*"..sl.."个")
		end
	end
end