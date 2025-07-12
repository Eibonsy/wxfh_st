include("Market_Def/zh.lua") --个人封装函数
local dalei_t = {"斗笠打造","勋章打造","金针锻造"}
local data = {
	{
		[1]={
				xilie="祖玛系列",
				{xiaohao={jinbi=50000,item={{"43号斗笠",2}}},givename="黑铁斗笠",},
				{xiaohao={jinbi=50000,item={{"44号斗笠",2}}},givename="恶魔斗笠",},
				{xiaohao={jinbi=50000,item={{"45号斗笠",2}}},givename="泰坦斗笠",},
			},
		[2]={
				xilie="赤月系列",
				{xiaohao={jinbi=100000,item={{"黑铁斗笠",2}}},givename="圣战斗笠",},
				{xiaohao={jinbi=100000,item={{"恶魔斗笠",2}}},givename="法神斗笠",},
				{xiaohao={jinbi=100000,item={{"泰坦斗笠",2}}},givename="天尊斗笠",},
			},
		[3]={
				xilie="雷霆系列",
				{xiaohao={jinbi=200000,item={{"圣战斗笠",2}}},givename="雷霆斗笠",},
				{xiaohao={jinbi=200000,item={{"法神斗笠",2}}},givename="烈焰斗笠",},
				{xiaohao={jinbi=200000,item={{"天尊斗笠",2}}},givename="光芒斗笠",},
			},
		[4]={
				xilie="天之系列",
				{xiaohao={jinbi=500000,shengwang=300,item={{"雷霆斗笠",2}}},givename="天之雷霆斗笠",},
				{xiaohao={jinbi=500000,shengwang=300,item={{"烈焰斗笠",2}}},givename="天之烈焰斗笠",},
				{xiaohao={jinbi=500000,shengwang=300,item={{"光芒斗笠",2}}},givename="天之光芒斗笠",},
			},
		[5]={
				xilie="战神系列",
				{xiaohao={shengwang=400,item={{"天之雷霆斗笠",2},{"金条",1}}},givename="战神斗笠",},
				{xiaohao={shengwang=400,item={{"天之烈焰斗笠",2},{"金条",1}}},givename="圣魔斗笠",},
				{xiaohao={shengwang=400,item={{"天之光芒斗笠",2},{"金条",1}}},givename="真魂斗笠",},
			},
		[6]={
				xilie="狂战系列",
				{xiaohao={shengwang=500,item={{"战神斗笠",2},{"金条",2}}},givename="狂战斗笠",},
				{xiaohao={shengwang=500,item={{"圣魔斗笠",2},{"金条",2}}},givename="混世斗笠",},
				{xiaohao={shengwang=500,item={{"真魂斗笠",2},{"金条",2}}},givename="太极斗笠",},
			},
		[7]={
				xilie="玄铁系列",dengji=55,
				{xiaohao={shengwang=600,item={{"狂战斗笠",2},{"紫水晶矿",1500}}},givename="玄铁斗笠",},
				{xiaohao={shengwang=600,item={{"混世斗笠",2},{"紫水晶矿",1500}}},givename="风雷斗笠",},
				{xiaohao={shengwang=600,item={{"太极斗笠",2},{"紫水晶矿",1500}}},givename="蓝灵斗笠",},
			},
		[8]={
				xilie="傲天系列",dengji=60,
				{xiaohao={shengwang=800,item={{"玄铁斗笠",2},{"紫水晶矿",3000}}},givename="傲天々斗笠",},
				{xiaohao={shengwang=800,item={{"风雷斗笠",2},{"紫水晶矿",3000}}},givename="幻天々斗笠",},
				{xiaohao={shengwang=800,item={{"蓝灵斗笠",2},{"紫水晶矿",3000}}},givename="玄天々斗笠",},
			},

	},
	{
			[1]={
					xilie="祖玛系列",
					{xiaohao={jinbi=50000,item={{"43号勋章",2}}},givename="黑铁勋章",},
					{xiaohao={jinbi=50000,item={{"44号勋章",2}}},givename="恶魔勋章",},
					{xiaohao={jinbi=50000,item={{"45号勋章",2}}},givename="泰坦勋章",},
				},
			[2]={
					xilie="赤月系列",
					{xiaohao={jinbi=100000,item={{"黑铁勋章",2}}},givename="圣战勋章",},
					{xiaohao={jinbi=100000,item={{"恶魔勋章",2}}},givename="法神勋章",},
					{xiaohao={jinbi=100000,item={{"泰坦勋章",2}}},givename="天尊勋章",},
				},
			[3]={
					xilie="雷霆系列",
					{xiaohao={jinbi=200000,item={{"圣战勋章",2}}},givename="雷霆勋章",},
					{xiaohao={jinbi=200000,item={{"法神勋章",2}}},givename="烈焰勋章",},
					{xiaohao={jinbi=200000,item={{"天尊勋章",2}}},givename="光芒勋章",},
				},
			[4]={
					xilie="天之系列",
					{xiaohao={jinbi=500000,shengwang=300,item={{"雷霆勋章",2}}},givename="天之雷霆勋章",},
					{xiaohao={jinbi=500000,shengwang=300,item={{"烈焰勋章",2}}},givename="天之烈焰勋章",},
					{xiaohao={jinbi=500000,shengwang=300,item={{"光芒勋章",2}}},givename="天之光芒勋章",},
				},
			[5]={
					xilie="战神系列",
					{xiaohao={shengwang=400,item={{"天之雷霆勋章",2},{"金条",1}}},givename="战神勋章",},
					{xiaohao={shengwang=400,item={{"天之烈焰勋章",2},{"金条",1}}},givename="圣魔勋章",},
					{xiaohao={shengwang=400,item={{"天之光芒勋章",2},{"金条",1}}},givename="真魂勋章",},
				},
			[6]={
					xilie="狂战系列",
					{xiaohao={shengwang=500,item={{"战神勋章",2},{"金条",2}}},givename="狂战勋章",},
					{xiaohao={shengwang=500,item={{"圣魔勋章",2},{"金条",2}}},givename="混世勋章",},
					{xiaohao={shengwang=500,item={{"真魂勋章",2},{"金条",2}}},givename="太极勋章",},
				},
			[7]={
					xilie="玄铁系列",dengji=55,
					{xiaohao={shengwang=600,item={{"狂战勋章",2},{"紫水晶矿",1500}}},givename="玄铁勋章",},
					{xiaohao={shengwang=600,item={{"混世勋章",2},{"紫水晶矿",1500}}},givename="风雷勋章",},
					{xiaohao={shengwang=600,item={{"太极勋章",2},{"紫水晶矿",1500}}},givename="蓝灵勋章",},
				},
			[8]={
					xilie="傲天系列",dengji=60,
					{xiaohao={shengwang=800,item={{"玄铁勋章",2},{"紫水晶矿",3000}}},givename="傲天々勋章",},
					{xiaohao={shengwang=800,item={{"风雷勋章",2},{"紫水晶矿",3000}}},givename="幻天々勋章",},
					{xiaohao={shengwang=800,item={{"蓝灵勋章",2},{"紫水晶矿",3000}}},givename="玄天々勋章",},
				},

	},
	{
			[1]={
					xilie="金针锻造",
					{xiaohao={jinbi=5000,item={{"一级金针",2}}},givename="二级金针",},
					{xiaohao={jinbi=10000,item={{"二级金针",2}}},givename="三级金针",},
					{xiaohao={jinbi=15000,item={{"三级金针",2}}},givename="四级金针",},
					{xiaohao={jinbi=20000,item={{"四级金针",2}}},givename="五级金针",},
					{xiaohao={jinbi=25000,item={{"五级金针",2}}},givename="六级金针",},
					{xiaohao={jinbi=30000,item={{"六级金针",2}}},givename="七级金针",},
					{xiaohao={jinbi=40000,item={{"七级金针",2}}},givename="八级金针",},
					{xiaohao={jinbi=50000,item={{"八级金针",2}}},givename="九级金针",},
					{xiaohao={jinbi=60000,item={{"九级金针",2}}},givename="十级金针",},
				},
	},
}

function show(actor,daleiid,xiaoleiid,hechengid,yijianduanzao)
	yijianduanzao = tonumber(yijianduanzao) or 0
	daleiid = tonumber(daleiid) or 1
	xiaoleiid = tonumber(xiaoleiid) or 1
	hechengid = tonumber(hechengid) or 1
	local msg = [[
		<Img|x=0|width=673|height=497|bg=1|scale9l=50|scale9t=50|scale9r=50|scale9b=50|esc=1|move=1|img=zhangheng/1.png|reset=0|show=4>
		<Button|x=669.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=16.5|y=40.5|width=636|height=432|esc=0|img=zhangheng/80.png>
		<Img|x=139.5|y=39.5|height=432|img=zhangheng/81.png|esc=0>
		<Img|x=265.5|y=39.5|height=432|img=zhangheng/81.png|esc=0>
		<Img|x=321.5|y=66.5|img=zhangheng/74.png|esc=0>
		<Img|x=316.5|y=199.5|img=zhangheng/75.png|esc=0>
	]]
	
	for i = 1,#dalei_t do
		if daleiid == i then --大类按钮
			msg=msg.."<Button|x=21.0|y=".. 45.5 + (i-1)*40 .."|size=18|color=150|nimg=zh/64.png|text="..dalei_t[i]..">"
		else
			msg=msg.."<Button|id="..i.."|x=21.0|y=".. 45.5 + (i-1)*40 .."|size=18|color=7|nimg=zh/65.png|pimg=zh/65.png|text="..dalei_t[i].."|link=@show,"..i..">"
		end
	end
	local pyy = 0
	for i = 1,#data[daleiid] do
		if data[daleiid][i].dengji and getlevel(actor) < data[daleiid][i].dengji then
			break
		end
		if xiaoleiid == i then --小类按钮
			msg=msg.."<Button|x=146.0|y=".. 45.5 + pyy .."|size=18|color=150|nimg=zh/64.png|text="..data[daleiid][i].xilie..">"
			pyy = pyy + 40
			for j = 1,#data[daleiid][xiaoleiid] do
				if hechengid == j then --选中的合成物品id
					msg=msg.."<Button|x=146.0|y=".. 45.5 + pyy .."|width=116|size=18|color=150|nimg=zh/21.png|text="..data[daleiid][xiaoleiid][j].givename..">"
					msg=msg.."<Img|x=146.0|y=".. 45.5 + pyy .."|width=116|height=31|img=zh/25.png|esc=0>"
					pyy = pyy + 34
					local t = data[daleiid][xiaoleiid][hechengid].xiaohao
					if #t.item == 2 then --2个消耗物品界面
						msg=msg.."<Img|x=374.5|y=149.5|img=zhangheng/77.png|esc=0>"
						msg=msg.."<Img|x=349.5|y=111.5|img=zhangheng/73.png|esc=0>"
						msg=msg.."<ItemShow|x=348.5|y=108.5|itemid=".. getidbyname(t.item[1][1]) .."|itemcount=1|showtips=1|bgtype=0>"
						msg=msg..'<RText|ax=0.5|x=382.0|y=148.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,t.item[1][1]) ..'/FCOLOR=249>/<'..t.item[1][2]..'/FCOLOR=250>>'
						msg=msg.."<Img|x=513.5|y=111.5|img=zhangheng/73.png|esc=0>"
						msg=msg.."<ItemShow|x=512.5|y=108.5|itemid=".. getidbyname(t.item[2][1]) .."|itemcount=1|showtips=1|bgtype=0>"
						msg=msg..'<RText|ax=0.5|x=546.0|y=148.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,t.item[2][1]) ..'/FCOLOR=249>/<'..t.item[2][2]..'/FCOLOR=250>>'
					elseif #t.item == 1 then --一个物品界面
						msg=msg.."<Img|x=456.0|y=149.5|img=zhangheng/76.png|esc=0>"
						msg=msg.."<Img|x=431.5|y=111.5|img=zhangheng/73.png|esc=0>"
						msg=msg.."<ItemShow|x=430.5|y=108.5|itemid=".. getidbyname(t.item[1][1]) .."|itemcount=1|showtips=1|bgtype=0>"
						msg=msg..'<RText|ax=0.5|x=464.0|y=148.0|size=16|color=255|outline=1|text=<'.. itemcount(actor,t.item[1][1]) ..'/FCOLOR=249>/<'..t.item[1][2]..'/FCOLOR=250>>'
					end
					msg=msg.."<Img|x=431.5|y=234.5|img=zhangheng/73.png|esc=0>"
					msg=msg.."<ItemShow|x=430.5|y=231.5|itemid=".. getidbyname(data[daleiid][xiaoleiid][hechengid].givename) .."|itemcount=1|showtips=1|bgtype=0>"
					local str = ""
					local str1= ""
					if t.jinbi then
						str = "<金币：/FCOLOR=251><".. jianhuanum(getbindgold(actor)) .."/FCOLOR=249>/<".. jianhuanum(t.jinbi) .."/FCOLOR=250>" 
					end
					if t.shengwang then
						str1 = "<声望：/FCOLOR=251><".. getshengwang(actor) .."/FCOLOR=249>/<".. t.shengwang .."/FCOLOR=250>" 
					end
					
					if str ~= "" then
						if str1 ~= "" then
							str = str .."　　"..str1
						end
					else
						str = str1
					end
					msg=msg.."<RText|ax=0.5|x=457.5|y=368.5|color=255|size=18|text="..str..">"
					if daleiid ~= 3 then
						msg=msg.."<Button|x=417.5|y=408.5|nimg=zhangheng/13.png|color=10051|size=18|text=确定锻造|link=@hecheng,"..daleiid..","..xiaoleiid..","..hechengid..">"
					else
						if yijianduanzao == 1 then
							msg=msg.."<Button|x=317.5|y=408.5|nimg=zhangheng/13.png|color=10051|size=18|text=停止锻造|link=@hecheng,"..daleiid..","..xiaoleiid..","..hechengid..",1,1>"
						else
							msg=msg.."<Button|x=317.5|y=408.5|nimg=zhangheng/13.png|color=10051|size=18|text=一键锻造|link=@hecheng,"..daleiid..","..xiaoleiid..","..hechengid..",1>"
						end
						msg=msg.."<Button|x=517.5|y=408.5|nimg=zhangheng/13.png|color=10051|size=18|text=确定锻造|link=@hecheng,"..daleiid..","..xiaoleiid..","..hechengid..">"
					end
				else
					msg=msg.."<Button|x=146.0|y=".. 45.5 + pyy .."|width=116|size=18|color=7|nimg=zh/21.png|pimg=zh/21.png|text="..data[daleiid][xiaoleiid][j].givename.."|link=@show,"..daleiid..","..xiaoleiid..","..j..">"
					pyy = pyy + 34
				end
			end
		else
			msg=msg.."<Button|x=146.0|y=".. 45.5 + pyy .."|size=18|color=7|nimg=zh/65.png|pimg=zh/65.png|text="..data[daleiid][i].xilie.."|link=@show,"..daleiid..","..i..">"
			pyy = pyy + 40
		end
	end
	
	say(actor,msg)
	
	if getint(actor,"完成任务id") == 8 then
		navigation(actor,0,3,"金针锻造")
	end
	if daleiid == 3 and getint(actor,"完成任务id") == 8 then
		newdeletetask(actor,9) --删除任务2
		setint(actor,"完成任务id",9)
		changeexp(actor,"+",20000,false)
		callscriptex(actor, "CallLua", "QFunction-0", "@getexp,20000") --经验触发
		sendmsg9(actor,"了解奇经八脉完成，获得经验20000")
		callscriptex(actor, "CallLua", "QFunction-0", "@renwupanduan") --任务系统
	end
end

function hecheng(actor,id1,id2,id3,yijian,tingzhi)
	if getbagblank(actor) < 2 then
		sendmsg9(actor,"背包空格不足")
		return
	end
	
	
	tingzhi = tonumber(tingzhi) or 0
	yijian = tonumber(yijian) or 0 --是否是一键锻造
	id1=tonumber(id1)
	id2=tonumber(id2)
	id3=tonumber(id3)
	
	if tingzhi == 1 then
		cleardelaygoto(actor,"hecheng")
		return show(actor,id1,id2,id3)
	end
	
	local shuju = data[id1][id2][id3].xiaohao
	local givename = data[id1][id2][id3].givename
	if shuju.jinbi then
		if data[id1][id2].xilie == "天之系列" then
			if getgold(actor) < shuju.jinbi then
				sendmsg9(actor,"非绑定金币不足","#00FF00")
				return
			end
		else
			if getbindgold(actor) < shuju.jinbi then
				sendmsg9(actor,"金币不足")
				return
			end
		end
	end
	if shuju.shengwang then
		if getshengwang(actor) < shuju.shengwang then
			sendmsg9(actor,"声望不足")
			return
		end
	end
	
	for i = 1,#shuju.item do
		if itemcount(actor,shuju.item[i][1],2) < shuju.item[i][2] then
			sendmsg9(actor,"条件不足")
			return
		end
	end
	for i = 1,#shuju.item do
		takeitem(actor, shuju.item[i][1], shuju.item[i][2],0)
	end
	
	if shuju.jinbi then
		if data[id1][id2].xilie == "天之系列" then
			subgold(actor,shuju.jinbi)
		else
			subbindgold(actor,shuju.jinbi)
		end
	end
	if shuju.shengwang then
		subshengwang(actor,shuju.shengwang)
	end
	if data[id1][id2].xilie == "金针锻造" then
		giveitem(actor,givename, 1,370)
	else
		giveitem(actor,givename, 1,0)
	end
	
	
	sendmsg9(actor,"打造成功")
	show(actor,id1,id2,id3,yijian)
	if yijian == 1 then
		delaygoto(actor,100,"hecheng,"..id1..","..id2..","..id3..","..yijian)
	end
end

