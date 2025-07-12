include("Market_Def/zh.lua") --个人封装函数
local biaoti_anniu = {"品牌介绍","起步攻略","游戏特色","游戏玩法","职业介绍","地图介绍","防挂说明","骗术说明"}
function show(actor,anniuid)
	anniuid = tonumber(anniuid) or 1
	local msg = [[
		<Img|x=0|width=700|height=494|bg=1|show=4|scale9r=50|scale9t=50|scale9b=50|move=1|scale9l=50|loadDelay=0|reset=0|img=zhangheng/1.png|esc=1>
		<Button|x=697.0|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=17.0|y=39.5|img=zhangheng/266.png|esc=0>
	]]
	
	for i = 1,#biaoti_anniu do
		if i == anniuid then
			msg = msg ..'<Button|x=19.0|y='.. 45+(i-1)*45 ..'|size=18|nimg=zhangheng/267.png|pimg=zhangheng/267.png|color=250|outline=2|text='..biaoti_anniu[i]..'>'
		else
			msg = msg ..'<Button|x=19.0|y='.. 45+(i-1)*45 ..'|size=18|nimg=zhangheng/267.png|pimg=zhangheng/267.png|color=7|outline=2|text='..biaoti_anniu[i]..'|link=@show,'.. i ..'>'
		end
	end
	
	if biaoti_anniu[anniuid] == "防挂说明" then
		msg = msg ..[[
		<RText|x=170.0|y=50.0|color=251|size=20|text=防挂说明>
<RText|ax=0|x=170|y=85.0|color=255|size=18|text=为防止影响正常玩家的游戏体验，<官方对非法外挂，群控脱机外/FCOLOR=250>>
<RText|ax=0|x=170|y=110.0|color=255|size=18|text=<挂，群控脱机抢散人BOSS行为以及加速外挂等零容忍，一经查/FCOLOR=250>>
<RText|ax=0|x=170|y=135.0|color=255|size=18|text=<实永久封停！/FCOLOR=250>不要抱有侥幸心理，请珍惜自己的游戏帐号，共建>
<RText|x=170.0|y=160.0|color=255|size=18|text=美好以及绿色的游戏环境。>
<RText|x=170.0|y=195.0|color=255|size=18|text=如出现一个投资号拖多个白嫖号横扫地图，包图，导致正常玩家>
<RText|x=170.0|y=220.0|color=255|size=18|text=没有怪打，白嫖号不捡东西等行为均判断为群控行为，旗下所有>
<RText|x=170.0|y=245.0|color=255|size=18|text=账号将会封禁三天处罚。>
<RText|x=170.0|y=280.0|color=255|size=18|text=如出现群控自动杀人，群控秒人，碰一下其中一个号就是一堆号>
<RText|x=170.0|y=305.0|color=255|size=18|text=集火攻击玩家的行为，将永久封禁同IP机器码旗下所有账号，永>
<RText|x=170.0|y=330.0|color=255|size=18|text=不解封。>



		]]
	end
	
	if biaoti_anniu[anniuid] == "品牌介绍" then
		msg = msg ..[[
		<RText|x=170.0|y=50.0|color=251|size=20|text=品牌介绍>
<RText|x=170.0|y=85.0|size=18|color=255|text=⒈<《顺天传奇》/FCOLOR=250>是一款耗时两年精心研发的三职业特色80复古>
<RText|x=188.0|y=110.0|color=255|size=18|text=版本，轻松耐玩是本游戏的最大亮点，每一个细节都经过精>
<RText|x=188.0|y=135.0|size=18|color=255|text=心打磨只为游戏更加平衡合理<门槛低玩法丰富/FCOLOR=253>，让你重返热>
<RText|x=188.0|y=160.0|color=255|size=18|text=血燃烧的年代>
<RText|x=170.0|y=195.0|size=18|color=255|text=⒉游戏里的<金币、元宝、装备、材料 、都非常保值/FCOLOR=250>，请妥善保>
<RText|x=188.0|y=220.0|color=255|size=18|text=管好自己的账号，出借或者被骗，造成的损失官方概不负责>
<RText|x=188.0|y=245.0|size=18|color=255|text=如有合理的建议或者BUG可以联系客服反馈，一经采纳将<以/FCOLOR=253>>
<RText|x=188.0|y=270.0|size=18|color=255|text=<现金奖励/FCOLOR=253>>

		]]
	end
	
	if biaoti_anniu[anniuid] == "起步攻略" then
		msg = msg ..[[
		<RText|x=170.0|y=50.0|color=251|size=20|text=起步攻略>
<RText|x=170.0|y=79.0|size=18|color=255|text=⒈本游戏<【无会员,无赞助,无回馈,无礼包,无累充,无隐藏,无暗坑,/FCOLOR=250>>
<RText|x=188.0|y=104.0|color=255|size=18|text=<无顶榜,无沙捐】/FCOLOR=250>无任何强制消费，一切物品皆可在游戏获得，>
<RText|x=188.0|y=129.0|color=255|size=18|text=打怪可获得经验加成以及怪物掉落大量经验卷，让你轻松提升>
<RText|x=188.0|y=154.0|color=255|size=18|text=等级，体验<绿色游戏/FCOLOR=253>，回味<传奇经典/FCOLOR=253>的年代>
<RText|x=170.0|y=182.0|color=255|size=18|text=⒉本服唯一通过充值获取的只有一个<【开荒豪礼】/FCOLOR=250>充值任意金额>
<RText|x=188.0|y=207.0|color=255|size=18|text=即可领取，散人和小资玩家强烈推荐>
<RText|x=170.0|y=235.0|color=255|size=18|text=⒊有条件的土豪或者时间多的玩家，通过充值或者游戏里面获取>
<RText|x=188.0|y=260.0|color=255|size=18|text=的元宝，可以<开通投资大使/FCOLOR=70><获得解绑以及/FCOLOR=251><搬砖打米权限/FCOLOR=251>，还能>
<RText|x=188.0|y=285.0|color=255|size=18|text=免费把购买投资的元宝全部领回来，<超值/FCOLOR=254><划算/FCOLOR=254>，<打宝强烈推荐/FCOLOR=253>>
<RText|x=170.0|y=313.0|color=255|size=18|text=⒋除此以外没有其他可以消费的地方，想要快速的提升自己，就>
<RText|x=188.0|y=338.0|color=255|size=18|text=多花时间从游戏获得或者从散人玩家手里收购>
<RText|x=170.0|y=366.0|size=18|color=255|text=⒌由于人气过于火爆，有条件的老板可通过<拍卖行收购/FCOLOR=250>玩家在游>
<RText|x=188.0|y=391.0|color=255|size=18|text=戏里打到的经验卷，快速到50级不至于跟平民玩家抢初级地图>
<RText|x=188.0|y=416.0|size=18|color=255|text=导致发育缓慢。50级以及50级后面的地图有打不完的怪物以及>
<RText|x=188.0|y=439.0|size=18|color=255|text=<高级BOSS/FCOLOR=250>，还有<BOSS首杀/FCOLOR=249>哦！>

		]]
	end
	
	if biaoti_anniu[anniuid] == "游戏特色" then
		msg = msg ..[[
			<RText|x=170.0|y=50.0|color=251|size=20|text=游戏特色>
<RText|x=170.0|y=85.0|size=18|color=255|text=⒈主要货币为<金币/FCOLOR=250>是本游戏最大的特色之一，只能通过怪物产出>
<RText|x=188.0|y=110.0|size=18|color=255|text=官方<概不售卖/FCOLOR=253>也无变相通过充值方式获得，个别地方只为方便>
<RText|x=188.0|y=135.0|size=18|color=255|text=玩家前期起步可少量获得，想要起步快只能<通过收玩家所产出/FCOLOR=254>>
<RText|x=188.0|y=160.0|size=18|color=255|text=<的金币/FCOLOR=254>>
<RText|x=170.0|y=195.0|size=18|color=255|text=⒉任意怪物所爆出的<物品均可回收/FCOLOR=250>成金币，所以获取金币非常>
<RText|x=188.0|y=220.0|color=255|size=18|text=容易，散人玩家打到的非绑定金币,可在土城左上角仓库保管>
<RText|x=188.0|y=245.0|size=18|color=255|text=员处兑换成<金条/FCOLOR=249>，出售给老板可获得不菲的收益>
<RText|x=170.0|y=280.0|size=18|color=255|text=⒊装备材料产出均只能通过怪物爆出获得，<任何地图都可爆出终/FCOLOR=250>>
<RText|x=188.0|y=305.0|size=18|color=255|text=<极装备和特殊顶级装备/FCOLOR=250>，为防止土豪包场，导致散人玩家无法>
<RText|x=188.0|y=330.0|color=255|size=18|text=发育，系统不设定"查询怪物刷新时间功能"地图里面也会刷新>
<RText|x=188.0|y=355.0|size=18|color=255|text=部分非定点BOSS，地图玩法以及怪物玩法令你回味无穷>


		]]
	end
	
	if biaoti_anniu[anniuid] == "游戏玩法" then
		msg = msg ..[[
		<RText|x=170.0|y=50.0|color=251|size=20|text=游戏玩法>
		<RText|x=170.0|y=85.0|color=255|size=18|text=⒈<幸运9套/FCOLOR=250>是每个玩家追求的极致，打怪能获得祝福油可轻松把>
		<RText|x=188.0|y=109.0|color=255|size=18|text=把武器喝到幸运6，幸运3项链需通过NPC升级获得，<费用低/FCOLOR=253>>
		<RText|x=188.0|y=135.0|color=255|size=18|text=<成功率高/FCOLOR=253>>
		<RText|x=170.0|y=165.0|size=18|color=255|text=⒉装备玩法趣味丰富，S级套装以及百件特殊装备，玩家可进行>
		<RText|x=188.0|y=190.0|size=18|color=255|text=任意搭配，选择最适合自己的才是最强悍的，每个特殊装备的>
		<RText|x=188.0|y=215.0|size=18|color=255|text=属性都是随机的，运气爆棚可直接逆袭土豪一件普普通通的装>
		<RText|x=188.0|y=240.0|size=18|color=255|text=备属性可能比顶级装备还要强悍，当然这<一切只能靠脸/FCOLOR=70>，出门>
		<RText|x=188.0|y=265.0|size=18|color=255|text=在外少PK，多打怪，运气总会眷顾勤奋努力之人>
		<RText|x=170.0|y=295.0|size=18|color=255|text=⒊在爆出物品的时候同时也会出现<红色孤品装备/FCOLOR=249>，地上出现红色>
		<RText|x=188.0|y=320.0|size=18|color=255|text=名字的装备一定要擦亮眼睛，找到土城的逍遥子，他会为你解>
		<RText|x=188.0|y=345.0|size=18|color=255|text=开孤品装备之谜>
		<RText|x=170.0|y=375.0|color=255|size=18|text=⒋合区后开放全网独创<"饮酒系统"/FCOLOR=250>玩法新颖，趣味性强，通过各>
		<RText|x=188.0|y=400.0|color=255|size=18|text=大地图采集的山泉水可进行免费酿制，美酒打怪过程中获得的>
		<RText|x=188.0|y=425.0|color=255|size=18|text=<"高粱，虎骨"/FCOLOR=250>具有高保值性，前期切不可贱卖>

		]]
	end
	
	if biaoti_anniu[anniuid] == "职业介绍" then
		msg = msg ..""
		msg = msg ..""
		msg = msg ..[[
		<ListView|children={1}|x=161.0|y=40.0|width=520|height=428|bounce=0>
		<Img|id=1|children={2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23}|x=161.0|y=39.0|width=520|height=588|img=public/0.png>

<RText|id=2|x=10.0|y=10.0|size=20|color=251|text=职业介绍>
<RText|id=3|x=10.0|y=40.0|size=18|color=253|text=三职业平衡是本服最大的特色，无论选择什么职业都可前途无量>
<RText|id=4|x=10.0|y=70.0|size=18|color=254|text=战士：>
<RText|id=5|x=10.0|y=95.0|size=18|color=255|text=<爆发力强悍/FCOLOR=250>，杀人越货，土匪一样的存在，中后期可根据自己>
<RText|id=6|x=10.0|y=120.0|size=18|color=255|text=需求通过装备随意搭配无任何门槛，吸血类玩法，暴击类玩法，>
<RText|id=7|x=10.0|y=145.0|size=18|color=255|text=攻速类玩法，准确类玩法，吸蓝类玩法，冲锋陷阵类玩法 巫术>
<RText|id=8|x=10.0|y=170.0|size=18|color=255|text=单控类玩法等等....>
<RText|id=9|x=10.0|y=200.0|size=18|color=254|text=法师：>
<RText|id=10|x=10.0|y=225.0|size=18|color=255|text=<升级群怪打宝效率高，团战优势明显/FCOLOR=250>，中后期可根据自己需求>
<RText|id=11|x=10.0|y=250.0|size=18|color=255|text=通过装备随意搭配无任何门槛，血量增益类玩法，聚魔类玩法，>
<RText|id=12|x=10.0|y=275.0|size=18|color=255|text=敏捷类玩法，冰火雷系列玩法，高伤类玩法，灼伤类玩法，群>
<RText|id=13|x=10.0|y=300.0|size=18|color=255|text=控类玩法等等.....>
<RText|id=14|x=10.0|y=330.0|size=18|color=254|text=道士：>
<RText|id=15|x=10.0|y=355.0|size=18|color=255|text=可单挑一切BOSS，无所不能，<50级召唤"万兽之王"/FCOLOR=250>，<60级召/FCOLOR=253>>
<RText|id=16|x=10.0|y=380.0|size=18|color=255|text=<唤"至尊牛帝"/FCOLOR=253><（四级召唤神兽产生质的变化）/FCOLOR=254>，中后期可根据>
<RText|id=17|x=10.0|y=405.0|size=18|color=255|text=自己需求通过装备随意搭配，无任何门槛，魔法躲避类玩法，>
<RText|id=18|x=10.0|y=430.0|size=18|color=255|text=属性增益类玩法，防御辅助类玩法宝宝强悍类玩法，阵法类玩>
<RText|id=23|x=10.0|y=455.0|size=18|color=255|text=法(排兵布阵)，隐身类玩法等等......>
<RText|id=19|x=10.0|y=485.0|size=18|color=255|text=本游戏任何职业前，中，后期都<不会出现秒杀现象/FCOLOR=154>，也不会出>
<RText|id=20|x=10.0|y=510.0|size=18|color=255|text=现鸡肋职业，中后期PK都各有优势，更多精彩玩法玩家自行探>
<RText|id=21|x=10.0|y=535.0|size=18|color=255|text=索，游戏玩法丰富，但是并不变态，一切以平衡复古为宗旨，>
<RText|id=22|x=10.0|y=560.0|size=18|color=255|text=只是增加游戏乐趣>


		]]
	end
	
	if biaoti_anniu[anniuid] == "地图介绍" then
		msg = msg ..[[
		<RText|x=170.0|y=50.0|size=20|color=251|text=地图介绍>
		<RText|x=170.0|y=85.0|size=18|color=255|text=游戏任何地图都<可爆出所有装备/FCOLOR=250>，很多地图都设有<隐藏地图/FCOLOR=250>，均>
		<RText|x=170|y=110.0|size=18|color=255|text=会刷新全服最大的BOSS，高级地图还可以通过采集泉水获得不>
		<RText|x=170.0|y=135.0|size=18|color=255|text=菲的收益，迷之幻境，未知暗殿，卧龙山庄，七星塔等都插入大>
		<RText|x=170|y=160.0|size=18|color=255|text=量新颖玩法，可以通过这些<地图的NPC/FCOLOR=250>了解详情，一切皆为散人>
		<RText|x=170.0|y=185.0|size=18|color=255|text=考虑而设计>

		]]
	end
	
	if biaoti_anniu[anniuid] == "骗术说明" then
		msg = msg ..[[
		<ListView|children={1}|x=159.0|y=39.0|width=520|height=420|bounce=0>
		<Img|id=1|children={2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29}|x=161.0|y=39.0|width=520|height=730|img=public/0.png>
		<RText|id=2|x=10.0|y=10.0|size=20|color=251|text=谨慎是骗子的克星，切勿贪小便宜，以免造成帐号的损失>
		<RText|id=3|x=10.0|y=40.0|size=18|color=255|text=<骗术一. /FCOLOR=253>骗子经常以老板的身份收材料. 然后让你把东西直接先>
		<RText|id=4|x=10.0|y=65.0|size=18|color=255|text=给老板.你看到老板不会跑单.所以把东西给了老板.结果老板把>
		<RText|id=5|x=10.0|y=90.0|size=18|color=255|text=米直接转给了骗子.因为骗子提前联系好了老板.最后的情况就是>
		<RText|id=6|x=10.0|y=115.0|size=18|color=255|text=老板被骗.卖材料的也被骗.骗子两头通吃！<老板交易时请务必与/FCOLOR=249>>
		<RText|id=7|x=10.0|y=140.0|size=18|color=249|text=给自己物品的本人游戏号确认.而不是其他途径的联系方式！>
		<RText|id=8|x=10.0|y=165.0|size=18|color=254|text=防骗提示：请各位玩家交易时，通过游戏的拍卖行，交易行，>
		<RText|id=9|x=10.0|y=190.0|size=18|color=254|text=进行交易，这样被骗风险系数为0>
		<RText|id=10|x=10.0|y=220.0|size=18|color=255|text=<骗术二. /FCOLOR=253>小哥哥XXX一起玩求组CP，可奔现哦，然后行会群已更>
		<RText|id=11|x=10.0|y=245.0|size=18|color=255|text=新，增加会长XXX加群，不加就踢！上当了嘿嘿，等我骗你去XX>
		<RText|id=12|x=10.0|y=270.0|size=18|color=255|text=X游戏充值，我的钱呢？我的爱情呢？我的兄弟呢？>
		<RText|id=13|x=10.0|y=295.0|size=18|color=254|text=防骗提示：真正的玩家不会轻易索取或者要求增加联系方式，>
		<RText|id=14|x=10.0|y=320.0|size=18|color=254|text=需要各位玩家火眼金晴，洞穿一切>
		<RText|id=15|x=10.0|y=350.0|size=18|color=255|text=<骗术三. /FCOLOR=253>兄弟，加群一起打BOSS啊！骗子跟玩家混熟悉后，索>
		<RText|id=16|x=10.0|y=375.0|size=18|color=255|text=要你的帐号后，等你上游戏后发现装备被洗白白了，那时你才>
		<RText|id=17|x=10.0|y=395.0|size=18|color=255|text=发现被骗了..>
		<RText|id=18|x=10.0|y=420.0|size=18|color=254|text=防骗提示：玩家们不要随意增加游戏群，同时也不要随便把帐>
		<RText|id=19|x=10.0|y=445.0|size=18|color=254|text=号给任何人>
		<RText|id=20|x=10.0|y=475.0|size=18|color=255|text=<骗术四. /FCOLOR=253>兄弟我有特殊充值渠道，官方五折，一般人我不告诉>
		<RText|id=21|x=10.0|y=500.0|size=18|color=255|text=他，你想这么划算，那充值1000，等你充值后，发现元宝没到>
		<RText|id=22|x=10.0|y=525.0|size=18|color=255|text=帐，那时才发现被骗了，但已经晚了..>
		<RText|id=23|x=10.0|y=550.0|size=18|color=254|text=防骗提示：官方人员不会通过任何渠道诱导玩家充值，请玩家>
		<RText|id=24|x=10.0|y=575.0|size=18|color=254|text=切勿贪小便宜>
		<RText|id=25|x=10.0|y=605.0|size=18|color=255|text=<骗术五. /FCOLOR=253>这个游戏不好玩，带你玩个更刺激的，还有这种操作，>
		<RText|id=26|x=10.0|y=630.0|size=18|color=255|text=给我整一个，然后骗子给你发个网址，你以为点进去就可以玩，>
		<RText|id=27|x=10.0|y=655.0|size=18|color=255|text=过一会儿收到短信XXX先生，你尾号XXX的银行卡剩余金额0元...>
		<RText|id=28|x=10.0|y=680.0|size=18|color=254|text=防骗提示：请玩家们不要轻易打开陌生人通过微信，QQ，论坛，>
		<RText|id=29|x=10.0|y=705.0|size=18|color=254|text=贴吧等平台发来的陌生地址，不要给骗子可乘之机>
		
		]]
	end
	
	say(actor,msg)
end
