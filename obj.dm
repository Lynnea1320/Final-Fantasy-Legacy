var/const/max_grouped_item = 99

obj
	var
		invicon
		equip
		stance=1
		power
		attack
		magic
		special
		def
		defp
		magdef
		magdefp
		status
		iceresist
		fireresist
		litresist
		str
		agi
		vit
		wis
		wil
		value
		list/attrib = new()
		list/effect = new()

obj/weapon
	Knife
		icon='obj/weapon/knife.dmi'
		invicon="knife"
		Dagger
			icon_state="Dagger"
			equip=list("Bard","Black Twin","Young Caller","Mature Caller","Magic Knight","Fiend")
			power=6
			attack=40
			value=500
		Mythril
			icon_state="Mythril"
			equip=list("Bard","Black Twin","Young Caller","Mature Caller","Magic Knight","Fiend")
			power=22
			attack=45
			value=2000
		Silver
			icon_state="Silver"
			equip=list("Bard","Black Twin","Young Caller","Mature Caller","Magic Knight","Fiend")
			power=34
			attack=45
			special="x4undead"
			value=3800
		MageMash
			icon_state="MageMash"
			equip=list("Bard","Black Twin","Young Caller","Mature Caller","Magic Knight","Fiend")
			power=48
			attack=30
			magic="mute"
			value=8000
		Breaker
			icon_state="Mythril"
			equip=list("Bard","Black Twin","Young Caller","Mature Caller","Magic Knight","Fiend")
			power = 58
			attack = 50
			value = 12000
		Dancing
			icon_state = "Silver"
			equip = list("Bard","Black Twin","Young Caller","Mature Caller","Magic Knight","Fiend")
			power = 65
			attack = 50
			value = 18000
		Assassin
			icon_state = "Silver"
			equip = list("Bard","Black Twin","Young Caller","Mature Caller","Magic Knight","Fiend")
			power = 80
			attack = 60
			special = "death"
			value = 24000
	Sword
		icon='obj/weapon/sword.dmi'
		invicon="sword"
		Shadow
			icon_state = "shadow"
			equip=list("Black Knight","Dark Knight","Magic Knight","Swordmaster")
			power=10
			attack=30
			attrib="darkness"
			value=700
		Light
			icon_state="light"
			equip=list("Paladin","Magic Knight","Holy Knight","Swordmaster","Card Mage")
			power=10
			attack=35
			attrib="saint"
			value=800
		Mythril
			icon_state = "mythril"
			equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			power=20
			attack=40
			value=3200
		Broad
			icon_state = "broad"
			equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			power=30
			attack=40
			value=5400
		Black
			icon_state = "black"
			equip=list("Black Knight","Dark Knight","Magic Knight","Swordmaster")
			power=40
			str=5
			agi=5
			vit=5
			wis=5
			wil=-5
			attack=40
			attrib="darkness"
			magic="swoon"
			value=7200
		Legend
			icon_state = "legend"
			equip=list("Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			power=45
			str=5
			vit=5
			wil=5
			attack=50
			attrib="sacred"
			value=8000
		Ancient
			invicon="longsword"
			icon_state = "ancient"
			equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			power=55
			attack=35
			value=11000
		Silver
			icon_state = "holy"
			equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			power=50
			attack=30
			special="x4undead"
			value=14000
		Slumber
			icon_state = "slumber"
			equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Magic Knight","Fiend","Swordmaster","Card Mage")
			power=60
			attack=27
			magic="sleep"
			value=16000
		Flame
			icon_state = "flame"
			equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Dragoon","Magic Knight","Swordmaster","Card Mage")
			power=65
			attack=30
			attrib="fire"
			value=20000
		IceBrand
			icon_state = "icebrand"
			equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Dragoon","Magic Knight","Swordmaster","Card Mage")
			power=70
			attack=30
			attrib="ice"
			value=26000
		Drain
			icon_state = "drain"
			equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Dragoon","Magic Knight","Swordmaster","Card Mage")
			power=55
			str=-5
			agi=-5
			vit=-5
			wis=-5
			wil=-5
			attack=0
			magic="drainhp"
			value=28000
		Diamond
			icon_state = "drain"
			invicon="heavysword"
			equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Dragoon","Magic Knight","Swordmaster","Card Mage")
			power=80
			attack=40
			attrib="darkness"
			value=35000
		Darkness
			icon_state = "darkness"
			invicon="heavysword"
			equip=list("Black Knight","Dark Knight","Magic Knight","Swordmaster")
			power=110
			attack=40
			attrib="darkness"
			value=52000
		Defense
			icon_state = "defense"
			equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Dragoon","Magic Knight","Swordmaster","Card Mage")
			power=105
			vit=10
			attack=40
			value=57000
		Blood
			icon_state = "blood"
			invicon="heavysword"
			equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			power=100
			attack=40
			value=72000
		Death
			icon_state = "death"
			invicon="heavysword"
			equip=list("Black Knight","Dark Knight","Magic Knight","Swordmaster")
			power=160
			attack=50
			str=5
			agi=5
			wis=5
			vit=-5
			wil=-5
			attrib="darkness"
			magic="death"
			value=95000
		Excalibur
			icon_state = "excalibur"
			invicon="heavysword"
			equip=list("Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			power=160
			str=5
			agi=5
			vit=5
			attack=50
			attrib="saint"
			value=110000
		Ragnarok
			icon_state = "ragnarok"
			invicon="heavysword"
			equip=list("Black Knight","Dark Knight","Magic Knight","Swordmaster")
			power=230
			str=10
			agi=5
			wis=10
			attack=45
			value=88000
		Crystal
			icon_state = "crystal"
			invicon="heavysword"
			equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			power=220
			str=10
			agi=5
			vit=10
			wil=5
			attack=50
			value=150000
		Excalibur2
			icon_state = "excalibur2"
			invicon="heavysword"
			name = "Excalibur"
			equip = list("Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			power = 250
			str = 5
			agi = 5
			vit = 5
			wis = 5
			wil = 5
			attack = 50
			value = 150000
		Judgement
			icon_state = "crystal"
			invicon = "heavysword"
			equip = list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
			power = 270
			str = 8
			vit = 8
			agi = 8
			wil = 8
			wis = 8
			attack = 75
			value = 300000
		Royal
			icon_state = "admin"
			invicon="heavysword"
			equip=list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
			power=320
			str=10
			vit=10
			agi=10
			wil=10
			wis=10
			attack=75
			value=350000
	Spear
		icon='obj/weapon/spear.dmi'
		invicon="spear"
		Iron
			icon_state="iron"
			equip=list("Dragoon")
			power=10
			attack=50
			value=600
		Mythril
			icon_state="mythril"
			equip=list("Dragoon")
			power=24
			attack=50
			value=2800
		Trident
			icon_state="trident"
			equip=list("Dragoon")
			power=40
			attack=50
			value=5200
		Wind
			icon_state="wind"
			equip=list("Dragoon")
			power=55
			attack=30
			value=7000
		Fire
			icon_state="fire"
			equip=list("Dragoon")
			power=66
			attack=30
			attrib="fire"
			magic="fire2"
			value=11000
		Blizzard
			icon_state="blizzard"
			equip=list("Dragoon")
			power=77
			attack=30
			attrib="ice"
			magic="ice2"
			value=21000
		Drain
			icon_state="drain"
			equip=list("Dragoon")
			power=88
			str=-5
			agi=-5
			vit=-5
			wis=-5
			wil=-5
			attack=0
			magic="drainhp"
			value=52000
		Diamond
			icon_state="gungnir"
			equip=list("Dragoon")
			power=90
			vit=10
			attack=30
			value=52000
		Gungnir
			icon_state="gungnir"
			equip=list("Dragoon")
			power=100
			vit=15
			attack=30
			value=72000
		Dragoon
			icon_state="dragoon"
			equip=list("Dragoon")
			power=120
			str = 5
			vit = 5
			wis = 5
			wil = 5
			attack=40
			value=95000
		Holy
			icon_state="holy"
			equip=list("Dragoon")
			power=150
			attack=40
			str = 5
			vit = 5
			wil = 10
			attrib="saint"
			magic="white"
			value=115000
	Katana
		icon='obj/weapon/katana.dmi'
		invicon="longsword"
		Short
			icon_state="Short"
			equip=list("Ninja","Fiend","Swordmaster")
			power=8
			attack=30
			value=800
		Middle
			icon_state="Middle"
			equip=list("Ninja","Fiend","Swordmaster")
			power=14
			attack=35
			value=2600
		Long
			icon_state="Long"
			equip=list("Ninja","Fiend","Swordmaster")
			power=22
			attack=35
			value=4800
		Katana
			icon_state = "Katana"
			equip=list("Ninja","Fiend","Swordmaster")
			power=35
			attack=40
			value=6000
		Ninja
			icon_state = "Ninja"
			equip=list("Ninja","Fiend","Swordmaster")
			power=44
			str=3
			attack=40
			value=18000
		Kotetsu
			icon_state = "Ninja"
			equip = list("Ninja","Fiend","Swordmaster")
			power = 54
			str = 2
			attack = 40
			value = 22000
		Tempest
			icon_state = "Tempest"
			equip=list("Ninja","Fiend","Swordmaster")
			power=62
			str=5
			attack=45
			value=32000
		Kusanagi
			icon_state = "Tempest"
			equip = list("Ninja","Fiend","Swordmaster")
			power = 70
			attack = 45
			value = 38000
		Ichimangi
			icon_state = "Murasame"
			equip = list("Ninja","Fiend","Swordmaster")
			power = 78
			str = 5
			attack = 50
			value = 42000
		Murasame
			icon_state = "Murasame"
			equip=list("Ninja","Fiend","Swordmaster")
			power=84
			str=5
			agi=-5
			vit=5
			wis=5
			wil=-5
			attack=50
			value=48000
		Masamune
			icon_state = "Masamune"
			equip=list("Ninja","Fiend","Swordmaster")
			power=88
			str = 5
			vit = 5
			wis = 5
			attack=50
			magic="fast"
			value=62000
	Axe
		icon='obj/weapon/axe.dmi'
		invicon="axe"
		Battle
			icon_state = "battle"
			equip=list("Paladin","Holy Knight","Dark Knight","Engineer","Dragoon","Magic Knight","Card Mage")
			power=35
			attack=30
			value=4800
		Dwarf
			icon_state = "dwarf"
			equip=list("Paladin","Holy Knight","Dark Knight","Engineer","Dragoon","Magic Knight","Card Mage")
			power=62
			str=5
			agi=-5
			vit=5
			wis=-5
			wil=-5
			attack=19
			value=16000
		Ogre
			icon_state = "ogre"
			equip=list("Paladin","Holy Knight","Dark Knight","Engineer",,"Dragoon","Magic Knight","Card Mage")
			power=85
			attack=45
			special="x4giant"
			value=42000
		Runeaxe
			icon_state = "rune"
			equip=list("Paladin","Holy Knight","Dark Knight","Engineer",,"Dragoon","Magic Knight","Card Mage")
			power=100
			attack=40
			str = 20
			agi = -10
			vit = 10
			wis = -5
			wil = -5
			value=80000
	Claw
		icon='obj/weapon/claw.dmi'
		invicon="claw"
		stance=0
		Fire
			icon_state = "fire"
			equip=list("Monk","Ninja","Fiend")
			attack=30
			attrib="fire"
			value=5000
		Ice
			icon_state = "ice"
			equip=list("Monk","Ninja")
			attack=30
			attrib="ice"
			value=6000
		Thunder
			icon_state = "thunder"
			equip=list("Monk","Ninja")
			attack=30
			attrib="lit"
			value=8000
		Charm
			icon_state = "charm"
			equip=list("Monk","Ninja")
			agi=3
			magic="charm"
			special="x4giants"
			value=10000
		Poison
			icon_state = "poison"
			equip=list("Monk","Ninja")
			str=3
			attack=40
			magic="poison"
			value=16000
		Cat
			icon_state = "cat"
			equip=list("Monk","Ninja")
			str=5
			agi=5
			attack=40
			magic="sleep"
			value=25000
		Sylph
			icon_state = "cat"
			equip=list("Monk","Ninja")
			attack = 45
			magic = "hpdrain"
			value = 35000
		Hell
			icon_state = "poison"
			equip = list("Monk","Ninja")
			attack = 50
			str = 5
			agi = 5
			vit = 5
			value = 38000
		Kaiser
			icon_state = "godhand"
			equip = list("Monk","Ninja")
			attack = 55
			str = 5
			agi = 5
			vit = 5
			wis = 5
			value = 42000
		GodHand
			icon_state = "godhand"
			equip=list("Monk","Ninja")
			attack=60
			str = 5
			agi = 5
			vit = 5
			wis = 5
			wil = 5
			value=55000
	Whip
		icon='obj/weapon/whip.dmi'
		invicon="whip"
		Whip
			icon_state="whip"
			equip=list("Mature Caller")
			power=20
			magic="paralyze"
			value=4000
		Chain
			icon_state="chain"
			equip=list("Mature Caller")
			power=30
			attack=5
			magic="paralyze"
			value=6000
		Blitz
			icon_state="blitz"
			equip=list("Mature Caller")
			power=40
			attack=10
			attrib="lit"
			magic="paralyze"
			value=12000
		Flame
			icon_state="flame"
			equip=list("Mature Caller")
			power=50
			str=5
			agi=5
			vit=5
			wis=-5
			wil=-5
			attack=15
			attrib="fire"
			magic="paralyze"
			value=28000
		Ice
			icon_state = "dragon"
			equip = list("Mature Caller")
			power = 55
			str = 5
			agi = 5
			vit = 5
			wis = -5
			wil = -5
			attack = 20
			attrib = "ice"
			magic="paralyze"
			value= 32000
		Diamond
			icon_state = "blitz"
			equip = list("Mature Caller")
			power = 60
			str = 5
			agi = 5
			vit = 5
			wis = -5
			wil = -5
			attack = 25
			attrib = "bolt"
			magic="paralyze"
			value = 38000
		Dragon
			icon_state="dragon"
			equip=list("Mature Caller")
			power=65
			str = 5
			vit = 15
			wis = 5
			wil = 5
			attack=25
			magic="paralyze"
			value=40000
	Wrench
		icon='obj/weapon/wrench.dmi'
		invicon="wrench"
		Wooden
			icon_state = "wooden"
			equip=list("Engineer")
			power=14
			attack=30
			value=900
		Mythril
			icon_state ="mythril"
			equip=list("Engineer")
			power=30
			attack=35
			value=3000
		Iron
			icon_state = "iron"
			equip=list("Engineer")
			power=55
			attack=40
			value=6200
		Silver
			icon_state = "silver"
			equip=list("Engineer")
			power=65
			attack=40
			special="x4undead"
			value=12000
		Scorch
			icon_state = "white"
			equip=list("Engineer")
			power = 75
			attack = 40
			attrib = "fire"
			value = 15000
		Blizzard
			icon_state = "silver"
			equip=list("Engineer")
			power = 90
			attack = 40
			attrib = "ice"
			value = 22000
		Earth
			icon_state = "earth"
			equip=list("Engineer")
			power=110
			str=5
			attack=40
			magic="quake"
			value=27000
		White
			icon_state = "white"
			equip=list("Engineer")
			power=140
			str=6
			vit=2
			attack=50
			attrib="saint"
			magic="white"
			value=70000
		Black
			icon_state = "black"
			equip=list("Engineer")
			power=180
			str=8
			agi=2
			vit=5
			attack=50
			attrib="darkness"
			magic="nuke"
			value=85000
		Mastercraft
			icon_state = "mastercraft"
			equip=list("Engineer")
			power=240
			str=8
			agi=5
			vit=10
			attack=50
			value=165000
	Bow
		icon='obj/weapon/bow.dmi'
		invicon="bow"
		stance=0
		Shortbow
			icon_state = "shortbow"
			equip=list("Young Caller","Mature Caller","Paladin","Holy Knight","Black Twin","White Mage","White Twin","Lunarian","Bard","Engineer","Magic Knight","Card Mage")
			power=10
			attack=-20
			value=400
		Crossbow
			icon_state = "crossbow"
			equip=list("Young Caller","Mature Caller","Paladin","Holy Knight","Black Twin","White Mage","White Twin","Lunarian","Bard","Engineer","Magic Knight","Card Mage")
			power=15
			attack=-15
			value=850
		Greatbow
			icon_state = "greatbow"
			equip=list("Young Caller","Mature Caller","Paladin","Holy Knight","Black Twin","White Mage","White Twin","Lunarian","Bard","Engineer","Magic Knight","Card Mage")
			power=20
			attack=-10
			str=3
			value=2150
		Elvenbow
			icon_state = "elvenbow"
			equip=list("Young Caller","Mature Caller","Paladin","Holy Knight","Black Twin","White Mage","White Twin","Lunarian","Bard","Engineer","Magic Knight","Card Mage")
			power=35
			attack=25
			wis=3
			wil=3
			value=5300
		Firebow
			icon_state = "firebow"
			equip=list("Young Caller","Mature Caller","Paladin","Holy Knight","Black Twin","White Mage","White Twin","Lunarian","Bard","Engineer","Magic Knight","Card Mage")
			power=45
			attack=20
			str=5
			magic="fire1"
			attrib="fire"
			value=7800
		Icebow
			icon_state = "icebow"
			equip=list("Young Caller","Mature Caller","Paladin","Holy Knight","Black Twin","White Mage","White Twin","Lunarian","Bard","Engineer","Magic Knight","Card Mage")
			power=45
			attack=20
			vit=5
			magic="ice1"
			attrib="ice"
			value=7800
		Litbow
			icon_state = "litbow"
			equip=list("Young Caller","Mature Caller","Paladin","Holy Knight","Black Twin","White Mage","White Twin","Lunarian","Bard","Engineer","Magic Knight","Card Mage")
			power=55
			attack=20
			agi=5
			magic="lit2"
			attrib="lit"
			value=9800
		Dark
			icon_state = "darkbow"
			equip=list("Mature Caller","Paladin","Holy Knight","Black Twin","White Mage","White Twin","Lunarian","Bard","Engineer","Magic Knight","Card Mage")
			power=75
			attack=10
			magic="darkness"
			value=22600
		Samurai
			icon_state = "samuraibow"
			equip=list("Paladin","Holy Knight","Black Twin","White Mage","White Twin","Lunarian","Bard","Engineer","Magic Knight","Card Mage")
			power=88
			attack=15
			str=10
			value=36500
		Artemis
			icon_state = "artemis"
			equip=list("Paladin","Holy Knight","Black Twin","White Mage","White Twin","Lunarian","Bard","Magic Knight","Card Mage")
			power=105
			str=5
			agi=5
			vit=5
			attack=25
			special="x4dragon"
			value=68000
	Harp
		icon='obj/weapon/harp.dmi'
		invicon="harp"
		stance=0
		Dreamer
			icon_state = "dreamer"
			equip=list("Bard")
			power=8
			attack=35
			magic="sleep"
			value=480
		Charm
			icon_state = "charm"
			equip=list("Bard")
			power=18
			attack=40
			magic="charm"
			value=1600
		Lamia
			icon_state = "lamia"
			equip=list("Bard")
			power=36
			attack=40
			magic="confuse"
			value=7200
		Rune
			icon_state = "rune"
			equip=list("Bard")
			power=50
			attack=45
			value=16500
		FireHarp
			icon_state = "lamia"
			equip=list("Bard")
			power = 60
			attack = 45
			attrib = "fire"
			value = 23500
		IceHarp
			icon_state = "rune"
			equip=list("Bard")
			power = 72
			attack = 45
			attrib = "ice"
			value = 33500
		Apollo
			icon_state = "apollo"
			equip=list("Bard")
			power=82
			attack=45
			magic="x2dragon"
			value=42000
		Tinker
			icon_state = "tinker"
			equip=list("Bard")
			power=96
			attack=50
			value=68000
		Death
			icon_state = "death"
			equip=list("Bard")
			power=115
			attack=50
			magic="death"
			value=108000
		Angel
			icon_state = "crystal"
			equip=list("Bard")
			power=125
			str = 5
			agi = 5
			vit = 5
			wis = 5
			wil = 5
			attack=55
			value=128000
	Rod
		icon='obj/weapon/rod.dmi'
		invicon="rod"
		Rod
			icon_state="rod"
			equip=list("Young Caller","Mature Caller","Sage","Black Twin","Lunarian")
			power=3
			attack=-10
			value=250
		Icerod
			icon_state="ice"
			equip=list("Young Caller","Mature Caller","Sage","Black Twin","Lunarian")
			power=5
			attack=0
			attrib="ice"
			magic="ice1"
			value=800
		Firerod
			icon_state="fire"
			equip=list("Young Caller","Mature Caller","Sage","Black Twin","Lunarian")
			power=7
			attack=-5
			wis=3
			attrib="fire"
			magic="fire1"
			value=1000
		Thunder
			icon_state="thunder"
			equip=list("Young Caller","Mature Caller","Sage","Black Twin","Lunarian")
			power=20
			attack=0
			wis=3
			attrib="lit"
			magic="lit1"
			value=2200
		Charm
			icon_state="charm"
			equip=list("Young Caller","Mature Caller","Sage","Black Twin","Lunarian")
			power=30
			attack=5
			wis=5
			value=8000
		Wizard
			icon_state ="charm"
			equip = list("Young Caller","Mature Caller","Sage","Black Twin","Lunarian")
			power = 35
			attack = 5
			wis = 5
			wil = 5
			value = 12000
		Poison
			icon_state = "stardust"
			equip = list("Young Caller","Mature Caller","Sage","Black Twin","Lunarian")
			power = 40
			attack = 5
			wis = 5
			wil = 5
			value = 22000
		Dragon
			icon_state = "charm"
			equip = list("Young Caller","Mature Caller","Sage","Black Twin","Lunarian")
			power = 45
			attack = 5
			wis = 5
			wil = 5
			value = 29000
		Stardust
			icon_state="stardust"
			equip=list("Young Caller","Mature Caller","Sage","Black Twin","Lunarian")
			power=65
			attack=10
			wis=10
			magic="comet"
			value=35000
	Staff
		icon='obj/weapon/staff.dmi'
		invicon="staff"
		Staff
			icon_state = "staff"
			equip=list("Young Caller","Paladin","Holy Knight","Sage","White Mage","White Twin","Lunarian","Card Mage")
			power=4
			attack=-5
			value=350
		Silver
			icon_state = "silver"
			equip=list("Young Caller","Paladin","Holy Knight","Sage","White Mage","White Twin","Lunarian","Card Mage")
			power=12
			attack=5
			wil=3
			special="x4undead"
			value=4000
		Power
			icon_state = "power"
			equip=list("Young Caller","Paladin","Holy Knight","Sage","White Mage","White Twin","Lunarian","Card Mage")
			power=30
			attack=50
			str=10
			value=3500
		Lunar
			icon_state = "lunar"
			equip=list("Young Caller","Paladin","Holy Knight","Sage","White Mage","White Twin","Lunarian","Card Mage")
			power=36
			attack=10
			wil=5
			value=8600
		Silence
			icon_state = "silence"
			equip=list("Young Caller","White Mage","White Twin","Lunarian")
			power=52
			str = 5
			attack=5
			wil = 5
			magic="mute"
			value=17200
		Wizard
			icon_state = "silence"
			equip = list("Young Caller","White Mage","White Twin","Lunarian")
			power = 62
			attack = 5
			wil = 5
			wis = 5
			value = 22000
		White
			icon_state = "lunar"
			equip = list("Young Caller","White Mage","White Twin","Lunarian")
			power = 70
			attack = 5
			str = 5
			wil = 5
			value = 32300
		Zeus
			icon_state = "silence"
			equip = list("Young Caller","White Mage","White Twin","Lunarian")
			power = 75
			attack = 10
			str = 5
			wil = 5
			value = 42000
		Sage
			icon_state = "crystal"
			equip = list("Young Caller","White Mage","White Twin","Lunarian")
			power = 80
			attack = 20
			str = 5
			wil = 10
			magic = "life"
			value = 50000

obj/shield
	invicon="shield"
	stance=0
	Leather
		icon_state = "Leather"
		equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Dragoon","Engineer","Magic Knight","Card Mage")
		def=1
		defp=15
		value=240
	Iron
		icon_state = "Iron"
		equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Dragoon","Engineer","Magic Knight","Card Mage")
		def=1
		defp=20
		value=360
	Shadow
		icon_state = "Shadow"
		equip=list("Black Knight","Dark Knight")
		def=1
		defp=22
		value=480
	Black
		icon_state = "Black"
		equip=list("Black Knight","Dark Knight")
		def=2
		defp=24
		magdefp=1
		value=650
	Paladin
		icon_state = "Paladin"
		equip=list("Paladin","Holy Knight","Card Mage")
		def=2
		defp=24
		magdef=1
		magdefp=1
		wil=3
		value=880
	Silver
		icon_state = "Silver"
		equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Dragoon","Engineer","Magic Knight","Card Mage")
		def=3
		defp=26
		magdef=2
		magdefp=2
		value=1500
	Fire
		icon_state = "Fire"
		equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Dragoon","Engineer","Magic Knight","Card Mage")
		def=3
		defp=28
		magdef=2
		magdefp=2
		iceresist=40
		value=3500
	Ice
		icon_state = "Ice"
		equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Dragoon","Engineer","Magic Knight","Card Mage")
		def=3
		defp=30
		magdef=2
		magdefp=2
		fireresist=40
		value=5800
	Diamond
		icon_state = "Diamond"
		equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Dragoon","Magic Knight","Card Mage")
		def=4
		defp=32
		magdef=2
		magdefp=3
		litresist=40
		value=9800
	Aegis
		icon_state = "Aegis"
		equip=list("Paladin","Holy Knight","Dragoon","Magic Knight","Card Mage")
		def=4
		defp=34
		magdef=5
		magdefp=4
		wis=3
		wil=3
		value=18200
	Samurai
		icon_state = "Samurai"
		equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Dragoon","Engineer","Magic Knight","Card Mage")
		def=5
		defp=36
		magdef=3
		magdefp=4
		value=23500
	Darkness
		icon_state = "Darkness"
		equip=list("Black Knight","Dark Knight")
		def=5
		defp=36
		magdef=3
		magdefp=5
		value=26000
	Dragoon
		icon_state = "Dragoon"
		equip=list("Dragoon")
		def=6
		defp=38
		magdef=3
		magdefp=5
		iceresist=40
		fireresist=40
		litresist=40
		value=45000
	Crystal
		icon_state = "Crystal"
		equip=list("Paladin","Holy Knight","Magic Knight","Card Mage")
		def=7
		defp=40
		magdef=4
		magdefp=6
		wil=5
		value=67000
	Chaos
		icon_state = "Crystal"
		equip=list("Black Knight","Dark Knight","Magic Knight")
		def=7
		defp=40
		magdef=4
		magdefp=5
		wis = 5
		value=67000
	Judgement
		icon_state = "Crystal"
		equip = list("Black Knight","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Lunarian","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Card Mage")
		def = 9
		defp = 50
		magdef = 9
		magdefp = 20
		str = 2
		vit = 2
		agi = 2
		wis = 2
		wil = 2
		value = 70000
	Tower
		icon_state = "Crystal"
		equip=list("Black Knight","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Lunarian","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Card Mage")
		def=10
		defp=50
		magdef=10
		magdefp=25
		str=3
		vit=3
		agi=3
		wis=3
		wil=3
		value=75000
	Arrow
		invicon="arrow"
		equip=list("Young Caller","Hero","Mature Caller","Paladin","Holy Knight","Black Twin","White Mage","White Twin","Lunarian","Bard","Engineer","Magic Knight","Card Mage")
		Wooden
			power = 1
			value = 50
		Iron
			power = 10
			value = 1000
		Holy
			power = 12
			value = 2800
		Fire
			power = 14
			value = 4000
		Ice
			power = 15
			value = 7800
		Lit
			power = 16
			value = 9800
		Darkness
			power = 18
			value = 22600
		Poison
			power = 20
			value = 27600
		Mute
			power = 23
			value = 32500
		Samurai
			power = 26
			value = 36500
		Artemis
			power = 34
			str=1
			vit=1
			agi=1
			wis=1
			wil=1
			value = 10


obj/helmet
	invicon="helmet"
	stance=0
	Cap
		icon_state = "Cloth"
		equip=list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
		def=1
		defp=-5
		magdef=1
		magdefp=1
		value=100
	Leather
		icon_state = "Leather"
		equip=list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
		def=2
		defp=-4
		magdef=3
		magdefp=3
		value=330
	Iron
		icon_state = "Iron"
		equip=list("Black Knight","Dark Knight","Dragoon","Engineer","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
		def=3
		defp=-10
		magdef=0
		magdefp=0
		value=150
	Shadow
		icon_state = "Shadow"
		equip=list("Black Knight","Dark Knight","Swordmaster")
		def=4
		defp=-10
		magdef=0
		magdefp=0
		value=360
	Black
		icon_state = "Black"
		equip=list("Black Knight","Dark Knight","Swordmaster")
		def=6
		defp=-10
		magdef=1
		magdefp=1
		value=980
	Paladin
		icon_state = "Paladin"
		equip=list("Paladin","Holy Knight","Swordmaster","Card Mage")
		def=6
		defp=-10
		magdef=2
		magdefp=1
		wil=3
		value=1000
	Gaea
		icon_state = "Gaea"
		equip=list("Young Caller","Mature Caller","White Mage","White Twin","Black Twin","Sage","Lunarian","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
		def=3
		defp=-3
		magdef=5
		magdefp=5
		wis=3
		wil=3
		value=700
	Headband
		icon_state = "Headband"
		equip=list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
		def=1
		defp=0
		magdef=1
		magdefp=1
		str=5
		status="charm"
		value=450
	Silver
		icon_state = "Silver"
		equip=list("Black Knight","Dark Knight","Paladin","Holy Knight","Dragoon","Engineer","Magic Knight","Swordmaster","Card Mage")
		def=7
		defp=-10
		magdef=2
		magdefp=2
		value=3000
	Bandana
		icon_state = "Bandanna"
		equip=list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
		def=3
		defp=2
		magdef=1
		magdefp=1
		str=5
		vit=5
		value=1200
	Wizard
		icon_state = "Wizard"
		equip=list("Young Caller","Mature Caller","White Mage","White Twin","Black Twin","Sage","Lunarian","Swordmaster")
		def=5
		defp=-2
		magdef=7
		magdefp=7
		wil=5
		wis=5
		value=2000
	Diamond
		icon_state = "Diamond"
		equip=list("Black Knight","Dark Knight","Dragoon","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
		def=9
		defp=10
		magdef=2
		magdefp=2
		litresist=20
		value=10000
	Samurai
		icon_state = "Samurai"
		equip=list("Black Knight","Fiend","Dark Knight","Dragoon","Engineer","Paladin","Holy Knight","Ninja","Magic Knight","Swordmaster","Card Mage")
		def=10
		defp=-10
		magdef=3
		magdefp=3
		value=13500
	Tiara
		icon_state = "Tiara"
		equip=list("Young Caller","Mature Caller","Lunarian","White Twin","Black Twin","Sage","White Mage","Swordmaster")
		def=7
		defp=0
		magdef=10
		magdefp=9
		wis=5
		litresist=20
		value=10000
	Ninja
		icon_state = "Ninja"
		equip=list("Ninja","Monk","Engineer","Bard","Fiend","Swordmaster")
		def=5
		defp=4
		magdef=1
		magdefp=1
		str=3
		agi=3
		vit=3
		status="sleep"
		value=5000
	Ribbon
		icon_state = "Ribbon"
		equip=list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
		def=9
		defp=2
		magdef=12
		magdefp=12
		status="all"
		value=36000
	Darkness
		icon_state = "Darkness"
		equip=list("Black Knight","Dark Knight","Swordmaster")
		def=10
		defp=-10
		magdef=6
		magdefp=4
		value=40000
	Dragoon
		icon_state = "Dragoon"
		equip=list("Dragoon")
		def=11
		defp=-10
		magdef=7
		magdefp=4
		iceresist=20
		fireresist=20
		litresist=20
		value=48000
	Crystal
		icon_state = "Crystal"
		equip=list("Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
		def=12
		defp=-10
		magdef=8
		magdefp=5
		iceresist=20
		fireresist=20
		litresist=20
		value=60000
	Chaos
		icon_state = "Crystal"
		equip = list("Black Knight","Dark Knight","Magic Knight","Swordmaster")
		def=12
		defp=-10
		magdef=8
		magdefp=5
		iceresist=20
		fireresist=20
		litresist=20
		value=60000
	Glass
		icon_state = "Glass"
		equip=list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
		def=30
		defp=-10
		magdef=0
		magdefp=0
		value=65000
	Judgement
		icon_state = "Glass"
		equip = list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
		def = 35
		defp = 5
		magdef = 5
		magdefp = 10
		value = 80000
	Crown
		icon_state = "Glass"
		equip=list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
		def=40
		defp=10
		magdef=5
		magdefp=15
		value=85000

obj/armor
	stance=0
	Armor
		invicon="heavyarmor"
		Iron
			icon_state = "Iron"
			equip=list("Black Knight","Dark Knight","Dragoon","Engineer","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=4
			defp=-10
			magdef=1
			magdefp=0
			value=600
		Shadow
			icon_state = "Shadow"
			equip=list("Black Knight","Dark Knight","Swordmaster")
			def=5
			defp=-10
			magdef=1
			magdefp=0
			value=1100
		Black
			icon_state = "Black"
			equip=list("Black Knight","Dark Knight","Swordmaster")
			def=9
			defp=-10
			magdef=3
			magdefp=0
			value=3000
		Paladin
			icon_state = "Paladin"
			equip=list("Paladin","Holy Knight","Swordmaster","Card Mage")
			def=11
			defp=-10
			magdef=3
			magdefp=1
			wil=3
			value=8000
		Silver
			icon_state = "Silver"
			equip=list("Black Knight","Dark Knight","Dragoon","Engineer","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=13
			defp=-10
			magdef=4
			magdefp=2
			value=17000
		Fire
			icon_state = "Fire"
			equip=list("Black Knight","Dark Knight","Dragoon","Engineer","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=15
			defp=-10
			magdef=4
			magdefp=2
			iceresist=40
			value=30000
		Ice
			icon_state = "Ice"
			equip=list("Black Knight","Dark Knight","Dragoon","Engineer","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=17
			defp=-10
			magdef=4
			magdefp=2
			fireresist=40
			value=35000
		Diamond
			icon_state = "Diamond"
			equip=list("Black Knight","Dark Knight","Dragoon","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=19
			defp=-5
			magdef=4
			magdefp=2
			litresist=40
			value=40000
		Samurai
			icon_state = "Samurai"
			equip=list("Black Knight","Fiend","Dark Knight","Dragoon","Engineer","Paladin","Holy Knight","Ninja","Magic Knight","Swordmaster","Card Mage")
			def=21
			defp=-10
			magdef=4
			magdefp=2
			value=45000
		Darkness
			icon_state = "Darkness"
			equip=list("Black Knight","Dark Knight","Swordmaster")
			def=22
			defp=-10
			magdef=5
			magdefp=3
			value=60000
		Dragoon
			icon_state = "Dragoon"
			equip=list("Dragoon")
			def=23
			defp=-10
			magdef=8
			magdefp=5
			str=3
			agi=3
			vit=3
			iceresist=40
			fireresist=40
			litresist=40
			value=70000
		Crystal
			icon_state = "Crystal"
			name="Crystal"
			equip=list("Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=25
			defp=-10
			magdef=10
			magdefp=6
			wil=5
			status="all"
			value=110000
		Chaos
			icon_state = "Crystal"
			name="Chaos"
			equip=list("Black Knight","Dark Knight","Magic Knight","Swordmaster","Card Mage")
			def=25
			defp=-10
			magdef=10
			magdefp=6
			wis=5
			status="all"
			value=110000
		Adamant
			icon_state = "Adamant"
			equip=list("Black Knight","Fiend","Dark Knight","Dragoon","Engineer","Monk","Ninja","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=75
			defp=40
			magdef=20
			magdefp=20
			str=10
			agi=10
			vit=10
			wis=10
			wil=10
			iceresist=60
			fireresist=60
			litresist=60
			value=999999
		Judgement
			icon_state = "Adamant"
			equip = list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
			def = 85
			defp = 45
			magdef = 25
			magdefp = 25
			str = 12
			agi = 12
			vit = 12
			wis = 12
			wil = 12
			iceresist = 65
			fireresist = 65
			litresist = 65
			value = 9999999
		Mythril
			icon_state = "Adamant"
			equip=list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
			def=95
			defp=50
			magdef=30
			magdefp=30
			str=15
			agi=15
			vit=15
			wis=15
			wil=15
			iceresist=75
			fireresist=75
			litresist=75
			value=9999999
	Robe
		invicon="lightarmor"
		Cloth
			icon_state = "Cloth"
			equip=list("Bard","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Fiend","Swordmaster","Card Mage")
			def=1
			defp=0
			magdef=0
			magdefp=0
			value=50
		Prisoner
			icon_state = "Prisoner"
			equip=list("Bard","Black Knight","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Fiend","Swordmaster","Card Mage")
			def=1
			defp=0
			magdef=1
			magdefp=0
			value=70
		Bard
			icon_state = "Bard"
			equip=list("Bard","Black Knight","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Fiend","Swordmaster","Card Mage")
			def=2
			defp=0
			magdef=1
			magdefp=0
			status="mute"
			value=80
		Leather
			icon_state = "Leather"
			equip=list("Bard","Black Knight","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Fiend","Swordmaster","Card Mage")
			def=2
			defp=0
			magdef=1
			magdefp=1
			value=200
		Gaea
			icon_state = "Gaea"
			equip=list("Young Caller","Mature Caller","White Mage","White Twin","Black Twin","Sage","Lunarian","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=3
			defp=0
			magdef=3
			magdefp=3
			value=500
		Karate
			icon_state = "Karate"
			equip=list("Bard","Black Knight","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Fiend","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
			def=5
			defp=10
			magdef=2
			magdefp=1
			str=3
			value=4000
		Wizard
			icon_state = "Wizard"
			equip=list("Bard","Young Caller","Mature Caller","White Mage","White Twin","Black Twin","Sage","Lunarian","Swordmaster")
			def=8
			defp=0
			magdef=5
			magdefp=5
			wil=5
			value=1200
		BlBelt
			icon_state = "BlBelt"
			equip=list("Bard","Engineer","Monk","Ninja","Young Caller","Mature Caller","White Mage","White Twin","Black Twin","Sage","Lunarian","Fiend","Swordmaster")
			def=8
			defp=20
			magdef=3
			magdefp=2
			str=5
			vit=5
			value=14000
		Power
			icon_state = "Power"
			equip=list("Dark Knight","Black Knight","Fiend","Mature Caller","Lunarian","Ninja","Magic Knight","Swordmaster")
			def=5
			defp=0
			magdef=0
			magdefp=0
			str=15
			wis=5
			value=8000
		Sorceror
			icon_state = "Sorceror"
			equip=list("Young Caller","Mature Caller","Lunarian","Magic Knight","Swordmaster")
			def=12
			defp=0
			magdef=9
			magdefp=9
			wis=5
			wil=5
			litresist=40
			value=30000
		Ninja
			icon_state = "Ninja"
			equip=list("Ninja","Monk","Fiend","Engineer","Bard","Swordmaster")
			def=16
			defp=16
			magdef=8
			magdefp=2
			agi=5
			value=34000
		White
			icon_state = "White"
			equip=list("Young Caller","Paladin","Holy Knight","White Mage","White Twin","Lunarian","Swordmaster","Card Mage")
			def=12
			defp=0
			magdef=10
			magdefp=4
			wil=5
			value=48000
		Black
			icon_state = "Black"
			equip=list("Young Caller","Fiend","Mature Caller","Black Knight","Black Twin","Sage","Magic Knight","Swordmaster")
			def=12
			defp=0
			magdef=10
			magdefp=4
			wis=5
			value=48000
		Heroine
			icon_state = "Heroine"
			equip=list("Young Caller","Mature Caller","White Mage","White Twin")
			def=20
			defp=30
			magdef=5
			magdefp=5
			wis=5
			wil=5
			status="paralyze"
			value=50000
		Adamant
			icon_state = "Adamant"
			equip=list("Bard","Black Twin","Young Caller","Mature Caller","Lunarian","Sage","White Mage","White Twin","Swordmaster")
			def=55
			defp=20
			magdef=40
			magdefp=30
			str=10
			agi=10
			vit=10
			wis=10
			wil=10
			iceresist=80
			fireresist=80
			litresist=80
			value=999999

obj/arm
	stance=0
	Glove
		invicon="glove"
		Leather
			icon_state = "Leather"
			equip=list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
			def=1
			defp=-10
			magdef=0
			magdefp=0
			value=80
		Iron
			icon_state = "Iron"
			equip=list("Black Knight","Fiend","Dark Knight","Dragoon","Engineer","Ninja","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=2
			defp=-10
			magdef=0
			magdefp=0
			value=130
		Shadow
			icon_state = "Shadow"
			equip=list("Black Knight","Dark Knight","Swordmaster")
			def=2
			defp=-10
			magdef=0
			magdefp=0
			value=260
		Black
			icon_state = "Black"
			equip=list("Black Knight","Dark Knight","Swordmaster")
			def=4
			defp=-10
			magdef=0
			magdefp=0
			value=800
		Paladin
			icon_state = "Paladin"
			equip=list("Paladin","Holy Knight","Swordmaster","Card Mage")
			def=5
			defp=-10
			magdef=1
			magdefp=1
			wil=3
			value=3000
		Silver
			icon_state = "Silver"
			equip=list("Black Knight","Dark Knight","Dragoon","Engineer","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=6
			defp=-10
			magdef=2
			magdefp=2
			value=2000
		Diamond
			icon_state = "Diamond"
			equip=list("Black Knight","Dark Knight","Dragoon","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=7
			defp=-10
			magdef=3
			magdefp=3
			litresist=20
			value=5000
		Samurai
			icon_state = "Samurai"
			equip=list("Black Knight","Fiend","Dark Knight","Dragoon","Engineer","Ninja","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=8
			defp=-10
			magdef=5
			magdefp=3
			value=8000
		Darkness
			icon_state = "Darkness"
			equip=list("Black Knight","Dark Knight","Swordmaster")
			def=8
			defp=-10
			magdef=6
			magdefp=3
			value=10000
		Dragoon
			icon_state = "Dragoon"
			equip=list("Dragoon","Swordmaster")
			def=9
			defp=-10
			magdef=6
			magdefp=3
			iceresist=20
			fireresist=20
			litresist=20
			value=13000
		Crystal
			icon_state = "Crystal Glove"
			name="Crystal"
			equip=list("Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=10
			defp=-10
			magdef=7
			magdefp=4
			wil=5
			value=18000
		Chaos
			icon_state = "Crystal Glove"
			name="Crystal"
			equip=list("Black Knight","Dark Knight","Magic Knight","Swordmaster")
			def=10
			defp=-10
			magdef=7
			magdefp=4
			wis=5
			value=18000
		Zeus
			icon_state = "Zeus"
			equip=list("Black Knight","Fiend","Dark Knight","Dragoon","Engineer","Ninja","Paladin","Holy Knight","Magic Knight","Swordmaster","Card Mage")
			def=15
			defp=-10
			magdef=0
			magdefp=0
			wis=5
			wil=5
			value=20000
		Judgement
			icon_state = "Zeus"
			equip = list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller","Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
			def = 20
			defp = 5
			magdef = 12
			magdefp = 10
			wis = 7
			wil = 7
			value = 35000
		Gauntlet
			icon_state = "Zeus"
			equip=list("Bard","Black Knight","Fiend","Black Twin","Young Caller","Mature Caller",,"Dark Knight","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
			def=25
			defp=10
			magdef=10
			magdefp=15
			wis=10
			wil=10
			value=50000

	Ring
		invicon="ring"
		Iron
			icon_state = "Iron"
			equip=list("Young Caller","Fiend","Mature Caller","Sage","White Mage","White Twin","Black Twin","Monk","Ninja","Bard","Swordmaster")
			def=2
			defp=0
			magdef=2
			magdefp=1
			value=100
		Ruby
			icon_state = "Ruby"
			equip=list("Bard","Black Twin","Fiend","Young Caller","Mature Caller","Dragoon","Engineer","Monk","Lunarian","Ninja","Paladin","Holy Knight","Sage","White Mage","White Twin","Magic Knight","Swordmaster","Card Mage")
			def=0
			defp=0
			magdef=3
			magdefp=2
			status="pig"
			value=1000
		Silver
			icon_state = "Silver"
			equip=list("Ninja","Monk","Fiend","White Mage","White Twin","Black Twin","Young Caller","Mature Caller","Sage","Swordmaster")
			def=4
			defp=0
			magdef=4
			magdefp=4
			value=650
		Rune
			icon_state = "Rune"
			equip=list("Young Caller","Fiend","Mature Caller","Monk","Ninja","White Mage","White Twin","Lunarian","Swordmaster")
			def=5
			defp=0
			magdef=8
			magdefp=8
			status="mute"
			wis=3
			wil=3
			value=2000
		Strength
			icon_state = "Strength"
			equip=list("Paladin","Holy Knight","Fiend","Mature Caller","Monk","Ninja","Dragoon","Engineer","Magic Knight","Swordmaster","Card Mage")
			def=2
			defp=0
			magdef=2
			magdefp=2
			str=5
			value=760
		Diamond
			icon_state = "Diamond"
			equip=list("Sage","Lunarian","Fiend","White Mage","Black Twin","White Twin","Young Caller","Mature Caller","Ninja","Monk","Bard","Engineer","Magic Knight","Swordmaster")
			def=6
			defp=0
			magdef=8
			magdefp=6
			litresist=20
			value=4000
		Protect
			icon_state = "Protect"
			equip=list("Paladin","Holy Knight","Dragoon","Fiend","Ninja","White Mage","White Twin","Young Caller","Mature Caller","Black Twin","Sage","Lunarian","Magic Knight","Swordmaster","Card Mage")
			def=10
			defp=5
			magdef=12
			magdefp=10
			vit=5
			iceresist=20
			fireresist=20
			litresist=20
			value=6000
		Curse
			icon_state = "Protect"
			equip = list("Black Knight","Dark Knight","Swordmaster")
			def=10
			defp=5
			magdef=12
			magdefp=10
			vit=5
			iceresist=20
			fireresist=20
			litresist=20
			value=6000
		Crystal
			icon_state = "Crystal Ring"
			name="Crystal"
			equip=list("White Mage","Fiend","White Twin","Young Caller","Sage","Mature Caller","Black Twin","Lunarian","Holy Knight","Paladin","Swordmaster","Card Mage")
			def=20
			defp=0
			magdef=12
			magdefp=10
			wil=5
			wis=5
			value=18000

obj/Key_Item
	invicon="key"
	Channel/special = "underground_channel"
	Royal/special = "royal"
	SRoadEssence
		invicon = "other"
		special = "sroad"
	SandRuby/invicon = null
	Pink_Tail/invicon = "tail"
	Adamant/invicon = null
	ArchBlood/invicon = "potion"
	Hvrcraft
		invicon = "other"
		special = "Hover"
	BlkChoco
		invicon = "choco"
		special = "Fly"
	Airship
		invicon = "bonus"
		special = "Fly"