var/const/GPLimit = 9999999
var/const/min_level = 5

mob/var
	level
	HP
	MaxHP
	MP
	MaxMP
	status
	list/Resist = new()
	list/StatResist = new()
	Maxlev=0  //This stat becomes 1 after you hit 99
	char_num

mob/PC/var
	list/Black = new()
	list/Black_ = new()
	list/BMagic = new()
	list/White = new()
	list/White_ = new()
	list/White__ = new()
	list/WMagic = new()
	list/Summon = new()
	list/Summon_ = new()
	list/Song = new()
	list/Ninjutsu = new()
	list/Twin = new()
	list/Support = new()
	list/Create = new()
	list/Blue = new()
	str
	agi
	vit
	wis
	wil

mob
	proc
		lvl2exp(i as num)
			var/Experience = round(((i*i*i)+(3.6*(i*i))+27*i+44))
			return Experience
/*mob
	proc
		lvl2exp(i as num)
			if(i<=68)
				switch(i)
					if(1)return 44;if(2)return 76;if(3)return 118;if(4)return 175;if(5)return 249;if(6)return 345
					if(7)return 467;if(8)return 617;if(9)return 800;if(10)return 1018;if(11)return 1276;if(12)return 1578
					if(13)return 1926;if(14)return 2325;if(15)return 2777;if(16)return 3287;if(17)return 3859;if(18)return 4495
					if(19)return 5200;if(20)return 5976;if(21)return 6828;if(22)return 7760;if(23)return 8774;if(24)return 9875
					if(25)return 11065;if(26)return 12349;if(27)return 13731;if(28)return 15213;if(29)return 16800;if(30)return 18494
					if(31)return 20300;if(32)return 22222;if(33)return 24262;if(34)return 26425;if(35)return 28713;if(36)return 31131
					if(37)return 33683;if(38)return 36371;if(39)return 39200;if(40)return 42172;if(41)return 45292;if(42)return 48564
					if(43)return 51990;if(44)return 55575;if(45)return 59321;if(46)return 63233;if(47)return 67315;if(48)return 71569
					if(49)return 76000;if(50)return 80610;if(51)return 85404;if(52)return 90386;if(53)return 95558;if(54)return 100925
					if(55)return 106489;if(56)return 112255;if(57)return 118227;if(58)return 124407;if(59)return 130800;if(60)return 137408
					if(61)return 144236;if(62)return 151288;if(63)return 158566;if(64)return 166075;if(65)return 173817;if(66)return 181797
					if(67)return 190019;if(68)return 198485;if(69)return 207200;if(70)return 216171;if(71)return 225406;if(72)return 222533
					if(73)return 229082;if(74)return 235823;if(75)return 242763;if(76)return 249906;if(77)return 257260;if(78)return 264831
					if(79)return 272624;if(80)return 280647;if(81)return 288906;if(82)return 297408;if(83)return 306160;if(84)return 315170
					if(85)return 324445;if(86)return 333993;if(87)return 343822;if(88)return 364356;if(89)return 375078;if(90)return 386116
					if(91)return 397479;if(92)return 409176;if(93)return 421217;if(94)return 433613;if(95)return 446373;if(96)return 459509
					if(97)return 473032;if(98)return 486952
			else return 501282*/

mob/PC/proc
	level_up()
		if(level<99&&exp>=maxexp)
			level++
			maxexp+=lvl2exp(level)
			var/cls = class
			switch(cls)
				if("Bard")
					if(level<10){MaxHP+=10+rand(0,1)}
					else if(level<20){MaxHP+=18+rand(0,1)}
					else if(level<30){MaxHP+=25+rand(0,1)}
					else if(level<40){MaxHP+=38+rand(0,2)}
					else if(level<50){MaxHP+=53+rand(0,2)}
					else if(level<60){MaxHP+=74+rand(0,3)}
					else if(level<70){MaxHP+=98+rand(0,3)}
					else if(level<80){MaxHP+=121+rand(0,4)}
					else if(level<90){MaxHP+=153+rand(0,4)}
					else if(level<99){MaxHP+=177+rand(0,5)}
					switch(rand(1,4))
						if(1){str+=1;vit+=1;agi+=1;wis+=1;wil+=1}
						if(2){str+=1;vit+=1;agi+=1;wis+=1;wil+=1}
						if(3){str+=1;vit+=1;agi+=1;wis+=1;wil+=1}
						if(4){str+=1;vit+=1;agi+=1;wis+=1;wil+=1}
				if("Black Knight")
					if(level<10){MaxHP+=8+rand(0,1);MaxMP+=3}
					else if(level<20){MaxHP+=16+rand(0,1);MaxMP+=3+rand(0,1)}
					else if(level<30){MaxHP+=26+rand(0,1);MaxMP+=4+rand(0,1)}
					else if(level<40){MaxHP+=38+rand(0,2);MaxMP+=4+rand(0,1)}
					else if(level<50){MaxHP+=52+rand(0,2);MaxMP+=5+rand(0,2)}
					else if(level<60){MaxHP+=68+rand(0,2);MaxMP+=6+rand(0,2)}
					else if(level<70){MaxHP+=78+rand(0,3);MaxMP+=6+rand(0,2)}
					else if(level<80){MaxHP+=100+rand(0,3);MaxMP+=7+rand(0,3)}
					else if(level<90){MaxHP+=134+rand(0,3);MaxMP+=8+rand(0,3)}
					else if(level<99){MaxHP+=160+rand(0,5);MaxMP+=8+rand(0,3)}
					switch(rand(1,4))
						if(1){str+=1;vit+=0+rand(0,1);agi+=0;wis+=1;wil+=0}
						if(2){str+=0+rand(0,1);vit+=2;agi+=1;wis+=1;wil+=0}
						if(3){str+=1;vit+=1;agi+=1;wis+=1+rand(0,1);wil+=0}
						if(4){str+=1;vit+=1+rand(0,1);agi+=1;wis+=1;wil+=0}
				if("Black Twin")
					if(level<10){MaxHP+=8+rand(0,1);MaxMP+=5}
					else if(level<20){MaxHP+=16+rand(0,1);MaxMP+=5+rand(0,1)}
					else if(level<30){MaxHP+=26+rand(0,1);MaxMP+=6+rand(0,1)}
					else if(level<40){MaxHP+=38+rand(0,2);MaxMP+=7+rand(0,1)}
					else if(level<50){MaxHP+=52+rand(0,2);MaxMP+=7+rand(0,2)}
					else if(level<60){MaxHP+=68+rand(0,2);MaxMP+=8+rand(0,2)}
					else if(level<70){MaxHP+=78+rand(0,3);MaxMP+=9+rand(0,2)}
					else if(level<80){MaxHP+=100+rand(0,3);MaxMP+=9+rand(0,3)}
					else if(level<90){MaxHP+=124+rand(0,3);MaxMP+=10+rand(0,3)}
					else if(level<99){MaxHP+=150+rand(0,5);MaxMP+=12+rand(0,3)}
					switch(rand(1,4))
						if(1){str+=1;vit+=0;agi+=0;wis+=1+rand(0,1);wil+=1}
						if(2){str+=0;vit+=1;agi+=0;wis+=1;wil+=2}
						if(3){str+=1;vit+=1;agi+=1;wis+=1;wil+=0+rand(0,1)}
						if(4){str+=0;vit+=0;agi+=1+rand(0,1);wis+=2;wil+=0}
				if("Young Caller")
					if(level<10){MaxHP+=8+rand(0,1);MaxMP+=4}
					else if(level<20){MaxHP+=16+rand(0,1);MaxMP+=4+rand(0,1)}
					else if(level<30){MaxHP+=26+rand(0,1);MaxMP+=5+rand(0,1)}
					else if(level<40){MaxHP+=38+rand(0,2);MaxMP+=6+rand(0,1)}
					else if(level<50){MaxHP+=52+rand(0,2);MaxMP+=6+rand(0,2)}
					else if(level<60){MaxHP+=68+rand(0,2);MaxMP+=7+rand(0,2)}
					else if(level<70){MaxHP+=78+rand(0,3);MaxMP+=8+rand(0,2)}
					else if(level<80){MaxHP+=100+rand(0,3);MaxMP+=8+rand(0,3)}
					else if(level<90){MaxHP+=124+rand(0,3);MaxMP+=9+rand(0,3)}
					else if(level<99){MaxHP+=150+rand(0,5);MaxMP+=10+rand(0,3)}
					switch(rand(1,4))
						if(1){str+=0;vit+=1;agi+=0;wis+=1+rand(0,1);wil+=1}
						if(2){str+=1;vit+=1;agi+=0+rand(0,1);wis+=0;wil+=1}
						if(3){str+=1;vit+=0;agi+=1;wis+=1;wil+=0+rand(0,1)}
						if(4){str+=0;vit+=0;agi+=1;wis+=1+rand(0,1);wil+=1}
				if("Mature Caller")
					if(level<10){MaxHP+=8+rand(0,1);MaxMP+=5}
					else if(level<20){MaxHP+=15+rand(0,1);MaxMP+=6+rand(0,1)}
					else if(level<30){MaxHP+=23+rand(0,1);MaxMP+=7+rand(0,1)}
					else if(level<40){MaxHP+=38+rand(0,2);MaxMP+=8+rand(0,1)}
					else if(level<50){MaxHP+=45+rand(0,2);MaxMP+=9+rand(0,2)}
					else if(level<60){MaxHP+=59+rand(0,2);MaxMP+=10+rand(0,2)}
					else if(level<70){MaxHP+=70+rand(0,3);MaxMP+=11+rand(0,2)}
					else if(level<80){MaxHP+=87+rand(0,3);MaxMP+=12+rand(0,3)}
					else if(level<90){MaxHP+=119+rand(0,3);MaxMP+=13+rand(0,3)}
					else if(level<99){MaxHP+=133+rand(0,5);MaxMP+=14+rand(0,3)}
					switch(rand(1,4))
						if(1){str+=0;vit+=1;agi+=0+rand(0,1);wis+=1;wil+=1}
						if(2){str+=2;vit+=1;agi+=0;wis+=1;wil+=0+rand(0,1)}
						if(3){str+=1;vit+=0;agi+=1+rand(0,1);wis+=2;wil+=0}
						if(4){str+=0+rand(0,1);vit+=0;agi+=1;wis+=1;wil+=1}
				if("Magic Knight")
					if(level<10){MaxHP+=10+rand(0,1);MaxMP+=rand(1,2)}
					else if(level<20){MaxHP+=18+rand(0,1);MaxMP+=2}
					else if(level<30){MaxHP+=26+rand(0,1);MaxMP+=rand(2,3)}
					else if(level<40){MaxHP+=39+rand(0,2);MaxMP+=3}
					else if(level<50){MaxHP+=56+rand(0,2);MaxMP+=rand(3,4)}
					else if(level<60){MaxHP+=78+rand(0,3);MaxMP+=4}
					else if(level<70){MaxHP+=102+rand(0,3);MaxMP+=rand(4,5)}
					else if(level<80){MaxHP+=127+rand(0,4);MaxMP+=5}
					else if(level<90){MaxHP+=161+rand(0,4);MaxMP+=rand(5,6)}
					else if(level<99){MaxHP+=186+rand(0,5);MaxMP+=6}
					switch(rand(1,4))
						if(1){str+=1+rand(0,1);vit+=0;agi+=0;wis+=1;wil+=1}
						if(2){str+=0;vit+=2;agi+=1+rand(0.1);wis+=1;wil+=0}
						if(3){str+=1;vit+=1;agi+=1;wis+=1+rand(0,1);wil+=1}
						if(4){str+=1;vit+=1;agi+=1;wis+=0;wil+=1+rand(0,1)}
				if("Lunar Knight")
					if(level<10){MaxHP+=12+rand(0,1);MaxMP+=2}
					else if(level<20){MaxHP+=24+rand(0,1);MaxMP+=2+rand(0,1)}
					else if(level<30){MaxHP+=38+rand(0,1);MaxMP+=2+rand(1,2)}
					else if(level<40){MaxHP+=53+rand(0,2);MaxMP+=2+rand(1,2)}
					else if(level<50){MaxHP+=76+rand(0,2);MaxMP+=3+rand(1,2)}
					else if(level<60){MaxHP+=92+rand(0,3);MaxMP+=3+rand(1,2)}
					else if(level<70){MaxHP+=124+rand(0,3);MaxMP+=4+rand(1,2)}
					else if(level<80){MaxHP+=156+rand(0,4);MaxMP+=4+rand(2,3)}
					else if(level<90){MaxHP+=196+rand(0,4);MaxMP+=4+rand(2,3)}
					else if(level<99){MaxHP+=231+rand(0,5);MaxMP+=5+rand(2,3)}
					switch(rand(1,4))
						if(1){str+=1;vit+=0;agi+=1;wis+=1;wil+=0+rand(0,1)}
						if(2){str+=0+rand(0,1);vit+=1;agi+=1;wis+=0;wil+=1}
						if(3){str+=1;vit+=1;agi+=1;wis+=0+rand(0,1);wil+=0}
						if(4){str+=1;vit+=1+rand(0,1);agi+=0;wis+=0;wil+=1}
				if("Holy Knight")
					if(level<10){MaxHP+=10+rand(0,1);MaxMP+=2}
					else if(level<20){MaxHP+=21+rand(0,1);MaxMP+=2+rand(0,1)}
					else if(level<30){MaxHP+=33+rand(0,1);MaxMP+=2+rand(1,2)}
					else if(level<40){MaxHP+=47+rand(0,2);MaxMP+=2+rand(1,2)}
					else if(level<50){MaxHP+=65+rand(0,2);MaxMP+=3+rand(1,2)}
					else if(level<60){MaxHP+=98+rand(0,3);MaxMP+=3+rand(1,2)}
					else if(level<70){MaxHP+=121+rand(0,3);MaxMP+=4+rand(1,2)}
					else if(level<80){MaxHP+=140+rand(0,4);MaxMP+=4+rand(2,3)}
					else if(level<90){MaxHP+=170+rand(0,5);MaxMP+=4+rand(2,3)}
					else if(level<99){MaxHP+=210+rand(0,6);MaxMP+=5+rand(2,3)}
					switch(rand(1,4))
						if(1){str+=2;vit+=1;agi+=1;wis+=0+rand(0,1);wil+=1}
						if(2){str+=1;vit+=0;agi+=0;wis+=1;wil+=0+rand(1,2)}
						if(3){str+=0+rand(0,1);vit+=1;agi+=1;wis+=1;wil+=1}
						if(4){str+=1;vit+=1;agi+=1+rand(0,1);wis+=0;wil+=1}
				if("Dark Knight")
					if(level<10){MaxHP+=10+rand(0,1)}
					else if(level<20){MaxHP+=21+rand(0,1)}
					else if(level<30){MaxHP+=33+rand(0,1)}
					else if(level<40){MaxHP+=47+rand(0,2)}
					else if(level<50){MaxHP+=65+rand(0,2)}
					else if(level<60){MaxHP+=88+rand(0,3)}
					else if(level<70){MaxHP+=119+rand(0,3)}
					else if(level<80){MaxHP+=149+rand(0,4)}
					else if(level<90){MaxHP+=189+rand(0,4)}
					else if(level<99){MaxHP+=213+rand(0,5)}
					switch(rand(1,4))
						if(1){str+=2;vit+=0+rand(0,1);agi+=1;wis+=1;wil+=0}
						if(2){str+=1;vit+=1;agi+=1;wis+=1+rand(0,1);wil+=0}
						if(3){str+=0;vit+=1;agi+=1;wis+=0+rand(0,1);wil+=0}
						if(4){str+=1+rand(0,1);vit+=1;agi+=0;wis+=0;wil+=0}
				if("Dragoon")
					if(level<10){MaxHP+=10+rand(0,1)}
					else if(level<20){MaxHP+=19+rand(0,1)}
					else if(level<30){MaxHP+=26+rand(0,1)}
					else if(level<40){MaxHP+=43+rand(0,2)}
					else if(level<50){MaxHP+=62+rand(0,2)}
					else if(level<60){MaxHP+=77+rand(0,3)}
					else if(level<70){MaxHP+=112+rand(0,3)}
					else if(level<80){MaxHP+=139+rand(0,4)}
					else if(level<90){MaxHP+=178+rand(0,4)}
					else if(level<99){MaxHP+=203+rand(0,5)}
					switch(rand(1,4))
						if(1){str+=1;vit+=0;agi+=0;wis+=1+rand(0,1);wil+=0}
						if(2){str+=1+rand(0,1);vit+=1;agi+=1;wis+=0;wil+=1}
						if(3){str+=1;vit+=1;agi+=1;wis+=1;wil+=1+rand(0,1)}
						if(4){str+=0;vit+=1;agi+=1+rand(0,1);wis+=0;wil+=0}
				if("Engineer")
					if(level<10){MaxHP+=12+rand(0,1)}
					else if(level<20){MaxHP+=24+rand(0,1)}
					else if(level<30){MaxHP+=38+rand(0,1)}
					else if(level<40){MaxHP+=53+rand(0,2)}
					else if(level<50){MaxHP+=76+rand(0,2)}
					else if(level<60){MaxHP+=92+rand(0,3)}
					else if(level<70){MaxHP+=124+rand(0,3)}
					else if(level<80){MaxHP+=156+rand(0,4)}
					else if(level<90){MaxHP+=196+rand(0,4)}
					else if(level<99){MaxHP+=231+rand(0,5)}
					switch(rand(1,4))
						if(1){str+=2;vit+=0;agi+=1;wis+=0;wil+=0}
						if(2){str+=1+rand(0,1);vit+=1;agi+=1;wis+=1;wil+=0}
						if(3){str+=1;vit+=1+rand(0,1);agi+=0;wis+=0;wil+=1}
						if(4){str+=1;vit+=2;agi+=1;wis+=0;wil+=0}
				if("Monk")
					if(level<10){MaxHP+=10+rand(0,1)}
					else if(level<20){MaxHP+=18+rand(0,1)}
					else if(level<30){MaxHP+=24+rand(0,1)}
					else if(level<40){MaxHP+=41+rand(0,2)}
					else if(level<50){MaxHP+=60+rand(0,2)}
					else if(level<60){MaxHP+=75+rand(0,3)}
					else if(level<70){MaxHP+=108+rand(0,3)}
					else if(level<80){MaxHP+=134+rand(0,4)}
					else if(level<90){MaxHP+=162+rand(0,4)}
					else if(level<99){MaxHP+=195+rand(0,5)}
					switch(rand(1,4))
						if(1){str+=2;vit+=0+rand(0,1);agi+=0;wis+=1;wil+=0}
						if(2){str+=1;vit+=1;agi+=1+rand(0,1);wis+=0;wil+=0}
						if(3){str+=1;vit+=1;agi+=1;wis+=0+rand(0,1);wil+=1}
						if(4){str+=1;vit+=2;agi+=1;wis+=0;wil+=0+rand(0.1)}
				if("Lunarian")
					if(level<10){MaxHP+=8+rand(0,1);MaxMP+=5}
					else if(level<20){MaxHP+=16+rand(0,1);MaxMP+=5+rand(0,1)}
					else if(level<30){MaxHP+=26+rand(0,1);MaxMP+=6+rand(0,1)}
					else if(level<40){MaxHP+=38+rand(0,2);MaxMP+=7+rand(0,1)}
					else if(level<50){MaxHP+=52+rand(0,2);MaxMP+=7+rand(0,2)}
					else if(level<60){MaxHP+=68+rand(0,2);MaxMP+=8+rand(0,2)}
					else if(level<70){MaxHP+=78+rand(0,3);MaxMP+=9+rand(0,2)}
					else if(level<80){MaxHP+=100+rand(0,3);MaxMP+=9+rand(0,3)}
					else if(level<90){MaxHP+=124+rand(0,3);MaxMP+=10+rand(0,3)}
					else if(level<99){MaxHP+=150+rand(0,5);MaxMP+=12+rand(0,3)}
					switch(rand(1,4))
						if(1){str+=1;vit+=1;agi+=0;wis+=1;wil+=0+rand(0,1)}
						if(2){str+=0;vit+=0+rand(0.1);agi+=1;wis+=1;wil+=1}
						if(3){str+=0;vit+=1;agi+=0+rand(0.1);wis+=1;wil+=2}
						if(4){str+=1;vit+=0;agi+=1;wis+=0+rand(0,1);wil+=1}
				if("Ninja")
					if(level<10){MaxHP+=10+rand(0,1);MaxMP+=2}
					else if(level<20){MaxHP+=17+rand(0,1);MaxMP+=rand(2,3)}
					else if(level<30){MaxHP+=25+rand(0,1);MaxMP+=2}
					else if(level<40){MaxHP+=36+rand(0,2);MaxMP+=rand(2,3)}
					else if(level<50){MaxHP+=52+rand(0,2);MaxMP+=2}
					else if(level<60){MaxHP+=73+rand(0,3);MaxMP+=rand(2,3)}
					else if(level<70){MaxHP+=96+rand(0,3);MaxMP+=2}
					else if(level<80){MaxHP+=119+rand(0,4);MaxMP+=rand(2,3)}
					else if(level<90){MaxHP+=149+rand(0,4);MaxMP+=3}
					else if(level<99){MaxHP+=171+rand(0,5);MaxMP+=3}
					switch(rand(1,4))
						if(1){str+=1;vit+=0;agi+=1;wis+=0;wil+=0+rand(0,1)}
						if(2){str+=0+rand(0,1);vit+=1;agi+=1;wis+=1;wil+=0}
						if(3){str+=1;vit+=1;agi+=0+rand(0,1);wis+=2;wil+=0}
						if(4){str+=1;vit+=1;agi+=1;wis+=0+rand(0,1);wil+=1}
				if("Paladin")
					if(level<10){MaxHP+=15+rand(0,1);MaxMP+=rand(1,2)}
					else if(level<20){MaxHP+=28+rand(0,1);MaxMP+=2}
					else if(level<30){MaxHP+=36+rand(0,1);MaxMP+=rand(2,3)}
					else if(level<40){MaxHP+=59+rand(0,2);MaxMP+=3}
					else if(level<50){MaxHP+=76+rand(0,2);MaxMP+=rand(3,4)}
					else if(level<60){MaxHP+=98+rand(0,3);MaxMP+=4}
					else if(level<70){MaxHP+=112+rand(0,3);MaxMP+=rand(4,5)}
					else if(level<80){MaxHP+=137+rand(0,4);MaxMP+=5}
					else if(level<90){MaxHP+=161+rand(0,4);MaxMP+=rand(5,6)}
					else if(level<99){MaxHP+=196+rand(0,5);MaxMP+=6}
					switch(rand(1,4))
						if(1){str+=1;vit+=0+rand(0,1);agi+=1;wis+=0;wil+=1}
						if(2){str+=1;vit+=1;agi+=0+rand(0,1);wis+=0;wil+=1}
						if(3){str+=0+rand(0,1);vit+=1;agi+=1;wis+=0;wil+=1}
						if(4){str+=1+rand(0,1);vit+=1;agi+=1;wis+=0;wil+=1}
				if("Sage")
					if(level<10){MaxHP+=9+rand(0,1);MaxMP+=3}
					else if(level<20){MaxHP+=16+rand(0,1);MaxMP+=3+rand(0,1)}
					else if(level<30){MaxHP+=24+rand(0,1);MaxMP+=4+rand(0,1)}
					else if(level<40){MaxHP+=36+rand(0,2);MaxMP+=5+rand(0,1)}
					else if(level<50){MaxHP+=52+rand(0,2);MaxMP+=5+rand(0,2)}
					else if(level<60){MaxHP+=70+rand(0,2);MaxMP+=6+rand(0,2)}
					else if(level<70){MaxHP+=84+rand(0,3);MaxMP+=7+rand(0,2)}
					else if(level<80){MaxHP+=114+rand(0,3);MaxMP+=7+rand(0,3)}
					else if(level<90){MaxHP+=138+rand(0,3);MaxMP+=8+rand(0,3)}
					else if(level<99){MaxHP+=160+rand(0,5);MaxMP+=9+rand(0,3)}
					switch(rand(1,4))
						if(1){str+=1;vit+=0+rand(0,1);agi+=0;wis+=1;wil+=1}
						if(2){str+=1;vit+=0;agi+=1;wis+=2;wil+=0+rand(0,1)}
						if(3){str+=0;vit+=1;agi+=1;wis+=0+rand(0,1);wil+=1}
						if(4){str+=0;vit+=1;agi+=0+rand(0,1);wis+=1;wil+=1}
				if("White Mage")
					if(level<10){MaxHP+=9+rand(0,1);MaxMP+=3}
					else if(level<20){MaxHP+=16+rand(0,1);MaxMP+=rand(3,4)}
					else if(level<30){MaxHP+=24+rand(0,1);MaxMP+=4}
					else if(level<40){MaxHP+=35+rand(0,2);MaxMP+=rand(4,5)}
					else if(level<50){MaxHP+=52+rand(0,2);MaxMP+=6}
					else if(level<60){MaxHP+=73+rand(0,3);MaxMP+=rand(6,7)}
					else if(level<70){MaxHP+=94+rand(0,3);MaxMP+=8}
					else if(level<80){MaxHP+=115+rand(0,4);MaxMP+=rand(8,9)}
					else if(level<90){MaxHP+=139+rand(0,4);MaxMP+=9}
					else if(level<99){MaxHP+=165+rand(0,5);MaxMP+=10}
					switch(rand(1,4))
						if(1){str+=1;vit+=1+rand(0,1);agi+=0;wis+=0;wil+=1}
						if(2){str+=0+rand(0,1);vit+=0;agi+=1;wis+=1;wil+=2}
						if(3){str+=0;vit+=1;agi+=0+rand(0,1);wis+=2;wil+=1}
						if(4){str+=1;vit+=0;agi+=2;wis+=0+rand(0,1);wil+=1}
				if("White Twin")
					if(level<10){MaxHP+=8+rand(0,1);MaxMP+=3}
					else if(level<20){MaxHP+=15+rand(0,1);MaxMP+=rand(4,5)}
					else if(level<30){MaxHP+=23+rand(0,1);MaxMP+=5}
					else if(level<40){MaxHP+=33+rand(0,2);MaxMP+=rand(6,7)}
					else if(level<50){MaxHP+=51+rand(0,2);MaxMP+=7}
					else if(level<60){MaxHP+=72+rand(0,3);MaxMP+=rand(7,8)}
					else if(level<70){MaxHP+=92+rand(0,3);MaxMP+=8}
					else if(level<80){MaxHP+=112+rand(0,4);MaxMP+=rand(8,9)}
					else if(level<90){MaxHP+=136+rand(0,4);MaxMP+=9}
					else if(level<99){MaxHP+=160+rand(0,5);MaxMP+=10}
					switch(rand(1,4))
						if(1){str+=1;vit+=0;agi+=1;wis+=0+rand(0,1);wil+=1}
						if(2){str+=0+rand(0,1);vit+=1;agi+=1;wis+=0;wil+=2}
						if(3){str+=1;vit+=1;agi+=0;wis+=1;wil+=1+rand(0,1)}
						if(4){str+=0;vit+=0;agi+=0+rand(0,1);wis+=2;wil+=1}
				if("Fiend")
					if(level<10){MaxHP+=10+rand(0,1);MaxMP+=2}
					else if(level<20){MaxHP+=17+rand(0,1);MaxMP+=rand(2,3)}
					else if(level<30){MaxHP+=25+rand(0,1);MaxMP+=2}
					else if(level<40){MaxHP+=36+rand(0,2);MaxMP+=rand(2,3)}
					else if(level<50){MaxHP+=52+rand(0,2);MaxMP+=2}
					else if(level<60){MaxHP+=73+rand(0,3);MaxMP+=rand(2,3)}
					else if(level<70){MaxHP+=86+rand(0,3);MaxMP+=3}
					else if(level<80){MaxHP+=129+rand(0,4);MaxMP+=rand(2,3)}
					else if(level<90){MaxHP+=159+rand(0,4);MaxMP+=4}
					else if(level<99){MaxHP+=191+rand(0,5);MaxMP+=3}
					switch(rand(1,4))
						if(1){str+=1;vit+=0+rand(0,1);agi+=2;wis+=1;wil+=0}
						if(2){str+=1;vit+=1;agi+=0;wis+=0+rand(0,1);wil+=0}
						if(3){str+=1;vit+=1+rand(0,1);agi+=1;wis+=1;wil+=0}
						if(4){str+=0+rand(0,1);vit+=1;agi+=1;wis+=1;wil+=0}
				if("Swordmaster")
					if(level<10){MaxHP+=12+rand(0,1);MaxMP+=1}
					else if(level<20){MaxHP+=24+rand(0,1);MaxMP+=1+rand(0,1)}
					else if(level<30){MaxHP+=38+rand(0,1);MaxMP+=1+rand(0,1)}
					else if(level<40){MaxHP+=53+rand(0,1);MaxMP+=2+rand(0,1)}
					else if(level<50){MaxHP+=76+rand(0,2);MaxMP+=2+rand(1,2)}
					else if(level<60){MaxHP+=86+rand(0,2);MaxMP+=2+rand(1,2)}
					else if(level<70){MaxHP+=101+rand(0,3);MaxMP+=3+rand(1,2)}
					else if(level<80){MaxHP+=116+rand(0,3);MaxMP+=3+rand(1,2)}
					else if(level<90){MaxHP+=146+rand(0,4);MaxMP+=3+rand(1,3)}
					else if(level<99){MaxHP+=191+rand(0,4);MaxMP+=4+rand(2,3)}
					switch(rand(1,4))
						if(1){str+=0;vit+=1;agi+=1;wis+=1;wil+=1}
						if(2){str+=1+rand(0,1);vit+=1;agi+=0+rand(0,1);wis+=1+rand(0,1);wil+=0}
						if(3){str+=1+rand(0,1);vit+=0+rand(0,1);agi+=1;wis+=0;wil+=1+rand(0,1)}
						if(4){str+=1+rand(0,1);vit+=1;agi+=1;wis+=0;wil+=0}
				if("Card Mage")
					if(level<10){MaxHP+=9+rand(0,1);MaxMP+=3}
					else if(level<20){MaxHP+=16+rand(0,1);MaxMP+=3+rand(0,1)}
					else if(level<30){MaxHP+=24+rand(0,1);MaxMP+=4+rand(0,1)}
					else if(level<40){MaxHP+=36+rand(0,2);MaxMP+=5+rand(0,1)}
					else if(level<50){MaxHP+=52+rand(0,2);MaxMP+=5+rand(0,2)}
					else if(level<60){MaxHP+=70+rand(0,2);MaxMP+=6+rand(0,2)}
					else if(level<70){MaxHP+=84+rand(0,3);MaxMP+=7+rand(0,2)}
					else if(level<80){MaxHP+=114+rand(0,3);MaxMP+=7+rand(0,3)}
					else if(level<90){MaxHP+=138+rand(0,3);MaxMP+=8+rand(0,3)}
					else if(level<99){MaxHP+=160+rand(0,5);MaxMP+=9+rand(0,3)}
					switch(rand(1,4))
						if(1){str+=1;vit+=0+rand(0,1);agi+=1;wis+=1;wil+=0}
						if(2){str+=1;vit+=1;agi+=0+rand(0,1);wis+=1;wil+=0}
						if(3){str+=0+rand(0,1);vit+=1;agi+=1;wis+=1;wil+=1}
						if(4){str+=1+rand(0,1);vit+=1;agi+=1;wis+=1;wil+=1}
			if(MaxHP>9999) MaxHP=9999
			if(MaxMP>999) MaxMP=999
			level_up()
			return 1

mob/PC
	var/obj/lhand
	var/obj/rhand
	var/obj/helmet
	var/obj/armor
	var/obj/arm
	proc
		//# derived stats algo
		att()
			var/lb=0
			if(istype(src,/mob/PC/monk)){lb=level+1;lb*=1.5}//;lb*=2}
			else lb=level/4
			var/sb=str
			if(istype(lhand,/obj/weapon)) sb+=lhand.str
			if(istype(lhand,/obj/shield)) sb+=lhand.str
			if(istype(rhand,/obj/weapon)) sb+=rhand.str
			if(istype(rhand,/obj/shield)) sb+=rhand.str
			if(helmet) sb+=helmet.str
			if(armor) sb+=armor.str
			if(arm) sb+=arm.str
			sb/=4
			var/wp=0
			if(istype(lhand,/obj/weapon)) wp+=lhand.power
			if(istype(rhand,/obj/weapon)) wp+=rhand.power
			return round(lb+sb+wp+1)
		attp()
			var/lb=0
			if(istype(src,/mob/PC/monk)){lb=level+1}//;lb*=2}
			else lb=level/4
			var/wpp=50
			if(istype(lhand,/obj/weapon)) wpp+=lhand.attack
			if(istype(rhand,/obj/weapon)) wpp+=rhand.attack
			if(istype(lhand,/obj/weapon)&&istype(rhand,/obj/weapon))wpp/=2
			return round(min(lb+wpp,99))
		xatt()
			var/sb=str
			if(istype(lhand,/obj/weapon)) sb+=lhand.str
			if(istype(lhand,/obj/shield)) sb+=lhand.str
			if(istype(rhand,/obj/weapon)) sb+=rhand.str
			if(istype(rhand,/obj/shield)) sb+=rhand.str
			if(helmet) sb+=helmet.str
			if(armor) sb+=armor.str
			if(arm) sb+=arm.str
			sb/=8
			var/ab=agi
			if(istype(lhand,/obj/weapon)) ab+=lhand.agi
			if(istype(lhand,/obj/shield)) ab+=lhand.agi
			if(istype(rhand,/obj/weapon)) ab+=rhand.agi
			if(istype(rhand,/obj/shield)) ab+=rhand.agi
			if(helmet) ab+=helmet.agi
			if(armor) ab+=armor.agi
			if(arm) ab+=arm.agi
			ab/=16
			return round(sb+ab+1)
		def()
			var/vb=vit
			if(istype(lhand,/obj/weapon)) vb+=lhand.vit
			if(istype(lhand,/obj/shield)) vb+=lhand.vit
			if(istype(rhand,/obj/weapon)) vb+=rhand.vit
			if(istype(rhand,/obj/shield)) vb+=rhand.vit
			if(helmet) vb+=helmet.vit
			if(armor) vb+=armor.vit
			if(arm) vb+=arm.vit
			vb/=2
			var/def=0
			if(istype(lhand,/obj/shield)) def+=lhand.def
			if(istype(rhand,/obj/shield)) def+=rhand.def
			if(helmet) def+=helmet.def
			if(armor) def+=armor.def
			if(arm) def+=arm.def
			if(parry) def*=2
			return round(vb+def+1)
		defp()
			var/defp=30
			if(parry) defp+=30
			if(istype(lhand,/obj/shield)) defp+=lhand.defp
			if(istype(rhand,/obj/shield)) defp+=rhand.defp
			if(helmet) defp+=helmet.defp
			if(armor) defp+=armor.defp
			if(arm) defp+=arm.defp
			return round(min(defp,99))
		xdef()
			var/ab=agi
			if(istype(lhand,/obj/weapon)) ab+=lhand.agi
			if(istype(lhand,/obj/shield)) ab+=lhand.agi
			if(istype(rhand,/obj/weapon)) ab+=rhand.agi
			if(istype(rhand,/obj/shield)) ab+=rhand.agi
			if(helmet) ab+=helmet.agi
			if(armor) ab+=armor.agi
			if(arm) ab+=arm.agi
			ab/=8
			var/lb=level/16
			if(istype(lhand,/obj/shield)||istype(rhand,/obj/shield)) return round(ab+lb)
			return round(ab+1)
		magdef()
			var/md=0
			if(istype(lhand,/obj/shield)) md+=lhand.magdef
			if(istype(rhand,/obj/shield)) md+=rhand.magdef
			if(helmet) md+=helmet.magdef
			if(armor) md+=armor.magdef
			if(arm) md+=arm.magdef
			return round(md+1)
		magdefp()
			var/wwb=wis+wil
			if(istype(lhand,/obj/weapon)) wwb+=lhand.wis+lhand.wil
			if(istype(lhand,/obj/shield)) wwb+=lhand.wis+lhand.wil
			if(istype(rhand,/obj/weapon)) wwb+=rhand.wis+rhand.wil
			if(istype(rhand,/obj/shield)) wwb+=rhand.wis+rhand.wil
			if(helmet) wwb+=helmet.wis+helmet.wil
			if(armor) wwb+=armor.wis+armor.wil
			if(arm) wwb+=arm.wis+arm.wil
			wwb/=8
			var/mdp=0
			if(istype(lhand,/obj/shield)) mdp+=lhand.magdefp
			if(istype(rhand,/obj/shield)) mdp+=rhand.magdefp
			if(helmet) mdp+=helmet.magdefp
			if(armor) mdp+=armor.magdefp
			if(arm) mdp+=arm.magdefp
			return round(min(mdp+wwb,99))
		xmagdef()
			var/wwb=wis+wil
			if(istype(lhand,/obj/weapon)) wwb+=lhand.wis+lhand.wil
			if(istype(lhand,/obj/shield)) wwb+=lhand.wis+lhand.wil
			if(istype(rhand,/obj/weapon)) wwb+=rhand.wis+rhand.wil
			if(istype(rhand,/obj/shield)) wwb+=rhand.wis+rhand.wil
			if(helmet) wwb+=helmet.wis+helmet.wil
			if(armor) wwb+=armor.wis+armor.wil
			if(arm) wwb+=arm.wis+arm.wil
			wwb/=32
			var/ab=agi/32
			return round(wwb+ab+1)
		//black/white multiplier
		xBlack()
			var/wp=wis
			if(istype(lhand,/obj/weapon)) wp+=lhand.wis
			if(istype(lhand,/obj/shield)) wp+=lhand.wis
			if(istype(rhand,/obj/weapon)) wp+=rhand.wis
			if(istype(rhand,/obj/shield)) wp+=rhand.wis
			if(helmet) wp+=helmet.wis
			if(armor) wp+=armor.wis
			if(arm) wp+=arm.wis
			wp/=4
			return round(wp+1)
		xWhite()
			var/wp=wil
			if(istype(lhand,/obj/weapon)) wp+=lhand.wil
			if(istype(lhand,/obj/shield)) wp+=lhand.wil
			if(istype(rhand,/obj/weapon)) wp+=rhand.wil
			if(istype(rhand,/obj/shield)) wp+=rhand.wil
			if(helmet) wp+=helmet.wil
			if(armor) wp+=armor.wil
			if(arm) wp+=arm.wil
			wp/=4
			return round(wp+1)

//Quick stats
mob/PC/Stat()
	var/mob/PC/p
	p = party[1]
	statpanel("Status","[p.name]","[p.class] Lv.[p.level]")
	statpanel("Status","  HP: ","[p.HP]/[p.MaxHP]")
	statpanel("Status","  MP: ","[p.MP]/[p.MaxMP]")
/*	statpanel("Status","Exp.	: ",num2text(exp,15))
	if(level<99) statpanel("Status","For level up:",maxexp-exp)
	else statpanel("Status","For level up:","Max level reached.")
	statpanel("Status","GP	:",num2text(p.gold,15))*/
	if(p.Haste||p.Protect||p.Shell||p.Regen||p.Reflect||p.Berserk||p.Float||p.Blink||p.Strengthen||p.Cover||p.Covered||p.Slow||p.Poison||p.Cry||p.Mute||p.Curse||p.Confuse||p.Sleep||p.Hold||p.Stone||p.Countdown)
		statpanel("Status","Status:","")
	if(p.Haste) statpanel("Status","Haste")
	if(p.Protect) statpanel("Status","Protect")
	if(p.Shell) statpanel("Status","Shell")
	if(p.Regen) statpanel("Status","Regen")
	if(p.Reflect) statpanel("Status","Reflect")
	if(p.Berserk) statpanel("Status","Berserk")
	if(p.Float) statpanel("Status","Float")
	if(p.Blink) statpanel("Status","Blink")
	if(p.Strengthen) statpanel("Status","Strengthen")
	if(p.Cover) statpanel("Status","Covering: [Cover]")
	if(p.Covered) statpanel("Status","Covered by: [Covered]")
	if(p.Slow) statpanel("Status","Slow")
	if(p.Poison) statpanel("Status","Poison")
	if(p.Cry) statpanel("Status","Cry")
	if(p.Mute) statpanel("Status","Mute")
	if(p.Curse) statpanel("Status","Curse")
	if(p.Confuse) statpanel("Status","Confuse")
	if(p.Sleep) statpanel("Status","Sleep")
	if(p.Hold) statpanel("Status","Hold")
	if(p.Stone) statpanel("Status","Stone")
	if(p.Countdown)
		if(countdown_counter==0) statpanel("Status","Countdown: 10")
		if(countdown_counter==1) statpanel("Status","Countdown: 9")
		if(countdown_counter==2) statpanel("Status","Countdown: 8")
		if(countdown_counter==3) statpanel("Status","Countdown: 7")
		if(countdown_counter==4) statpanel("Status","Countdown: 6")
		if(countdown_counter==5) statpanel("Status","Countdown: 5")
		if(countdown_counter==6) statpanel("Status","Countdown: 4")
		if(countdown_counter==7) statpanel("Status","Countdown: 3")
		if(countdown_counter==8) statpanel("Status","Countdown: 2")
		if(countdown_counter==9) statpanel("Status","Countdown: 1")
		if(countdown_counter==10) statpanel("Status","Countdown: 0")
	if(length(party)>=2)
		p = party[2]
		statpanel("Status","[p.name]","[p.class] Lv.[p.level]")
		statpanel("Status","  HP: ","[p.HP]/[p.MaxHP]")
		statpanel("Status","  MP: ","[p.MP]/[p.MaxMP]")
		if(p.Haste||p.Protect||p.Shell||p.Regen||p.Reflect||p.Berserk||p.Float||p.Blink||p.Strengthen||p.Cover||p.Covered||p.Slow||p.Poison||p.Cry||p.Mute||p.Curse||p.Confuse||p.Sleep||p.Hold||p.Stone||p.Countdown)
			statpanel("Status","Status:","")
		if(p.Haste) statpanel("Status","Haste")
		if(p.Protect) statpanel("Status","Protect")
		if(p.Shell) statpanel("Status","Shell")
		if(p.Regen) statpanel("Status","Regen")
		if(p.Reflect) statpanel("Status","Reflect")
		if(p.Berserk) statpanel("Status","Berserk")
		if(p.Float) statpanel("Status","Float")
		if(p.Blink) statpanel("Status","Blink")
		if(p.Strengthen) statpanel("Status","Strengthen")
		if(p.Cover) statpanel("Status","Covering: [Cover]")
		if(p.Covered) statpanel("Status","Covered by: [Covered]")
		if(p.Slow) statpanel("Status","Slow")
		if(p.Poison) statpanel("Status","Poison")
		if(p.Cry) statpanel("Status","Cry")
		if(p.Mute) statpanel("Status","Mute")
		if(p.Curse) statpanel("Status","Curse")
		if(p.Confuse) statpanel("Status","Confuse")
		if(p.Sleep) statpanel("Status","Sleep")
		if(p.Hold) statpanel("Status","Hold")
		if(p.Stone) statpanel("Status","Stone")
		if(p.Countdown)
			if(countdown_counter==0) statpanel("Status","Countdown: 10")
			if(countdown_counter==1) statpanel("Status","Countdown: 9")
			if(countdown_counter==2) statpanel("Status","Countdown: 8")
			if(countdown_counter==3) statpanel("Status","Countdown: 7")
			if(countdown_counter==4) statpanel("Status","Countdown: 6")
			if(countdown_counter==5) statpanel("Status","Countdown: 5")
			if(countdown_counter==6) statpanel("Status","Countdown: 4")
			if(countdown_counter==7) statpanel("Status","Countdown: 3")
			if(countdown_counter==8) statpanel("Status","Countdown: 2")
			if(countdown_counter==9) statpanel("Status","Countdown: 1")
			if(countdown_counter==10) statpanel("Status","Countdown: 0")
	if(length(party)>=3)
		p = party[3]
		statpanel("Status","[p.name]","[p.class] Lv.[p.level]")
		statpanel("Status","  HP: ","[p.HP]/[p.MaxHP]")
		statpanel("Status","  MP: ","[p.MP]/[p.MaxMP]")
		if(p.Haste||p.Protect||p.Shell||p.Regen||p.Reflect||p.Berserk||p.Float||p.Blink||p.Strengthen||p.Cover||p.Covered||p.Slow||p.Poison||p.Cry||p.Mute||p.Curse||p.Confuse||p.Sleep||p.Hold||p.Stone||p.Countdown)
			statpanel("Status","Status:","")
		if(p.Haste) statpanel("Status","Haste")
		if(p.Protect) statpanel("Status","Protect")
		if(p.Shell) statpanel("Status","Shell")
		if(p.Regen) statpanel("Status","Regen")
		if(p.Reflect) statpanel("Status","Reflect")
		if(p.Berserk) statpanel("Status","Berserk")
		if(p.Float) statpanel("Status","Float")
		if(p.Blink) statpanel("Status","Blink")
		if(p.Strengthen) statpanel("Status","Strengthen")
		if(p.Cover) statpanel("Status","Covering: [Cover]")
		if(p.Covered) statpanel("Status","Covered by: [Covered]")
		if(p.Slow) statpanel("Status","Slow")
		if(p.Poison) statpanel("Status","Poison")
		if(p.Cry) statpanel("Status","Cry")
		if(p.Mute) statpanel("Status","Mute")
		if(p.Curse) statpanel("Status","Curse")
		if(p.Confuse) statpanel("Status","Confuse")
		if(p.Sleep) statpanel("Status","Sleep")
		if(p.Hold) statpanel("Status","Hold")
		if(p.Stone) statpanel("Status","Stone")
		if(p.Countdown)
			if(countdown_counter==0) statpanel("Status","Countdown: 10")
			if(countdown_counter==1) statpanel("Status","Countdown: 9")
			if(countdown_counter==2) statpanel("Status","Countdown: 8")
			if(countdown_counter==3) statpanel("Status","Countdown: 7")
			if(countdown_counter==4) statpanel("Status","Countdown: 6")
			if(countdown_counter==5) statpanel("Status","Countdown: 5")
			if(countdown_counter==6) statpanel("Status","Countdown: 4")
			if(countdown_counter==7) statpanel("Status","Countdown: 3")
			if(countdown_counter==8) statpanel("Status","Countdown: 2")
			if(countdown_counter==9) statpanel("Status","Countdown: 1")
			if(countdown_counter==10) statpanel("Status","Countdown: 0")
	if(length(party)>=4)
		p = party[4]
		statpanel("Status","[p.name]","[p.class] Lv.[p.level]")
		statpanel("Status","  HP: ","[p.HP]/[p.MaxHP]")
		statpanel("Status","  MP: ","[p.MP]/[p.MaxMP]")
		if(p.Haste||p.Protect||p.Shell||p.Regen||p.Reflect||p.Berserk||p.Float||p.Blink||p.Strengthen||p.Cover||p.Covered||p.Slow||p.Poison||p.Cry||p.Mute||p.Curse||p.Confuse||p.Sleep||p.Hold||p.Stone||p.Countdown)
			statpanel("Status","Status:","")
		if(p.Haste) statpanel("Status","Haste")
		if(p.Protect) statpanel("Status","Protect")
		if(p.Shell) statpanel("Status","Shell")
		if(p.Regen) statpanel("Status","Regen")
		if(p.Reflect) statpanel("Status","Reflect")
		if(p.Berserk) statpanel("Status","Berserk")
		if(p.Float) statpanel("Status","Float")
		if(p.Blink) statpanel("Status","Blink")
		if(p.Strengthen) statpanel("Status","Strengthen")
		if(p.Cover) statpanel("Status","Covering: [Cover]")
		if(p.Covered) statpanel("Status","Covered by: [Covered]")
		if(p.Slow) statpanel("Status","Slow")
		if(p.Poison) statpanel("Status","Poison")
		if(p.Cry) statpanel("Status","Cry")
		if(p.Mute) statpanel("Status","Mute")
		if(p.Curse) statpanel("Status","Curse")
		if(p.Confuse) statpanel("Status","Confuse")
		if(p.Sleep) statpanel("Status","Sleep")
		if(p.Hold) statpanel("Status","Hold")
		if(p.Stone) statpanel("Status","Stone")
		if(p.Countdown)
			if(countdown_counter==0) statpanel("Status","Countdown: 10")
			if(countdown_counter==1) statpanel("Status","Countdown: 9")
			if(countdown_counter==2) statpanel("Status","Countdown: 8")
			if(countdown_counter==3) statpanel("Status","Countdown: 7")
			if(countdown_counter==4) statpanel("Status","Countdown: 6")
			if(countdown_counter==5) statpanel("Status","Countdown: 5")
			if(countdown_counter==6) statpanel("Status","Countdown: 4")
			if(countdown_counter==7) statpanel("Status","Countdown: 3")
			if(countdown_counter==8) statpanel("Status","Countdown: 2")
			if(countdown_counter==9) statpanel("Status","Countdown: 1")
			if(countdown_counter==10) statpanel("Status","Countdown: 0")
	if(length(party)>=5)
		p = party[5]
		statpanel("Status","[p.name]","[p.class] Lv.[p.level]")
		statpanel("Status","  HP: ","[p.HP]/[p.MaxHP]")
		statpanel("Status","  MP: ","[p.MP]/[p.MaxMP]")
		if(p.Haste||p.Protect||p.Shell||p.Regen||p.Reflect||p.Berserk||p.Float||p.Blink||p.Strengthen||p.Cover||p.Covered||p.Slow||p.Poison||p.Cry||p.Mute||p.Curse||p.Confuse||p.Sleep||p.Hold||p.Stone||p.Countdown)
			statpanel("Status","Status:","")
		if(p.Haste) statpanel("Status","Haste")
		if(p.Protect) statpanel("Status","Protect")
		if(p.Shell) statpanel("Status","Shell")
		if(p.Regen) statpanel("Status","Regen")
		if(p.Reflect) statpanel("Status","Reflect")
		if(p.Berserk) statpanel("Status","Berserk")
		if(p.Float) statpanel("Status","Float")
		if(p.Blink) statpanel("Status","Blink")
		if(p.Strengthen) statpanel("Status","Strengthen")
		if(p.Cover) statpanel("Status","Covering: [Cover]")
		if(p.Covered) statpanel("Status","Covered by: [Covered]")
		if(p.Slow) statpanel("Status","Slow")
		if(p.Poison) statpanel("Status","Poison")
		if(p.Cry) statpanel("Status","Cry")
		if(p.Mute) statpanel("Status","Mute")
		if(p.Curse) statpanel("Status","Curse")
		if(p.Confuse) statpanel("Status","Confuse")
		if(p.Sleep) statpanel("Status","Sleep")
		if(p.Hold) statpanel("Status","Hold")
		if(p.Stone) statpanel("Status","Stone")
		if(p.Countdown)
			if(countdown_counter==0) statpanel("Status","Countdown: 10")
			if(countdown_counter==1) statpanel("Status","Countdown: 9")
			if(countdown_counter==2) statpanel("Status","Countdown: 8")
			if(countdown_counter==3) statpanel("Status","Countdown: 7")
			if(countdown_counter==4) statpanel("Status","Countdown: 6")
			if(countdown_counter==5) statpanel("Status","Countdown: 5")
			if(countdown_counter==6) statpanel("Status","Countdown: 4")
			if(countdown_counter==7) statpanel("Status","Countdown: 3")
			if(countdown_counter==8) statpanel("Status","Countdown: 2")
			if(countdown_counter==9) statpanel("Status","Countdown: 1")
			if(countdown_counter==10) statpanel("Status","Countdown: 0")