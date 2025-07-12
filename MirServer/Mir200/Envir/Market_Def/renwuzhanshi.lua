include("Market_Def/zh.lua") --个人封装函数
local renwu_ditu = {
	{xqitem = {"九穗禾",5},caijiditu="蛮荒一层",shaguaiditu="蛮荒遗迹"},
	{xqitem = {"怀梦草",5},caijiditu="蛮荒禁地",shaguaiditu="蛮荒遗迹"},
	{xqitem = {"紫罗兰",5},caijiditu="神域二层",shaguaiditu="龙之神域"},
	{xqitem = {"幽冥花",5},caijiditu="铁血一层",shaguaiditu="铁血魔窟"},
	{xqitem = {"不死草",5},caijiditu="深渊二层",shaguaiditu="堕落深渊"},
	{xqitem = {"人参果树",5},caijiditu="桃花谷二层",shaguaiditu="桃花谷"},
	{xqitem = {"护心莲",1},caijiditu="桃花谷底",shaguaiditu="桃花谷"},
}
function renwu_show(actor)
	delbutton(actor,110,1)
	local msg = "<ListView|children={1,2,3,4,8,9}|width=200|height=180|y=3.0|margin=0|bounce=0|>"
	if getsysint("合区次数") > 0 and getint(actor,"酒剑仙任务是否领取") == 0 and getint(actor,"酒剑仙任务编号") < 7 and getdayint(actor,"今日酒剑仙任务") == 0 and getint(actor,"完成任务id") >= 16 then
		msg = msg.. [[
		<Img|id=8|children={801,802,803,804,805}|x=1.0|y=6.0|width=200|height=140|scale9t=20|scale9r=20|scale9b=20|img=zhangheng/0.png|esc=0|scale9l=20>
		<Text|id=801|x=9.0|y=8.0|rotate=0|size=16|color=251|outline=1|text=[任务]酒剑仙>
		<Text|id=802|x=9.0|y=33.0|rotate=0|size=16|outline=1|color=253|text=请至盟重土城酒馆>
		<RText|id=803|x=9.0|y=56.0|outline=1|size=16|color=131|text=打听<酒剑仙/FCOLOR=250>的故事>
		]]
		
		addbutton(actor,110,1,msg)
	end
	
	if getint(actor,"酒剑仙任务是否领取") == 1 then
		local renwujindu = getint(actor,"酒剑仙任务编号")
		local showid = renwujindu + 1
		local t = renwu_ditu[showid]
		msg = msg.. [[
		<Img|id=1|children={101,102,103,104,105}|x=1.0|y=6.0|width=200|height=140|scale9t=20|scale9r=20|scale9b=20|img=zhangheng/0.png|esc=0|scale9l=20>
		<Text|id=101|x=39.0|y=8.0|rotate=0|size=16|color=251|outline=1|text=【任务】酒仙剑>
		]]
		msg=msg.."<Text|id=102|x=9.0|y=33.0|rotate=0|size=16|color=131|outline=1|text=⒈前往地图".. t.shaguaiditu ..">"
		msg=msg.."<RText|id=103|x=25.0|y=56.0|size=16|color=254|outline=1|text=击杀5只怪物<（".. getint(actor,"酒剑仙任务杀怪数") .."/5）/FCOLOR=250>>"
		msg=msg.."<Text|id=104|x=9.0|y=86.0|size=16|color=131|outline=1|text=⒉前往地图".. t.caijiditu ..">"
		msg=msg.."<RText|id=105|x=26.0|y=109.0|color=254|size=16|outline=1|text=采集".. t.xqitem[2] .."株".. t.xqitem[1] .."<（".. itemcount(actor,t.xqitem[1]) .."/".. t.xqitem[2] .."）/FCOLOR=250>>"
		addbutton(actor,110,1,msg)
	end
	if itemcount(actor,"酒剑仙的推荐信") > 0 then
		msg = msg.. [[
		<Img|id=2|children={201,202,203,204,205}|x=1.0|y=6.0|width=200|height=140|scale9t=20|scale9r=20|scale9b=20|img=zhangheng/0.png|esc=0|scale9l=20>
		<Text|id=201|x=39.0|y=8.0|rotate=0|size=16|color=251|outline=1|text=【酒馆】店小二>
		]]
		msg=msg.."<Text|id=202|x=9.0|y=33.0|rotate=0|size=16|color=131|outline=1|text=前往盟重城酒馆一楼>寻找"
		msg=msg.."<RText|id=203|x=9.0|y=56.0|size=16|color=131|outline=1|text=<店小二/FCOLOR=250>，并把<推荐信/FCOLOR=250>交付>"
		msg=msg.."<Text|id=204|x=9.0|y=79.0|size=16|color=131|outline=1|text=给他>"
		addbutton(actor,110,1,msg)
	end
	if itemcount(actor,"玫瑰花") > 0 then
		msg = msg.. [[
		<Img|id=3|children={301,302,303,304,305}|x=1.0|y=6.0|width=200|height=140|scale9t=20|scale9r=20|scale9b=20|img=zhangheng/0.png|esc=0|scale9l=20>
		<Text|id=301|x=39.0|y=8.0|rotate=0|size=16|color=251|outline=1|text=【酒馆】老板娘>
		]]
		msg=msg.."<RText|id=302|x=9.0|y=33.0|rotate=0|size=16|color=131|outline=1|text=前往酒馆一楼，找到<老板/FCOLOR=250>>"
		msg=msg.."<RText|id=303|x=9.0|y=56.0|size=16|color=131|outline=1|text=<娘/FCOLOR=250>，把<\"玫瑰花\"/FCOLOR=250>交付给她>"
		msg=msg.."<RText|id=304|x=9.0|y=79.0|size=16|color=131|outline=1|text=有机会获得酿酒术>"
		addbutton(actor,110,1,msg)
	end
	
	if getint(actor,"领悟酿酒术") == 2 then
		msg = msg.. [[
		<Img|id=4|children={401,402,403,404,405}|x=1.0|y=6.0|width=200|height=140|scale9t=20|scale9r=20|scale9b=20|img=zhangheng/0.png|esc=0|scale9l=20>
		<Text|id=401|x=39.0|y=8.0|rotate=0|size=16|color=251|outline=1|text=【酒馆】品酒师>
		]]
		msg=msg.."<RText|id=402|x=9.0|y=33.0|rotate=0|size=16|color=131|outline=1|text=前往酒馆一楼，找到<品酒/FCOLOR=250>>"
		msg=msg.."<RText|id=403|x=9.0|y=56.0|size=16|color=131|outline=1|text=<师/FCOLOR=250>，完成第一次酿酒>"
		addbutton(actor,110,1,msg)
	end
	
	if getint(actor,"挖矿任务显示") == 1 then
		msg = msg.. [[
		<Img|id=9|children={901,902,903,904,905,906,907,908,909,910,}|x=1.0|y=6.0|width=200|height=174|scale9l=0|img=zhangheng/0.png|scale9r=0|scale9b=20|esc=0|scale9t=20>
		<Text|id=901|x=74.0|y=6.0|rotate=0|color=251|size=16|outline=1|text=矿洞守卫>
		<Text|id=902|x=9.0|y=31.0|rotate=0|color=150|size=16|outline=1|text=任务描述：>
		<RText|id=903|x=41.0|y=56.0|color=255|size=16|outline=1|text=到紫金矿洞挖取50个>
		<Text|id=904|x=9.0|y=101.0|color=150|size=16|outline=1|text=任务奖励：>
		<Img|id=905|x=43.0|y=127.0|width=40|height=40|esc=0|img=zh/2.png>
		<Img|id=906|x=95.0|y=127.0|width=40|height=40|esc=0|img=zh/2.png>
		]]
		msg=msg.."<ItemShow|id=907|x=30.0|y=113.0|width=70|height=70|itemid=".. getidbyname("经验奖励") .."|itemcount=1|showtips=1|bgtype=0>"
		msg=msg.."<ItemShow|id=908|x=82.0|y=113.0|width=70|height=70|itemid=".. getidbyname("黑铁矿石") .."|itemcount=1|showtips=1|bgtype=0>"
		msg=msg.."<RText|id=909|x=41.0|y=75.0|color=255|size=16|outline=1|text=<铜矿石/FCOLOR=254><（".. itemcount(actor,"铜矿石") .."/50）/FCOLOR=250>>"
		msg=msg.."<Text|id=910|x=114.0|y=147.0|color=255|size=16|outline=1|text=10|outline=1>"
		addbutton(actor,110,1,msg)
	end
	
end

