
include("Market_Def/fuli.lua") --福利界面
include("Market_Def/shouchong.lua") --首充
include("Market_Def/zhouka.lua") --周卡
---------右上图标显示段
local tubiao_t1 = {
	{"天天省钱",5,"tubiao_ttsq"},
	{"拍卖行",18,"tubiao_pmh"},
	--{"交易行",6,"tubiao_jyh"},
	
	{"福利",7,"tubiao_fuli"},
	{"首杀",9,"tubiao_shousha"},
	-- {"微信礼包",15,"tubiao_libao"},
	-- {"公众号",19,"tubiao_gongzonghao"},
	--{"实物兑换",10,"tubiao_shiwuduihuan"},
	-- {"游戏活动",16,"tubiao_huodong"},
	-- {"攻略",14,"tubiao_gonglue"},
	

}
local tubiao_t2 = {
	{"首充",12,"tubiao_shouchong",bianliang = "首充领取"},
	{"周卡",13,"tubiao_zhouka",},
	{"骰王",8,"tubiao_touwang",},
	{"充值",17,"tubiao_chongzhi"},
}

function touzihongdian(actor)
	if getint(actor,"会员等级") >= 2 then
		return false
	end
	if ( getlevel(actor) == 40 or getlevel(actor) == 43 ) and getint(actor,"投资红点") == 0 then
		setint(actor,"免费福利红点",1)
		return true
	end
	return false
end

function tubiaoxianshi(actor)
	--haoshistart(actor)
	local msg = ""
	if getispc(actor) then --电脑端
		msg = msg .. '<Button|x=-235.0|y=20.0|nimg=tubiao/2.png|link=@close_tubiao>'
		local xh = 1
		for i = 1,#tubiao_t1 do				
			if tubiao_t1[i][1] == "微信礼包" or ( getmap(actor) ~= "tuoji" and getmap(actor) ~= "waigua" ) then
				
				if tubiao_t1[i][1] == "公众号" and ( (getlevel(actor) >= 48 and getint(actor,"公众号隐藏") ~= 0 ) or getint(actor,"公众号隐藏") == 2 ) then
				else
					msg = msg .. '<Button|x='.. -305 - (xh-1)*65 ..'|y=15.0|nimg=tubiao/'.. tubiao_t1[i][2] ..'1.png|link=@'.. tubiao_t1[i][3] ..'>'
					if tubiao_t1[i][1] == "首杀" and (dengjihongdian(actor) or getint(actor,"重大奖励红点") == 1 ) then --红点
						msg = msg .. '<Img|x='.. -265 - (xh-1)*65 ..'|y=15.0|img=zh/100.png|esc=0>'
					end
					if tubiao_t1[i][1] == "公众号" and getint(actor,"微信礼包红点") == 0 then --红点
						msg = msg .. '<Img|x='.. -265 - (xh-1)*65 ..'|y=15.0|img=zh/100.png|esc=0>'
					end
					--if tubiao_t1[i][1] == "福利" and touzihongdian(actor) then --红点
					--	msg = msg .. '<Img|x='.. -265 - (xh-1)*65 ..'|y=15.0|img=zh/100.png|esc=0>'
					--end
					if tubiao_t1[i][1] == "微信礼包" and getint(actor,"客服红点显示") == 1 then --红点
						msg = msg .. '<Img|x='.. -265 - (xh-1)*65 ..'|y=15.0|img=zh/100.png|esc=0>'
					end
					xh = xh + 1
				end
			end
		end
		xh = 1
		for i = 1,#tubiao_t2 do
			if tubiao_t2[i].bianliang ~= nil and getint(actor,tubiao_t2[i].bianliang) == 1 then
			elseif (tubiao_t2[i][1] == "骰王" and getsysint("合区次数") < 1) or (tubiao_t2[i][1] == "周卡" and getlevel(actor) < 50) then
			elseif (tubiao_t2[i][1] == "骰王" or tubiao_t2[i][1] == "周卡") and getint(actor,"隐藏图标") == 1 then	
			else
				if getmap(actor) ~= "tuoji" and getmap(actor) ~= "waigua" then
					msg = msg .. '<Button|x='.. -305 - (xh-1)*65 ..'|y=85.0|nimg=tubiao/'.. tubiao_t2[i][2] ..'1.png|link=@'.. tubiao_t2[i][3] ..'>'
					
					if tubiao_t2[i][1] == "周卡" and getsysint("合区次数") > 0 and getdayint(actor,"周卡红点") == 0 then --红点
						msg = msg .. '<Img|x='.. -265 - (xh-1)*65 ..'|y=85.0|img=zh/100.png|esc=0>'
					end
					
					xh = xh + 1
				end
			end
		end
	else
		msg = msg .. '<Button|x=-220.0|y=40.0|nimg=tubiao/2.png|link=@close_tubiao>'
		local xh = 1
		for i = 1,#tubiao_t1 do		
			if tubiao_t1[i][1] == "微信礼包" or ( getmap(actor) ~= "tuoji" and getmap(actor) ~= "waigua" ) then
				if tubiao_t1[i][1] == "公众号" and ( (getlevel(actor) >= 48 and getint(actor,"公众号隐藏") ~= 0 ) or getint(actor,"公众号隐藏") == 2 ) then
				else
					msg = msg .. '<Button|x='.. -310 - (xh-1)*75 ..'|y=30.0|nimg=tubiao/'.. tubiao_t1[i][2] ..'.png|link=@'.. tubiao_t1[i][3] ..'>'
					if tubiao_t1[i][1] == "首杀" and (dengjihongdian(actor) or getint(actor,"重大奖励红点") == 1 ) then --红点
						msg = msg .. '<Img|x='.. -255 - (xh-1)*75 ..'|y=30.0|img=zh/100.png|esc=0>'
					end
					if tubiao_t1[i][1] == "公众号" and getint(actor,"微信礼包红点") == 0 then --红点
						msg = msg .. '<Img|x='.. -255 - (xh-1)*75 ..'|y=30.0|img=zh/100.png|esc=0>'
					end
					--if tubiao_t1[i][1] == "福利" and touzihongdian(actor) then --红点
					--	msg = msg .. '<Img|x='.. -255 - (xh-1)*75 ..'|y=30.0|img=zh/100.png|esc=0>'
					--end
					if tubiao_t1[i][1] == "微信礼包" and getint(actor,"客服红点显示") == 1 then --红点
						msg = msg .. '<Img|x='.. -255 - (xh-1)*75 ..'|y=30.0|img=zh/100.png|esc=0>'
					end
					xh = xh + 1
				end
				
			end
		end
		xh = 1
		for i = 1,#tubiao_t2 do
			if tubiao_t2[i].bianliang ~= nil and getint(actor,tubiao_t2[i].bianliang) == 1 then
			elseif (tubiao_t2[i][1] == "骰王" and getsysint("合区次数") < 1) or (tubiao_t2[i][1] == "周卡" and getlevel(actor) < 50) then
			elseif (tubiao_t2[i][1] == "骰王" or tubiao_t2[i][1] == "周卡") and getint(actor,"隐藏图标") == 1 then	
			else
				if getmap(actor) ~= "tuoji" and getmap(actor) ~= "waigua" then
					msg = msg .. '<Button|x='.. -310 - (xh-1)*75 ..'|y=105.0|nimg=tubiao/'.. tubiao_t2[i][2] ..'.png|link=@'.. tubiao_t2[i][3] ..'>'
					if tubiao_t2[i][1] == "周卡" and getsysint("合区次数") > 0 and getdayint(actor,"周卡红点") == 0 then --红点
						msg = msg .. '<Img|x='.. -255 - (xh-1)*75 ..'|y=105.0|img=zh/100.png|esc=0>'
					end
					xh = xh + 1
				end
			end
		end
	end
	--delbutton(actor,102,1)
	addbutton(actor,102,1,msg)
	--haoshiend(actor)
end



function close_tubiao(actor)
	local msg = ""
	if getispc(actor) then --电脑端
		msg = msg .. '<Button|a=0|x=-235.0|y=20.0|nimg=tubiao/1.png|link=@tubiaoxianshi>'
	else
		msg = msg .. '<Button|a=0|x=-220.0|y=40.0|nimg=tubiao/1.png|link=@tubiaoxianshi>'
	end
	--delbutton(actor,102,1)
	addbutton(actor,102,1,msg)
end


------------------------------------------------------------
function tubiao_jubaopen(actor)
	fulishow(actor,5)
end


function tubiao_gonglue(actor)
	gonglue_show(actor)
end

function tubiao_shouchong(actor)
	shouchong_show(actor)
end

function tubiao_sjbs(actor)
	shijieboss_show(actor)
end

function tubiao_ttsq(actor)
	openhyperlink(actor,111,0)
end

function tubiao_pmh(actor)
	openhyperlink(actor,27,0)
end

function tubiao_fuli(actor)
	fulishow(actor)
	setint(actor,"投资红点",1)
	tubiaoxianshi(actor)
end

function tubiao_baobao(actor)
	baobaoshow(actor)
end

function tubiao_bscs(actor)
	--haoshistart(actor)
	bosschaxunshow(actor)
	--haoshiend(actor)
end

function tubiao_zbtj(actor)
	zhuangbeitujian_show(actor)
end

function tubiao_zhouka(actor)
	zhouka_show(actor)
	setdayint(actor,"周卡红点",1)
	tubiaoxianshi(actor)
end

function tubiao_touwang(actor)
	callscriptex(actor, "CallLua", "touwang", "@show") --骰王界面
end

function tubiao_shousha(actor)
	callscriptex(actor, "CallLua", "shousha", "@show") --首杀界面
end

function tubiao_shiwuduihuan(actor)
	callscriptex(actor, "CallLua", "shiwuduihuan", "@show") --实物兑换界面
end

function tubiao_gonglue(actor)
	callscriptex(actor, "CallLua", "gonglue", "@show") --首杀界面
end

function tubiao_libao(actor)
	callscriptex(actor, "CallLua", "libao", "@show") --礼包界面
	setint(actor,"客服红点显示",0)
	tubiaoxianshi(actor)
end

function tubiao_gongzonghao(actor)
	callscriptex(actor, "CallLua", "libao", "@show1") --公众号界面
	setint(actor,"微信礼包红点",1)
	tubiaoxianshi(actor)
end

function tubiao_huodong(actor)
	callscriptex(actor, "CallLua", "huodong", "@show") --活动界面
end

function tubiao_chongzhi(actor)
	openhyperlink(actor,26,0)
end

---------右上图标显示段结束