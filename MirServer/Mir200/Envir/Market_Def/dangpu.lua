include("Market_Def/zh.lua") --个人封装函数

function show(actor)
	local msg = [[
		<Img|x=0|width=644|height=472|scale9r=50|show=4|scale9t=50|reset=0|bg=1|move=1|loadDelay=1|scale9b=50|img=zhangheng/1.png|scale9l=50|esc=1>
		<Button|x=640.0|y=1.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=16.0|y=38.0|img=zhangheng/240.png|esc=0>
		<RText|ay=0.5|x=43.0|y=58.5|color=100|size=18|outline=2|text=本服不售卖任何金币，为解勇士们的燃眉之急，可通过将自身的贵重物>
		
		<RText|ay=0.5|x=24.0|y=380.5|color=100|size=16|outline=1|text=本当铺为无息当铺，每当入<1万元宝/FCOLOR=250>可获得<100万/FCOLOR=250>绑定金币，<8小时内/FCOLOR=250>诚信归还者无需>
		<RText|ay=0.5|x=24.0|y=405.5|color=100|size=16|outline=1|text=利息，赎回元宝<仅需1根金条/FCOLOR=250>，请当入者及时归还，有借有还，再借不难，如超过规>
		

	]]
	
	if getint(actor,"当铺可看利息") == 0 then
		msg=msg.."<RText|ay=0.5|x=43.0|y=85.5|color=100|size=18|outline=2|text=品进行典当，最多可当入六次！>"
	else
		msg=msg.."<RText|ay=0.5|x=43.0|y=85.5|color=100|size=18|outline=2|text=品进行典当，最多可当入六次！<八小时内未归还每小时收取500元宝利息/FCOLOR=253>>"
	end
	
	local yincangxianshi = false
	local yxy = 160
	local pyy = 37
	for i = 1,6 do
		local diandangtime = getint(actor,"典当时间"..i)
		local dangqiantime = os.time() --现在时间
		local shijiancha = dangqiantime - diandangtime --秒时间差
		local xiaoshicha = math.ceil(shijiancha/3600) --小时差 
		local lixitime = xiaoshicha - 8 --利息的小时
		if diandangtime ~= 0 and lixitime >= 20 then
			setint(actor,"典当时间"..i,0)
			sendmail(getbaseinfo(actor,2),1,"江湖救急","由于您当入的元宝长时间未归还，利息已超过当入元宝，系统已自动清除","")
		end
		local lixi = 0
		if lixitime > 0 then
			lixi = lixitime * 500
		end
		
		msg=msg.."<Text|ax=0.5|ay=0.5|x=89|y=".. yxy+(i-1)*pyy .."|outline=2|size=18|color=161|text=10000元宝>"
		--时间
		if getint(actor,"典当时间"..i) > 0 then
			msg=msg.."<Text|ax=0.5|ay=0.5|x=247|y=".. yxy+(i-1)*pyy .."|outline=2|size=18|color=254|text=".. os.date("%d日%H:%M:%S",diandangtime) ..">"
			--利息
			msg=msg.."<Text|ax=0.5|ay=0.5|x=397|y=".. yxy+(i-1)*pyy .."|outline=2|size=18|color=249|text=".. lixi .."元宝>"
			--操作
			if getint(actor,"放弃赎回"..i) == 0 then
				msg=msg.."<Text|ax=0.5|ay=0.5|x=507|y=".. yxy+(i-1)*pyy .."|outline=2|size=18|color=250|text=赎回元宝|link=@shuhui,"..i..">"
				msg=msg.."<Text|ax=0.5|ay=0.5|x=587|y=".. yxy+(i-1)*pyy .."|outline=2|size=18|color=250|text=放弃赎回|link=@fangqishuhui,"..i..">"
			else
				msg=msg.."<Text|ax=0.5|ay=0.5|x=549|y=".. yxy+(i-1)*pyy .."|outline=2|size=18|color=250|text=赎回元宝|link=@shuhui,"..i..">"
			end
			yincangxianshi = true
		else
			--操作
			msg=msg.."<Text|ax=0.5|ay=0.5|x=549|y=".. yxy+(i-1)*pyy .."|outline=2|size=18|color=251|text=当入元宝|link=@dangru,"..i..">"
		end
	end

	msg=msg.."<RText|ay=0.5|x=24.0|y=430.5|color=100|size=16|outline=1|text=定时间则会收取<相应利息/FCOLOR=250>，8小时后可放弃赎回.扣除<1500/FCOLOR=253>元宝.每档终生只有1次机会>"

	say(actor,msg)
end

function fangqishuhui(actor,par)
	local diandangtime = getint(actor,"典当时间"..par)
	local dangqiantime = os.time() --现在时间
	local shijiancha = dangqiantime - diandangtime --秒时间差
	local xiaoshicha = math.ceil(shijiancha/3600) --小时差 
	local lixitime = xiaoshicha - 8 --利息的小时
	if lixitime < 1 then
		sendmsg9(actor,"8小时后才可放弃赎回")
		return
	end
	local lixi = 0
	if lixitime > 0 then
		lixi = lixitime * 500
	end
	local huodeyuanbao = 10000-lixi-1500
	if huodeyuanbao < 0 then
		huodeyuanbao = 0
	end
	messagebox(actor,"\\\\此时放弃赎回只可获得".. huodeyuanbao .."元宝，是否确定放弃赎回？","@func_fangqi,"..par..","..huodeyuanbao,"@show")
end

function func_fangqi(actor,par,huodeyuanbao)
	--sendmsg9(actor,par.."  "..huodeyuanbao)
	huodeyuanbao = tonumber(huodeyuanbao)
	addingot(actor,huodeyuanbao)
	setint(actor,"典当时间"..par,0)
	setint(actor,"放弃赎回"..par,1)
	sendmsg9(actor,"放弃赎回成功")
	return show(actor)
end

function dangru(actor,par)
	if getingot(actor) < 10000 then
		sendmsg9(actor,"你没有1万元宝")
		return 
	end
	subingot(actor,10000)
	addbindgold(actor,1000000)
	setint(actor,"典当时间"..par,os.time())
	sendmsg9(actor,"典当成功")
	setint(actor,"当铺可看利息",1)
	return show(actor)
end

function shuhui(actor,par)
	local diandangtime = getint(actor,"典当时间"..par)
	local dangqiantime = os.time() --现在时间
	local shijiancha = dangqiantime - diandangtime --秒时间差
	local xiaoshicha = math.ceil(shijiancha/3600) --小时差 
	local lixitime = xiaoshicha - 8 --利息的小时
	if lixitime >= 20 then
		setint(actor,"典当时间"..par,0)
		sendmsg9(actor,"已过可赎回时间")
		return show(actor)
	end
	local lixi = 0
	if lixitime > 0 then
		lixi = lixitime * 500
	end
	
	if itemcount(actor,"金条") < 1 then
		sendmsg9(actor,"赎回元宝需1根金条")
		return show(actor)
	end
	takeitem(actor,"金条",1)
	addingot(actor,10000-lixi)
	setint(actor,"典当时间"..par,0)
	sendmsg9(actor,"赎回成功")
	
	return show(actor)
end