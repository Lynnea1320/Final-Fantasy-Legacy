client
	default_verb_category="Social"
	fps = 60
	Northeast()
		if(!istype(usr,/mob/PC)) return
		var/mob/PC/M=usr
		if(!M.inbattle&&!M.inmenu) M.screen("menu")
	Northwest()
		if(!istype(usr,/mob/PC)&&!istype(usr,/mob/character)) return
		var/mob/PC/M=usr
		if(M.inmenu)
			switch(M.inmenu)
			//CHARACTER MENU
				if("character_menu")
					M.close_screen("character_menu_slot1")
					M.close_screen("character_menu_slot2")
					M.close_screen("character_menu_slot3")
					M.close_screen("character_menu_slot4")
					M.close_screen("character_menu_type")
					if(M.menuaction=="Load")
						spawn(10) if(M&&M.inmenu=="intro_screen") M.screen_textl(5,13,1,1,16,24,2,0,"� 1991 SQU�RE","intro_screen")
						M.inmenu="intro_screen"
					else M.inmenu=null
					M.menuaction=null
					M.menupos=null
					del(M.curser)
				if("character_newgame_toggle"){M.character_screen("character_menu")}
				if("character_create"){M.close_screen("character_create_info");M.close_screen("character_create");M.character_screen("character_menu")}
				if("character_name")
					if(!M.menuaction) M.menuaction = M.input_box
					else M.menuaction = copytext(M.menuaction,1,length(M.menuaction))
					M.namingway_refresh(M.menuaction)
			//MAIN MENU
				if("menu")
					M.close_screen("menu_s1")
					M.close_screen("menu_s2")
					M.close_screen("menu_s3")
					M.close_screen("menu_s4")
					M.close_screen("menu_s5")
					M.close_screen("menu")
					M.inmenu=null
					M.menupos=0
					del(M.curser)
				if("item","menu_target","magic_type")
					M.close_screen("item")
					M.close_screen("magic_type")
					M.btl_action = null
					M.inmenu="menu"
					for(var/obj/onscreen/curser/C in M.client.screen) del(C)
					M.curser = new(M.client)
					M.menupos=1
					M.curser.screen_loc="13,16:8"
				if("magic")
					M.close_screen("magic_cost")
					M.close_screen("magic")
					M.inmenu="magic_type"
					M.menupos=1
					M.curser.screen_loc="1:13,16:16"
				if("equip")
					M.close_screen("equip")
					M.inmenu="menu"
					M.menupos=1
					M.curser.screen_loc="13,16:8"
				if("equiplist")
					M.close_screen("equiplist")
					M.inmenu="equip"
					M.menupos=1
					M.curser.screen_loc="2,15:8"
				if("status")
					M.close_screen("status")
					M.screen("menu")
				if("trade")
					M.close_screen("trade")
					M.inmenu="menu"
					M.menupos=1
					M.curser.screen_loc="13,16:8"
				if("teleport")
					M.close_screen("teleport")
					M.inmenu = null
					del(M.curser)
			//BANK CODE
				if("bank")
					M.close_screen("bank")
					M.close_screen("bankmessage")
					M.inmenu=null
					M.menupos=0
					del(M.curser)
				if("bankaction")
					M.close_screen("bankaction")
					M.inmenu="bank"
					M.screen_textl(3,5,13.5,13.5,0,0,5,,"Item","bank")
					M.screen_textl(6.5,8.5,13.5,13.5,0,0,5,,"Gold","bank")
					M.menupos=1
					M.curser.screen_loc="2,13:8"
				if("bank_item")
					M.close_screen("bank_item")
					M.menuaction="item"
					M.inmenu="bankaction"
					M.menupos=1
					M.curser.screen_loc="2,13:8"
					for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="bankmessage") del O
					M.screen_textl(3,16,15.5,15.5,0,0,5,,"What do you want?","bankmessage")
				if("bank_gold")
					M.close_screen("bank_gold")
					M.close_screen("bank_gold_numbox")
					M.menuaction="gold"
					M.inmenu="bankaction"
					M.menupos=1
					M.curser.screen_loc="2,13:8"
					for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="bankmessage") del O
					M.screen_textl(3,16,15.5,15.5,0,0,5,,"What do you want?","bankmessage")
			// SHOP CODE
				if("shop")
					M.close_screen("shop_gold")
					M.close_screen("shop")
					M.close_screen("shopmessage")
					M.close_screen("shoptitle")
					M.close_screen("shop_party")
					M.inmenu=null
					M.menupos=0
					del(M.curser)
				if("shopbuy")
					M.close_screen("shopbuy")
					M.inmenu="shop"
					M.menupos=1
					M.curser.screen_loc="2,13:8"
				if("shopbuynum")
					M.close_screen("shopbuynum_price")
					M.close_screen("shopbuynum_numbox")
					M.close_screen("shopbuynum")
					M.inmenu="shopbuy"
					M.menupos=1
					M.curser.screen_loc="2,11:8"
				if("shopsell")
					M.close_screen("shopsell")
					M.inmenu="shop"
					M.menupos=1
					M.curser.screen_loc="2,13:8"
				if("shopsellnum")
					M.close_screen("shopsellnum_price")
					M.close_screen("shopsellnum_numbox")
					M.close_screen("shopsellnum")
					M.inmenu="shopsell"
					M.menupos=1
					M.curser.screen_loc="2,11:8"
			// BATTLE CODE
				if("battle_left_menu","battle_right_menu")
					M.close_screen(M.inmenu)
					switch(M.menupos)
						if(1) M.curser.screen_loc="3:16,6:-8"
						if(2) M.curser.screen_loc="3:16,5:-4"
						if(3) M.curser.screen_loc="3:16,4"
						if(4) M.curser.screen_loc="3:16,3:4"
						if(5) M.curser.screen_loc="3:16,2:8"
					M.inmenu="battle_menu"
				if("battle_target")
					for(var/obj/onscreen/curser/O in M.client.screen) del(O)
					if(istype(M.btl_action,/obj/Ability/ASkills))
						M.menulist = new()
						for(var/A in typesof(M.btl_action.parent_type))
							if(A!=M.btl_action.parent_type)
								var/obj/Ability/O = new A
								if(M.level>=O.LvlNeed) M.menulist+=O
						M.curser=new(M.client)
						M.menupos=1
						M.curser.screen_loc="2,6:16"
						M.inmenu="battle_askills"
					else	//going in the action menu
						M.curser=new(M.client)
						M.menupos=1
						M.curser.screen_loc="3:16,6:-8"
						M.inmenu="battle_menu"
				if("battle_askills")
					M.close_screen("battle_askills")
					M.close_screen("battle_askills_cost")
					M.menupos=1
					M.curser.screen_loc="3:16,6:-8"
					M.inmenu="battle_menu"
				if("battle_item")
					M.close_screen("battle_item")
					M.menupos=1
					M.curser.screen_loc="3:16,6:-8"
					M.inmenu="battle_menu"
				if("battle_dart")
					M.close_screen("battle_dart")
					M.menupos=1
					M.curser.screen_loc="3:16,6:-8"
					M.inmenu="battle_menu"
				if("monster_drop")
					M.close_screen("monster_drop_menu")
					M.close_screen("monster_drop")
					for(var/i = 0, i<10, i++) M.close_screen("monster_drop[i]")
					M.inmenu = "panel"
					M.menupos=1
					del(M.curser)
				if("monster_drop_tp")
					M.close_screen("monster_drop_tp")
					M.inmenu = "monster_drop"
					M.menuanswer = null
					M.menupos = 1
					M.curser.screen_loc = "3,12:8"
	Southwest(){return}
	Southeast(){return}
	//control keys
	North()
		if(!istype(usr,/mob/PC)&&!istype(usr,/mob/character))
			usr.density=0
		var/mob/PC/M=usr
		if(!M.inbattle&&!M.inmenu&&M.inparty&&M.inparty!=1) return //??????????????
		if(M.inmenu)
			switch(M.inmenu)
			//CHARACTER MENU
				if("character_menu")
					M.menupos--
					if(M.menupos<1) M.menupos=4
					switch(M.menupos)
						if(0) M.curser.screen_loc="1:16,16:8"
						if(1) M.curser.screen_loc="1:16,14:8"
						if(2) M.curser.screen_loc="1:16,10:8"
						if(3) M.curser.screen_loc="1:16,6:8"
						if(4) M.curser.screen_loc="1:16,2:8"
				if("character_create")
					if(M.menupos<6) return
					else M.menupos-=5
					switch(M.menupos)
						if(1) M.curser.screen_loc="1,14:16"
						if(2) M.curser.screen_loc="4:8,14:16"
						if(3) M.curser.screen_loc="7:16,14:16"
						if(4) M.curser.screen_loc="10:24,14:16"
						if(5) M.curser.screen_loc="14,14:16"
						if(6) M.curser.screen_loc="1,13"
						if(7) M.curser.screen_loc="4:8,13"
						if(8) M.curser.screen_loc="7:16,13"
						if(9) M.curser.screen_loc="10:24,13"
						if(10) M.curser.screen_loc="14,13"
						if(11) M.curser.screen_loc="1,12:-16"
						if(12) M.curser.screen_loc="4:8,12:-16"
						if(13) M.curser.screen_loc="7:16,12:-16"
						if(14) M.curser.screen_loc="10:24,12:-16"
						if(15) M.curser.screen_loc="14,12:-16"
					M.character_screen("character_create_refresh")
				if("character_name")
					if(M.menupos>72) M.menupos=67
					else if(M.menupos>71) M.menupos=66
					else if(M.menupos>67) M.menupos-=7
					else if(M.menupos>66) M.menupos-=8
					else M.menupos-=10
					if(M.menupos<1) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="4,10:12";if(2) M.curser.screen_loc="5,10:12";if(3) M.curser.screen_loc="6,10:12";if(4) M.curser.screen_loc="7,10:12";if(5) M.curser.screen_loc="8,10:12";if(6) M.curser.screen_loc="9:16,10:12";if(7) M.curser.screen_loc="10:16,10:12";if(8) M.curser.screen_loc="11:16,10:12";if(9) M.curser.screen_loc="12:16,10:12";if(10) M.curser.screen_loc="13:16,10:12";if(11) M.curser.screen_loc="4,9:12";if(12) M.curser.screen_loc="5,9:12"
						if(13) M.curser.screen_loc="6,9:12";if(14) M.curser.screen_loc="7,9:12";if(15) M.curser.screen_loc="8,9:12";if(16) M.curser.screen_loc="9:16,9:12";if(17) M.curser.screen_loc="10:16,9:12";if(18) M.curser.screen_loc="11:16,9:12";if(19) M.curser.screen_loc="12:16,9:12";if(20) M.curser.screen_loc="13:16,9:12";if(21) M.curser.screen_loc="4,8:12";if(22) M.curser.screen_loc="5,8:12";if(23) M.curser.screen_loc="6,8:12";if(24) M.curser.screen_loc="7,8:12"
						if(25) M.curser.screen_loc="8,8:12";if(26) M.curser.screen_loc="9:16,8:12";if(27) M.curser.screen_loc="10:16,8:12";if(28) M.curser.screen_loc="11:16,8:12";if(29) M.curser.screen_loc="12:16,8:12";if(30) M.curser.screen_loc="13:16,8:12";if(31) M.curser.screen_loc="4,7:12";if(32) M.curser.screen_loc="5,7:12";if(33) M.curser.screen_loc="6,7:12";if(34) M.curser.screen_loc="7,7:12";if(35) M.curser.screen_loc="8,7:12";if(36) M.curser.screen_loc="9:16,7:12"
						if(37) M.curser.screen_loc="10:16,7:12";if(38) M.curser.screen_loc="11:16,7:12";if(39) M.curser.screen_loc="12:16,7:12";if(40) M.curser.screen_loc="13:16,7:12";if(41) M.curser.screen_loc="4,6:12";if(42) M.curser.screen_loc="5,6:12";if(43) M.curser.screen_loc="6,6:12";if(44) M.curser.screen_loc="7,6:12";if(45) M.curser.screen_loc="8,6:12";if(46) M.curser.screen_loc="9:16,6:12";if(47) M.curser.screen_loc="10:16,6:12";if(48) M.curser.screen_loc="11:16,6:12"
						if(49) M.curser.screen_loc="12:16,6:12";if(50) M.curser.screen_loc="13:16,6:12";if(51) M.curser.screen_loc="4,5:12";if(52) M.curser.screen_loc="5,5:12";if(53) M.curser.screen_loc="6,5:12";if(54) M.curser.screen_loc="7,5:12";if(55) M.curser.screen_loc="8,5:12";if(56) M.curser.screen_loc="9:16,5:12";if(57) M.curser.screen_loc="10:16,5:12";if(58) M.curser.screen_loc="11:16,5:12";if(59) M.curser.screen_loc="12:16,5:12";if(60) M.curser.screen_loc="13:16,5:12"
						if(61) M.curser.screen_loc="4,4:12";if(62) M.curser.screen_loc="5,4:12";if(63) M.curser.screen_loc="6,4:12";if(64) M.curser.screen_loc="7,4:12";if(65) M.curser.screen_loc="8,4:12";if(66) M.curser.screen_loc="9:16,4:12";if(67) M.curser.screen_loc="12:16,4:12";if(68) M.curser.screen_loc="4,3:12";if(69) M.curser.screen_loc="5,3:12";if(70) M.curser.screen_loc="6,3:12";if(71) M.curser.screen_loc="7,3:12";if(72) M.curser.screen_loc="9:16,3:12";if(73) M.curser.screen_loc="12:16,3:12"
				if("character_load_delete")
					M.menupos--
					if(M.menupos<=0) M.menupos=2
					switch(M.menupos)
						if(1) M.curser.screen_loc="12,9:8"
						if(2) M.curser.screen_loc="12,8:8"
			//MAIN MENU
				if("menu")
					M.menupos--
					if(M.menupos<=0) M.menupos=9
					else if(M.menupos>=10) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="13,16:8"
						if(2) M.curser.screen_loc="13,15:8"
						if(3) M.curser.screen_loc="13,14:8"
						if(4) M.curser.screen_loc="13,13:8"
						if(5) M.curser.screen_loc="13,12:8"
						if(6) M.curser.screen_loc="13,11:8"
						if(7) M.curser.screen_loc="13,10:8"
						if(8) M.curser.screen_loc="13,9:8"
						if(9) M.curser.screen_loc="13,8:8"
				if("item")
					M.menupos-=2
					if(M.menupos<0) M.menupos=19
					else if(M.menupos==0) M.menupos=20
					switch(M.menupos)
						if(1) M.curser.screen_loc="1,14:8"
						if(2) M.curser.screen_loc="9,14:8"
						if(3) M.curser.screen_loc="1,13:8"
						if(4) M.curser.screen_loc="9,13:8"
						if(5) M.curser.screen_loc="1,12:8"
						if(6) M.curser.screen_loc="9,12:8"
						if(7) M.curser.screen_loc="1,11:8"
						if(8) M.curser.screen_loc="9,11:8"
						if(9) M.curser.screen_loc="1,10:8"
						if(10) M.curser.screen_loc="9,10:8"
						if(11) M.curser.screen_loc="1,9:8"
						if(12) M.curser.screen_loc="9,9:8"
						if(13) M.curser.screen_loc="1,8:8"
						if(14) M.curser.screen_loc="9,8:8"
						if(15) M.curser.screen_loc="1,7:8"
						if(16) M.curser.screen_loc="9,7:8"
						if(17) M.curser.screen_loc="1,6:8"
						if(18) M.curser.screen_loc="9,6:8"
						if(19) M.curser.screen_loc="1,5:8"
						if(20) M.curser.screen_loc="9,5:8"
				if("menu_target") M.menu_target("N")
				if("magic_type")
					M.menupos--
					if(M.menupos<1) M.menupos = 3
					switch(M.menupos)
						if(1) M.curser.screen_loc="1:16,16:16"
						if(2) M.curser.screen_loc="1:16,15:24"
						if(3) M.curser.screen_loc="1:16,15"
				if("magic")
					M.menupos-=3
					if(M.menupos<1)
						M.menupos += (round(length(M.menulist) / 3) * 3)
						if(length(M.menulist)>=(M.menupos+3)) M.menupos += max(1,(length(M.menulist) % 3) + 1)
					switch(M.menupos)
						if(1) M.curser.screen_loc="2:8,11:16"
						if(2) M.curser.screen_loc="6:24,11:16"
						if(3) M.curser.screen_loc="11:8,11:16"
						if(4) M.curser.screen_loc="2:8,10:24"
						if(5) M.curser.screen_loc="6:24,10:24"
						if(6) M.curser.screen_loc="11:8,10:24"
						if(7) M.curser.screen_loc="2:8,10"
						if(8) M.curser.screen_loc="6:24,10"
						if(9) M.curser.screen_loc="11:8,10"
						if(10) M.curser.screen_loc="2:8,9:8"
						if(11) M.curser.screen_loc="6:24,9:8"
						if(12) M.curser.screen_loc="11:8,9:8"
						if(13) M.curser.screen_loc="2:8,8:16"
						if(14) M.curser.screen_loc="6:24,8:16"
						if(15) M.curser.screen_loc="11:8,8:16"
						if(16) M.curser.screen_loc="2:8,7:24"
						if(17) M.curser.screen_loc="6:24,7:24"
						if(18) M.curser.screen_loc="11:8,7:24"
						if(19) M.curser.screen_loc="2:8,7"
						if(20) M.curser.screen_loc="6:24,7"
						if(21) M.curser.screen_loc="11:8,7"
					M.screen("magic_cost")
				if("equip")
					M.menupos--
					if(M.menupos<=0) M.menupos=5
					else if(M.menupos>=6) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="7,16:8"
						if(2) M.curser.screen_loc="7,15:8"
						if(3) M.curser.screen_loc="7,14:8"
						if(4) M.curser.screen_loc="7,13:8"
						if(5) M.curser.screen_loc="7,12:8"
				if("equiplist")
					M.menupos-=2
					if(M.menupos<0) M.menupos=9
					else if(M.menupos==0) M.menupos=10
					//if(M.menupos>11) M.menupos=2
					//else if(M.menupos==11) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="1,9:8"
						if(2) M.curser.screen_loc="9,9:8"
						if(3) M.curser.screen_loc="1,8:8"
						if(4) M.curser.screen_loc="9,8:8"
						if(5) M.curser.screen_loc="1,7:8"
						if(6) M.curser.screen_loc="9,7:8"
						if(7) M.curser.screen_loc="1,6:8"
						if(8) M.curser.screen_loc="9,6:8"
						if(9) M.curser.screen_loc="1,5:8"
						if(10) M.curser.screen_loc="9,5:8"
				if("status") return
				if("teleport")
					M.menupos--
					if(M.menupos<1) M.menupos=6
					switch(M.menupos)
						if(1) M.curser.screen_loc="3,11:16"
						if(2) M.curser.screen_loc="3,10:16"
						if(3) M.curser.screen_loc="3,9:16"
						if(4) M.curser.screen_loc="3,8:16"
						if(5) M.curser.screen_loc="3,7:16"
						if(6) M.curser.screen_loc="3,6:16"
			//BANK CODE
				if("bank_item")
					M.menupos-=2
					if(M.menupos<0) M.menupos=19
					else if(M.menupos==0) M.menupos=20
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,11:8"
						if(2) M.curser.screen_loc="9,11:8"
						if(3) M.curser.screen_loc="2,10:8"
						if(4) M.curser.screen_loc="9,10:8"
						if(5) M.curser.screen_loc="2,9:8"
						if(6) M.curser.screen_loc="9,9:8"
						if(7) M.curser.screen_loc="2,8:8"
						if(8) M.curser.screen_loc="9,8:8"
						if(9) M.curser.screen_loc="2,7:8"
						if(10) M.curser.screen_loc="9,7:8"
						if(11) M.curser.screen_loc="2,6:8"
						if(12) M.curser.screen_loc="9,6:8"
						if(13) M.curser.screen_loc="2,5:8"
						if(14) M.curser.screen_loc="9,5:8"
						if(15) M.curser.screen_loc="2,4:8"
						if(16) M.curser.screen_loc="9,4:8"
						if(17) M.curser.screen_loc="2,3:8"
						if(18) M.curser.screen_loc="9,3:8"
						if(19) M.curser.screen_loc="2,2:8"
						if(20) M.curser.screen_loc="9,2:8"
				if("bank_gold")
					switch(M.menupos)
						if(1) M.input_box+=1000000
						if(2) M.input_box+=100000
						if(3) M.input_box+=10000
						if(4) M.input_box+=1000
						if(5) M.input_box+=100
						if(6) M.input_box+=10
						if(7) M.input_box+=1
					if(M.menuaction=="gold give")
						if(M.input_box>M.gold) M.input_box=M.gold
						if(M.input_box+M.goldinbank>GPLimit)
							M.input_box=GPLimit-M.goldinbank
							M.inmenu="bank_message"
							for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="bankmessage") del O
							M.screen_textl(3,16,15.5,15.5,0,0,5,,"I got already enough!","bankmessage")
							spawn(20)
								for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="bankmessage") del O
								M.screen_textl(3,16,15.5,15.5,0,0,5,,"Give how much?","bankmessage")
								M.inmenu="bank_gold"
					else if(M.menuaction=="gold take")
						if(M.input_box>M.goldinbank) M.input_box=M.goldinbank
						if(M.input_box+M.gold>GPLimit)
							M.input_box=GPLimit-M.gold
							M.inmenu="bank_message"
							for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="bankmessage") del O
							M.screen_textl(3,16,15.5,15.5,0,0,5,,"You cannot hold more gold.","bankmessage")
							spawn(20)
								for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="bankmessage") del O
								M.screen_textl(3,16,15.5,15.5,0,0,5,,"Take how much?","bankmessage")
								M.inmenu="bank_gold"
					M.bank_screen("bank_gold_refresh")
			// SHOP CODE
				if("shopbuy")
					M.menupos--
					if(M.menupos<=0) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,11:8"
						if(2) M.curser.screen_loc="2,10:8"
						if(3) M.curser.screen_loc="2,9:8"
						if(4) M.curser.screen_loc="2,8:8"
						if(5) M.curser.screen_loc="2,7:8"
						if(6) M.curser.screen_loc="2,6:8"
						if(7) M.curser.screen_loc="2,5:8"
						if(8) M.curser.screen_loc="2,4:8"
						if(9) M.curser.screen_loc="2,3:8"
						if(10) M.curser.screen_loc="2,2:8"
				if("shopbuynum")
					switch(M.menupos)
						if(1) M.input_box+=10
						if(2) M.input_box+=1
					if(M.input_box>max_grouped_item)
						M.inmenu="shopmessage"
						for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
						M.screen_textl(8,16,15.5,15.5,0,0,5,,"Can't hold more.","shopmessage")
						spawn(20)
							for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
							M.screen_textl(8,16,15.5,15.5,0,0,5,,"Which one?","shopmessage")
							M.inmenu="shopbuynum"
						M.input_box = max_grouped_item
					if(M.input_box*M.shopitem.value > M.gold)
						M.inmenu="shopmessage"
						for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
						M.screen_textl(8,16,15.5,15.5,0,0,5,,"Not enough GP!","shopmessage")
						spawn(20)
							for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
							M.screen_textl(8,16,15.5,15.5,0,0,5,,"Which one?","shopmessage")
							M.inmenu="shopbuynum"
						M.input_box = min(max_grouped_item,round(text2num(copytext("[M.gold / M.shopitem.value]",1,7))))
					var/obj/Ability/O = locate(M.shopitem.type) in M.contents
					if(O&&text2num(O.suffix)+M.input_box>max_grouped_item)
						if(M.inmenu!="shopmessage")
							M.inmenu="shopmessage"
							for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
							M.screen_textl(8,16,15.5,15.5,0,0,5,,"Can't hold more.","shopmessage")
							spawn(20)
								for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
								M.screen_textl(8,16,15.5,15.5,0,0,5,,"Which one?","shopmessage")
								M.inmenu="shopbuynum"
						M.input_box = max_grouped_item - text2num(O.suffix)
					M.shop_screen("shopbuynum_refresh")
				if("shopsell")
					M.menupos-=2
					if(M.menupos<0) M.menupos=19
					else if(M.menupos==0) M.menupos=20
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,11:8"
						if(2) M.curser.screen_loc="9,11:8"
						if(3) M.curser.screen_loc="2,10:8"
						if(4) M.curser.screen_loc="9,10:8"
						if(5) M.curser.screen_loc="2,9:8"
						if(6) M.curser.screen_loc="9,9:8"
						if(7) M.curser.screen_loc="2,8:8"
						if(8) M.curser.screen_loc="9,8:8"
						if(9) M.curser.screen_loc="2,7:8"
						if(10) M.curser.screen_loc="9,7:8"
						if(11) M.curser.screen_loc="2,6:8"
						if(12) M.curser.screen_loc="9,6:8"
						if(13) M.curser.screen_loc="2,5:8"
						if(14) M.curser.screen_loc="9,5:8"
						if(15) M.curser.screen_loc="2,4:8"
						if(16) M.curser.screen_loc="9,4:8"
						if(17) M.curser.screen_loc="2,3:8"
						if(18) M.curser.screen_loc="9,3:8"
						if(19) M.curser.screen_loc="2,2:8"
						if(20) M.curser.screen_loc="9,2:8"
				if("shopsellnum")
					if(!istype(M.shopitem,/obj/Ability/Basic)) return
					switch(M.menupos)
						if(1) M.input_box+=10
						if(2) M.input_box+=1
					if(M.input_box>text2num(M.shopitem.suffix))
						M.inmenu="shopmessage"
						for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
						M.screen_textl(8,16,15.5,15.5,0,0,5,,"No more to sell.","shopmessage")
						spawn(20)
							for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
							M.screen_textl(8,16,15.5,15.5,0,0,5,,"Which one?","shopmessage")
							M.inmenu="shopsellnum"
						M.input_box = text2num(M.shopitem.suffix)
					M.shop_screen("shopsellnum_refresh")
			// COMMON CODE
				if("yesno","character_delete")
					M.menupos--
					if(M.menupos<=0) M.menupos=2
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,10:8"
						if(2) M.curser.screen_loc="2,9:8"
			// BATTLE CODE
				if("battle_target") M.btl_target(M.btl_action,"N")
				if("battle_menu")
					M.menupos--
					if(M.menupos<=0) M.menupos=length(M.action)
					while(!M.action[M.menupos]) M.menupos--
					switch(M.menupos)
						if(1) M.curser.screen_loc="3:16,6:-8"
						if(2) M.curser.screen_loc="3:16,5:-4"
						if(3) M.curser.screen_loc="3:16,4"
						if(4) M.curser.screen_loc="3:16,3:4"
						if(5) M.curser.screen_loc="3:16,2:8"
				if("battle_askills")
					M.menupos-=3
					if(M.menupos<1) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,6:16";if(2) M.curser.screen_loc="6:16,6:16";if(3) M.curser.screen_loc="11,6:16"
						if(4) M.curser.screen_loc="2,6:-2";if(5) M.curser.screen_loc="6:16,6:-2";if(6) M.curser.screen_loc="11,6:-2"
						if(7) M.curser.screen_loc="2,5:12";if(8) M.curser.screen_loc="6:16,5:12";if(9) M.curser.screen_loc="11,5:12"
						if(10) M.curser.screen_loc="2,5:-6";if(11) M.curser.screen_loc="6:16,5:-6";if(12) M.curser.screen_loc="11,5:-6"
						if(13) M.curser.screen_loc="2,4:8";if(14) M.curser.screen_loc="6:16,4:8";if(15) M.curser.screen_loc="11,4:8"
						if(16) M.curser.screen_loc="2,4:-10";if(17) M.curser.screen_loc="6:16,4:-10";if(18) M.curser.screen_loc="11,4:-10"
						if(19) M.curser.screen_loc="2,3:4";if(20) M.curser.screen_loc="6:16,3:4";if(21) M.curser.screen_loc="11,3:4"
					M.battle_screen("battle_askills_cost_refresh")
				if("battle_item")
					M.menupos--
					if(M.menupos<=0) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="5:16,9:8"
						if(2) M.curser.screen_loc="5:16,8:8"
						if(3) M.curser.screen_loc="5:16,7:8"
						if(4) M.curser.screen_loc="5:16,6:8"
						if(5) M.curser.screen_loc="5:16,5:8"
				if("battle_dart")
					M.menupos--
					if(M.menupos<=0) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="5:16,9:8"
						if(2) M.curser.screen_loc="5:16,8:8"
						if(3) M.curser.screen_loc="5:16,7:8"
						if(4) M.curser.screen_loc="5:16,6:8"
						if(5) M.curser.screen_loc="5:16,5:8"
				if("monster_drop")
					M.menupos-=2
					if(M.menupos<1) M.menupos = 1
					switch(M.menupos)
						if(1) M.curser.screen_loc = "3,11:8"
						if(2) M.curser.screen_loc = "9,11:8"
						if(3) M.curser.screen_loc = "3,10:8"
						if(4) M.curser.screen_loc = "9,10:8"
						if(5) M.curser.screen_loc = "3,9:8"
						if(6) M.curser.screen_loc = "9,9:8"
						if(7) M.curser.screen_loc = "3,8:8"
						if(8) M.curser.screen_loc = "9,8:8"
						if(9) M.curser.screen_loc = "3,7:8"
						if(10) M.curser.screen_loc = "9,7:8"
			// MINI-GAME CODE
				// CHOCOBO RACES
				if("chocobo_race_menu")
					M.menupos--
					if(M.menupos<=0) M.menupos=3
					switch(M.menupos)
						if(1) M.curser.screen_loc="4:16,12:8"
						if(2) M.curser.screen_loc="4:16,11:8"
						if(3) M.curser.screen_loc="4:16,10:8"
				if("chocobo_race_menu_feed")
					M.menupos--
					if(M.menupos<=0) M.menupos=6
					switch(M.menupos)
						if(1) M.curser.screen_loc="5,12:8"
						if(2) M.curser.screen_loc="5,11:8"
						if(3) M.curser.screen_loc="5,10:8"
						if(4) M.curser.screen_loc="5,9:8"
						if(5) M.curser.screen_loc="5,8:8"
						if(6) M.curser.screen_loc="5,7:8"
				if("chocobo_race")
					M.current_speed += M.acceleration/12
					if(M.current_speed>M.top_speed) M.current_speed = M.top_speed
				else return
			return
		..()
	South()
		if(!istype(usr,/mob/PC)&&!istype(usr,/mob/character))
			usr.density=0
		var/mob/PC/M=usr
		if(!M.inbattle&&!M.inmenu&&M.inparty&&M.inparty!=1) return
		if(M.inmenu)
			switch(M.inmenu)
			//CHARACTER MENU
				if("character_menu")
					M.menupos++
					if(M.menupos>4) M.menupos=1
					switch(M.menupos)
						if(0) M.curser.screen_loc="1:16,16:8"
						if(1) M.curser.screen_loc="1:16,14:8"
						if(2) M.curser.screen_loc="1:16,10:8"
						if(3) M.curser.screen_loc="1:16,6:8"
						if(4) M.curser.screen_loc="1:16,2:8"
				if("character_create")
					if(M.menupos>10) return
					else M.menupos+=5
					switch(M.menupos)
						if(1) M.curser.screen_loc="1,14:16"
						if(2) M.curser.screen_loc="4:8,14:16"
						if(3) M.curser.screen_loc="7:16,14:16"
						if(4) M.curser.screen_loc="10:24,14:16"
						if(5) M.curser.screen_loc="14,14:16"
						if(6) M.curser.screen_loc="1,13"
						if(7) M.curser.screen_loc="4:8,13"
						if(8) M.curser.screen_loc="7:16,13"
						if(9) M.curser.screen_loc="10:24,13"
						if(10) M.curser.screen_loc="14,13"
						if(11) M.curser.screen_loc="1,12:-16"
						if(12) M.curser.screen_loc="4:8,12:-16"
						if(13) M.curser.screen_loc="7:16,12:-16"
						if(14) M.curser.screen_loc="10:24,12:-16"
						if(15) M.curser.screen_loc="14,12:-16"
					M.character_screen("character_create_refresh")
				if("character_name")
					if(M.menupos<57) M.menupos+=10
					else if(M.menupos<58) M.menupos+=9
					else if(M.menupos<60) M.menupos+=8
					else if(M.menupos<65) M.menupos+=7
					else if(M.menupos<67) M.menupos+=6
					else M.menupos+=10
					if(M.menupos>73) M.menupos=73
					switch(M.menupos)
						if(1) M.curser.screen_loc="4,10:12";if(2) M.curser.screen_loc="5,10:12";if(3) M.curser.screen_loc="6,10:12";if(4) M.curser.screen_loc="7,10:12";if(5) M.curser.screen_loc="8,10:12";if(6) M.curser.screen_loc="9:16,10:12";if(7) M.curser.screen_loc="10:16,10:12";if(8) M.curser.screen_loc="11:16,10:12";if(9) M.curser.screen_loc="12:16,10:12";if(10) M.curser.screen_loc="13:16,10:12";if(11) M.curser.screen_loc="4,9:12";if(12) M.curser.screen_loc="5,9:12"
						if(13) M.curser.screen_loc="6,9:12";if(14) M.curser.screen_loc="7,9:12";if(15) M.curser.screen_loc="8,9:12";if(16) M.curser.screen_loc="9:16,9:12";if(17) M.curser.screen_loc="10:16,9:12";if(18) M.curser.screen_loc="11:16,9:12";if(19) M.curser.screen_loc="12:16,9:12";if(20) M.curser.screen_loc="13:16,9:12";if(21) M.curser.screen_loc="4,8:12";if(22) M.curser.screen_loc="5,8:12";if(23) M.curser.screen_loc="6,8:12";if(24) M.curser.screen_loc="7,8:12"
						if(25) M.curser.screen_loc="8,8:12";if(26) M.curser.screen_loc="9:16,8:12";if(27) M.curser.screen_loc="10:16,8:12";if(28) M.curser.screen_loc="11:16,8:12";if(29) M.curser.screen_loc="12:16,8:12";if(30) M.curser.screen_loc="13:16,8:12";if(31) M.curser.screen_loc="4,7:12";if(32) M.curser.screen_loc="5,7:12";if(33) M.curser.screen_loc="6,7:12";if(34) M.curser.screen_loc="7,7:12";if(35) M.curser.screen_loc="8,7:12";if(36) M.curser.screen_loc="9:16,7:12"
						if(37) M.curser.screen_loc="10:16,7:12";if(38) M.curser.screen_loc="11:16,7:12";if(39) M.curser.screen_loc="12:16,7:12";if(40) M.curser.screen_loc="13:16,7:12";if(41) M.curser.screen_loc="4,6:12";if(42) M.curser.screen_loc="5,6:12";if(43) M.curser.screen_loc="6,6:12";if(44) M.curser.screen_loc="7,6:12";if(45) M.curser.screen_loc="8,6:12";if(46) M.curser.screen_loc="9:16,6:12";if(47) M.curser.screen_loc="10:16,6:12";if(48) M.curser.screen_loc="11:16,6:12"
						if(49) M.curser.screen_loc="12:16,6:12";if(50) M.curser.screen_loc="13:16,6:12";if(51) M.curser.screen_loc="4,5:12";if(52) M.curser.screen_loc="5,5:12";if(53) M.curser.screen_loc="6,5:12";if(54) M.curser.screen_loc="7,5:12";if(55) M.curser.screen_loc="8,5:12";if(56) M.curser.screen_loc="9:16,5:12";if(57) M.curser.screen_loc="10:16,5:12";if(58) M.curser.screen_loc="11:16,5:12";if(59) M.curser.screen_loc="12:16,5:12";if(60) M.curser.screen_loc="13:16,5:12"
						if(61) M.curser.screen_loc="4,4:12";if(62) M.curser.screen_loc="5,4:12";if(63) M.curser.screen_loc="6,4:12";if(64) M.curser.screen_loc="7,4:12";if(65) M.curser.screen_loc="8,4:12";if(66) M.curser.screen_loc="9:16,4:12";if(67) M.curser.screen_loc="12:16,4:12";if(68) M.curser.screen_loc="4,3:12";if(69) M.curser.screen_loc="5,3:12";if(70) M.curser.screen_loc="6,3:12";if(71) M.curser.screen_loc="7,3:12";if(72) M.curser.screen_loc="9:16,3:12";if(73) M.curser.screen_loc="12:16,3:12"
				if("character_load_delete")
					M.menupos++
					if(M.menupos>2) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="12,9:8"
						if(2) M.curser.screen_loc="12,8:8"
			//MAIN MENU
				if("menu")
					M.menupos++
					if(M.menupos>=10) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="13,16:8"
						if(2) M.curser.screen_loc="13,15:8"
						if(3) M.curser.screen_loc="13,14:8"
						if(4) M.curser.screen_loc="13,13:8"
						if(5) M.curser.screen_loc="13,12:8"
						if(6) M.curser.screen_loc="13,11:8"
						if(7) M.curser.screen_loc="13,10:8"
						if(8) M.curser.screen_loc="13,9:8"
						if(9) M.curser.screen_loc="13,8:8"
				if("item")
					M.menupos+=2
					if(M.menupos>21) M.menupos=2
					else if(M.menupos==21) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="1,14:8"
						if(2) M.curser.screen_loc="9,14:8"
						if(3) M.curser.screen_loc="1,13:8"
						if(4) M.curser.screen_loc="9,13:8"
						if(5) M.curser.screen_loc="1,12:8"
						if(6) M.curser.screen_loc="9,12:8"
						if(7) M.curser.screen_loc="1,11:8"
						if(8) M.curser.screen_loc="9,11:8"
						if(9) M.curser.screen_loc="1,10:8"
						if(10) M.curser.screen_loc="9,10:8"
						if(11) M.curser.screen_loc="1,9:8"
						if(12) M.curser.screen_loc="9,9:8"
						if(13) M.curser.screen_loc="1,8:8"
						if(14) M.curser.screen_loc="9,8:8"
						if(15) M.curser.screen_loc="1,7:8"
						if(16) M.curser.screen_loc="9,7:8"
						if(17) M.curser.screen_loc="1,6:8"
						if(18) M.curser.screen_loc="9,6:8"
						if(19) M.curser.screen_loc="1,5:8"
						if(20) M.curser.screen_loc="9,5:8"
				if("menu_target") M.menu_target("S")
				if("magic_type")
					M.menupos++
					if(M.menupos>3) M.menupos = 1
					switch(M.menupos)
						if(1) M.curser.screen_loc="1:16,16:16"
						if(2) M.curser.screen_loc="1:16,15:24"
						if(3) M.curser.screen_loc="1:16,15"
				if("magic")
					M.menupos+=3
					if(M.menupos>length(M.menulist))
						M.menupos = (M.menupos % 3)
						if(!M.menupos) M.menupos = 3
					switch(M.menupos)
						if(1) M.curser.screen_loc="2:8,11:16"
						if(2) M.curser.screen_loc="6:24,11:16"
						if(3) M.curser.screen_loc="11:8,11:16"
						if(4) M.curser.screen_loc="2:8,10:24"
						if(5) M.curser.screen_loc="6:24,10:24"
						if(6) M.curser.screen_loc="11:8,10:24"
						if(7) M.curser.screen_loc="2:8,10"
						if(8) M.curser.screen_loc="6:24,10"
						if(9) M.curser.screen_loc="11:8,10"
						if(10) M.curser.screen_loc="2:8,9:8"
						if(11) M.curser.screen_loc="6:24,9:8"
						if(12) M.curser.screen_loc="11:8,9:8"
						if(13) M.curser.screen_loc="2:8,8:16"
						if(14) M.curser.screen_loc="6:24,8:16"
						if(15) M.curser.screen_loc="11:8,8:16"
						if(16) M.curser.screen_loc="2:8,7:24"
						if(17) M.curser.screen_loc="6:24,7:24"
						if(18) M.curser.screen_loc="11:8,7:24"
						if(19) M.curser.screen_loc="2:8,7"
						if(20) M.curser.screen_loc="6:24,7"
						if(21) M.curser.screen_loc="11:8,7"
					M.screen("magic_cost")
				if("equip")
					M.menupos++
					if(M.menupos>=6) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="7,16:8"
						if(2) M.curser.screen_loc="7,15:8"
						if(3) M.curser.screen_loc="7,14:8"
						if(4) M.curser.screen_loc="7,13:8"
						if(5) M.curser.screen_loc="7,12:8"
				if("equiplist")
					M.menupos+=2
					if(M.menupos>11) M.menupos=2
					else if(M.menupos==11) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="1,9:8"
						if(2) M.curser.screen_loc="9,9:8"
						if(3) M.curser.screen_loc="1,8:8"
						if(4) M.curser.screen_loc="9,8:8"
						if(5) M.curser.screen_loc="1,7:8"
						if(6) M.curser.screen_loc="9,7:8"
						if(7) M.curser.screen_loc="1,6:8"
						if(8) M.curser.screen_loc="9,6:8"
						if(9) M.curser.screen_loc="1,5:8"
						if(10) M.curser.screen_loc="9,5:8"
				if("status") return
				if("teleport")
					M.menupos++
					if(M.menupos>6) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="3,11:16"
						if(2) M.curser.screen_loc="3,10:16"
						if(3) M.curser.screen_loc="3,9:16"
						if(4) M.curser.screen_loc="3,8:16"
						if(5) M.curser.screen_loc="3,7:16"
						if(6) M.curser.screen_loc="3,6:16"
			//BANK CODE
				if("bank_item")
					M.menupos+=2
					if(M.menupos>21) M.menupos=2
					else if(M.menupos==21) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,11:8"
						if(2) M.curser.screen_loc="9,11:8"
						if(3) M.curser.screen_loc="2,10:8"
						if(4) M.curser.screen_loc="9,10:8"
						if(5) M.curser.screen_loc="2,9:8"
						if(6) M.curser.screen_loc="9,9:8"
						if(7) M.curser.screen_loc="2,8:8"
						if(8) M.curser.screen_loc="9,8:8"
						if(9) M.curser.screen_loc="2,7:8"
						if(10) M.curser.screen_loc="9,7:8"
						if(11) M.curser.screen_loc="2,6:8"
						if(12) M.curser.screen_loc="9,6:8"
						if(13) M.curser.screen_loc="2,5:8"
						if(14) M.curser.screen_loc="9,5:8"
						if(15) M.curser.screen_loc="2,4:8"
						if(16) M.curser.screen_loc="9,4:8"
						if(17) M.curser.screen_loc="2,3:8"
						if(18) M.curser.screen_loc="9,3:8"
						if(19) M.curser.screen_loc="2,2:8"
						if(20) M.curser.screen_loc="9,2:8"
				if("bank_gold")
					switch(M.menupos)
						if(1) M.input_box-=1000000
						if(2) M.input_box-=100000
						if(3) M.input_box-=10000
						if(4) M.input_box-=1000
						if(5) M.input_box-=100
						if(6) M.input_box-=10
						if(7) M.input_box-=1
					if(M.input_box<1) M.input_box=0
					M.bank_screen("bank_gold_refresh")
			// SHOP CODE
				if("shopbuy")
					M.menupos++
					if(M.menupos>10) M.menupos=10
					if((M.menuaction + M.menupos - 1)>length(M.menulist)) M.menupos=length(M.menulist) - M.menuaction + 1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,11:8"
						if(2) M.curser.screen_loc="2,10:8"
						if(3) M.curser.screen_loc="2,9:8"
						if(4) M.curser.screen_loc="2,8:8"
						if(5) M.curser.screen_loc="2,7:8"
						if(6) M.curser.screen_loc="2,6:8"
						if(7) M.curser.screen_loc="2,5:8"
						if(8) M.curser.screen_loc="2,4:8"
						if(9) M.curser.screen_loc="2,3:8"
						if(10) M.curser.screen_loc="2,2:8"
				if("shopbuynum")
					switch(M.menupos)
						if(1) M.input_box-=10
						if(2) M.input_box-=1
					if(M.input_box<1) M.input_box=0
					M.shop_screen("shopbuynum_refresh")
				if("shopsell")
					M.menupos+=2
					if(M.menupos>21) M.menupos=2
					else if(M.menupos==21) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,11:8"
						if(2) M.curser.screen_loc="9,11:8"
						if(3) M.curser.screen_loc="2,10:8"
						if(4) M.curser.screen_loc="9,10:8"
						if(5) M.curser.screen_loc="2,9:8"
						if(6) M.curser.screen_loc="9,9:8"
						if(7) M.curser.screen_loc="2,8:8"
						if(8) M.curser.screen_loc="9,8:8"
						if(9) M.curser.screen_loc="2,7:8"
						if(10) M.curser.screen_loc="9,7:8"
						if(11) M.curser.screen_loc="2,6:8"
						if(12) M.curser.screen_loc="9,6:8"
						if(13) M.curser.screen_loc="2,5:8"
						if(14) M.curser.screen_loc="9,5:8"
						if(15) M.curser.screen_loc="2,4:8"
						if(16) M.curser.screen_loc="9,4:8"
						if(17) M.curser.screen_loc="2,3:8"
						if(18) M.curser.screen_loc="9,3:8"
						if(19) M.curser.screen_loc="2,2:8"
						if(20) M.curser.screen_loc="9,2:8"
				if("shopsellnum")
					if(!istype(M.shopitem,/obj/Ability/Basic)) return
					switch(M.menupos)
						if(1) M.input_box-=10
						if(2) M.input_box-=1
					if(M.input_box<1) M.input_box=0
					M.shop_screen("shopsellnum_refresh")
			// COMMON CODE
				if("yesno","character_delete")
					M.menupos++
					if(M.menupos>2) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,10:8"
						if(2) M.curser.screen_loc="2,9:8"
			// BATTLE CODE
				if("battle_target") M.btl_target(M.btl_action,"S")
				if("battle_menu")
					M.menupos++
					if(M.menupos>5) M.menupos=1
					while(!M.action[M.menupos]) M.menupos++
					switch(M.menupos)
						if(1) M.curser.screen_loc="3:16,6:-8"
						if(2) M.curser.screen_loc="3:16,5:-4"
						if(3) M.curser.screen_loc="3:16,4"
						if(4) M.curser.screen_loc="3:16,3:4"
						if(5) M.curser.screen_loc="3:16,2:8"
				if("battle_askills")
					M.menupos+=3
					if(M.menupos>length(M.menulist)) M.menupos=length(M.menulist)
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,6:16";if(2) M.curser.screen_loc="6:16,6:16";if(3) M.curser.screen_loc="11,6:16"
						if(4) M.curser.screen_loc="2,6:-2";if(5) M.curser.screen_loc="6:16,6:-2";if(6) M.curser.screen_loc="11,6:-2"
						if(7) M.curser.screen_loc="2,5:12";if(8) M.curser.screen_loc="6:16,5:12";if(9) M.curser.screen_loc="11,5:12"
						if(10) M.curser.screen_loc="2,5:-6";if(11) M.curser.screen_loc="6:16,5:-6";if(12) M.curser.screen_loc="11,5:-6"
						if(13) M.curser.screen_loc="2,4:8";if(14) M.curser.screen_loc="6:16,4:8";if(15) M.curser.screen_loc="11,4:8"
						if(16) M.curser.screen_loc="2,4:-10";if(17) M.curser.screen_loc="6:16,4:-10";if(18) M.curser.screen_loc="11,4:-10"
						if(19) M.curser.screen_loc="2,3:4";if(20) M.curser.screen_loc="6:16,3:4";if(21) M.curser.screen_loc="11,3:4"
					M.battle_screen("battle_askills_cost_refresh")
				if("battle_item")
					M.menupos++
					if(M.menupos>5) M.menupos=5
					switch(M.menupos)
						if(1) M.curser.screen_loc="5:16,9:8"
						if(2) M.curser.screen_loc="5:16,8:8"
						if(3) M.curser.screen_loc="5:16,7:8"
						if(4) M.curser.screen_loc="5:16,6:8"
						if(5) M.curser.screen_loc="5:16,5:8"
				if("battle_dart")
					M.menupos++
					if(M.menupos>5) M.menupos=5
					switch(M.menupos)
						if(1) M.curser.screen_loc="5:16,9:8"
						if(2) M.curser.screen_loc="5:16,8:8"
						if(3) M.curser.screen_loc="5:16,7:8"
						if(4) M.curser.screen_loc="5:16,6:8"
						if(5) M.curser.screen_loc="5:16,5:8"
				if("monster_drop")
					M.menupos+=2
					if(M.menupos>10) M.menupos = 10
					switch(M.menupos)
						if(1) M.curser.screen_loc = "3,12:8"
						if(2) M.curser.screen_loc = "9,12:8"
						if(3) M.curser.screen_loc = "3,11:8"
						if(4) M.curser.screen_loc = "9,11:8"
						if(5) M.curser.screen_loc = "3,10:8"
						if(6) M.curser.screen_loc = "9,10:8"
						if(7) M.curser.screen_loc = "3,9:8"
						if(8) M.curser.screen_loc = "9,9:8"
						if(9) M.curser.screen_loc = "3,8:8"
						if(10) M.curser.screen_loc = "9,8:8"
			// MINI-GAME
				//CHOCOBO RACES
				if("chocobo_race_menu")
					M.menupos++
					if(M.menupos>3) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="4:16,12:8"
						if(2) M.curser.screen_loc="4:16,11:8"
						if(3) M.curser.screen_loc="4:16,10:8"
				if("chocobo_race_menu_feed")
					M.menupos++
					if(M.menupos>6) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="5,12:8"
						if(2) M.curser.screen_loc="5,11:8"
						if(3) M.curser.screen_loc="5,10:8"
						if(4) M.curser.screen_loc="5,9:8"
						if(5) M.curser.screen_loc="5,8:8"
						if(6) M.curser.screen_loc="5,7:8"
				if("chocobo_race")
					M.current_speed -= M.top_speed/12
					if(M.current_speed<0) M.current_speed = 0
				else return
			return
		..()
	East()
		if(!istype(usr,/mob/PC)&&!istype(usr,/mob/character))
			usr.density=0
		var/mob/PC/M=usr
		if(!M.inbattle&&!M.inmenu&&M.inparty&&M.inparty!=1) return
		if(M.inmenu)
			switch(M.inmenu)
			//CHARACTER MENU
				if("character_newgame_toggle")
					M.menupos++
					switch(M.menupos)
						if(1) M.curser.screen_loc = "1:16,16:8"
						if(2) M.curser.screen_loc = "9:16,16:8"
					if(M.menupos<2) M.menupos=1
				if("character_create")
					if(M.menupos==5) return
					else if(M.menupos==10) return
					else if(M.menupos==15) return
					else M.menupos+=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="1,14:16"
						if(2) M.curser.screen_loc="4:8,14:16"
						if(3) M.curser.screen_loc="7:16,14:16"
						if(4) M.curser.screen_loc="10:24,14:16"
						if(5) M.curser.screen_loc="14,14:16"
						if(6) M.curser.screen_loc="1,13"
						if(7) M.curser.screen_loc="4:8,13"
						if(8) M.curser.screen_loc="7:16,13"
						if(9) M.curser.screen_loc="10:24,13"
						if(10) M.curser.screen_loc="14,13"
						if(11) M.curser.screen_loc="1,12:-16"
						if(12) M.curser.screen_loc="4:8,12:-16"
						if(13) M.curser.screen_loc="7:16,12:-16"
						if(14) M.curser.screen_loc="10:24,12:-16"
						if(15) M.curser.screen_loc="14,12:-16"
					M.character_screen("character_create_refresh")
				if("character_name")
					M.menupos++
					if(M.menupos>73) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="4,10:12";if(2) M.curser.screen_loc="5,10:12";if(3) M.curser.screen_loc="6,10:12";if(4) M.curser.screen_loc="7,10:12";if(5) M.curser.screen_loc="8,10:12";if(6) M.curser.screen_loc="9:16,10:12";if(7) M.curser.screen_loc="10:16,10:12";if(8) M.curser.screen_loc="11:16,10:12";if(9) M.curser.screen_loc="12:16,10:12";if(10) M.curser.screen_loc="13:16,10:12";if(11) M.curser.screen_loc="4,9:12";if(12) M.curser.screen_loc="5,9:12"
						if(13) M.curser.screen_loc="6,9:12";if(14) M.curser.screen_loc="7,9:12";if(15) M.curser.screen_loc="8,9:12";if(16) M.curser.screen_loc="9:16,9:12";if(17) M.curser.screen_loc="10:16,9:12";if(18) M.curser.screen_loc="11:16,9:12";if(19) M.curser.screen_loc="12:16,9:12";if(20) M.curser.screen_loc="13:16,9:12";if(21) M.curser.screen_loc="4,8:12";if(22) M.curser.screen_loc="5,8:12";if(23) M.curser.screen_loc="6,8:12";if(24) M.curser.screen_loc="7,8:12"
						if(25) M.curser.screen_loc="8,8:12";if(26) M.curser.screen_loc="9:16,8:12";if(27) M.curser.screen_loc="10:16,8:12";if(28) M.curser.screen_loc="11:16,8:12";if(29) M.curser.screen_loc="12:16,8:12";if(30) M.curser.screen_loc="13:16,8:12";if(31) M.curser.screen_loc="4,7:12";if(32) M.curser.screen_loc="5,7:12";if(33) M.curser.screen_loc="6,7:12";if(34) M.curser.screen_loc="7,7:12";if(35) M.curser.screen_loc="8,7:12";if(36) M.curser.screen_loc="9:16,7:12"
						if(37) M.curser.screen_loc="10:16,7:12";if(38) M.curser.screen_loc="11:16,7:12";if(39) M.curser.screen_loc="12:16,7:12";if(40) M.curser.screen_loc="13:16,7:12";if(41) M.curser.screen_loc="4,6:12";if(42) M.curser.screen_loc="5,6:12";if(43) M.curser.screen_loc="6,6:12";if(44) M.curser.screen_loc="7,6:12";if(45) M.curser.screen_loc="8,6:12";if(46) M.curser.screen_loc="9:16,6:12";if(47) M.curser.screen_loc="10:16,6:12";if(48) M.curser.screen_loc="11:16,6:12"
						if(49) M.curser.screen_loc="12:16,6:12";if(50) M.curser.screen_loc="13:16,6:12";if(51) M.curser.screen_loc="4,5:12";if(52) M.curser.screen_loc="5,5:12";if(53) M.curser.screen_loc="6,5:12";if(54) M.curser.screen_loc="7,5:12";if(55) M.curser.screen_loc="8,5:12";if(56) M.curser.screen_loc="9:16,5:12";if(57) M.curser.screen_loc="10:16,5:12";if(58) M.curser.screen_loc="11:16,5:12";if(59) M.curser.screen_loc="12:16,5:12";if(60) M.curser.screen_loc="13:16,5:12"
						if(61) M.curser.screen_loc="4,4:12";if(62) M.curser.screen_loc="5,4:12";if(63) M.curser.screen_loc="6,4:12";if(64) M.curser.screen_loc="7,4:12";if(65) M.curser.screen_loc="8,4:12";if(66) M.curser.screen_loc="9:16,4:12";if(67) M.curser.screen_loc="12:16,4:12";if(68) M.curser.screen_loc="4,3:12";if(69) M.curser.screen_loc="5,3:12";if(70) M.curser.screen_loc="6,3:12";if(71) M.curser.screen_loc="7,3:12";if(72) M.curser.screen_loc="9:16,3:12";if(73) M.curser.screen_loc="12:16,3:12"
			//MAIN MENU
				if("item")
					M.menupos++
					if(M.menupos>20) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="1,14:8"
						if(2) M.curser.screen_loc="9,14:8"
						if(3) M.curser.screen_loc="1,13:8"
						if(4) M.curser.screen_loc="9,13:8"
						if(5) M.curser.screen_loc="1,12:8"
						if(6) M.curser.screen_loc="9,12:8"
						if(7) M.curser.screen_loc="1,11:8"
						if(8) M.curser.screen_loc="9,11:8"
						if(9) M.curser.screen_loc="1,10:8"
						if(10) M.curser.screen_loc="9,10:8"
						if(11) M.curser.screen_loc="1,9:8"
						if(12) M.curser.screen_loc="9,9:8"
						if(13) M.curser.screen_loc="1,8:8"
						if(14) M.curser.screen_loc="9,8:8"
						if(15) M.curser.screen_loc="1,7:8"
						if(16) M.curser.screen_loc="9,7:8"
						if(17) M.curser.screen_loc="1,6:8"
						if(18) M.curser.screen_loc="9,6:8"
						if(19) M.curser.screen_loc="1,5:8"
						if(20) M.curser.screen_loc="9,5:8"
				if("magic")
					M.menupos++
					if(M.menupos>length(M.menulist)) M.menupos = 1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2:8,11:16"
						if(2) M.curser.screen_loc="6:24,11:16"
						if(3) M.curser.screen_loc="11:8,11:16"
						if(4) M.curser.screen_loc="2:8,10:24"
						if(5) M.curser.screen_loc="6:24,10:24"
						if(6) M.curser.screen_loc="11:8,10:24"
						if(7) M.curser.screen_loc="2:8,10"
						if(8) M.curser.screen_loc="6:24,10"
						if(9) M.curser.screen_loc="11:8,10"
						if(10) M.curser.screen_loc="2:8,9:8"
						if(11) M.curser.screen_loc="6:24,9:8"
						if(12) M.curser.screen_loc="11:8,9:8"
						if(13) M.curser.screen_loc="2:8,8:16"
						if(14) M.curser.screen_loc="6:24,8:16"
						if(15) M.curser.screen_loc="11:8,8:16"
						if(16) M.curser.screen_loc="2:8,7:24"
						if(17) M.curser.screen_loc="6:24,7:24"
						if(18) M.curser.screen_loc="11:8,7:24"
						if(19) M.curser.screen_loc="2:8,7"
						if(20) M.curser.screen_loc="6:24,7"
						if(21) M.curser.screen_loc="11:8,7"
					M.screen("magic_cost")
				if("menu_target") M.menu_target("E")
				if("equiplist")
					M.menupos++
					if(M.menupos>10) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,9:8"
						if(2) M.curser.screen_loc="9,9:8"
						if(3) M.curser.screen_loc="2,8:8"
						if(4) M.curser.screen_loc="9,8:8"
						if(5) M.curser.screen_loc="2,7:8"
						if(6) M.curser.screen_loc="9,7:8"
						if(7) M.curser.screen_loc="2,6:8"
						if(8) M.curser.screen_loc="9,6:8"
						if(9) M.curser.screen_loc="2,5:8"
						if(10) M.curser.screen_loc="9,5:8"
				if("teleport") if(length(M.menulist) >= (M.menuaction+6)) M.screen("teleport",M.menuaction + 6)
			//BANK CODE
				if("bank")
					M.menupos++
					if(M.menupos>2) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,13:8"
						if(2) M.curser.screen_loc="5:16,13:8"
				if("bankaction")
					M.menupos++
					if(M.menupos>2) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,13:8"
						if(2) M.curser.screen_loc="5:16,13:8"
				if("bank_item")
					M.menupos++
					if(M.menupos>20) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,11:8"
						if(2) M.curser.screen_loc="9,11:8"
						if(3) M.curser.screen_loc="2,10:8"
						if(4) M.curser.screen_loc="9,10:8"
						if(5) M.curser.screen_loc="2,9:8"
						if(6) M.curser.screen_loc="9,9:8"
						if(7) M.curser.screen_loc="2,8:8"
						if(8) M.curser.screen_loc="9,8:8"
						if(9) M.curser.screen_loc="2,7:8"
						if(10) M.curser.screen_loc="9,7:8"
						if(11) M.curser.screen_loc="2,6:8"
						if(12) M.curser.screen_loc="9,6:8"
						if(13) M.curser.screen_loc="2,5:8"
						if(14) M.curser.screen_loc="9,5:8"
						if(15) M.curser.screen_loc="2,4:8"
						if(16) M.curser.screen_loc="9,4:8"
						if(17) M.curser.screen_loc="2,3:8"
						if(18) M.curser.screen_loc="9,3:8"
						if(19) M.curser.screen_loc="2,2:8"
						if(20) M.curser.screen_loc="9,2:8"
				if("bank_gold")
					M.menupos++
					if(M.menupos>7) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="6,11:8"
						if(2) M.curser.screen_loc="6:16,11:8"
						if(3) M.curser.screen_loc="7,11:8"
						if(4) M.curser.screen_loc="7:16,11:8"
						if(5) M.curser.screen_loc="8,11:8"
						if(6) M.curser.screen_loc="8:16,11:8"
						if(7) M.curser.screen_loc="9,11:8"
			//SHOP CODE
				if("shop")
					M.menupos++
					if(M.menupos>3) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,13:8"
						if(2) M.curser.screen_loc="4:16,13:8"
						if(3) M.curser.screen_loc="7:16,13:8"
				if("shopbuy")
					if(length(M.menulist)>=M.menuaction+10)
						M.shop_screen("shopbuy",M.menuaction+10)
						M.menupos=1
						M.curser.screen_loc="2,11:8"
				if("shopbuynum")
					M.menupos++
					if(M.menupos>2) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="9:16,9:8"
						if(2) M.curser.screen_loc="10,9:8"
				if("shopsell")
					M.menupos++
					if(M.menupos>20) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,11:8"
						if(2) M.curser.screen_loc="9,11:8"
						if(3) M.curser.screen_loc="2,10:8"
						if(4) M.curser.screen_loc="9,10:8"
						if(5) M.curser.screen_loc="2,9:8"
						if(6) M.curser.screen_loc="9,9:8"
						if(7) M.curser.screen_loc="2,8:8"
						if(8) M.curser.screen_loc="9,8:8"
						if(9) M.curser.screen_loc="2,7:8"
						if(10) M.curser.screen_loc="9,7:8"
						if(11) M.curser.screen_loc="2,6:8"
						if(12) M.curser.screen_loc="9,6:8"
						if(13) M.curser.screen_loc="2,5:8"
						if(14) M.curser.screen_loc="9,5:8"
						if(15) M.curser.screen_loc="2,4:8"
						if(16) M.curser.screen_loc="9,4:8"
						if(17) M.curser.screen_loc="2,3:8"
						if(18) M.curser.screen_loc="9,3:8"
						if(19) M.curser.screen_loc="2,2:8"
						if(20) M.curser.screen_loc="9,2:8"
				if("shopsellnum")
					if(!istype(M.shopitem,/obj/Ability/Basic)) return
					M.menupos++
					if(M.menupos>2) M.menupos=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="9:16,9:8"
						if(2) M.curser.screen_loc="10,9:8"
			// BATTLE CODE
				if("battle_menu") M.battle_screen("battle_right_menu")
				if("battle_left_menu") M.client.Northwest()
				if("battle_askills")
					M.menupos++
					if(M.menupos>length(M.menulist)) M.menupos = 1
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,6:16";if(2) M.curser.screen_loc="6:16,6:16";if(3) M.curser.screen_loc="11,6:16"
						if(4) M.curser.screen_loc="2,6:-2";if(5) M.curser.screen_loc="6:16,6:-2";if(6) M.curser.screen_loc="11,6:-2"
						if(7) M.curser.screen_loc="2,5:12";if(8) M.curser.screen_loc="6:16,5:12";if(9) M.curser.screen_loc="11,5:12"
						if(10) M.curser.screen_loc="2,5:-6";if(11) M.curser.screen_loc="6:16,5:-6";if(12) M.curser.screen_loc="11,5:-6"
						if(13) M.curser.screen_loc="2,4:8";if(14) M.curser.screen_loc="6:16,4:8";if(15) M.curser.screen_loc="11,4:8"
						if(16) M.curser.screen_loc="2,4:-10";if(17) M.curser.screen_loc="6:16,4:-10";if(18) M.curser.screen_loc="11,4:-10"
						if(19) M.curser.screen_loc="2,3:4";if(20) M.curser.screen_loc="6:16,3:4";if(21) M.curser.screen_loc="11,3:4"
					M.battle_screen("battle_askills_cost_refresh")
				if("battle_target") M.btl_target(M.btl_action,"E")
				if("battle_item")
					if(length(M.menulist)>=M.menuaction+5) M.battle_screen("battle_item_refresh",M.menuaction+5)
				if("battle_dart")
					if(length(M.menulist)>=M.menuaction+5) M.battle_screen("battle_dart_refresh",M.menuaction+5)
				if("monster_drop")
					M.menupos++
					if(M.menupos>10) M.menupos = 10
					switch(M.menupos)
						if(1) M.curser.screen_loc = "3,12:8"
						if(2) M.curser.screen_loc = "9,12:8"
						if(3) M.curser.screen_loc = "3,11:8"
						if(4) M.curser.screen_loc = "9,11:8"
						if(5) M.curser.screen_loc = "3,10:8"
						if(6) M.curser.screen_loc = "9,10:8"
						if(7) M.curser.screen_loc = "3,9:8"
						if(8) M.curser.screen_loc = "9,9:8"
						if(9) M.curser.screen_loc = "3,8:8"
						if(10) M.curser.screen_loc = "9,8:8"
				if("monster_drop_tp")
					M.menupos++
					if(M.menupos>2) M.menupos = 1
					switch(M.menupos)
						if(1) M.curser.screen_loc = "9,14:8"
						if(2) M.curser.screen_loc = "12,14:8"
			// MINI-GAME CODE
				// CHOCOBO RACES
				if("chocobo_race") M.direction+=M.turning
				else return
			return
		..()
	West()
		if(!istype(usr,/mob/PC)&&!istype(usr,/mob/character))
			usr.density=0
		var/mob/PC/M=usr
		if(!M.inbattle&&!M.inmenu&&M.inparty&&M.inparty!=1) return
		if(M.inmenu)
			switch(M.inmenu)
			//CHARACTER MENU
				if("character_newgame_toggle")
					M.menupos--
					if(M.menupos<1) M.menupos=2
					switch(M.menupos)
						if(1) M.curser.screen_loc = "1:16,16:8"
						if(2) M.curser.screen_loc = "9:16,16:8"
				if("character_create")
					if(M.menupos==1) return
					else if(M.menupos==6) return
					else if(M.menupos==11) return
					else M.menupos-=1
					switch(M.menupos)
						if(1) M.curser.screen_loc="1,14:16"
						if(2) M.curser.screen_loc="4:8,14:16"
						if(3) M.curser.screen_loc="7:16,14:16"
						if(4) M.curser.screen_loc="10:24,14:16"
						if(5) M.curser.screen_loc="14,14:16"
						if(6) M.curser.screen_loc="1,13"
						if(7) M.curser.screen_loc="4:8,13"
						if(8) M.curser.screen_loc="7:16,13"
						if(9) M.curser.screen_loc="10:24,13"
						if(10) M.curser.screen_loc="14,13"
						if(11) M.curser.screen_loc="1,12:-16"
						if(12) M.curser.screen_loc="4:8,12:-16"
						if(13) M.curser.screen_loc="7:16,12:-16"
						if(14) M.curser.screen_loc="10:24,12:-16"
						if(15) M.curser.screen_loc="14,12:-16"
					M.character_screen("character_create_refresh")
				if("character_name")
					M.menupos--
					if(M.menupos<1) M.menupos=73
					switch(M.menupos)
						if(1) M.curser.screen_loc="4,10:12";if(2) M.curser.screen_loc="5,10:12";if(3) M.curser.screen_loc="6,10:12";if(4) M.curser.screen_loc="7,10:12";if(5) M.curser.screen_loc="8,10:12";if(6) M.curser.screen_loc="9:16,10:12";if(7) M.curser.screen_loc="10:16,10:12";if(8) M.curser.screen_loc="11:16,10:12";if(9) M.curser.screen_loc="12:16,10:12";if(10) M.curser.screen_loc="13:16,10:12";if(11) M.curser.screen_loc="4,9:12";if(12) M.curser.screen_loc="5,9:12"
						if(13) M.curser.screen_loc="6,9:12";if(14) M.curser.screen_loc="7,9:12";if(15) M.curser.screen_loc="8,9:12";if(16) M.curser.screen_loc="9:16,9:12";if(17) M.curser.screen_loc="10:16,9:12";if(18) M.curser.screen_loc="11:16,9:12";if(19) M.curser.screen_loc="12:16,9:12";if(20) M.curser.screen_loc="13:16,9:12";if(21) M.curser.screen_loc="4,8:12";if(22) M.curser.screen_loc="5,8:12";if(23) M.curser.screen_loc="6,8:12";if(24) M.curser.screen_loc="7,8:12"
						if(25) M.curser.screen_loc="8,8:12";if(26) M.curser.screen_loc="9:16,8:12";if(27) M.curser.screen_loc="10:16,8:12";if(28) M.curser.screen_loc="11:16,8:12";if(29) M.curser.screen_loc="12:16,8:12";if(30) M.curser.screen_loc="13:16,8:12";if(31) M.curser.screen_loc="4,7:12";if(32) M.curser.screen_loc="5,7:12";if(33) M.curser.screen_loc="6,7:12";if(34) M.curser.screen_loc="7,7:12";if(35) M.curser.screen_loc="8,7:12";if(36) M.curser.screen_loc="9:16,7:12"
						if(37) M.curser.screen_loc="10:16,7:12";if(38) M.curser.screen_loc="11:16,7:12";if(39) M.curser.screen_loc="12:16,7:12";if(40) M.curser.screen_loc="13:16,7:12";if(41) M.curser.screen_loc="4,6:12";if(42) M.curser.screen_loc="5,6:12";if(43) M.curser.screen_loc="6,6:12";if(44) M.curser.screen_loc="7,6:12";if(45) M.curser.screen_loc="8,6:12";if(46) M.curser.screen_loc="9:16,6:12";if(47) M.curser.screen_loc="10:16,6:12";if(48) M.curser.screen_loc="11:16,6:12"
						if(49) M.curser.screen_loc="12:16,6:12";if(50) M.curser.screen_loc="13:16,6:12";if(51) M.curser.screen_loc="4,5:12";if(52) M.curser.screen_loc="5,5:12";if(53) M.curser.screen_loc="6,5:12";if(54) M.curser.screen_loc="7,5:12";if(55) M.curser.screen_loc="8,5:12";if(56) M.curser.screen_loc="9:16,5:12";if(57) M.curser.screen_loc="10:16,5:12";if(58) M.curser.screen_loc="11:16,5:12";if(59) M.curser.screen_loc="12:16,5:12";if(60) M.curser.screen_loc="13:16,5:12"
						if(61) M.curser.screen_loc="4,4:12";if(62) M.curser.screen_loc="5,4:12";if(63) M.curser.screen_loc="6,4:12";if(64) M.curser.screen_loc="7,4:12";if(65) M.curser.screen_loc="8,4:12";if(66) M.curser.screen_loc="9:16,4:12";if(67) M.curser.screen_loc="12:16,4:12";if(68) M.curser.screen_loc="4,3:12";if(69) M.curser.screen_loc="5,3:12";if(70) M.curser.screen_loc="6,3:12";if(71) M.curser.screen_loc="7,3:12";if(72) M.curser.screen_loc="9:16,3:12";if(73) M.curser.screen_loc="12:16,3:12"
			//MAIN MENU
				if("item")
					M.menupos--
					if(M.menupos<1) M.menupos=20
					switch(M.menupos)
						if(1) M.curser.screen_loc="1,14:8"
						if(2) M.curser.screen_loc="9,14:8"
						if(3) M.curser.screen_loc="1,13:8"
						if(4) M.curser.screen_loc="9,13:8"
						if(5) M.curser.screen_loc="1,12:8"
						if(6) M.curser.screen_loc="9,12:8"
						if(7) M.curser.screen_loc="1,11:8"
						if(8) M.curser.screen_loc="9,11:8"
						if(9) M.curser.screen_loc="1,10:8"
						if(10) M.curser.screen_loc="9,10:8"
						if(11) M.curser.screen_loc="1,9:8"
						if(12) M.curser.screen_loc="9,9:8"
						if(13) M.curser.screen_loc="1,8:8"
						if(14) M.curser.screen_loc="9,8:8"
						if(15) M.curser.screen_loc="1,7:8"
						if(16) M.curser.screen_loc="9,7:8"
						if(17) M.curser.screen_loc="1,6:8"
						if(18) M.curser.screen_loc="9,6:8"
						if(19) M.curser.screen_loc="1,5:8"
						if(20) M.curser.screen_loc="9,5:8"
				if("magic")
					M.menupos--
					if(M.menupos<1) M.menupos = length(M.menulist)
					switch(M.menupos)
						if(1) M.curser.screen_loc="2:8,11:16"
						if(2) M.curser.screen_loc="6:24,11:16"
						if(3) M.curser.screen_loc="11:8,11:16"
						if(4) M.curser.screen_loc="2:8,10:24"
						if(5) M.curser.screen_loc="6:24,10:24"
						if(6) M.curser.screen_loc="11:8,10:24"
						if(7) M.curser.screen_loc="2:8,10"
						if(8) M.curser.screen_loc="6:24,10"
						if(9) M.curser.screen_loc="11:8,10"
						if(10) M.curser.screen_loc="2:8,9:8"
						if(11) M.curser.screen_loc="6:24,9:8"
						if(12) M.curser.screen_loc="11:8,9:8"
						if(13) M.curser.screen_loc="2:8,8:16"
						if(14) M.curser.screen_loc="6:24,8:16"
						if(15) M.curser.screen_loc="11:8,8:16"
						if(16) M.curser.screen_loc="2:8,7:24"
						if(17) M.curser.screen_loc="6:24,7:24"
						if(18) M.curser.screen_loc="11:8,7:24"
						if(19) M.curser.screen_loc="2:8,7"
						if(20) M.curser.screen_loc="6:24,7"
						if(21) M.curser.screen_loc="11:8,7"
					M.screen("magic_cost")
				if("menu_target") M.menu_target("W")
				if("equiplist")
					M.menupos--
					if(M.menupos<1) M.menupos=10
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,9:8"
						if(2) M.curser.screen_loc="9,9:8"
						if(3) M.curser.screen_loc="2,8:8"
						if(4) M.curser.screen_loc="9,8:8"
						if(5) M.curser.screen_loc="2,7:8"
						if(6) M.curser.screen_loc="9,7:8"
						if(7) M.curser.screen_loc="2,6:8"
						if(8) M.curser.screen_loc="9,6:8"
						if(9) M.curser.screen_loc="2,5:8"
						if(10) M.curser.screen_loc="9,5:8"
				if("teleport") if(M.menuaction>1) M.screen("teleport",M.menuaction - 6)
			//BANK CODE
				if("bank")
					M.menupos--
					if(M.menupos<1) M.menupos=2
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,13:8"
						if(2) M.curser.screen_loc="5:16,13:8"
				if("bankaction")
					M.menupos--
					if(M.menupos<1) M.menupos=2
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,13:8"
						if(2) M.curser.screen_loc="5:16,13:8"
				if("bank_item")
					M.menupos--
					if(M.menupos<1) M.menupos=20
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,11:8"
						if(2) M.curser.screen_loc="9,11:8"
						if(3) M.curser.screen_loc="2,10:8"
						if(4) M.curser.screen_loc="9,10:8"
						if(5) M.curser.screen_loc="2,9:8"
						if(6) M.curser.screen_loc="9,9:8"
						if(7) M.curser.screen_loc="2,8:8"
						if(8) M.curser.screen_loc="9,8:8"
						if(9) M.curser.screen_loc="2,7:8"
						if(10) M.curser.screen_loc="9,7:8"
						if(11) M.curser.screen_loc="2,6:8"
						if(12) M.curser.screen_loc="9,6:8"
						if(13) M.curser.screen_loc="2,5:8"
						if(14) M.curser.screen_loc="9,5:8"
						if(15) M.curser.screen_loc="2,4:8"
						if(16) M.curser.screen_loc="9,4:8"
						if(17) M.curser.screen_loc="2,3:8"
						if(18) M.curser.screen_loc="9,3:8"
						if(19) M.curser.screen_loc="2,2:8"
						if(20) M.curser.screen_loc="9,2:8"
				if("bank_gold")
					M.menupos--
					if(M.menupos<1) M.menupos=7
					switch(M.menupos)
						if(1) M.curser.screen_loc="6,11:8"
						if(2) M.curser.screen_loc="6:16,11:8"
						if(3) M.curser.screen_loc="7,11:8"
						if(4) M.curser.screen_loc="7:16,11:8"
						if(5) M.curser.screen_loc="8,11:8"
						if(6) M.curser.screen_loc="8:16,11:8"
						if(7) M.curser.screen_loc="9,11:8"
			// SHOP CODE
				if("shop")
					M.menupos--
					if(M.menupos<1) M.menupos=3
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,13:8"
						if(2) M.curser.screen_loc="4:16,13:8"
						if(3) M.curser.screen_loc="7:16,13:8"
				if("shopbuy")
					if(M.menuaction>1)
						M.shop_screen("shopbuy",M.menuaction-10)
						M.menupos=1
						M.curser.screen_loc="2,11:8"
				if("shopbuynum")
					M.menupos--
					if(M.menupos<1) M.menupos=2
					switch(M.menupos)
						if(1) M.curser.screen_loc="9:16,9:8"
						if(2) M.curser.screen_loc="10,9:8"
				if("shopsell")
					M.menupos--
					if(M.menupos<1) M.menupos=20
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,11:8"
						if(2) M.curser.screen_loc="9,11:8"
						if(3) M.curser.screen_loc="2,10:8"
						if(4) M.curser.screen_loc="9,10:8"
						if(5) M.curser.screen_loc="2,9:8"
						if(6) M.curser.screen_loc="9,9:8"
						if(7) M.curser.screen_loc="2,8:8"
						if(8) M.curser.screen_loc="9,8:8"
						if(9) M.curser.screen_loc="2,7:8"
						if(10) M.curser.screen_loc="9,7:8"
						if(11) M.curser.screen_loc="2,6:8"
						if(12) M.curser.screen_loc="9,6:8"
						if(13) M.curser.screen_loc="2,5:8"
						if(14) M.curser.screen_loc="9,5:8"
						if(15) M.curser.screen_loc="2,4:8"
						if(16) M.curser.screen_loc="9,4:8"
						if(17) M.curser.screen_loc="2,3:8"
						if(18) M.curser.screen_loc="9,3:8"
						if(19) M.curser.screen_loc="2,2:8"
						if(20) M.curser.screen_loc="9,2:8"
				if("shopsellnum")
					if(!istype(M.shopitem,/obj/Ability/Basic/Item)) return
					M.menupos--
					if(M.menupos<1) M.menupos=2
					switch(M.menupos)
						if(1) M.curser.screen_loc="9:16,9:8"
						if(2) M.curser.screen_loc="10,9:8"
			// BATTLE CODE
				if("battle_menu") M.battle_screen("battle_left_menu")
				if("battle_right_menu") M.client.Northwest()
				if("battle_askills")
					M.menupos--
					if(M.menupos<1) M.menupos = length(M.menulist)
					switch(M.menupos)
						if(1) M.curser.screen_loc="2,6:16";if(2) M.curser.screen_loc="6:16,6:16";if(3) M.curser.screen_loc="11,6:16"
						if(4) M.curser.screen_loc="2,6:-2";if(5) M.curser.screen_loc="6:16,6:-2";if(6) M.curser.screen_loc="11,6:-2"
						if(7) M.curser.screen_loc="2,5:12";if(8) M.curser.screen_loc="6:16,5:12";if(9) M.curser.screen_loc="11,5:12"
						if(10) M.curser.screen_loc="2,5:-6";if(11) M.curser.screen_loc="6:16,5:-6";if(12) M.curser.screen_loc="11,5:-6"
						if(13) M.curser.screen_loc="2,4:8";if(14) M.curser.screen_loc="6:16,4:8";if(15) M.curser.screen_loc="11,4:8"
						if(16) M.curser.screen_loc="2,4:-10";if(17) M.curser.screen_loc="6:16,4:-10";if(18) M.curser.screen_loc="11,4:-10"
						if(19) M.curser.screen_loc="2,3:4";if(20) M.curser.screen_loc="6:16,3:4";if(21) M.curser.screen_loc="11,3:4"
					M.battle_screen("battle_askills_cost_refresh")
				if("battle_target") M.btl_target(M.btl_action,"W")
				if("battle_item")
					if(M.menuaction>1) M.battle_screen("battle_item_refresh",M.menuaction-5)
				if("battle_dart")
					if(M.menuaction>1) M.battle_screen("battle_dart_refresh",M.menuaction-5)
				if("monster_drop")
					M.menupos--
					if(M.menupos<1) M.menupos = 1
					switch(M.menupos)
						if(1) M.curser.screen_loc = "3,12:8"
						if(2) M.curser.screen_loc = "9,12:8"
						if(3) M.curser.screen_loc = "3,11:8"
						if(4) M.curser.screen_loc = "9,11:8"
						if(5) M.curser.screen_loc = "3,10:8"
						if(6) M.curser.screen_loc = "9,10:8"
						if(7) M.curser.screen_loc = "3,9:8"
						if(8) M.curser.screen_loc = "9,9:8"
						if(9) M.curser.screen_loc = "3,8:8"
						if(10) M.curser.screen_loc = "9,8:8"
				if("monster_drop_tp")
					M.menupos--
					if(M.menupos<1) M.menupos = 2
					switch(M.menupos)
						if(1) M.curser.screen_loc = "9,14:8"
						if(2) M.curser.screen_loc = "12,14:8"
			// MINI-GAME CODE
				// CHOCOBO RACES
				if("chocobo_race") M.direction-=M.turning
				else return
			return
		..()
	Center()
		if(!istype(usr,/mob/PC)&&!istype(usr,/mob/character)) return
		var/mob/PC/M=usr
		if(!M.inbattle&&!M.inmenu){M.default();return ..()}
		if(M.inmenu)
			switch(M.inmenu)
			//INTRO SCREEN
				if("intro_screen")
					M.character_screen("character_menu")
					for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="intro_screen") del(O)
			//CHARACTER MENU
				if("character_menu")
					if(!M.menupos) return
					M.client.last_used_slot = M.menupos
					if(M.menuaction=="Load")
						if(M.menulist.Find(M.menupos))
							M.inmenu=null
							del(M.curser)
							M.close_screen("character_menu_slot1")
							M.close_screen("character_menu_slot2")
							M.close_screen("character_menu_slot3")
							M.close_screen("character_menu_slot4")
							M.close_screen("character_menu_type")
							if(M.character_screen("character_load_delete")) M.client.character_load(last_used_slot)
							else M.client.character_delete(last_used_slot)
						else {M.client.last_used_slot = M.menupos;M.inmenu=null;del(M.curser);M.close_screen("character_menu_type");M.close_screen("character_menu_newgame");M.close_screen("character_menu_slot1");M.close_screen("character_menu_slot2");M.close_screen("character_menu_slot3");M.close_screen("character_menu_slot4");M.character_screen("character_create")}
					else{M.inmenu=null;del(M.curser);M.close_screen("character_menu_slot1");M.close_screen("character_menu_slot2");M.close_screen("character_menu_slot3");M.close_screen("character_menu_slot4");M.close_screen("character_menu_type");M.client.character_save(M.menupos)}
				if("character_create")
					switch(M.menupos)
						if(1 to 10){M.inmenu=null;M.close_screen("character_create_info");M.close_screen("character_create");M.client.character_new(M.menulist[M.menulist[M.menupos]])}
						if(11 to 15)
							var/savefile/F = new("saves/[copytext(ckey,1,2)]/[ckey].sav")
							F.cd = "/bonus/"
							if(M.menulist[M.menupos] in F["characters"]){M.close_screen("character_create_info");M.close_screen("character_create_bonus");M.close_screen("character_create");M.inmenu=null;M.client.character_new(M.menulist[M.menulist[M.menupos]])}
							else M<<SOUND_WRONG
				if("character_name")
					switch(M.menupos)
						if(1 to 71)
							if(length(M.menuaction)<max_name_character)
								M.menuaction+=M.menulist[M.menupos]
								M.namingway_refresh(M.menuaction)
							else M<<SOUND_WRONG
						if(72)
							if(!M.menuaction) M.menuaction = M.input_box
							else M.menuaction = copytext(M.menuaction,1,length(M.menuaction))
							M.namingway_refresh(M.menuaction)
						if(73) M.menuanswer = M.menuaction
			//MAIN MENU
				if("menu")
					switch(M.menupos)
						if(1) M.screen("item")
						if(2) M.screen("magic_type")
						if(3) M.screen("equip")
						if(4) {M.screen("status");del(M.curser)}
						if(5)	return
						if(6)	return
						if(7)	return
						if(8)	M.trade_screen("trade")
						else{M.client.Northwest();M.msg("You have saved your game.");M.client.character_save(M.client.last_used_slot)}
				if("item")
					if(length(M.contents)>=M.menupos)
						var/obj/O = M.contents[M.menupos]
						var/turf/T = M.loc
						if(istype(O,/obj/Ability/Basic) && (!O:CanUse || O:CanUse == 2 ||(T.worldmap && O:CanUse == 3)))
							M.menuaction = "item"
							M.menu_target()
							M.close_screen("item")
						else M<<SOUND_WRONG
					else M<<SOUND_WRONG
				if("magic")
					var/obj/Ability/O = M.menulist[M.menupos]
					var/turf/T = M.loc
					if(!O.CanUse || O.CanUse == 2 ||(T.worldmap && O.CanUse == 3))
						M.menuaction = "magic"
						M.menu_target()
						M.close_screen("magic_cost")
						M.close_screen("magic")
						M.close_screen("magic_type")
					else M<<SOUND_WRONG
				if("menu_target") M.menu_target("C")
				if("magic_type")
					if(M.action[M.menupos+1]) M.screen("magic",M.menupos+1)
					else M<<SOUND_WRONG
				if("equip")
					switch(M.menupos)
						if(1) M.screen("equiplist","rhand")
						if(2) M.screen("equiplist","lhand")
						if(3) M.screen("equiplist","head")
						if(4) M.screen("equiplist","body")
						if(5) M.screen("equiplist","arms")
				if("equiplist")
					if(length(M.menulist)>=M.menupos) M.equip(M.menuaction,M.menulist[M.menupos])
					else M.unequip(M.menuaction)
				if("teleport")
					if(length(M.menulist) >= (M.menuaction + M.menupos - 1))
						var/area/saved_location/A = M.menulist[M.menuaction + M.menupos - 1]
						for(var/mob/PC/p in M.party) p.GotoLoc(A.type)
						del(M.curser)
						M.close_allscreen()
					else M<<SOUND_WRONG
			//BANK CODE
				if("bank")
					switch(M.menupos)
						if(1) M.bank_screen("bankaction","item")
						if(2) M.bank_screen("bankaction","gold")
				if("bankaction")
					switch(M.menupos)
						if(1) M.bank_screen("bankaction","[M.menuaction] give")
						if(2) M.bank_screen("bankaction","[M.menuaction] take")
				if("bank_item")
					if(M.menuaction=="item give"&&length(M.iteminbank)>=20)
						M.inmenu="bank_message"
						for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="bankmessage") del O
						M.screen_textl(3,16,15.5,15.5,0,0,5,,"I got already enough!","bankmessage")
						spawn(20)
							for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="bankmessage") del O
							M.screen_textl(3,16,15.5,15.5,0,0,5,,"Give what?","bankmessage")
							M.inmenu="bank_item"
					else if(M.menuaction=="item take"&&length(M.contents)>=20)
						M.inmenu="bank_message"
						for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="bankmessage") del O
						M.screen_textl(3,16,15.5,15.5,0,0,5,,"Your inventory is full.","bankmessage")
						spawn(20)
							for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="bankmessage") del O
							M.screen_textl(3,16,15.5,15.5,0,0,5,,"Take what?","bankmessage")
							M.inmenu="bank_item"
					else if(length(M.menulist)>=M.menupos)
						var/obj/item=M.menulist[M.menupos]
						if(item.suffix=="Equipped")
							M.inmenu="bank_message"
							for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="bankmessage") del O
							M.screen_textl(3,16,15.5,15.5,0,0,5,,"It's equipped!","bankmessage")
							spawn(20)
								for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="bankmessage") del O
								M.screen_textl(3,16,15.5,15.5,0,0,5,,"Give what?","bankmessage")
								M.inmenu="bank_item"
						else M.bank(M.menuaction,M.menulist[M.menupos])
				if("bank_gold") if(M.input_box) M.bank(M.menuaction,M.input_box)
			//SHOP CODE
				if("shop")
					switch(M.menupos)
						if(1) M.shop_screen("shopbuy")
						if(2) M.shop_screen("shopsell")
						if(3) M.client.Northwest()
				if("shopbuy")
					var/obj/item = M.menulist[M.menuaction + M.menupos - 1]
					if(item.value>M.gold)
						M.inmenu="shopmessage"
						for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="shopmessage") del O
						M.screen_textl(8,16,15.5,15.5,0,0,5,,"Not enough GP!","shopmessage")
						spawn(20)
							for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="shopmessage") del O
							M.screen_textl(8,16,15.5,15.5,0,0,5,,"Which one?","shopmessage")
							M.inmenu="shopbuy"
					else if(length(M.contents)>=20)
						M.inmenu="shopmessage"
						for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="shopmessage") del O
						M.screen_textl(8,16,15.5,15.5,0,0,5,,"Your bag is full!","shopmessage")
						spawn(20)
							for(var/obj/onscreen/text/O in M.client.screen) if(O.screentag=="shopmessage") del O
							M.screen_textl(8,16,15.5,15.5,0,0,5,,"Which one?","shopmessage")
							M.inmenu="shopbuy"
					else if(istype(item,/obj/Ability/Basic))
						var/obj/Ability/O = locate(item) in M.contents
						if(O&&text2num(O.suffix)>=max_grouped_item)
							M.inmenu="shopmessage"
							for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
							M.screen_textl(8,16,15.5,15.5,0,0,5,,"Can't hold more.","shopmessage")
							spawn(20)
								for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
								M.screen_textl(8,16,15.5,15.5,0,0,5,,"Which one?","shopmessage")
								M.inmenu="shopbuy"
						else M.shop_screen("shopbuynum",item)
					else if((M.menuaction + M.menupos - 1)<=length(M.menulist)) M.shop("buy",item)
				if("shopbuynum")
					if(M.input_box) M.shop("buy",M.shopitem,M.input_box)
					else
						M.close_screen("shopbuynum_price")
						M.close_screen("shopbuynum_numbox")
						M.close_screen("shopbuynum")
						M.inmenu="shopbuy"
						M.menupos=1
						M.curser.screen_loc="2,11:8"
				if("shopsell")
					var/obj/item
					if(length(M.contents)>=M.menupos) item = M.contents[M.menupos]
					if(!item) return
					if(istype(item,/obj/Key_Item))
						M.inmenu="shopmessage"
						for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
						M.screen_textl(8,16,15.5,15.5,0,0,5,,"Can't sell this.","shopmessage")
						spawn(20)
							for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
							M.screen_textl(8,16,15.5,15.5,0,0,5,,"Which one?","shopmessage")
							M.inmenu="shopsell"
					else if(item.suffix=="Equipped")
						M.inmenu="shopmessage"
						for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
						M.screen_textl(8,16,15.5,15.5,0,0,5,,"It's equipped!","shopmessage")
						spawn(20)
							for(var/obj/onscreen/text/S in M.client.screen) if(S.screentag=="shopmessage") del S
							M.screen_textl(8,16,15.5,15.5,0,0,5,,"Which one?","shopmessage")
							M.inmenu="shopsell"
					else M.shop_screen("shopsellnum",item)
				if("shopsellnum") M.shop("sell",M.shopitem,M.input_box)
				if("shop_thanks")
					M.close_screen("shop_thanks")
					M.inmenu="shopbuy"
			// COMMON CODE
				if("message")
					if(M.sleep_in_message) M.sleep_in_message=0
					else if(length(M.text_list)) M.screen_dialog()
					else {M.close_screen("message");M.inmenu=null}
				if("yesno","character_delete","character_load_delete")
					switch(M.menupos)
						if(1) M.menuanswer=1
						if(2) M.menuanswer=2
			// BATTLE CODE
				if("battle_menu") M.btl_action(M.action[M.menupos])
				if("battle_left_menu")
					M.inmenu="panel"
					M.close_screen("battle_left_menu")
					M.close_screen("battle_menu")
					del(M.curser)
					M.btl_action(new/obj/Ability/Basic/Run)
				if("battle_right_menu")
					M.inmenu="panel"
					M.close_screen("battle_right_menu")
					M.close_screen("battle_menu")
					del(M.curser)
					M.btl_action(new/obj/Ability/Basic/Parry)
				if("battle_askills")
					var/obj/Ability/ASkill = M.menulist[M.menupos]
					if(M.MP>=ASkill.MPCost) M.btl_target(ASkill)
					else M<<SOUND_WRONG
				if("battle_target") M.btl_target(M.btl_action,"C")
				if("battle_item")
					var/obj/Item
					if((M.menuaction + M.menupos - 1)<=length(M.menulist)) Item = M.menulist[M.menuaction + M.menupos - 1]
					if(Item && istype(Item,/obj/Ability/Basic/Item||istype(Item,/obj/Ability/Basic/Dart)) && (!Item:CanUse || Item:CanUse == 1)) M.btl_target(Item)
					else{M<<SOUND_WRONG;return}
					M.close_screen("battle_item")
				if("battle_dart")
					var/obj/Item
					if((M.menuaction + M.menupos - 1)<=length(M.menulist)) Item = M.menulist[M.menuaction + M.menupos - 1]
					if(Item && istype(Item,/obj/Ability/Basic/Dart) && (!Item:CanUse || Item:CanUse == 1)) M.btl_target(Item)
					else{M<<SOUND_WRONG;return}
					M.close_screen("battle_dart")
				if("monster_drop")
					var/turf/battle/location/BLoc = locate(/turf/battle/location) in view(M)
					if(length(BLoc.obj_reward)>=M.menupos && (!BLoc.obj_reward[BLoc.obj_reward[M.menupos]] || BLoc.obj_reward[BLoc.obj_reward[M.menupos]] == M)) M.battle_screen("monster_drop_tp",M.menupos)
					else M<<SOUND_WRONG
				if("monster_drop_tp")
					var/turf/battle/location/BLoc = locate(/turf/battle/location) in view(M)
					switch(M.menupos)
						if(1)
							if(BLoc.obj_reward[M.menuanswer]&&BLoc.obj_reward[BLoc.obj_reward[M.menuanswer]] == null)
								BLoc.obj_reward[BLoc.obj_reward[M.menuanswer]] = M
								for(var/mob/PC/p in M.party) p.battle_screen("monster_drop_list",M.menuanswer)
							else M<<SOUND_WRONG
							M.client.Northwest()
						if(2)
							if(BLoc.obj_reward[M.menuanswer]&&BLoc.obj_reward[BLoc.obj_reward[M.menuanswer]] == M)
								BLoc.obj_reward[BLoc.obj_reward[M.menuanswer]] = null
								for(var/mob/PC/p in M.party) p.battle_screen("monster_drop_list",M.menuanswer)
							else M<<SOUND_WRONG
							M.client.Northwest()
			// MINI-GAME CODE
				// CHOCOBO RACE
				if("chocobo_race_menu")
					switch(M.menupos)
						if(1) M.chocobo_race_screen("chocobo_race_menu_race")
						if(2) M.chocobo_race_screen("chocobo_race_menu_feed")
						if(3){del(M.curser);M.menupos=1;M.close_screen("chocobo_race_menu");M.close_screen("chocobo_race_menu_gold");M.inmenu=null}
				if("chocobo_race_menu_feed")
					switch(M.menupos)
						if(0) return
						if(1 to 5) M.chocobo_buy(M.menupos)
						if(6){M.curser.screen_loc="4:16,12:8";M.menupos=1;M.close_screen("chocobo_race_menu_feed");M.inmenu="chocobo_race_menu"}
				else return
			return
		..()