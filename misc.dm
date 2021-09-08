//# misc stuff
obj/misc/anim
	var/anim_len
	explosion
		anim_len = 8
		name="explosion"
		icon='obj/explosion.dmi'
		icon_state="bl"
		layer=MOB_LAYER+2
		br{icon_state="br";pixel_x=32}
		ul{icon_state="ul";pixel_y=32}
		ur{icon_state="ur";pixel_x=32;pixel_y=32}
		New()
			overlays += /obj/misc/anim/explosion/br
			overlays += /obj/misc/anim/explosion/ul
			overlays += /obj/misc/anim/explosion/ur
			..()

obj/misc/lightning
	var
		owner
		dir_x
		dir_y
	name="lightning"
	icon='obj/other.dmi'
	icon_state="lightning"
	animate_movement=0

obj/misc/crystal
	name="crystal"
	icon='turf/crystal/pedestal.dmi'
	bcrystal{name="crystal";icon_state="bcrystal";pixel_y=4}
	ycrystal{name="crystal";icon_state="ycrystal";pixel_y=4}

obj/misc/swirl
	name="swirl"
	icon='turf/swirl.dmi'
	invisibility=100
	swirl
		swirl11/icon_state="swirl 1,1"
		swirl12/icon_state="swirl 1,2"
		swirl13/icon_state="swirl 1,3"
		swirl14/icon_state="swirl 1,4"
		swirl15/icon_state="swirl 1,5"
		swirl21/icon_state="swirl 2,1"
		swirl22/icon_state="swirl 2,2"
		swirl23/icon_state="swirl 2,3"
		swirl24/icon_state="swirl 2,4"
		swirl25/icon_state="swirl 2,5"
		swirl31{icon_state="swirl 3,1";layer=MOB_LAYER+2}
		swirl32{icon_state="swirl 3,2";layer=MOB_LAYER+2}
		swirl33{icon_state="swirl 3,3";layer=MOB_LAYER+2}
		swirl34{icon_state="swirl 3,4";layer=MOB_LAYER+2}
		swirl35{icon_state="swirl 3,5";layer=MOB_LAYER+2}
		swirl41{icon_state="swirl 4,1";layer=MOB_LAYER+2}
		swirl42{icon_state="swirl 4,2";layer=MOB_LAYER+2}
		swirl43{icon_state="swirl 4,3";layer=MOB_LAYER+2}
		swirl44{icon_state="swirl 4,4";layer=MOB_LAYER+2}
		swirl45{icon_state="swirl 4,5";layer=MOB_LAYER+2}
	splash
		lsplash{icon_state="left_splash";layer=MOB_LAYER+3}
		splash{icon_state="splash";layer=MOB_LAYER+3}
		rsplash{icon_state="right_splash";layer=MOB_LAYER+3}
