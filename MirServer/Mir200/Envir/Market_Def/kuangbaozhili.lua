include("Market_Def/zh.lua") --个人封装函数

function show(actor)
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=龙的传人>
<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
<RText|ax=0|ay=0.5|x=22.0|y=70.0|color=255|size=18|text=来自玛法大陆的勇士，不知你可听说过<"龙的传人"/FCOLOR=250>，现在魔族>
<RText|ay=0.5|x=22.0|y=95.0|color=255|size=18|text=欲入侵此大陆，我需要一批有实力的勇士来征服魔族，如果您>
<RText|ay=0.5|x=22.0|y=120.5|color=255|size=18|text=愿意给我<1000元宝/FCOLOR=250>，老夫可帮你开启龙的传人  <攻城区域不掉/FCOLOR=253>>
<RText|ay=0.5|x=22.0|y=145.5|color=254|size=18|text=只有被开启龙的传人的玩家击杀才会消失，其他情况不消失>
<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
<RText|ay=0.5|x=22.0|y=214.5|color=31|size=18|text=<开启龙的传人后/FCOLOR=249>击杀<龙的传人/FCOLOR=249>可获得500元宝>


	]]
	if getsysint("合区次数") == 0 then
		msg=msg.."<RText|ay=0.5|x=22.0|y=170.5|color=251|size=18|text=属性：金币回收比例+30%    攻魔道+5%   生命值+5%>"
	else
		msg=msg.."<RText|ay=0.5|x=22.0|y=170.5|color=251|size=18|text=属性：金币回收比例+30%    攻魔道+5%   生命值+10%>"
	end
	if hasbuff(actor,10001) or hasbuff(actor,20083) then
		msg=msg.."<Text|ay=0.5|x=410.0|y=214.5|size=18|color=249|text=已经开启>"
	else
		msg=msg.."<Text|ay=0.5|x=410.0|y=214.5|size=18|color=250|text=我要开启|link=@kaiqi>"
	end
	say(actor,msg)
end
function kaiqi(actor)
	if hasbuff(actor,10001) or hasbuff(actor,20083) then
		sendmsg9(actor,"您已经开启过龙的传人了")
		return
	end
	
	if getingot(actor) < 1000 then
		sendmsg9(actor,"开启龙的传人需1000元宝")
		return
	end
	subingot(actor,1000,"开启狂暴")
	seticon(actor, 10, -1)
	if getsysint("合区次数") == 0 then
		addbuff(actor,10001)
	else
		addbuff(actor,20083)
	end
	sendmsg9(actor,"开启龙的传人成功")
	
	
	return show(actor)
end
