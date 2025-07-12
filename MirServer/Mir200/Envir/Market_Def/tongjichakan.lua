include("Market_Def/zh.lua") --个人封装函数

local tongjibiaoti = {
	"开狂暴消耗的元宝","骰王消耗的元宝","买药消耗的元宝","买绳子消耗的元宝","买锤子消耗的元宝","砸蛋的次数","洗武穆遗书消耗的元宝","洗武穆遗书的次数","幸运项链消耗的元宝",
	"购买锄头消耗的元宝","购买武穆遗书的个数","购买金矿花费的元宝","购买紫水晶矿花费的元宝","须弥禅师消耗的元宝","免费福利金币兑换的元宝",
	"购买投资新秀的个数","购买投资大使的个数","购买投资达人的个数","购买投资专家的个数","领取首冲的个数","融合的次数",
	"砸蛋半兽统领","砸蛋祖玛教主","砸蛋虹魔教主","砸蛋牛魔王","砸蛋赤月恶魔","砸蛋魔龙教主","赏金猎人抽取的次数",
	"抽取震天箭","抽取日照香炉","抽取闪电五连鞭","抽取东皇钟","抽取昆仑镜","抽取玄武盾","抽取番天印","抽取玉净瓶",
	"抽取镇魂钟","抽取妖魄之瞳","抽取炼妖壶","抽取混元凤凰珠","抽取雷公锤","抽取琉璃佩","抽取崆峒印","抽取断玉钩",
	"购买泉水的元宝","真实充值元宝","后台充值元宝","购买周卡消耗元宝","客服部门","材料部门","场控部门","气氛部门","项目部门"
	}
	

function show(actor)
	local msg = [[
		<Img|x=0|width=700|height=527|esc=1|loadDelay=1|bg=1|img=zhangheng/1.png|move=1|reset=1|show=4>
		<Button|x=696|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Text|x=524.0|y=466.5|color=255|size=18|text=清理数据|link=@qingli>

	]]
	
	for i = 1,#tongjibiaoti do
		msg = msg ..'<Text|x='.. 30 + (i-1)%3*230 ..'|y='.. 48+math.floor((i-1)/3) * 25 ..'|size=14|color=255|text='.. tongjibiaoti[i] ..'：'.. getsysint(tongjibiaoti[i]) ..'>'
	end
	
	say(actor,msg)
end

function qingli(actor)
	for i = 1,#tongjibiaoti do
		setsysint(tongjibiaoti[i],0)
	end
	return show(actor)
end

function show1(actor) --每日掉落查看
	local msg = [[
		<Img|x=0|width=700|height=527|esc=1|loadDelay=1|bg=1|img=zhangheng/1.png|move=1|reset=1|show=4>
		<Button|x=696|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		
	]]
	
	for i = 1,#tongjibiaoti do
		msg = msg ..'<Text|x='.. 30 + (i-1)%3*230 ..'|y='.. 48+math.floor((i-1)/3) * 25 ..'|size=14|color=255|text='.. tongjibiaoti[i] ..'：'.. getsysint("每日"..tongjibiaoti[i]) ..'>'
	end
	
	say(actor,msg)
	
	say(actor,msg)
end

