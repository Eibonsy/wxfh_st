include("Market_Def/zh.lua") --个人封装函数

function show(actor)
	local hour = tonumber(os.date("%H",os.time()))
	if hour < 21 or hour > 22 then
		sendmsg9(actor,"21点到23点才能查看")
		return
	end
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=攻城奖励>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		
		<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
		<Text|ay=0.5|x=209.0|y=214.5|color=250|size=18|text=领取攻城奖励|link=@lingjiang>
		<RText|x=30.0|y=140.0|color=254|size=18|text=行会掌门额外奖励10000点赏金值以及对15万血以上的boss>
<RText|x=31.0|y=165.0|color=254|size=18|text=爆率加成>

	]]
	local hanghui = "无"
	if castleinfo(2) ~= "" then
		hanghui = castleinfo(2)
	end
	msg =msg.."<RText|ax=0|ay=0.5|x=28.0|y=70.5|color=255|size=18|text=沙城归属行会：".. hanghui ..">"
	local name = "无"
	if castleinfo(3) ~= "管理员" then
		name = castleinfo(3)
	end
	msg =msg.."<RText|ay=0.5|x=28.0|y=95.5|color=255|size=18|text=行会掌门人：".. name ..">"
	local jiangligold = 50000000

	msg =msg.."<RText|ay=0.5|x=28.0|y=120.5|color=255|size=18|text=当前沙城奖励：".. jiangligold ..">"
	if getsysint("沙城奖励元宝") > 0 then
		msg =msg.."<RText|ay=0.5|x=278.0|y=120.5|color=254|size=18|text=额外元宝奖励：".. getsysint("沙城奖励元宝") ..">"
	end
	say(actor,msg)
end

function lingjiang(actor)
	if castleinfo(5) then
		sendmsg9(actor,"当前正在攻城中")
		return
	end
	if getname(actor) ~= castleinfo(3) then
		sendmsg9(actor,"你不是沙巴克行会掌门无法领取奖励")
		return
	end
	
	local hour = tonumber(os.date("%H",os.time()))
	local fen = tonumber(os.date("%M",os.time()))
	if hour == 22 and fen >= 1 and fen <= 30 then
	else
		sendmsg9(actor,"22:01 - 22:30才能领取奖励")
		return
	end
	if getsysint("可领沙奖") == 0 then
		sendmsg9(actor,"当前无可领取的沙城奖励或沙城奖励已发放完毕")
		return
	end
	setsysint("可领沙奖",0)
	local jiangligold = 50000000
	local jiangliyuanbao = getsysint("沙城奖励元宝")
	
	local t = {}
	local str = getsysstr("攻城奖励名单") --攻城可奖励的名单
	if str ~= "" then
		t = json2tbl(str)
	end
	
	local shachenghanghui = castleinfo(2) --沙巴克行会
	if shachenghanghui == "" then
		sendmsg9(actor,"当前暂无沙巴克行会")
		return
	end
	local jiangli_t ={}
	for i = 1,#t do
		if t[i][2] == shachenghanghui then
			table.insert(jiangli_t,t[i])
		end
	end 
	
	addshangjinzhi(actor,10000)
	local laodajiangligold = math.floor(jiangligold * 0.2) --老大获得的金币
	local laodajiangliyuanbao = math.floor(jiangliyuanbao * 0.2) --老大获得的元宝
	local pingfengold = jiangligold - laodajiangligold --平分的金币
	local pingfenyuanbao = jiangliyuanbao - laodajiangliyuanbao --平分的元宝
	local meirengold = math.floor(pingfengold/#jiangli_t) --每人奖励金币
	local meirenyuanbao = math.floor(pingfenyuanbao/#jiangli_t) --每人奖励元宝
	sendmail("#"..getname(actor),1,"沙城奖励","沙巴克老大奖励","金币#".. laodajiangligold .."#0&元宝#".. laodajiangliyuanbao .."#0")
	for i = 1,#jiangli_t do
		sendmail("#"..jiangli_t[i][1],2,"沙城奖励","沙巴克奖励","金币#".. meirengold .."#0&元宝#".. meirenyuanbao .."#0")
	end
end

