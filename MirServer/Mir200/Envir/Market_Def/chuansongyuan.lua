include("Market_Def/zh.lua") --个人封装函数

local daanniu = {"初级地图","危险地图","高级地图","终极地图","城市传送",}
local xiaoanniu = {
	{"蜈蚣洞穴","沃玛寺庙","石墓猪洞","祖玛之家","封魔殿堂","骨魔洞穴","牛魔大厅","赤月峡谷"},
	{"魔龙血域","BOSS迷宫","沙影之道","桃源之门","玛雅神殿"},
	{"蛮荒遗迹","龙之神域","铁血魔窟","堕落深渊","桃花谷"},
	{"幽冥古墓","熔岩地狱","酆都古域","寂静皇陵"},
	{"盟重省","比奇省","苍月岛","白日门","封魔谷","魔龙城","同心小径"},
}

local map_t = {
["BOSS迷宫"] = {jieshao={"经过无数岁月的洗礼.土城客栈里的林小姐<(291.386)/FCOLOR=250>终于发现了前往BOSS迷宫的入口.纵使你有万千仇敌.也能藏身于此.单人作战首选之地.不用担心被人多欺负而打不到boss.",} },

["盟重省"] = {"3",330,332,jieshao={"玛法大陆最繁华的城市，众多冒险者在此歇脚",} },
["比奇省"] = {"0",336,266,jieshao={"玛法大陆的庙堂所在，比奇皇宫就在这座城市的中心",} },
["苍月岛"] = {"5",141,336,jieshao={"苍月岛已被凶残的上古魔族占领多年，流传着众多传说",} }, 
["白日门"] = {"11",175,324,jieshao={"被白日门叛军占领的城市，隐藏着叛军基地“无间炼狱”",} }, 
["封魔谷"] = {"4",237,200,jieshao={"封魔谷散发着恶魔的气息，流传着三英雄抵御魔族的传奇",} }, 
["魔龙城"] = {"6",122,154,jieshao={"被远古恶魔侵蚀过的城市，听闻可召唤驾驭神龙的统帅",""} },
["同心小径"] = {"m100",jieshao={"漫漫传奇路，悠悠玛法情，带上心爱之人，穿过此地就能，到达婚姻神殿"} },

["蜈蚣洞穴"] = {"d601",205,231,jieshao={"地图的尽头盘踞着魔族首领“暗之触龙神”据说击杀触龙神后即可找到盘踞着暗之触龙神的神秘入口。\\温馨提示：此图小怪爆率不如沃玛寺庙",}, tiaojian="免费"},
["沃玛寺庙"] = {"d022",jieshao={"此地别有洞天，看似前期发育地图，却也能为你带来意外惊喜，运气好照样出终极装备。据说沃玛教主率领的魔族小弟身上携带的沃玛密函可以为你找到盘丝大仙",},tiaojian="免费" ,hequ2="2万金币" },
["石墓猪洞"] = {"d713",jieshao={"石墓七层的钉耙猫王一直守候着被盟重封印的墓地，石墓七层击杀钉耙猫王就可带你穿越时空，为你找到镜像魔王和镜像之主的踪迹，听说有人在他们身上寻到了终极装备？",},tiaojian="免费" ,hequ2="2万金币" },
["祖玛之家"] = {"d505",jieshao={"说起祖玛祭坛，你可能孤陋寡闻，说起祖玛头像总听说过吧？找到他，找到他，找到他重要的事情说三遍。他会为你打开前往祖玛祭坛的大门",},tiaojian="免费",hequ="2万金币" ,xuqiu={{"金币",0},{"金币",20000},lv=0}},
["封魔殿堂"] = {"d2008",78,77,jieshao={"封魔殿堂被大量魔族霸占，秦始皇可谓苦不堪言，布告天下，谁能替他消灭封魔大殿的魔族，即可面见秦始皇。至于怎么悬赏就看秦始皇的心情了，天下宝物，始皇无所不有。",},tiaojian="1万金币",hequ="3万金币",xuqiu={{"金币",10000},{"金币",30000},lv=0} },

["骨魔洞穴"] = {"d2063",jieshao={"在黄泉教主的不懈努力下.总算为玛法勇士开辟了前往奈何桥的通道.可是这里面的天机只有骨魔洞五层的孟婆才知道",},tiaojian="1.5万金币",hequ="4万金币",xuqiu={{"金币",15000},{"金币",40000},lv=0}  },
["牛魔大厅"] = {"d2073",157,158,jieshao={"常年被牛魔一族所占领的寺庙.想要去潜龙深渊.牛魔七层是必经之路.只能先去牛魔七层找到铁扇公主打探虚实再想想其它办法了，为防止脱机进入此地图需要等级达到45级，<投资专家无等级限制/FCOLOR=253>",},tiaojian="2万金币",hequ="5万金币",xuqiu={{"金币",20000},{"金币",50000},lv=0}},
["赤月峡谷"] = {"d1004",177,126,jieshao={"曾经的曾经.赤月巢穴.赤月祭坛是多少人的向往.打败镇守此地的远古赤月恶魔.他会送你前往烟花神殿的九珠连环炮.释放九珠连环炮就能为你解开烟花宫殿之谜"},tiaojian="2.5万金币",hequ="5万金币",xuqiu={{"金币",25000},{"金币",50000},lv=0}  },

["魔龙血域"] = {"63",174,174,jieshao={"听闻魔龙领的魔龙斜眼可直接通往魔龙殿.隐藏着关于邪恶统帅的传说.魔龙血域的暗之魔龙教主同样也可为你找到一丝丝线索",}, tiaojian="50级 + 15个紫水晶矿",xuqiu={{"紫水晶矿",15},lv=50}},
["沙影之道"] = {"h201",117,190,34,92,jieshao={"进入沙皇宫的秘密通道,听闻影之道尽头埋葬着上古时期的宝藏,攻城期间免费进入",}, tiaojian="52级 + 20个紫水晶矿",xuqiu={{"紫水晶矿",20},lv=52} },
["桃源之门"] = {"h106",100,100,jieshao={"宛如仙境的桃园之门,其背后隐藏着万恶之源的通道, 还需勇士们自行探索",}, tiaojian="54级 + 25个紫水晶矿",xuqiu={{"紫水晶矿",25},lv=54} },
["玛雅神殿"] = {"maya1",79,79,jieshao={"上古时期玛雅人居住之地,跨过独木桥可探索玛雅族的皇宫",}, tiaojian="56级 + 30个紫水晶矿",xuqiu={{"紫水晶矿",30},lv=56} },

["蛮荒遗迹"] = {"mhyj1",267,246,jieshao={"远古蛮荒族遗迹,弥漫着最原始,最野蛮的生存法则,蛮荒各大强者集聚于此",}, tiaojian="60级 + 30个紫水晶矿",xuqiu={{"紫水晶矿",30},lv=60} },
["龙之神域"] = {"lzsy1",238,236,jieshao={"洪荒时期,龙族以通天手段开辟的独立空间,其神域的最深处常常传来龙吟声",}, tiaojian="60级 + 35个紫水晶矿",xuqiu={{"紫水晶矿",35},lv=60} },
["铁血魔窟"] = {"txmk1",166,57,jieshao={"众多魔族叛徒的关押之地,处处弥漫着血腥的味道,时常传来杀戮之声",}, tiaojian="60级 + 40个紫水晶矿",xuqiu={{"紫水晶矿",40},lv=60} },
["堕落深渊"] = {"dlsy1",186,189,jieshao={"堕落者的流窜之地,处处透露着危机它们对冒险者有极大的仇意",}, tiaojian="62级 + 50个紫水晶矿",xuqiu={{"紫水晶矿",50},lv=62} },
["桃花谷"] = {"thg1",42,26,jieshao={"充满生机的一处世外桃园,后被魔族入侵,魔族首领盘踞于桃花谷底",}, tiaojian="64级 + 50个紫水晶矿",xuqiu={{"紫水晶矿",50},lv=64} },

["幽冥古墓"] = {"ymgm1",155,262,jieshao={"危机四伏的地图，埋葬着大量高级跟稀有的道具，请寻宝者务必小心",},tiaojian="65级 + 60个紫水晶矿",xuqiu={{"紫水晶矿",60},lv=65} },
["熔岩地狱"] = {"rydy1",87,240,jieshao={"危机四伏的地图，埋葬着大量高级跟稀有的道具，请寻宝者务必小心",} ,tiaojian="65级 + 60个紫水晶矿",xuqiu={{"紫水晶矿",60},lv=65}},
["酆都古域"] = {"fdgy1",37,150,jieshao={"危机四伏的地图，埋葬着大量高级跟稀有的道具，请寻宝者务必小心",} ,tiaojian="65级 + 100个紫水晶矿",xuqiu={{"紫水晶矿",100},lv=65,zjzt=1}},
["寂静皇陵"] = {"jjhl1",198,273,jieshao={"危机四伏的地图，埋葬着大量高级跟稀有的道具，请寻宝者务必小心",} ,tiaojian="65级 + 100个紫水晶矿",xuqiu={{"紫水晶矿",100},lv=65,zjzt=1}},
}

--1 客服部 2 材料组 3 场控组 4 气氛组 5 项目部
local fangjiahao = {
	["12407275"] = {"hao1","黄峰","客服部门"},["13216418"] = {"hao1","汪荣丽","客服部"},["18936379"] = {"hao1","舒泰","客服部"},
	["30497613"] = {"hao2","汪朗新","材料部门"},
	["19313238"] = {"hao3","魏亚伟","场控部门"},
	["7586169"] = {"hao4","汪成","气氛部门"},
	["25891743"] = {"hao5","张恒","项目部门"}, ["9071622"] = {"hao5","杜鹏","项目部门"}, ["5225660"] = {"hao5","祁玮","项目部门"}, ["10202743"] = {"hao5","李金伦","项目部门"},
}

function show(actor,anniu1,anniu2,xianshi)
	xianshi = tonumber(xianshi) or 0
	anniu1 = tonumber(anniu1) or 1
	anniu2 = tonumber(anniu2)
	if anniu1 == 3 or anniu1 == 4 then
		if not anniu2 then
			anniu2 = 0
		end
	else
		if not anniu2 then
			anniu2 = 1
			if anniu1 == 1 then
				anniu2 = 2
			end
		end
	end
	if getint(actor,"任务打开") == 1 then
		anniu1 = 1
		anniu2 = 2
		navigation(actor,0,221,"沃玛寺庙，高爆地图")
		setint(actor,"任务打开",0)
	end
	
	local msg = [[
		<Img|x=0.0|y=1.0|width=450|height=480|scale9r=10|bg=1|scale9t=10|scale9b=10|move=0|scale9l=10|esc=1|loadDelay=1|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=449.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=140.0|y=11.0|height=460|img=zhangheng/128.png|esc=0>
		<Img|x=142.0|y=275.0|width=298|img=zhangheng/230.png|esc=0>
		<Text|x=166.0|y=248.0|color=149|size=18|outline=1|text=本服所有地图均可爆出顶级装备>
		
	]]
	
	for i = 1,#daanniu do
		if i == anniu1 then
			msg = msg ..'<Button|x=18.0|y='.. 26+(i-1) * 60 ..'|nimg=zh/97.png|pimg=zh/97.png|color=250|size=18|text='.. daanniu[i] ..'>'
		else
			msg = msg ..'<Button|x=18.0|y='.. 26+(i-1) * 60 ..'|nimg=zh/98.png|pimg=zh/98.png|color=7|size=18|text='.. daanniu[i] ..'|link=@show,'..i..'>'
		end
	end
	
	local t = xiaoanniu[anniu1]
	for i = 1,#t do
		if i == anniu2 then
			msg = msg ..'<Button|x='.. 164 + (i-1)%2*140 ..'|y='.. 26+math.floor((i-1)/2) * 58 ..'|nimg=zh/97.png|size=18|color=250|text='..t[i] ..'>'
		else
			msg = msg ..'<Button|x='.. 164 + (i-1)%2*140 ..'|y='.. 26+math.floor((i-1)/2) * 58 ..'|nimg=zh/98.png|size=18|color=7|text='..t[i] ..'|link=@show,'..anniu1..','..i..'>'
		end
	end

	local mapname = xiaoanniu[anniu1][anniu2]
	if mapname then
		local texts = map_t[mapname].jieshao
		for i = 1,#texts do
			msg = msg ..'<RText|x=152.0|y='.. 285+(i-1)*25 ..'|color=103|width=280|size=16|outline=1|text='.. texts[i] ..'>'
		end
		
		if map_t[mapname].tiaojian then
			local str = map_t[mapname].tiaojian
			if getsysint("合区次数") > 0 and map_t[mapname].hequ then
				str = map_t[mapname].hequ
			end
			if getsysint("合区次数") > 1 and map_t[mapname].hequ2 then
				str = map_t[mapname].hequ2
			end
			local zb = 396
			if anniu1 == 2 or anniu1 == 3 or anniu1 == 4 then
				zb = 374
			end
			msg = msg ..'<RText|x=152.0|y='.. zb ..'|color=255|width=280|size=16|outline=1|text=进图条件：<'.. str ..'/FCOLOR=250>>'
		end
	else
		msg = msg ..'<RText|x=152.0|y=303.0|width=280|color=161|size=16|outline=1|text=传说每隔二十分钟.泉眼都会随机出现在以上地图的某一个角落....          >'
	end
	msg = msg ..'<Button|id=221|x=235.0|y=425.0|color=10051|size=18|nimg=zh/97.png|text=进入地图|link=@chuansong,'.. anniu1 ..','.. anniu2 ..'>'
	
	if anniu1 == 1 and anniu2 == 2 then
		if fangjiahao[getconst(actor,"<$USERACCOUNT>")] then
			msg = msg ..'<Text|x=362.0|y=395|color=250|size=16|outline=1|text=免费|link=@jingmfangjian>'
		end
	end
	if getsysint("合区次数") >=2 then
		if getint(actor,"防脱机验证") == 0 then
			msg = msg ..'<Button|x=16.0|y=366.0|width=120|nimg=zh/97.png|color=255|size=16|text=开启防脱机验证|link=@kaiqifangtuoji,'.. anniu1 ..','.. anniu2 ..'>'
		else
			msg = msg ..'<Button|x=16.0|y=366.0|width=120|nimg=zh/97.png|color=249|size=16|text=已开启验证>'
		end
		msg = msg ..'<Button|x=18.0|y=431.0|nimg=zhangheng/8.png|pimg=zhangheng/8.png|link=@show,'.. anniu1 ..','.. anniu2 ..',1>'
	end
	if xianshi == 1 then
		msg=msg..'<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@show,'.. anniu1 ..','.. anniu2 ..'>'
		if getsysint("合区次数") >=6 then
			msg =msg..[[
			<Img|ay=0.5|x=52.0|y=329.0|width=370|height=260|scale9t=10|scale9b=10|img=zh/7.png|scale9r=10|esc=0|scale9l=10>
			<RText|x=64.0|y=208.0|size=16|color=255|text=六次合区开始.为防止脱机玩家严重影响正常玩家>
			<RText|x=64.0|y=230.0|width=344|size=16|color=255|text=体验，进入58级以下地图需要开启防脱机验证，>
			<RText|x=64.0|y=252.0|width=344|size=16|color=255|text=每次开启需要十万非绑定金币.>
			<RText|x=64.0|y=274.0|width=344|size=16|color=255|text=在可随机地图被杀死将损失十万金币.>
			<RText|x=65.0|y=296.0|color=255|size=16|text=杀人者可获得五万金币.其他地图死亡.防脱机验>
			<RText|x=64.0|y=318.0|width=344|color=255|size=16|text=证标识不会消失.也不会损失金币.<杀人不加pk值/FCOLOR=250>>
			<RText|x=64.0|y=340.0|width=344|size=16|color=255|text=未达到二转的玩家使用随机将会延迟3秒.>
			<RText|x=64.0|y=362.0|width=344|color=255|size=16|text=正常玩家开启防脱机验证调好保护挂机使用随机>
			<RText|x=64.0|y=384.0|width=344|color=255|size=16|text=无延迟.无需担心死亡损失金币问题>
			<RText|x=64.0|y=406.0|width=344|color=255|size=16|text=此目的是将游戏空间留给需要的正常玩家.开启了>
			<RText|x=64.0|y=428.0|width=344|color=255|size=16|text=龙的传人无需开启防脱机验证>

			]]
		elseif getsysint("合区次数") >=5 then
			msg =msg..[[
			<Img|ay=0.5|x=52.0|y=329.0|width=370|height=260|scale9t=10|scale9b=10|img=zh/7.png|scale9r=10|esc=0|scale9l=10>
			<RText|x=64.0|y=208.0|size=16|color=255|text=五次合区开始.为防止脱机玩家严重影响正常玩家>
			<RText|x=64.0|y=230.0|width=344|size=16|color=255|text=体验，进入58级以下地图需要开启防脱机验证，>
			<RText|x=64.0|y=252.0|width=344|size=16|color=255|text=每次开启需要十万非绑定金币.>
			<RText|x=64.0|y=274.0|width=344|size=16|color=255|text=在可随机地图被杀死将损失十万金币.>
			<RText|x=65.0|y=296.0|color=255|size=16|text=杀人者可获得五万金币.其他地图死亡.防脱机验>
			<RText|x=64.0|y=318.0|width=344|color=255|size=16|text=证标识不会消失.也不会损失金币.<杀人不加pk值/FCOLOR=250>>
			<RText|x=64.0|y=340.0|width=344|size=16|color=255|text=未达到一转的玩家使用随机将会延迟3秒.>
			<RText|x=64.0|y=362.0|width=344|color=255|size=16|text=正常玩家开启防脱机验证调好保护挂机使用随机>
			<RText|x=64.0|y=384.0|width=344|color=255|size=16|text=无延迟.无需担心死亡损失金币问题>
			<RText|x=64.0|y=406.0|width=344|color=255|size=16|text=此目的是将游戏空间留给需要的正常玩家.开启了>
			<RText|x=64.0|y=428.0|width=344|color=255|size=16|text=龙的传人无需开启防脱机验证>

			]]
		else
			msg =msg..[[
			<Img|ay=0.5|x=52.0|y=329.0|width=370|height=260|scale9t=10|scale9b=10|img=zh/7.png|scale9r=10|esc=0|scale9l=10>
			<RText|x=64.0|y=208.0|color=255|size=16|text=二次合区开始.为防止脱机玩家严重影响正常玩家>
			<RText|x=64.0|y=230.0|width=344|size=16|color=255|text=体验，进入初级的八张地图和魔龙血域需要开启>
			<RText|x=64.0|y=252.0|width=344|size=16|color=255|text=防脱机验证，每次开启需要十万非绑定金币.>
			<RText|x=64.0|y=274.0|width=344|color=255|size=16|text=在初级可随机地图被杀死将损失十万金币.>
			<RText|x=65.0|y=296.0|color=255|size=16|text=杀人者可获得五万金币.其他地图死亡.防脱机验>
			<RText|x=64.0|y=318.0|width=344|color=255|size=16|text=证标识不会消失.也不会损失金币.<杀人不加pk值/FCOLOR=250>>
			<RText|x=64.0|y=340.0|width=344|color=255|size=16|text=被系统判定为脱机的玩家使用随机将会延迟3秒.>
			<RText|x=64.0|y=362.0|width=344|color=255|size=16|text=正常玩家开启防脱机验证调好保护挂机使用随机>
			<RText|x=64.0|y=384.0|width=344|color=255|size=16|text=无延迟.无需担心死亡损失金币问题>
			<RText|x=64.0|y=406.0|width=344|color=255|size=16|text=此目的是将游戏空间留给需要的正常玩家.开启了>
			<RText|x=64.0|y=428.0|width=344|color=255|size=16|text=龙的传人无需开启防脱机验证>
			]]
		end
	end
	
	say(actor,msg)
end
function kaiqifangtuoji(actor,anniu1,anniu2)
	messagebox(actor,"\n开启防脱机验证需要花费 十万非绑定金币\n\n是否确定开启？","@kaiqifangtuoji1,".. anniu1 ..",".. anniu2,"@kong")
end
function kaiqifangtuoji1(actor,anniu1,anniu2)
	if hasbuff(actor,10001) or hasbuff(actor,20083) then
		sendmsg9(actor,"您已经开启了龙的传人，无需开启防脱机验证","#00ff00")
		return
	end
	if getint(actor,"防脱机验证") == 1 then
		sendmsg9(actor,"您已经开启了防脱机验证","#00ff00")
		return
	end
	if getgold(actor) < 100000 then
		sendmsg9(actor,"非绑定金币不足，无法开启","#00ff00")
		return
	end
	subgold(actor,100000)
	setint(actor,"防脱机验证",1)
	confertitle(actor,"防脱机验证")
	sendmsg9(actor,"成功开启防脱机验证","#00ff00")
	return show(actor,anniu1,anniu2)
end

function jingmfangjian(actor)
	if fangjiahao[getconst(actor,"<$USERACCOUNT>")] then
		local t = fangjiahao[getconst(actor,"<$USERACCOUNT>")]
		map(actor,t[1])
	end
end

function chuansong(actor,anniu1,anniu2)
	anniu1 = tonumber(anniu1)
	anniu2 = tonumber(anniu2)
	if anniu2 == 0 then
		sendmsg9(actor,"请选择要进入的地图")
		return
	end
	local mapname = xiaoanniu[anniu1][anniu2]
	if mapname == "BOSS迷宫" then
		sendmsg9(actor,"请到土城客栈内林小姐处打探详情","#00FFFF")
		return
	end
	if getsysint("合区次数") >=5 then
		if anniu1 == 1 or anniu1==2 then
			if not hasbuff(actor,10001) and not hasbuff(actor,20083) and getint(actor,"防脱机验证") == 0 then
				sendmsg9(actor,"请先开启防脱机验证才可进入58级以下地图","#00ff00")
				return
			end
		end
	elseif getsysint("合区次数") >=2 then
		if anniu1 == 1 or mapname=="魔龙血域" then
			if not hasbuff(actor,10001) and not hasbuff(actor,20083) and getint(actor,"防脱机验证") == 0 then
				sendmsg9(actor,"请先开启防脱机验证才可进入初级地图或魔龙血域","#00ff00")
				return
			end
		end
	end
	
	if mapname == "牛魔大厅" then
		if getint(actor,"会员等级") < 4 and getlevel(actor) < 45 then
			messagebox(actor,"　\n为防止群控脱机号对正常玩家的游戏体验\n　\n进入此地图非投资专家的玩家需等级达到45级")
			return
		end
	end
	
	local xuqiu_t = map_t[mapname].xuqiu
	if xuqiu_t then
		if getlevel(actor) < xuqiu_t.lv and getbaseinfo(actor,39) == 0 then
			sendmsg9(actor,"等级不足")
			return
		end
		
		if xuqiu_t.zjzt then
			if not hasbuff(actor,10055) then
				sendmsg9(actor,"需达到醉酒状态才能进入")
				return
			end
		end
		
		if mapname == "沙影之道" and castleinfo(5) then
		
		else
			local items = xuqiu_t[1]
			if getsysint("合区次数") > 0 and xuqiu_t[2] then
				items = xuqiu_t[2]
			end
			if items[1] == "金币" then
				if getbindgold(actor) < items[2] then
					sendmsg9(actor,"金币不足")
					return
				end
				if items[2] > 0 then
					subbindgold(actor,items[2])
				end
			else
				if itemcount(actor,items[1]) < items[2] then
					sendmsg9(actor,items[1].."不足")
					return
				end
				takeitem(actor,items[1],items[2])
			end
		end
	end
	
	if getsysint("合区次数") > 1 and map_t[mapname].hequ2 then
		if getbindgold(actor) < 20000 then
			sendmsg9(actor,"金币不足")
			return
		end
		subbindgold(actor,20000)
	end
	
	local t = map_t[mapname]
	local mapid = t[1]
	if mapid == "d022" and os.time() - getsysint("开区时间") < 3600*6 then
		local t=getplayerlst()
		local sl = 0
		for k, v in ipairs(t) do
			if v and isnotnull(v) and not getbaseinfo(v,61) then
				sl = sl + 1
			end
		end
		if sl > 200 and math.random(1,100) < 50 then
			mapid = "womajingxiang"
		end
	end
	
	if mapid == "d2073" and os.time() - getsysint("开区时间") < 3600*4 then
		local t=getplayerlst()
		local sl = 0
		for k, v in ipairs(t) do
			if v and isnotnull(v) and not getbaseinfo(v,61) then
				sl = sl + 1
			end
		end
		if sl >= 400 then
			setsysint("开启牛魔镜像",1)
		end
		if getsysint("开启牛魔镜像") == 1 and math.random(1,100) < 50 then
			mapid = "niumojingxiang"
		end
	end
	


	if t[2] then
		--[[if t[4] then
			if math.random(1,100) < 50 then
				mapmove(actor,mapid,t[4],t[5],0)
				return
			end
		end--]]
		if mapname == "沙影之道" and castleinfo(5) then
			mapmove(actor,mapid,t[4],t[5],0)
		else
			mapmove(actor,mapid,t[2],t[3],0)
		end
	else
		map(actor,mapid)
	end
	if anniu1 >= 2 and anniu1 <= 4 and getbaseinfo(actor,39) == 0 then
		sendmsg0(actor,"ぐ【系统】勇敢的勇士:“".. getname(actor) .."”进入".. mapname .."地图寻找高级装备去了，大家祝福他吧…",117,94)
	end
	setint(actor,"地图随机次数",0)
end
