mob/var/tmp
	//Good Status Effects
	Protect = 0 // Physical Damage is reduced by half
	Shell = 0// Magical Damage is reduced by half
	Reflect = 0 // Magical Damage is reflected back to the source - still a little buggy
	Float = 0 // Earth elemental attacks don't deal damage - small chance of this not working
	Haste = 0 // Gauge fills 50% faster
	Blink = 0 // Dodges 2 physical Attacks Guaranteed
	Regen = 0 // Recovers 10% HP ever round
	Strengthen = 0 // Increases magical damage by 1.5
	Cry = 0 // Decreases physical attack power by 25%
	//Neutral Status Effects
	Cover // This is a paladin skill that allows you to cover someone(Paladins)
	Covered // This is who you are covering(Target) Still working details...
	Berserk = 0 // This makes a character's attack stronger.
	//Bad Status Effects
	Poison = 0 // Poison takes away a set percent of HP each round
	Darkness = 0 // Darkness lowers your accuracy by half
	Mute = 0 // Prevents magic spells - still a work in progress(Fixed by Crimson)
	Curse = 0 // Weakened defense and attack - still a work in progress
	Confuse = 0  // Randomly attack anyone in view - still a work in progress
	Sleep = 0 // Monster/Player is placed in sleep until attacked by a physical hit
	Slow = 0 // Gauge fills 50% slower
	Hold = 0 // Monster/Player is held in place
	Stone = 0 // Monster is killed instantly and Player is petrified until remedy or end of battle
	Countdown = 0 // When Countdown_counter reaches countdown_count characters hp drops to 1
	Jump_Charge = 0 //For invincibility while charging jump ~Crimson
	stoleitem=0
	gradual_petrify_counter=0
	blink_counter=0
	hold_counter=0
	sleep_counter=0
	reflect_counter=0
	protect_counter=0
	shell_counter=0
	haste_counter=0
	slow_counter=0
	strengthen_counter=0
	cry_counter=0
	dark_counter=0
	curse_counter=0
	confuse_counter=0
	berserk_counter=10
	stone_counter=0
	mute_counter=0
	countdown_counter=0
var/const
	stoleitem_count=3
	gradual_petrify_count=3
	blink_count = 2
	hold_count=4
	sleep_count=3
	reflect_count=3
	protect_count=5
	shell_count=5
	haste_count=5
	slow_count=5
	strengthen_count=3
	cry_count=3
	dark_count=5
	curse_count=5
	confuse_count=5
	berserk_count=10
	mute_count=5
	countdown_count=10
	stone_count=10
proc
	Status_Counter_Null(var/mob/PC/M)
		if(M.blink_counter>0) M.blink_counter=0
		if(M.hold_counter>0) M.hold_counter=0
		if(M.sleep_counter>0) M.sleep_counter=0
		if(M.reflect_counter>0) M.reflect_counter=0
		if(M.protect_counter>0) M.protect_counter=0
		if(M.shell_counter>0) M.shell_counter=0
		if(M.haste_counter>0) M.haste_counter=0
		if(M.slow_counter>0) M.slow_counter=0
		if(M.strengthen_counter>0) M.strengthen_counter=0
		if(M.cry_counter>0) M.cry_counter=0
		if(M.dark_counter>0) M.dark_counter=0
		if(M.curse_counter>0) M.curse_counter=0
		if(M.confuse_counter>0) M.confuse_counter=0
		if(M.mute_counter>0) M.mute_counter=0
		if(M.countdown_counter>0) M.countdown_counter=0
		if(M.stone_counter>0) M.stone_counter=0
		if(M.gradual_petrify_counter>0) M.gradual_petrify_counter=0
		if(M.stoleitem>0) M.stoleitem=0
	Inflict_Status_Check(var/obj/Ability/Action,var/mob/PC/P)
		if(Action.Protect&&P.Protect&&P.protect_counter==0) return 1
		if(Action.Shell&&P.Shell&&P.shell_counter==0) return 1
		if(Action.Reflect&&P.Reflect&&P.reflect_counter==0) return 1
		if(Action.Float&&P.Float) return 1
		if(Action.Haste&&P.Haste&&P.haste_counter==0) return 1
		if(Action.Blink&&P.Blink&&P.blink_counter==0) return 1
		if(Action.Strengthen&&P.Strengthen&&P.strengthen_counter==0) return 1
		if(Action.Cry&&P.Cry&&P.cry_counter==0) return 1
		if(Action.Cover&&P.Covered) return 1
		if(Action.Poison&&P.Poison) return 1
		if(Action.Regen&&P.Regen) return 1
		if(Action.Darkness&&P.Darkness&&P.dark_counter==0) return 1
		if(Action.Mute&&P.Mute&&P.mute_counter==0) return 1
		if(Action.Curse&&P.Curse&&P.curse_counter==0) return 1
		if(Action.Confuse&&P.Confuse) return 1
		if(Action.Berserk&&P.Berserk&&P.berserk_counter==0) return 1
		if(Action.Sleep&&P.Sleep&&P.sleep_counter==0) return 1
		if(Action.Slow&&P.Slow&&P.slow_counter==0) return 1
		if(Action.Hold&&P.Hold&&P.hold_counter==0) return 1
		if(Action.Stone&&P.Stone&&P.stone_counter==0) return 1
		if(Action.Countdown&&P.Countdown&&P.countdown_counter==0) return 1
		if(Action.Escape) return 1
		if(Action.Steal) return 1
		if(Action.Asura) return 1
		if(Action.Dispell) return 1
		if(Action.Esuna) return 1
		if(Action.Scan) return 1
		if(Action.Guard) return 1
		if(Action.Golem) return 1
	Full_Status_Null(var/mob/Z) // End of Battle called proc
		if(Z.Protect) Z.Protect=null
		if(Z.Shell) Z.Shell=null
		if(Z.Reflect) Z.Reflect=null
		if(Z.Float) Z.Float=null
		if(Z.Haste) Z.Haste=null
		if(Z.Blink) Z.Blink=null
		if(Z.Strengthen) Z.Strengthen=0
		if(Z.Cry) Z.Cry=0
		if(Z.Cover) Z.Cover=null
		if(Z.Covered) Z.Covered=null
		if(Z.Poison) Z.Poison=null
		if(Z.Regen) Z.Regen=null
		if(Z.Darkness) Z.Darkness=null
		if(Z.Mute) Z.Mute=null
		if(Z.Curse) Z.Curse=null
		if(Z.Confuse) Z.Confuse=null
		if(Z.Berserk) Z.Berserk=null
		if(Z.Sleep) Z.Sleep=null
		if(Z.Slow) Z.Slow=null
		if(Z.Hold) Z.Hold=null
		if(Z.Stone) Z.Stone=null
		if(Z.Countdown) Z.Countdown=null
	Status_Null(var/mob/Z) // Dispell Effect
		if(Z.Protect) Z.Protect=null
		if(Z.Shell) Z.Shell=null
		if(Z.Reflect) Z.Reflect=null
		if(Z.Float) Z.Float=null
		if(Z.Haste) Z.Haste=null
		if(Z.Blink) Z.Blink=null
		if(Z.Strengthen) Z.Strengthen=null
		if(Z.Cry) Z.Cry=null
		if(Z.Poison) Z.Poison=null
		if(Z.Regen) Z.Regen=null
		if(Z.Darkness) Z.Darkness=null
		if(Z.Mute) Z.Mute=null
		if(Z.Curse) Z.Curse=null
		if(Z.Confuse) Z.Confuse=null
		if(Z.Berserk) Z.Berserk=null
		if(Z.Sleep) Z.Sleep=null
		if(Z.Slow) Z.Slow=null
		if(Z.Hold) Z.Hold=null
		if(Z.Stone) Z.Stone=null
		if(Z.Countdown) Z.Countdown=null
	Bad_Status_Null(var/mob/Z) // Esuna Effect
		if(Z.Poison) Z.Poison=null
		if(Z.Darkness) Z.Darkness=null
		if(Z.Mute) Z.Mute=null
		if(Z.Curse) Z.Curse=null
		if(Z.Confuse) Z.Confuse=null
		if(Z.Berserk) Z.Berserk=null
		if(Z.Sleep) Z.Sleep=null
		if(Z.Slow) Z.Slow=null
		if(Z.Hold) Z.Hold=null
		if(Z.Stone) Z.Stone=null