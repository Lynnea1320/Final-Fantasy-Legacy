mob/var/tmp
	clan
	title
	rank

mob/PC
	Login()
		..()
		var/c_motd
		for(var/C in flist("clans/"))
			if(findtext(C,".cln"))
				var/savefile/F = new("clans/[C]")
				F.cd = "members"
				for(var/M in F.dir)
					if(ckey(M) == src.ckey)
						F.cd = ".."
						F.cd = "clan"
						F["clan_name"] >> src.clan
						F["motd"] >> c_motd
						F.cd = ".."
						F.cd = "members/[M]"
						F["title"] >> src.title
						F["rank"] >> src.rank
						F.cd = ".."
						F.cd = "clan"
		if(c_motd)
			info(,list(src),"<b>Clan MOTD:</b>")
			info(,list(src),"[c_motd]<hr>")
		if(!src.clan)
			src.clan = "None"
			src.title = "None"
			src.rank = 0
		var/t_rank
		t_rank = text2num(src.rank)
		switch(t_rank)
			if(4)
				for(var/L in typesof(/mob/clan/leader/proc))
					src.verbs += L
				for(var/S in typesof(/mob/clan/subleader/proc))
					src.verbs += S
				for(var/R in typesof(/mob/clan/recruiter/proc))
					src.verbs += R
				for(var/M in typesof(/mob/clan/member/proc))
					src.verbs += M
			if(3)
				for(var/S in typesof(/mob/clan/subleader/proc))
					src.verbs += S
				for(var/R in typesof(/mob/clan/recruiter/proc))
					src.verbs += R
				for(var/M in typesof(/mob/clan/member/proc))
					src.verbs += M
			if(2)
				for(var/R in typesof(/mob/clan/recruiter/proc))
					src.verbs += R
				for(var/M in typesof(/mob/clan/member/proc))
					src.verbs += M
			if(1)
				for(var/M in typesof(/mob/clan/member/proc))
					src.verbs += M

mob/clan/leader/proc

	clan_description()
		set category = "Clan"
		set name = "Clan Description"
		set desc = "Change the clan's description"
		var/savefile/F = new("clans/[ckey(src.clan)].cln")
		F.cd = "clan"
		var/new_description = input(src,"What do you want to change?","Clan Description",F["clan_description"])as null|message
		if(new_description)
			switch(alert("Are you sure about changing the clan description?","Clan Desciption","Yes","No"))
				if("Yes")
					F["clan_description"] << new_description
					var/list/People = list()
					for(var/mob/PC/P in world) if(P.clan == src.clan) People.Add(P)
					info(,People,"Clan description was changed.")
				if("No")
					return

	control_panel()
		set category = "Clan"
		set name = "Control Panel"
		set desc = "Offline Member Control Panel"
		src << browse("<html><body><center><h3>Offline Member Control</h3><p><a href=?clan=remove>Remove Members</a><br><a href=?clan=rank>Change Rank</a><br><a href=?clan=title>Change Title</a></center></body></html>")


mob/clan/subleader/proc

	clan_promote()
		set category = "Clan"
		set name = "Clan Promote"
		set desc = "Promote someone to a higher rank"
		var/list/People[] = list()
		for(var/mob/PC/P in world)
			if(src.rank == 4)
				if(P.clan == src.clan && P.rank < 4 && P != src)
					People["[P] ([P.key])"] += P
			if(src.rank == 3)
				if(P.clan == src.clan && P.rank < 3 && P != src)
					People["[P] ([P.key])"] += P
		if(!People.len) {info(,list(src),"No clan members to promote");return}
		var/mob/PC/M = People[input(src,"Who do you want to promote?","Promote")as null|anything in People]
		if(M)
			if(src.rank == 4)
				switch(alert("Promote [M] to which title?","Promote","Recruiter","Sub-Leader","Cancel"))
					if("Recruiter")
						info(,list(M),"You are now a clan recruiter.")
						var/savefile/F = new("clans/[ckey(src.clan)].cln")
						F.cd = "members/[M.ckey]"
						F["rank"] << 2
						M.rank = 2
						info(,list(src),"You have promoted [M] to recruiter status.")
						M.verbs += /mob/clan/recruiter/proc/recruit
						M.verbs += /mob/clan/recruiter/proc/c_kick
					if("Sub-Leader")
						info(,list(M),"You are now a sub-leader.")
						var/savefile/F = new("clans/[ckey(src.clan)].cln")
						F.cd = "members/[M.ckey]"
						F["rank"] << 3
						M.rank = 3
						info(,list(src),"You have promoted [M] to sub-leader status.")
						M.verbs += /mob/clan/subleader/proc/clan_promote
						M.verbs += /mob/clan/subleader/proc/clan_demote
						M.verbs += /mob/clan/subleader/proc/change_title
						M.verbs += /mob/clan/subleader/proc/c_motd
					if("Cancel")
						return
			else
				switch(alert("Are you sure about promoting [M]?","Promote","Yes","No"))
					if("Yes")
						info(,list(M),"You are now a clan recruiter.")
						var/savefile/F = new("clans/[ckey(src.clan)].cln")
						F.cd = "members/[M.ckey]"
						F["rank"] << 2
						M.rank = 2
						info(,list(src),"You have promoted [M] to recruiter status.")
						M.verbs += /mob/clan/recruiter/proc/recruit
						M.verbs += /mob/clan/recruiter/proc/c_kick

	clan_demote()
		set category = "Clan"
		set name = "Clan Demote"
		set desc = "Demote a clan member"
		var/list/People[] = list()
		for(var/mob/PC/P in world)
			if(src.rank == 4)
				if(P.clan == src.clan && P.rank < 3 && P.rank != 1 && P != src)
					People["[P] ([P.key])"] += P
			if(src.rank == 3)
				if(P.clan == src.clan && P.rank == 2 && P != src)
					People["[P] ([P.key])"] += P
		if(!People.len) {info(,list(src),"There are no clan members to demote");return}
		var/mob/PC/M = People[input(src,"Who would you like to demote?","Demote") as null|anything in People]
		if(M)
			if(src.rank == 4)
				if(M.rank == 3)
					switch(alert("Demote to what rank?","Demote","Recruiter","Member","Cancel"))
						if("Recruiter")
							info(,list(M),"You are no longer a sub-leader.")
							var/savefile/F = new("clans/[ckey(src.clan)].cln")
							F.cd = "members/[M.ckey]"
							F["rank"] << 2
							M.rank = 2
							info(,list(src),"You have demoted [M] to recruiter.")
							M.verbs -= /mob/clan/subleader/proc/clan_promote
							M.verbs -= /mob/clan/subleader/proc/clan_demote
							M.verbs -= /mob/clan/subleader/proc/change_title
							M.verbs -= /mob/clan/subleader/proc/c_motd
						if("Member")
							info(,list(M),"You are no longer a sub-leader.")
							var/savefile/F = new("clans/[ckey(src.clan)].cln")
							F.cd = "members/[M.ckey]"
							F["rank"] << 1
							M.rank = 1
							info(,list(src),"You have demoted [M] to a member.")
							M.verbs -= /mob/clan/subleader/proc/clan_promote
							M.verbs -= /mob/clan/subleader/proc/clan_demote
							M.verbs -= /mob/clan/subleader/proc/change_title
							M.verbs -= /mob/clan/subleader/proc/c_motd
							M.verbs -= /mob/clan/recruiter/proc/recruit
							M.verbs -= /mob/clan/recruiter/proc/c_kick
							M.verbs -= /mob/clan/member/proc/GSay
							M.verbs -= /mob/clan/member/proc/GEmote
							M.verbs -= /mob/clan/member/proc/GWho
							M.verbs -= /mob/clan/member/proc/clan_help
							M.verbs -= /mob/clan/member/proc/clan_leave
						if("Cancel")
							return
				else
					switch(alert("Demote to [M] to member?","Confirm","Yes","No"))
						if("Yes")
							info(,list(M),"You are no longer a recruiter")
							var/savefile/F = new("clans/[ckey(src.clan)].cln")
							F.cd = "members/[M.ckey]"
							F["rank"] << 1
							M.rank = 1
							info(,list(src),"You have demoted [M].")
							M.verbs -= /mob/clan/recruiter/proc/recruit
							M.verbs -= /mob/clan/recruiter/proc/c_kick
						if("No")
							return
			else
				switch(alert("Demote to [M] to member?","Confirm","Yes","No"))
					if("Yes")
						info(,list(M),"You are no longer a recruiter")
						var/savefile/F = new("clans/[ckey(src.clan)].cln")
						F.cd = "members/[M.ckey]"
						F["rank"] << 1
						M.rank = 1
						info(,list(src),"You have demoted [M].")
						M.verbs -= /mob/clan/recruiter/proc/recruit
						M.verbs -= /mob/clan/recruiter/proc/c_kick
					if("No")
						return

	change_title()
		set category = "Clan"
		set name = "Change Title"
		set desc = "Change a person's title"
		var/list/People[] = list()
		for(var/mob/PC/P in world)
			if(src.rank == 4)
				if(P.clan == src.clan)
					People["[P] ([P.key])"] += P
			if(src.rank == 3)
				if(P.clan == src.clan && P.rank != 4)
					People["[P] ([P.key])"] += P
		var/mob/PC/M = People[input(src,"Who's title would you like to change?","Change Title") as null|anything in People]
		if(M)
			var/new_title = input(src,"What do you want to edit [M]'s title to?","Change Title",M.title)as null|text
			if(new_title)
				switch(alert("Are you sure about changing [M.title] to [new_title]?","Change Title","Yes","No"))
					if("Yes")
						var/savefile/F = new("clans/[ckey(src.clan)].cln")
						F.cd = "members/[M.ckey]"
						info(,list(M),"Your title has been changed from [M.title] to [new_title].")
						F["title"] << new_title
						M.title = new_title
	c_motd()
		set category = "Clan"
		set name = "Clan-Motd"
		set desc = "Edit the clan message of the day."
		var/savefile/F = new("clans/[ckey(src.clan)].cln")
		F.cd = "clan"
		var/new_motd = input("What do you want to change the motd to?","Clan MOTD",F["motd"])as null|message
		if(new_motd)
			switch(alert("Are you sure about changing the clan's message of the day?","Clan MOTD","Yes","No"))
				if("Yes")
					F["motd"] << new_motd
					for(var/mob/PC/P in world)
						if(P.clan == src.clan)
							info(,list(P),"The <a href=?action=clanmotd&clan=[src.clan] STYLE=\"text-decoration:none\">Clan Message of the Day</a> has been changed.<br>")
				if("No") return

mob/clan/recruiter/proc

	recruit()
		set category = "Clan"
		set name = "Recruit"
		set desc = "Ask someone to join the clan"
		var/list/People[] = list()
		for(var/mob/PC/P in world)
			if(P.clan == "None")
				People["[P] ([P.key])"] += P
		if(!People.len){info(,list(src),"No one to recruit.");return}
		var/mob/PC/M = People[input(src,"Who would you like to recruit?","Recruit")as null|anything in People]
		if(M)
			info(,list(src),"Asking [M] to join...")
			switch(alert(M,"You have been invited to join the following clan: [src.clan]","Accept?","Accept","Deny"))
				if("Deny")
					info(,list(src),"[M] has denied your request.")
				if("Accept")
					info(,list(src),"[M] has accepted your request.")
					info(,list(M),"You have joined the [src.clan] clan!")
					M.clan = src.clan
					M.title = "Member"
					M.rank = 1
					M.verbs += /mob/clan/member/proc/GSay
					M.verbs += /mob/clan/member/proc/GEmote
					M.verbs += /mob/clan/member/proc/GWho
					M.verbs += /mob/clan/member/proc/clan_help
					M.verbs += /mob/clan/member/proc/clan_leave
					var/savefile/F = new("clans/[ckey(src.clan)].cln")
					F.cd = "members"
					F.dir.Add("[M.ckey]")
					F.cd = "[M.ckey]"
					F["name"] << M.key
					F["title"] << "Member"
					F["rank"] << 1

	c_kick()
		set category = "Clan"
		set name = "Clan Kick"
		set desc = "Kick out a clan member"
		var/list/People[] = list()
		for(var/mob/PC/P in world)
			if(P.clan == src.clan && P.rank < src.rank && P != src)
				People["[P] ([P.key] - [P.title])"] += P
		if(!People.len){info(,list(src),"No one to kick.");return}
		var/mob/PC/M = People[input(src,"Who would you like to kick from your clan?","Clan Kick")as null|anything in People]
		if(M)
			switch(alert("Are you sure you want to kick [M]?","Clan Kick","Yes","No"))
				if("Yes")
					var/savefile/F = new("clans/[ckey(src.clan)].cln")
					F.cd = "members"
					F.dir.Remove(M.ckey)
					info(,list(M),"You have been removed from [src.clan].")
					info(,list(src),"You have removed [M] from your clan.")
					if(M.rank == 3)
						M.verbs -= /mob/clan/subleader/proc/clan_promote
						M.verbs -= /mob/clan/subleader/proc/clan_demote
						M.verbs -= /mob/clan/subleader/proc/change_title
						M.verbs -= /mob/clan/subleader/proc/c_motd
						M.verbs -= /mob/clan/recruiter/proc/recruit
						M.verbs -= /mob/clan/recruiter/proc/c_kick
						M.verbs -= /mob/clan/member/proc/GSay
						M.verbs -= /mob/clan/member/proc/GEmote
						M.verbs -= /mob/clan/member/proc/GWho
						M.verbs -= /mob/clan/member/proc/clan_help
						M.verbs -= /mob/clan/member/proc/clan_leave
					if(M.rank == 2)
						M.verbs -= /mob/clan/recruiter/proc/recruit
						M.verbs -= /mob/clan/recruiter/proc/c_kick
						M.verbs -= /mob/clan/member/proc/GSay
						M.verbs -= /mob/clan/member/proc/GEmote
						M.verbs -= /mob/clan/member/proc/GWho
						M.verbs -= /mob/clan/member/proc/clan_help
						M.verbs -= /mob/clan/member/proc/clan_leave
					if(M.rank == 1)
						M.verbs -= /mob/clan/member/proc/GSay
						M.verbs -= /mob/clan/member/proc/GEmote
						M.verbs -= /mob/clan/member/proc/GWho
						M.verbs -= /mob/clan/member/proc/clan_help
						M.verbs -= /mob/clan/member/proc/clan_leave
					M.clan = "None"
					M.title = "None"
					M.rank = 0
				if("No")
					return

mob/clan/member/proc

	GSay(T as text)
		set category = "Clan"
		set name = "CSay"
		set desc = "Talk to clan members"
		var/list/People = list()
		for(var/mob/PC/P in world)
			if(P.clan == src.clan)
				People.Add(P)
		if(!T) return
		chat("CSay",src,People,"[T]")

	GEmote(T as text)
		set category = "Clan"
		set name = "CEmote"
		set desc = "Emote to clan members"
		var/list/People = list()
		for(var/mob/PC/P in world)
			if(P.clan == src.clan)
				People.Add(P)
		if(!T) return
		chat("CEmote",src,People,"[T]")

	GWho()
		set category = "Clan"
		set name = "CWho"
		set desc = "Look at onlin clan members"
		var/counter = 0
		info(,list(src),"<b>Clan Who</b>")
		for(var/mob/PC/P in world)
			if(P.clan == src.clan)
				counter ++
				info(,list(src),"Lvl. [P.level] <IMG CLASS=icon SRC=\ref[P.init_icon()] ICONSTATE='normal'> [P] ([P.key]) ([P.clan]-[P.title])")
		info(,list(src),"Total of [counter] clan members online.")

	clan_help()
		set category = "Clan"
		set name = "Clan Help"
		set desc = "Need help?"
		src << browse(\
		{"
		<html>
		<body>
		<center><h3>Clan Help</center></h3><p>
		<b>Members</b><br>
		You can use the GSay (guild-say) GEmote (guild-emote) and GWho(guild-who) commands.<p>
		<b>Recruiters</b><br>
		You can recruit people into the clan, and kick online members.<p>
		<b>Sub-Leaders</b><br>
		You can do almost everything a leader can except change offline members content promote others to sub-leader and change the clan's description.<p>
		<b>Leader</b><br>
		You can promote members to recruiter or sub-leader status.<br>
		Your control panel allows you to alter Offline and Online members information.<br>
		If you want your clan to end use leave clan to disband."})

	clan_leave()
		set category = "Clan"
		set name = "Leave Clan"
		set desc = "Leave your clan."
		switch(alert(src,"Are you sure about leaving your clan?","Leave Clan","Yes","No"))
			if("No")
				return
			if("Yes")
				if(src.rank == 4)
					switch(alert(src,"This will disband your clan, Are you sure?","Confirm","Yes","No"))
						if("Yes")
							fdel("clans/[ckey(src.clan)].cln")
							for(var/mob/PC/P in world)
								if(P.clan == src.clan && P != src)
									info(,list(P),"Your clan has been disbanded.")
									P.clan = "None"
									P.title = "None"
									if(P.rank == 3)
										P.verbs -= /mob/clan/subleader/proc/clan_promote
										P.verbs -= /mob/clan/subleader/proc/clan_demote
										P.verbs -= /mob/clan/subleader/proc/change_title
										P.verbs -= /mob/clan/subleader/proc/c_motd
										P.verbs -= /mob/clan/recruiter/proc/recruit
										P.verbs -= /mob/clan/recruiter/proc/c_kick
										P.verbs -= /mob/clan/member/proc/GSay
										P.verbs -= /mob/clan/member/proc/GEmote
										P.verbs -= /mob/clan/member/proc/GWho
										P.verbs -= /mob/clan/member/proc/clan_help
										P.verbs -= /mob/clan/member/proc/clan_leave
										P.rank = 0
									if(P.rank == 2)
										P.verbs -= /mob/clan/recruiter/proc/recruit
										P.verbs -= /mob/clan/recruiter/proc/c_kick
										P.verbs -= /mob/clan/member/proc/GSay
										P.verbs -= /mob/clan/member/proc/GEmote
										P.verbs -= /mob/clan/member/proc/GWho
										P.verbs -= /mob/clan/member/proc/clan_help
										P.verbs -= /mob/clan/member/proc/clan_leave
										P.rank = 0
									if(P.rank == 1)
										P.verbs -= /mob/clan/member/proc/GSay
										P.verbs -= /mob/clan/member/proc/GEmote
										P.verbs -= /mob/clan/member/proc/GWho
										P.verbs -= /mob/clan/member/proc/clan_help
										P.verbs -= /mob/clan/member/proc/clan_leave
										P.rank = 0
							info(,list(src),"Your clan has been disbanded.")
							src.clan = "None"
							src.title = "None"
							src.rank = 0
							for(var/L in typesof(/mob/clan/leader/proc))
								src.verbs -= L
							src.verbs -= /mob/clan/subleader/proc/clan_promote
							src.verbs -= /mob/clan/subleader/proc/clan_demote
							src.verbs -= /mob/clan/subleader/proc/change_title
							src.verbs -= /mob/clan/subleader/proc/c_motd
							src.verbs -= /mob/clan/recruiter/proc/recruit
							src.verbs -= /mob/clan/recruiter/proc/c_kick
							src.verbs -= /mob/clan/member/proc/GSay
							src.verbs -= /mob/clan/member/proc/GEmote
							src.verbs -= /mob/clan/member/proc/GWho
							src.verbs -= /mob/clan/member/proc/clan_help
							src.verbs -= /mob/clan/member/proc/clan_leave
						if("No")
							return
				else
					var/savefile/F = new("clans/[ckey(src.clan)].cln")
					F.cd = "members"
					F.dir.Remove(src.ckey)
					src.clan = "None"
					src.title = "None"
					if(src.rank == 3)
						src.verbs -= /mob/clan/subleader/proc/clan_promote
						src.verbs -= /mob/clan/subleader/proc/clan_demote
						src.verbs -= /mob/clan/subleader/proc/change_title
						src.verbs -= /mob/clan/subleader/proc/c_motd
						src.verbs -= /mob/clan/recruiter/proc/recruit
						src.verbs -= /mob/clan/recruiter/proc/c_kick
						src.verbs -= /mob/clan/member/proc/GSay
						src.verbs -= /mob/clan/member/proc/GEmote
						src.verbs -= /mob/clan/member/proc/GWho
						src.verbs -= /mob/clan/member/proc/clan_help
						src.verbs -= /mob/clan/member/proc/clan_leave
						src.rank = 0
					if(src.rank == 2)
						src.verbs -= /mob/clan/recruiter/proc/recruit
						src.verbs -= /mob/clan/recruiter/proc/c_kick
						src.verbs -= /mob/clan/member/proc/GSay
						src.verbs -= /mob/clan/member/proc/GEmote
						src.verbs -= /mob/clan/member/proc/GWho
						src.verbs -= /mob/clan/member/proc/clan_help
						src.verbs -= /mob/clan/member/proc/clan_leave
						src.rank = 0
					if(src.rank == 1)
						src.verbs -= /mob/clan/member/proc/GSay
						src.verbs -= /mob/clan/member/proc/GEmote
						src.verbs -= /mob/clan/member/proc/GWho
						src.verbs -= /mob/clan/member/proc/clan_help
						src.verbs -= /mob/clan/member/proc/clan_leave
						src.rank = 0

client
	Topic(href,href_list[])
		..()
		var/content = "<HTML><BODY>"
		if(href_list["viewmember"])
			var/member = href_list["viewmember"]
			if(!fexists("saves/[ckey(copytext(member,1,2))]/[ckey(member)].sav"))
				content += "No information on that member could be obtained."
			else
				var/savefile/F = new("saves/[ckey(copytext(member,1,2))]/[ckey(member)].sav")
				F.cd = "characters"
				content += "<center><b>Character Information for [member]"
				for(var/CS in F.dir)
					F.cd = "[CS]"
					content += "<table border=1 align=center width=75% cellspacing=0><tr><th>[F["name"]]</th></tr><tr><td align=left valign=top>Class: [F["class"]]<br>Level: [F["level"]]</td></tr></table><p>"
					F.cd = ".."
			usr << browse(content)
		else if(href_list["viewclan"])
			var/clan = href_list["viewclan"]
			if(fexists("clans/[ckey(clan)].cln"))
				var/savefile/F = new("clans/[ckey(clan)].cln")
				F.cd = "clan"
				content += "<center><h3>Information for [F["clan_name"]]</h3>[F["clan_description"]]</center><p>"
				content += "<table border=1 bordercolor=black cellspacing=0 width=100%>"
				content += "<tr><th>Member</th><th>Title</th></tr>"
				F.cd = ".."
				F.cd = "members"
				for(var/M in F.dir)
					F.cd = "[M]"
					content += "<tr><td><a href=?viewmember=[ckey(F["name"])] STYLE=\"text-decoration: none\">[F["name"]]</a></td><td>[F["title"]]"
					if(text2num(F["rank"]) == 2)
						content += "<small>*</small></td></tr>"
					else if(text2num(F["rank"]) == 3)
						content += " <small>**</small></td></tr>"
					else if(text2num(F["rank"]) == 4)
						content += " <small>***</small></td></tr>"
					else
						content += "</td></tr>"
					F.cd = ".."
				content += "<tr><td colspan=2 align=center valign=top height=10><b>Total members:</b> [F.dir.len]</b><p></td></tr>"
				content += "<tr><td colspan=2 align=center height=10><center><small>* = Recruiter ** = Sub-Leader *** = Leader</small></center></td></tr>"
				content += "</table>"
			else
				content += "Clan not found."

			usr << browse(content)
		else if(href_list["clan"])
			var/clan_action = href_list["clan"]
			var/savefile/F = new("clans/[ckey(usr.clan)].cln")
			switch(clan_action)
				if("remove")
					if(!href_list["member"])
						content += "<center><h3>Remove Members</h3><p>"
						F.cd = "members"
						content += \
						{"
						<form action=?>
						<input type=hidden name=clan value=remove>
						<select name=member>"}
						for(var/M in F.dir)
							if(M != usr.ckey)
								content += "<option value=[ckey(M)]>[M]</option>"
						content += "</select>  <input type=submit value=Remove></form>"
						F.cd = ".."
					else
						var/member = href_list["member"]
						F.cd = "members"
						F.dir.Remove(member)
						F.cd = ".."
						content += "You have removed [member] from your clan."
						for(var/mob/PC/P in world)
							if(P.ckey == member)
								P << "* You have been removed from the [P.clan] clan!"
								P.clan = "None"
								P.title = "None"
								P.rank = 0
								for(var/R in typesof(/mob/clan/recruiter/proc))
									P.verbs -= R
								for(var/M in typesof(/mob/clan/member/proc))
									P.verbs -= M
				if("rank")
					if(!href_list["member"])
						content += "<center><h3>Change Member Rank</h3><p>"
						F.cd = "members"
						content += \
						{"
						<form action=?>
						<input type=hidden name=clan value=rank>
						<select name=member>"}
						for(var/M in F.dir)
							if(M != usr.ckey)
								content += "<option value=[ckey(M)]>[M]</option>"
						content += "</select>  <input type=submit value=Select></form>"
						F.cd = ".."
					else
						var/member = href_list["member"]
						if(!href_list["n_rank"])
							F.cd = "members/[member]"
							content += \
							{"
							1 = Member, 2 = Recruiter, 3 = Sub-Leader
							<form action=?>
							<input type=hidden name=clan value=rank>
							<input type=hidden name=member value=[member]>
							New Rank: <input type=text size=1 name=n_rank value=[F["rank"]]> <input type=submit value=Change>
							</form>"}
						else
							var/n_rank = href_list["n_rank"]
							if(text2num(n_rank) < 1 || text2num(n_rank) > 3)
								content += "Please enter either 1,2, or 3"
							else
								F.cd = "members/[member]"
								F["rank"] << n_rank
								content += "Rank changed successfully!"
								for(var/mob/PC/P in world)
									if(P.ckey == member)
										P << "* Your rank has been changed from [P.rank] to [n_rank]"
										P.rank = n_rank
										if(n_rank == 3)
											for(var/S in typesof(/mob/clan/subleader/proc))
												P.verbs += S
										if(n_rank == 2)
											for(var/R in typesof(/mob/clan/recruiter/proc))
												P.verbs += R
										else
											for(var/S in typesof(/mob/clan/subleader/proc))
												P.verbs -= S
											for(var/R in typesof(/mob/clan/recruiter/proc))
												P.verbs -= R

				if("title")
					if(!href_list["member"])
						content += "<center><h3>Change Member Title</h3><p>"
						F.cd = "members"
						content += \
						{"
						<form action=?>
						<input type=hidden name=clan value=title>
						<select name=member>"}
						for(var/M in F.dir)
							if(M != usr.ckey)
								content += "<option value=[ckey(M)]>[M]</option>"
						content += "</select>  <input type=submit value=Select></form>"
						F.cd = ".."
					else
						var/member = href_list["member"]
						F.cd = "members/[member]"
						if(!href_list["title"])
							content += \
							{"
							<form action=?>
							<input type=hidden name=clan value=title>
							<input type=hidden name=member value=[member]>
							New Title: <input type=text name=title value="[F["title"]]"><br>
							<input type=submit value=Change></form>"}
						else
							F["title"] << href_list["title"]
							content += "Title changed successfully!"
							for(var/mob/PC/P in world)
								if(P.ckey == member)
									P << "* Your title has been changed to \"[href_list["title"]]\""
									P.title = href_list["title"]

			content += "</BODY></HTML>"
			usr << browse(content)