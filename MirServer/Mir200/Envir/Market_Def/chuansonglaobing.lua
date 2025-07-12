include("Market_Def/zh.lua") --个人封装函数
--比奇老兵
function biqi_show(actor)
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Img|x=9.0|y=9.0|height=232|img=zhangheng/210.png|esc=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=比奇传送员>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
	<Text|x=31.0|y=65.0|color=255|size=18|text=不要相信什么凌波微步，其实这个东西很简单，只要你找我>
	<Text|x=31.0|y=100.0|color=255|size=18|text=什么问题不能解决呢？>
	<Text|ay=0.5|x=52.0|y=154.5|size=18|color=250|text=传送至盟重省|link=@chuansong,盟重省>
	<Img|x=30.0|y=146.0|img=zhangheng/211.png|esc=0>
	<Text|ay=0.5|x=222.0|y=154.5|size=18|color=250|text=传送至白日门|link=@chuansong,白日门>
	<Img|x=200.0|y=146.0|img=zhangheng/211.png|esc=0>
	<Text|ay=0.5|x=392.0|y=154.5|color=250|size=18|text=传送至封魔谷|link=@chuansong,封魔谷>
	<Img|x=370.0|y=146.0|img=zhangheng/211.png|esc=0>
	]]
	say(actor,msg)
end

--苍月老兵
function cangyue_show(actor)
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Img|x=9.0|y=9.0|height=232|img=zhangheng/210.png|esc=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=苍月传送员>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
	<Text|x=31.0|y=65.0|color=255|size=18|text=不要相信什么凌波微步，其实这个东西很简单，只要你找我>
	<Text|x=31.0|y=100.0|color=255|size=18|text=什么问题不能解决呢？>
	<Text|ay=0.5|x=52.0|y=154.5|size=18|color=250|text=传送至盟重省|link=@chuansong,盟重省>
	<Img|x=30.0|y=146.0|img=zhangheng/211.png|esc=0>
	<Text|ay=0.5|x=222.0|y=154.5|size=18|color=250|text=传送至白日门|link=@chuansong,白日门>
	<Img|x=200.0|y=146.0|img=zhangheng/211.png|esc=0>
	<Text|ay=0.5|x=392.0|y=154.5|color=250|size=18|text=传送至封魔谷|link=@chuansong,封魔谷>
	<Img|x=370.0|y=146.0|img=zhangheng/211.png|esc=0>
	]]
	say(actor,msg)
end

--白日门老兵
function bairimen_show(actor)
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Img|x=9.0|y=9.0|height=232|img=zhangheng/210.png|esc=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=白日门老头>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
	<Text|x=31.0|y=65.0|color=255|size=18|text=玛法大陆广阔无垠，不认识路是正常的。比奇的国王说：>
	<Text|x=31.0|y=100.0|color=255|size=18|text=“路在嘴上”，只要你问问我就知道了！>
	<Text|ay=0.5|x=52.0|y=154.5|size=18|color=250|text=传送至盟重省|link=@chuansong,盟重省>
	<Img|x=30.0|y=146.0|img=zhangheng/211.png|esc=0>
	<Text|ay=0.5|x=222.0|y=154.5|size=18|color=250|text=传送至苍月岛|link=@chuansong,苍月岛>
	<Img|x=200.0|y=146.0|img=zhangheng/211.png|esc=0>
	<Text|ay=0.5|x=392.0|y=154.5|color=250|size=18|text=传送至封魔谷|link=@chuansong,封魔谷>
	<Img|x=370.0|y=146.0|img=zhangheng/211.png|esc=0>
	]]
	say(actor,msg)
end

--封魔谷老兵
function fengmo_show(actor)
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Img|x=9.0|y=9.0|height=232|img=zhangheng/210.png|esc=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=封魔传送员>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
	<Text|x=31.0|y=65.0|color=255|size=18|text=不要相信什么凌波微步，其实这个东西很简单，只要你找我>
	<Text|x=31.0|y=100.0|color=255|size=18|text=什么问题不能解决呢？>
	<Text|ay=0.5|x=52.0|y=154.5|size=18|color=250|text=传送至盟重省|link=@chuansong,盟重省>
	<Img|x=30.0|y=146.0|img=zhangheng/211.png|esc=0>
	<Text|ay=0.5|x=222.0|y=154.5|size=18|color=250|text=传送至白日门|link=@chuansong,白日门>
	<Img|x=200.0|y=146.0|img=zhangheng/211.png|esc=0>
	<Text|ay=0.5|x=392.0|y=154.5|color=250|size=18|text=传送至魔龙城|link=@chuansong,魔龙城>
	<Img|x=370.0|y=146.0|img=zhangheng/211.png|esc=0>
	]]
	say(actor,msg)
end

--魔龙城老兵
function molong_show(actor)
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Img|x=9.0|y=9.0|height=232|img=zhangheng/210.png|esc=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=魔龙传送员>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
	<Text|x=31.0|y=65.0|color=255|size=18|text=曾经这里是一个强大的帝国，后来被魔族的邪恶力侵蚀，彻>
	<Text|x=31.0|y=100.0|color=255|size=18|text=底沦落，许多冒险者找我逃离此地！>
	<Text|ay=0.5|x=52.0|y=154.5|size=18|color=250|text=传送至盟重省|link=@chuansong,盟重省>
	<Img|x=30.0|y=146.0|img=zhangheng/211.png|esc=0>
	<Text|ay=0.5|x=222.0|y=154.5|size=18|color=250|text=传送至苍月岛|link=@chuansong,苍月岛>
	<Img|x=200.0|y=146.0|img=zhangheng/211.png|esc=0>
	<Text|ay=0.5|x=392.0|y=154.5|color=250|size=18|text=传送至白日门|link=@chuansong,白日门>
	<Img|x=370.0|y=146.0|img=zhangheng/211.png|esc=0>
	]]
	say(actor,msg)
end

local dt_t = {
	["盟重省"] = {"3",330,332},
	["比奇省"] = {"0",336,266},
	["苍月岛"] = {"5",141,336},
	["白日门"] = {"11",175,324},
	["封魔谷"] = {"4",237,200},
	["魔龙城"] = {"6",122,154},
}
function chuansong(actor,mapname)
	local t = dt_t[mapname]
	mapmove(actor,t[1],t[2],t[3],4)
	
end

