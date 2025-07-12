include("Market_Def/zh.lua") --个人封装函数
local tu_biao = {
		{58.5, 187.5, "zhangheng/54.png","青龙之力","青龙",148.5,144.5,"zhangheng/242.png"},
		{331.5, 187.5, "zhangheng/55.png","白虎之力","白虎",148.5,144.5,"zhangheng/243.png"},
		{192.5, 57.5, "zhangheng/56.png","朱雀之力","朱雀",148.5,144.5,"zhangheng/244.png"},
		{193.5, 321.5, "zhangheng/57.png","玄武之力","玄武",148.5,144.5,"zhangheng/245.png"},
	}

local xiaohao_t ={
	{
		{jinbi=5000	,item={"神兽之角",5},		},
		{jinbi=10000	,item={"神兽之角",5},     },
		{jinbi=15000	,item={"神兽之角",5},     },
		{jinbi=20000	,item={"神兽之角",5},     },
		{jinbi=30000	,item={"神兽之角",5},     },
		{jinbi=40000	,item={"神兽之角",5},     },
		{jinbi=50000	,item={"神兽之角",5},     },
		{jinbi=60000	,item={"神兽之角",5},     },
		{jinbi=80000	,item={"神兽之角",5},     },
		{jinbi=100000,item={"神兽之角",5},       },
		{jinbi=150000,item={"神兽之角",5},       },
		{jinbi=200000,item={"神兽之角",5},       },
		{jinbi=250000,item={"神兽之角",5},       },
		{jinbi=300000,item={"神兽之角",5},       },
		{jinbi=350000,item={"神兽之角",5},       },
		{jinbi=400000,item={"神兽之角",5},       },
		{jinbi=450000,item={"神兽之角",5},       },
		{jinbi=500000,item={"神兽之角",5},       },
		{jinbi=550000,item={"神兽之角",5},         },
		{jinbi=600000,item={"神兽之角",5},         },
		{jinbi=600000,item={"神兽之角",5},         },--最后一级显示用
	},
	{
		{jinbi=100000,item={"神兽之血",5}, },
		{jinbi=150000,item={"神兽之血",5}, },
		{jinbi=200000,item={"神兽之血",5}, },
		{jinbi=250000,item={"神兽之血",5}, },
		{jinbi=300000,item={"神兽之血",5}, },
		{jinbi=350000,item={"神兽之血",5}, },
		{jinbi=400000,item={"神兽之血",5}, },
		{jinbi=450000,item={"神兽之血",5}, },
		{jinbi=500000,item={"神兽之血",5}, },
		{jinbi=550000,item={"神兽之血",5}, },
		{jinbi=600000,item={"神兽之血",5}, },
		{jinbi=650000,item={"神兽之血",5}, },
		{jinbi=700000,item={"神兽之血",5}, },
		{jinbi=750000,item={"神兽之血",5}, },
		{jinbi=800000,item={"神兽之血",5}, },
		{jinbi=850000,item={"神兽之血",5}, },
		{jinbi=900000,item={"神兽之血",5}, },
		{jinbi=950000,item={"神兽之血",5}, },
		{jinbi=1000000,item={"神兽之血",5},  },
		{jinbi=1050000,item={"神兽之血",5},  },
		{jinbi=1050000,item={"神兽之血",5},  },--最后一级显示用
	},
	{
		{jinbi=200000,item={"神兽之血",8},	},
		{jinbi=300000,item={"神兽之血",8},   },
		{jinbi=400000,item={"神兽之血",8},   },
		{jinbi=500000,item={"神兽之血",8},   },
		{jinbi=600000,item={"神兽之血",8},   },
		{jinbi=700000,item={"神兽之血",8},   },
		{jinbi=800000,item={"神兽之血",8},   },
		{jinbi=900000,item={"神兽之血",8},   },
		{jinbi=1000000,item={"神兽之血",8},  },
		{jinbi=1100000,item={"神兽之血",8},  },
		{jinbi=1200000,item={"神兽之血",8},  },
		{jinbi=1300000,item={"神兽之血",8},  },
		{jinbi=1400000,item={"神兽之血",8},  },
		{jinbi=1500000,item={"神兽之血",8},  },
		{jinbi=1600000,item={"神兽之血",8},  },
		{jinbi=1700000,item={"神兽之血",8},  },
		{jinbi=1800000,item={"神兽之血",8},  },
		{jinbi=1900000,item={"神兽之血",8},  },
		{jinbi=2000000,item={"神兽之血",8},  },
		{jinbi=2100000,item={"神兽之血",8},  },
		{jinbi=2100000,item={"神兽之血",8},  },--最后一级显示用
	},
	{
		{jintiao=1	,item={"神兽之血",12}},
		{jintiao=1	,item={"神兽之血",12}},
		{jintiao=1	,item={"神兽之血",12}},
		{jintiao=1	,item={"神兽之血",12}},
		{jintiao=2	,item={"神兽之血",12}},
		{jintiao=2	,item={"神兽之血",12}},
		{jintiao=2	,item={"神兽之血",12}},
		{jintiao=2	,item={"神兽之血",12}},
		{jintiao=3	,item={"神兽之血",12}},
		{jintiao=3	,item={"神兽之血",12}},
		{jintiao=3	,item={"神兽之血",12}},
		{jintiao=3	,item={"神兽之血",12}},
		{jintiao=4	,item={"神兽之血",12}},
		{jintiao=4	,item={"神兽之血",12}},
		{jintiao=4	,item={"神兽之血",12}},
		{jintiao=4	,item={"神兽之血",12}},
		{jintiao=5	,item={"神兽之血",12}},
		{jintiao=5	,item={"神兽之血",12}},
		{jintiao=5	,item={"神兽之血",12}},
		{jintiao=5	,item={"神兽之血",12}},
		{jintiao=5	,item={"神兽之血",12}}, --最后一级显示用
	}
}
local bl = {"青龙之力","白虎之力","朱雀之力","玄武之力"}
function show(actor,xzid)
	if getint(actor,"完成任务id") == 11 then
		newdeletetask(actor,12) --删除任务2
		setint(actor,"完成任务id",12)
		sendmsg9(actor,"了解四相之力完成")
		callscriptex(actor, "CallLua", "QFunction-0", "@renwupanduan") --任务系统
	end
	
	xzid = tonumber(xzid) or 1
	local msg = [[
		<Img|x=0|width=643|height=457|show=4|bg=1|img=zhangheng/1.png|move=1|esc=1|reset=0>
<Button|x=639.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
<Img|x=15.5|y=37.5|img=zhangheng/241.png|esc=0>
<RText|ay=0.5|x=42.5|y=411.0|color=149|size=16|text=<温馨提示：/FCOLOR=149>激活四大神兽可获得顶级技能<"护体神盾"/FCOLOR=249>>
<Img|x=435.5|y=43.5|img=zhangheng/62.png|esc=0>

	]]
	
	
	for i = 1,4 do
		if i == xzid then
			msg=msg.."<Img|x="..tu_biao[i][1].."|y="..tu_biao[i][2].."|img=".. tu_biao[i][3] .."|esc=0>" --青龙这些选择按钮
			msg=msg.."<Img|x="..tu_biao[i][1]-5 .."|y="..tu_biao[i][2]-6 .."|img=zhangheng/63.png|esc=0>" --亮框
			msg=msg.."<Img|x="..tu_biao[i][6].."|y="..tu_biao[i][7].."|img=".. tu_biao[i][8] .."|esc=0>" --中间图
			msg=msg.."<Text|ay=0.5|x=493.5|y=58.0|color=224|size=18|text="..tu_biao[i][4]..">"
			local lv = getint(actor,bl[i])
			if i > 1 and getint(actor,bl[i-1]) < 20 then
				msg=msg.."<Text|x=447.5|y=232.5|color=249|size=18|text="..tu_biao[i-1][4].."点满后解锁>"
			else
				msg=msg.."<Text|x=448.5|y=97.5|color=103|size=16|text=当前"..tu_biao[i][5].."等级："..lv.."/20>"
				msg=msg.."<Text|x=448.5|y=137.5|color=103|size=16|text=每提升一次\"".. tu_biao[i][4] .."\">"
				msg=msg.."<Text|x=448.5|y=177.5|color=103|size=16|text=对怪固定伤害增加1点>"
				msg=msg.."<Img|x=435.5|y=227.5|img=zhangheng/62.png|esc=0>"
				msg=msg.."<Text|ay=0.5|x=493.5|y=242.0|size=18|color=224|text=所需消耗>"
				local t=xiaohao_t[xzid][lv+1]
				msg=msg.."<Text|x=447.5|y=282.5|color=116|size=16|text=".. t.item[1] .."：>"
				msg=msg.."<ItemShow|x=511.5|y=258.5|width=70|height=70|itemid=".. getidbyname(t.item[1]) .."|itemcount=1|showtips=1|bgtype=0|scale=0.7>"
				msg=msg.."<RText|x=563.5|y=281.5|color=250|size=18|text=<".. itemcount(actor,t.item[1]) .."/FCOLOR=249>/".. t.item[2] ..">"
				
				if t.jinbi then
					msg=msg.."<RText|x=447.5|y=322.5|color=255|size=16|text=<金币：/FCOLOR=251><".. jianhuanum(getbindgold(actor)) .."/FCOLOR=249>/<".. jianhuanum(t.jinbi) .."/FCOLOR=250>>"
				end
				if t.jintiao then
					msg=msg.."<RText|x=447.5|y=322.5|color=255|size=16|text=<金条：/FCOLOR=251>>"
					msg=msg.."<ItemShow|x=471.5|y=298.5|width=70|height=70|itemid=".. getidbyname("金条") .."|itemcount=1|showtips=1|bgtype=0|scale=0.75>"
					msg=msg.."<RText|x=523.5|y=322.5|color=250|size=18|text=<".. itemcount(actor,"金条") .."/FCOLOR=249>/".. t.jintiao ..">"
				end
				if lv >= 20 then
					msg=msg.."<Button|x=487.5|y=367.5|color=249|size=18|nimg=zhangheng/13.png|text=已升满>"
				else
					msg=msg.."<Button|x=487.5|y=367.5|color=10051|size=18|nimg=zhangheng/13.png|text=提  升|link=@tisheng,".. xzid ..">"
				end
			end
		else
			msg=msg.."<Img|x="..tu_biao[i][1].."|y="..tu_biao[i][2].."|img=".. tu_biao[i][3] .."|esc=0|link=@show,"..i..">"
		end
	end
	msg=msg.."<RText|ax=0.5|ay=0.5|x=224.5|y=208.0|size=16|outline=1|color=150|text=对怪固定伤害总值>"
	msg=msg.."<Img|x=199.5|y=223.5|width=50|esc=0|img=zhangheng/62.png>"
	msg=msg.."<RText|ax=0.5|ay=0.5|x=224.0|y=238.0|color=253|size=16|outline=1|text=".. getint(actor,"四象之力总值") ..">"
	say(actor,msg)
end


function tisheng(actor,id)
	id = tonumber(id)
	local dj = getint(actor,bl[id]) --获取当前要升级的等级
	if dj >= 20 then
		sendmsg9(actor,bl[id].."已经升满")
		return
	end
	local t = xiaohao_t[id][dj+1]
	if itemcount(actor,t.item[1],2) < t.item[2] then
		sendmsg9(actor,"条件不足")
		return
	end
	if t.jintiao then
		if itemcount(actor,"金条",2) < t.jintiao then
			sendmsg9(actor,"条件不足")
			return
		end
	end
	if t.jinbi then
		if getbindgold(actor) < t.jinbi then
			sendmsg9(actor,"条件不足")
			return
		end
	end
	
	takeitem(actor, t.item[1], t.item[2],0)
	if t.jintiao then
		takeitem(actor, "金条", t.jintiao,0)
	end
	if t.jinbi then
		subbindgold(actor,t.jinbi)
	end
	setint(actor,bl[id],dj+1)
	setint(actor,"四象之力总值",getint(actor,"四象之力总值")+1)
	if getint(actor,"四象之力总值") == 80 then
		addskill(actor, 75, 0)
	end
	sendmsg9(actor,"升级成功")
	return show(actor,id)

end