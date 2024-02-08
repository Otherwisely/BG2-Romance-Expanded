BEGIN OW#VICON

/////////////////
// LOVE TALKS //
///////////////

// LT1 //
REPLACE BVICONI
IF ~~ 38 // from: 34.1
  SAY ~How are you going to hunt down these culprits who ambushed you? Vermin rarely leave scent or footstep.~
  IF ~~ THEN REPLY #8831 /* ~The Cowled Wizards arrested the man responsible for my imprisonment and will know where to find him.~ */ GOTO 39
  IF ~~ THEN REPLY #26428 /* ~I am not sure, Viconia... I have a couple of ideas of where to start looking though, and I must make the effort.~ */ GOTO 160
  IF ~Gender(Player1,MALE)~ THEN REPLY #8833 /* ~I have a plan that's foolproof, Viconia, so don't you worry about anything.~ */ GOTO 40
  + ~Gender(Player1,FEMALE)~ + ~I have a plan that not such a man as he could thwart. Do not think that my prey will escape.~ + OW#VIC1
END
END

APPEND BVICONI
IF ~~ OW#VIC1 // from: 38.3
  SAY ~My, my. Confident, are we? I think I will enjoy seeing you work. Happy hunting, <CHARNAME>.~
  IF ~~ THEN EXIT
END
END

// LT3 //
REPLACE BVICONI
IF WEIGHT #27 ~Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",4)~ 131 // from:
  SAY ~It's a strange time along this Sword Coast. The brink of war was averted, but the countryside remains hazardous to the citizenry.~ [VICONI68]
  + ~OR(2) !Global("AnomenRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Anomen")~ + ~War? What are you talking about, Viconia?~ + 132
  + ~Gender(Player1,MALE) OR(2) !Global("AnomenRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Anomen")~ + ~I don't have time to hear you prattle on, Viconia... leave me be.~ + 42
  + ~Gender(Player1,FEMALE) OR(2) !Global("AnomenRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Anomen")~ + ~I don't have time to hear you prattle on, Viconia... leave me be.~ + OW#VIC2
  IF ~Gender(Player1,FEMALE) Global("AnomenRomanceActive","GLOBAL",1) IfValidForPartyDialogue("Anomen")~ EXTERN BANOMEN OW#ANO1
  IF ~Gender(Player1,MALE) Global("AnomenRomanceActive","GLOBAL",1) IfValidForPartyDialogue("Anomen")~ EXTERN BANOMEN OW#ANO2
END
END

APPEND BANOMEN
IF ~~ OW#ANO1 // from: BVICONI 131F
  SAY ~Fear not, my ladies! Though danger lurks around every corner, you have me to drive it from your path. Yours especially, <CHARNAME>.~
  IF ~~ THEN EXTERN ~BVICONI~ OW#VIC3
END

IF ~~ OW#ANO2 // from: BVICONI 131M
  SAY ~Fear not, my lady! Though danger lurks around every corner, you have two strong and handsome men to drive it from your path. Isn't that right, <CHARNAME>?~
  IF ~~ THEN EXTERN ~BVICONI~ OW#VIC4
END
END

APPEND BVICONI
IF ~~ OW#VIC2 // from: OW#VIC5.1 132.2 131.2 41.2
  SAY ~I see you are no different from these other surface-dwellers. I shall remember this insult, elg'caress.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ OW#VIC3 // from: 
  SAY ~Really now? How very chivalrous of you. Surface women must swoon over you. Unfortunately for you, <CHARNAME> and I are quite capable.~
  IF ~~ THEN GOTO OW#VIC5
END

IF ~~ OW#VIC4 // from: 
  SAY ~I see only one handsome male at the moment, Anomen, and it was the one I spoke to first. Silence yourself as a well-trained male should.~
  IF ~~ THEN GOTO OW#VIC5
END

IF ~~ OW#VIC5 // from: OW#VIC4 OW#VIC5
  SAY ~What were we discussing? Ah, yes. The ever-present threat of war.~ 
  ++ ~War? What are you talking about, Viconia?~ + 132
  + ~Gender(Player1,MALE)~ + ~I don't have time to hear you prattle on, Viconia... leave me be.~ + 42
  + ~Gender(Player1,FEMALE)~ + ~I don't have time to hear you prattle on, Viconia... leave me be.~ + OW#VIC2
END
END

REPLACE BVICONI
IF ~~ 132 // from: 131.0
  SAY ~The war your half-brother nearly started. What do you think I was speaking of?~
  ++ ~Why bring it up? I killed Sarevok. His plans for war died with him.~ + 41
  + ~Gender(Player1,MALE)~ + ~Don't talk of Sarevok like you know anything about it. Believe me, you haven't a clue... so remain quiet.~ + 42
  + ~Gender(Player1,FEMALE)~ + ~Don't talk of Sarevok like you know anything about it. Believe me, you haven't a clue... so remain quiet.~ + OW#VIC2
END
END

REPLACE BVICONI
IF ~~ 41 // from: 132.0
  SAY ~Perhaps "his" war died. That does not mean other conflicts won't arise. Perhaps I ramble on; if you wish, I'll stop bothering you.~
  ++ ~No, no. Tell me, what have you been up to since all the trouble with Sarevok happened?~ + 43
  + ~Gender(Player1,MALE)~ + ~Stop bothering me, Viconia. You're right, you do ramble on.~ + 42
  + ~Gender(Player1,FEMALE)~ + ~Stop bothering me, Viconia. You're right, you do ramble on.~ + OW#VIC2
END
END

REPLACE BVICONI
IF ~~ 47 // from: 137.0
  SAY ~I had grown weak in my trust. They chortled as I lost consciousness, saying how easy it had been and congratulating each other on a fine... a fine catch.~
  ++ ~What happened next, Viconia?~ + 164
  + ~Gender(Player1,MALE)~ + ~Those men are sick and twisted, Viconia. Don't judge all by the actions of a few.~ + 164
  + ~Gender(Player1,FEMALE)~ + ~There are more men than I would care to know who would do such a thing. But don't judge all surfacers based on their actions alone, Viconia.~ + 164
END
END

REPLACE BVICONI
IF ~~ 147 // from: 143.0
  SAY ~He dropped to his knees in shock, which afforded me a height advantage as I caved his head with a miner's mallet. ~
  ++ ~I am... glad that you had your revenge.~ + 148
  + ~Gender(Player1,MALE)~ + ~That's horrid, Viconia! You didn't need to kill the farmers. Revenge only brings more suffering.~ + 149
  + ~Gender(Player1,FEMALE)~ + ~That's horrid, Viconia! You didn't need to kill the farmers. Revenge only brings more suffering.~ + OW#VIC6
END
END

APPEND BVICONI
IF ~~ OW#VIC6 // from: 147.2
  SAY ~I let my guard lower once and paid the price for believing the surface-dwellers might let me be, <CHARNAME>. I would have thought you knew something of suffering.~
IF ~~ THEN EXIT
END
END

// LT5 //
REPLACE BVICONI
IF WEIGHT #4 ~Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",6) !StateCheck(Player1,STATE_SLEEPING)~ 48 // from:
  SAY ~I wish to... apologize for attempting to unburden myself upon you before. I was foolish to be so weak in Beregost, and worse yet to speak to you about it.~ [VICONI69]
  + ~Gender(Player1,MALE)~ + ~Well, I was barely listening anyway, so don't worry about it. Let's just concentrate on killing the next orc we see.~ + 167
  + ~Gender(Player1,FEMALE)~ + ~Well, I was barely listening anyway, so don't worry about it. Let's just concentrate on killing the next orc we see.~ + OW#VIC7
  ++ ~Talking is no weakness, Viconia. You went through a horrid experience.~ + 171
END
END

APPEND BVICONI
IF ~~ OW#VIC7 // from: 48.1
  SAY ~I shall do that, elg'caress. And when I bash its skull in, you do not mind if I picture you in its porcine features, hm?~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)~ EXIT
END
END

// LT7 //
REPLACE BVICONI
IF WEIGHT #0 ~Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",8) !StateCheck(Player1,STATE_SLEEPING)~ 31 // from:
  SAY ~I have been watching you for a time as we travel. You have a pleasing look about you. ~ [OW#VIC01]
  IF ~  Gender(Player1,MALE)
  CheckStatGT(Player1,15,INT)
~ THEN GOTO OW#VIC9DM
  IF ~  Gender(Player1,MALE)
  CheckStatGT(Player1,15,WIS)
~ THEN GOTO OW#VIC9DM
  IF ~  Gender(Player1,FEMALE)
  CheckStatGT(Player1,15,INT)
~ THEN GOTO OW#VIC9DF
  IF ~  Gender(Player1,FEMALE)
  CheckStatGT(Player1,15,WIS)
~ THEN GOTO OW#VIC9DF 
  IF ~  Gender(Player1,MALE)
  CheckStatGT(Player1,15,CHR)
~ THEN GOTO OW#VIC9CM
  IF ~  Gender(Player1,FEMALE)
  CheckStatGT(Player1,15,CHR)
~ THEN GOTO OW#VIC9CF  
  IF ~  Gender(Player1,FEMALE)
  CheckStatGT(Player1,15,CON)
~ THEN GOTO OW#VIC9B  
   IF ~  Gender(Player1,MALE)
  CheckStatGT(Player1,15,DEX)
~ THEN GOTO OW#VIC9AM
  IF ~  Gender(Player1,FEMALE)
  CheckStatGT(Player1,15,DEX)
~ THEN GOTO OW#VIC9AF 
  IF ~  Gender(Player1,MALE)
  OR(2)
  CheckStatGT(Player1,15,STR)
  CheckStatGT(Player1,15,CON)
~ THEN GOTO OW#VIC8A
  IF ~  Gender(Player1,FEMALE)
  CheckStatGT(Player1,15,STR)
~ THEN GOTO OW#VIC8B
  IF ~  Gender(Player1,MALE)
  CheckStatLT(Player1,16,STR)
  CheckStatLT(Player1,16,CON)
  CheckStatLT(Player1,16,DEX)
  CheckStatLT(Player1,16,INT)
  CheckStatLT(Player1,16,WIS)
  CheckStatLT(Player1,16,CHR)
~ THEN GOTO OW#VIC9EM
  IF ~  Gender(Player1,FEMALE)
  CheckStatLT(Player1,16,STR)
  CheckStatLT(Player1,16,CON)
  CheckStatLT(Player1,16,DEX)
  CheckStatLT(Player1,16,INT)
  CheckStatLT(Player1,16,WIS)
  CheckStatLT(Player1,16,CHR)
~ THEN GOTO OW#VIC9EF
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 172 // from: 31.0
  SAY #8676 /* ~Perhaps. And what do you think of Viconia, hmm? Does her ebony glow spur lustful thoughts? Does her sharp beauty give you singular twinges of desire?~ */
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #8679 /* ~I think you are the most exotic creature I have ever laid my eyes upon.~ */ GOTO 174
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #8681 /* ~You know of your beauty well enough, Viconia. I'll not add to your descriptions.~ */ GOTO 175
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #8682 /* ~Your beauty is marred only by the ugliness with which you treat others around you, Viconia.~ */ GOTO 176
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #8683 /* ~No, it doesn't. You're not my type, truly.~ */ GOTO 177 
  + ~GENDER(PLAYER1,FEMALE)~ + ~I think you are the most exotic creature I have ever laid my eyes upon.~ + OW#VIC13
  + ~GENDER(PLAYER1,FEMALE)~ + ~You know of your beauty well enough, Viconia. I'll not add to your descriptions.~ + OW#VIC14
  + ~GENDER(PLAYER1,FEMALE)~ + ~Your beauty is marred only by the ugliness with which you treat others around you, Viconia.~ + OW#VIC15
  + ~GENDER(PLAYER1,FEMALE)~ + ~No, it doesn't. You're not my type, truly.~ + OW#VIC12
END
END

APPEND BVICONI
IF ~~ OW#VIC8A // from: 31M-STR/CON
  SAY ~The sort of musculature that does make a woman swoon with desire.~ [OW#VIC1A]
  ++ ~Truly? You find me desirable, do you?~ + 172
  ++ ~I don't have time for such talk, Viconia. Keep your eyes to yourself.~ + 173
END

IF ~~ OW#VIC8B // from: 31F-STR
  SAY ~The sort of musculature that does make a woman swoon with desire.~ [OW#VIC1A]
  ++ ~Truly? You find me desirable, do you?~ + 172
  ++ ~You enjoy women, Viconia? That is not something I would expect from a drow.~ + OW#VIC10
  ++ ~I don't have time for such talk, Viconia. Keep your eyes to yourself.~ + OW#VIC12
END

IF ~~ OW#VIC9AM // from: 31M-DEX
  SAY ~The sort of trim lines that do make a woman swoon with desire.~
  ++ ~Truly? You find me desirable, do you?~ + 172
  ++ ~I don't have time for such talk, Viconia. Keep your eyes to yourself.~ + 173
END

IF ~~ OW#VIC9AF // from: 31F-DEX
  SAY ~The sort of trim lines that do make a woman swoon with desire.~
  ++ ~Truly? You find me desirable, do you?~ + 172
  ++ ~You enjoy women, Viconia? That is not something I would expect from a drow.~ + OW#VIC10
  ++ ~I don't have time for such talk, Viconia. Keep your eyes to yourself.~ + OW#VIC12
END

IF ~~ OW#VIC9B // from: 31F-CON
  SAY ~The sort of curves that do make a woman swoon with desire.~ [OW#VIC1C]
  ++ ~Truly? You find me desirable, do you?~ + 172
  ++ ~You enjoy women, Viconia? That is not something I would expect from a drow.~ + OW#VIC10
  ++ ~I don't have time for such talk, Viconia. Keep your eyes to yourself.~ + OW#VIC12
END

IF ~~ OW#VIC9CM // from: 31M-CHA
  SAY ~An inviting smile that does make a woman swoon with desire.~
  ++ ~Truly? You find me desirable, do you?~ + 172
  ++ ~I don't have time for such talk, Viconia. Keep your eyes to yourself.~ + 173
END

IF ~~ OW#VIC9CF // from: 31F-CHA
  SAY ~An inviting smile that does make a woman swoon with desire.~
  ++ ~Truly? You find me desirable, do you?~ + 172
  ++ ~You enjoy women, Viconia? That is not something I would expect from a drow.~ + OW#VIC10
  ++ ~I don't have time for such talk, Viconia. Keep your eyes to yourself.~ + OW#VIC12
END

IF ~~ OW#VIC9DM // from: 31M-INT
  SAY ~A beguiling taste of magic that does make a woman swoon with desire.~
  ++ ~Truly? You find me desirable, do you?~ + 172
  ++ ~I don't have time for such talk, Viconia. Keep your eyes to yourself.~ + 173
END

IF ~~ OW#VIC9DF // from: 31F-INT
  SAY ~A beguiling taste of magic that does make a woman swoon with desire.~
  ++ ~Truly? You find me desirable, do you?~ + 172
  ++ ~You enjoy women, Viconia? That is not something I would expect from a drow.~ + OW#VIC10
  ++ ~I don't have time for such talk, Viconia. Keep your eyes to yourself.~ + OW#VIC12
END

IF ~~ OW#VIC9EM // from: 31M-LOW
  SAY ~Perhaps it is the divine blood within you that causes a woman's heart to race with desire.~
  ++ ~Truly? You find me desirable, do you?~ + 172
  ++ ~I don't have time for such talk, Viconia. Keep your eyes to yourself.~ + 173
END

IF ~~ OW#VIC9EF // from: 31F-LOW
  SAY ~Perhaps it is the divine blood within you that causes a woman's heart to race with desire.~
  ++ ~Truly? You find me desirable, do you?~ + 172
  ++ ~You enjoy women, Viconia? That is not something I would expect from a drow.~ + OW#VIC10
  ++ ~I don't have time for such talk, Viconia. Keep your eyes to yourself.~ + OW#VIC12
END

IF ~~ OW#VIC10 // from: OW#VIC9F.1
  SAY ~You surfacers can have such strange views of drow life. My culture venerates the power of women, does it not? Appreciating the feminine figure more fully is not so far out of our way.~
  IF ~~ THEN GOTO OW#VIC11
END

IF ~~ OW#VIC11 // from: OW#VIC10
  SAY ~And what do you think of Viconia, hmm? Does her ebony glow spur lustful thoughts? Does her sharp beauty give you singular twinges of desire?~
  ++ ~I think you are the most exotic creature I have ever laid my eyes upon.~ + OW#VIC13
  ++ ~You know of your beauty well enough, Viconia. I'll not add to your description.~ + OW#VIC14
  ++ ~Your beauty is marred only by the ugliness with which you treat others around you, Viconia.~ + OW#VIC15
  ++ ~No, it doesn't. You're not my type, truly.~ + OW#VIC12
END

IF ~~ OW#VIC12 // from: OW#VIC11.3 OW#VIC9F.2
  SAY ~*chuckle* Do not mistake my attentions for that of a lecherous male. I only offer you my admiration as one of your peers—though I do find your blush to be quite flattering.~
  IF ~~ THEN EXIT
END

IF ~~ OW#VIC13 // from: OW#VIC11.0
  SAY ~Exotic, hmm? I would say the same about you. But I would not shame myself by laying with so unsubtle a kivvil. Turn your eyes away. You embarrass yourself.~
  IF ~~ THEN EXIT
END

IF ~~ OW#VIC14 // from: OW#VIC11.1
  SAY ~You are coy, yet you stare from the corner of your eyes. *chuckle* I suppose I have done the same. I'll be sure to offer a pleasing view for you now and then, hmm?~
  IF ~~ THEN EXIT
END

IF ~~ OW#VIC15 // from: OW#VIC11.2
  SAY ~I treat others as they would treat me, had they the chance. And I know that you burn for me more than you say.~
  IF ~~ THEN GOTO OW#VIC16
END

IF ~~ OW#VIC16 // from: OW#VIC15
  SAY ~The attentions of a bumbling surfacer do little for me, however... so keep your eyes ahead of us.~
  IF ~~ THEN EXIT
END
END

// LT9 //
REPLACE BVICONI
IF WEIGHT #1 ~Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",10) !StateCheck(Player1,STATE_SLEEPING)~ 32 // from:
  SAY ~I have been thinking a little. I've been thinking of the time I've spent with the rivvil... the humans... and I have found nothing redeeming or worthwhile in them.~ [VICONI71]
  + ~OR(2) !Global("JaheiraRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Jaheira") OR(2) !Global("AerieRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Aerie")~ + ~Well, there is hardly anything redeeming or worthwhile in you either, so get used to it.~ + 178
  + ~OR(2) !Global("JaheiraRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Jaheira") OR(2) !Global("AerieRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Aerie") GENDER(PLAYER1,MALE)~ + ~You shouldn't judge all humans by the actions of a few, Viconia.~ + 179
  + ~OR(2) !Global("JaheiraRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Jaheira") OR(2) !Global("AerieRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Aerie") GENDER(PLAYER1,FEMALE)~ + ~The world has been unkind to you, Viconia. But there are good people on the surface. Don't judge them by the worst of your experiences.~ + 179
  IF ~Global("JaheiraRomanceActive","GLOBAL",1) IfValidForPartyDialogue("Jaheira")~ EXTERN BJAHEIR 439
  IF ~OR(2) !Global("JaheiraRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Jaheira") Global("AerieRomanceActive","GLOBAL",1) IfValidForPartyDialogue("Aerie")~ EXTERN BAERIE 441
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 178 // from: 553.0 552.0 32.0
  SAY #8716 /* ~Indeed. I am despicable, am I? I am to be destroyed and murdered for no more cause than my race, is this how it is to be on the surface?~ */
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #8717 /* ~Don't come crying to me, Viconia. No doubt most of what you get you deserve.~ */ GOTO 181
  + ~GENDER(PLAYER1,FEMALE)~ + ~What do you expect, Viconia? You're hardly innocent yourself.~ + 181
  IF ~~ THEN REPLY #8718 /* ~I am sure it is not like that everywhere... and not with everybody. But you could certainly try harder, Viconia.~ */ GOTO 182
END
END

REPLACE BVICONI
IF ~~ 552 // from:
  SAY ~It was plenty to reduce my already poor view of rivvin, half-breed, which were my words to <CHARNAME>. Resume chewing cud and allow me to converse with <PRO_HIMHER>.~
  ++ ~I agree with Jaheira. I don't need to hear your commentary on humans when there's few enough qualities to redeem a drow.~ + 178
  + ~Gender(Player1,MALE)~ + ~You shouldn't judge all humans by the actions of a few, Viconia.~ + 179
  + ~Gender(Player1,FEMALE)~ + ~The world has been unkind to you, Viconia. But there are good people on the surface. Don't judge them by the worst of your experiences.~ + 179
END
END

REPLACE BVICONI
IF ~~ 553 // from:
  SAY ~If I need to hear from our resident wingless pigeon, I will bang on a drum. Otherwise, return to your pathetic cowering and let me speak.~ [VICONIC3]
  ++ ~I agree with Aerie. I don't need to hear your commentary on humans when there's few enough qualities to redeem a drow.~ + 178
  + ~Gender(Player1,MALE)~ + ~You shouldn't judge all humans by the actions of a few, Viconia.~ + 179
  + ~Gender(Player1,FEMALE)~ + ~The world has been unkind to you, Viconia. But there are good people on the surface. Don't judge them by the worst of your experiences.~ + 179
END
END

REPLACE BVICONI
IF ~~ 180 // from: 179.0
  SAY ~Name me one surface-dweller who has treated me with ANY civility!~
  + ~Gender(Player1,MALE)~ + ~Well... what about me, for instance?~ + 183
  + ~Gender(Player1,FEMALE)~ + ~Well... what about me, for instance?~ + OW#VIC17
  ++ ~You get treated with the same civility that you show others, Viconia.~ + 182
END
END

APPEND BVICONI
IF ~~ OW#VIC17 // from: 180.1
  SAY ~You?! You gather fools like moths to a flame and wander without any knowledge of real experience! What do you know, simpering fool?! Now leave me be!~
  IF ~~ THEN EXIT
END
END

// LT11 //
REPLACE BVICONI
IF WEIGHT #2 ~Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",12) !StateCheck(Player1,STATE_SLEEPING)~ 33 // from:
  SAY ~I have acted... poorly towards you. I... I wish to apologize.~ [VICONI72]
  ++ ~You? Apologize? The great and haughty Viconia?~ + 184
  + ~Gender(Player1,MALE)~ + ~*sigh* Is it not enough that I permit you to accompany us that I must put up with your constant drivel?~ + 186
  + ~Gender(Player1,FEMALE)~ + ~Poorly? I try to treat you kindly and you lash out in return. Why should I keep tolerating you?~ + OW#VIC19
END
END

REPLACE BVICONI
IF ~~ 184 // from: 33.0
  SAY ~Certainly, make fun if you wish, but you... did not deserve my insults. You are the only surfacer who has treated me fairly and not demanded something in return.~
  IF ~Gender(Player1,MALE)~ THEN GOTO 185
  IF ~Gender(Player1,FEMALE)~ THEN GOTO OW#VIC18
END
END

APPEND BVICONI
IF ~~ OW#VIC18 // from: 184F
  SAY ~You... you are not a threat to my continued existence.~
  ++ ~That's your idea of an apology? Get lost, Viconia.~ + 187
  ++ ~It must be hard to adjust to life on the surface. I accept your apology, Viconia.~ + 188
END

IF ~~ OW#VIC19 // from: 33.2
  SAY ~I admit my fault and wish to make amends. If you do not wish it, there is no obligation to put up with my presence. Simply say so and I shall be on my way.~
  ++ ~No... no, don't go, Viconia. Now it is my turn to apologize.~ + 191
  ++ ~No, you can stay, if you must.~ + 189
  ++ ~All the better, Viconia. Get lost.~ + 190
END
END

// LT13 //
REPLACE BVICONI
IF WEIGHT #5 ~Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",14) !StateCheck(Player1,STATE_SLEEPING)~ 61 // from:
  SAY ~So... it must take a very driven <PRO_MANWOMAN> to lead <PRO_HISHER> life always on the road.~
  + ~Gender(Player1,MALE)~ + ~If you must chatter with small talk, Viconia, do it with our other companions.~ + 193
  + ~Gender(Player1,FEMALE)~ + ~I'm sorry, Viconia, but I'm not in the mood to talk. Maybe some other time.~ + OW#VIC20
  ++ ~I had little choice in the beginning, Viconia.~ + 194
  + ~OR (3) Race(Player1,HUMAN) Race(Player1,HALFORC) Race(Player1,HALFLING)~ + ~That is the type of <PRO_MANWOMAN> I am.~ + 195
  + ~OR (2) Race(Player1,DWARF) Race(Player1,GNOME)~ + ~That is the type of <PRO_MANWOMAN> I am.~ + OW#VIC25
  + ~Race(Player1,HALF_ELF)~ + ~That is the type of <PRO_MANWOMAN> I am.~ + OW#VIC29
  + ~ Race(Player1,ELF)~ + ~That is the type of <PRO_MANWOMAN> I am.~ + OW#VIC31
END
END

REPLACE BVICONI
IF ~~ THEN 194 // from: 61.1
  SAY ~Perhaps so, but you dealt with Sarevok long ago, didn't you? What impelled you to continue your travels? I know your parting from Baldur's Gate was sour, but surely you had the means to settle down.~
  + ~Gender(Player1,MALE)~ + ~Enough chatter. I'd rather not talk about that.~ + 193
  + ~Gender(Player1,FEMALE)~ + ~Can we keep moving? I'd rather not talk about this.~ + OW#VIC20
  ++ ~I'm not ready to settle... I still have questions that must be answered.~ + 196
  ++ ~I might have settled, but there was no place right for me.~ + 196
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 195 // from: 61.2
  SAY #9691 /* ~Yes, I have noticed the type of <PRO_MANWOMAN> that you are. Intense, determined, strong... all the qualities that I have grown to like most in colnbluth exist in you.~ */
  IF ~~ THEN REPLY #9661 /* ~Does colnbluth mean outsiders? I thought you didn't like the qualities of any non-drow.~ */ GOTO 197
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #9662 /* ~I don't know where you're going with this, but knock it off. I'm not interested.~ */ GOTO 193
  + ~GENDER(PLAYER1,FEMALE)~ + ~I don't know where you're going with this, but knock it off. I'm not interested.~ + OW#VIC20
END
END

REPLACE BVICONI
IF ~~ 196 // from: 194.2 194.1
  SAY ~Yes... You have a god's restless blood, a wondrous heritage. Chaos fills your life from one moment to the next, stirred by your potency.~
  ++ ~It is not by choice that my life is filled with chaos.~ + 199
  ++ ~Yes, I've grown rather fond of it. Few mortals have my advantages.~ + 201
  + ~Gender(Player1,MALE)~ + ~I don't want to talk about this, Viconia. Chatter with someone else.~ + 193
  + ~Gender(Player1,FEMALE)~ + ~I don't want to talk about this, Viconia. Let's keep moving.~ + OW#VIC20
END
END

REPLACE BVICONI
IF ~~ 200 // from: 199.0
  SAY ~Or do you claim that you would have preferred to remain a lowly student in that Candlekeep of yours? Tied to the apron strings of your Gorion forever?~
  ++ ~I'll not speak of Gorion... or anything else for that matter. Go away.~ + 204
  + ~Gender(Player1,MALE)~ + ~I was happy in Candlekeep, and I would have stayed there if I had had the chance.~ + 205
  + ~Gender(Player1,FEMALE)~ + ~I was happy in Candlekeep, and I would have stayed there if I had had the chance.~ + OW#VIC21
  ++ ~No... I suppose not.~ + 201
END
END

REPLACE BVICONI
IF ~~ 201 // from: 200.2 196.1
  SAY ~That is what I like to hear. Such words display your prowess and stir my passions. I suddenly have fond images of a half-god's strong hand stroking my dark skin...~
  + ~Gender(Player1,MALE)~ + ~If you like, I could make that fantasy of yours come true...~ + 206
  + ~Gender(Player1,FEMALE)~ + ~If you like, I could make that fantasy of yours come true...~ + OW#VIC24
  + ~Gender(Player1,MALE)~ + ~Whatever, Viconia. Let's just get back to our traveling, shall we?~ + 207
  + ~Gender(Player1,FEMALE)~ + ~Whatever, Viconia. Let's just get back to our traveling, shall we?~ + OW#VIC22
END
END

REPLACE BVICONI
IF ~~ 202 // from: 198.0
  SAY ~It is unfortunate that the good traits of most colnbluth are held in pale little lives no longer than a firefly's. Here and there they flicker, then sad death.~
  + ~Gender(Player1,MALE)~ + ~There you go, being a bitch again.~ + 204
  + ~Gender(Player1,FEMALE)~ + ~A morbid thought, Viconia. Don't you think we're worth more than that?~ + 204
  + ~Gender(Player1,MALE)~ + ~You could try a bit of humanity yourself, Viconia.~ + 205
  + ~Gender(Player1,FEMALE)~ + ~You could try a bit of humanity yourself, Viconia.~ + OW#VIC21
END
END

REPLACE BVICONI
IF ~~ 203 // from: 198.1
  SAY ~I am no surface elf, despite similarity in my limber, ageless body. How about it, <CHARNAME>...? Do you see something in my own elven features that you like?~
  + ~Gender(Player1,MALE)~ + ~I'm not going down this road again; forget it.~ + 207
  + ~Gender(Player1,MALE)~ + ~No, Viconia, I don't.~ + 207
  + ~Gender(Player1,FEMALE)~ + ~I'm not going down this road again; forget it.~ + OW#VIC22
  + ~Gender(Player1,FEMALE)~ + ~No, Viconia, I don't.~ + OW#VIC22
  + ~Gender(Player1,MALE)~ + ~Of course I do, Viconia. You're beautiful.~ + 208
  + ~Gender(Player1,FEMALE)~ + ~Of course I do, Viconia. You're beautiful.~ + OW#VIC23
END
END

APPEND BVICONI
IF ~~ OW#VIC20 // from: OW#VIC31.0 OW#VIC25.2 196.3 194.1 61
  SAY ~Very well. I shall leave you in quiet then, so you may preoccupy yourself with whatever vapid thoughts draw your interest.~
  IF ~~ THEN EXIT
END

IF ~~ OW#VIC21 // from: OW#VIC28 202.3 200.2
  SAY ~Hah! Your sentiment is simple, the philosophy of a kitten. If I gazed into your ear, would I see aught but a meek and obedient servant, awaiting the beck and call of her master? Laughable.~
  IF ~~ THEN EXIT
END

IF ~~ OW#VIC22 // from: 203.2 203.3 201.3
  SAY ~Deny it if you must, but I know your gaze lingers upon me. Your refusal to admit what you want is just more evidence of the weakness you kivvin embrace.~
  IF ~~ THEN EXIT
END

IF ~~ OW#VIC23 // from: 203.3
  SAY ~A compliment I'll accept, though it comes from a tame and obedient servant who doesn't dare embrace her power. Be gone from my sight for now, coward.~
  IF ~~ THEN EXIT
END

IF ~~ OW#VIC24 // from: 201.1
  SAY ~Hah! Do not think yourself so clever, ssin'urninness! I will not fall for such cheap tricks. Away with you, and mind where your eyes wander.~
  IF ~~ THEN EXIT
END

  IF ~~ OW#VIC25 // from: 61-SHORT
  SAY ~Yes, I have noticed the type of <PRO_MANWOMAN> that you are. Industrious, crafty, and shrewd... all the qualities that I have grown to like most in colnbluth exist in you.~
  ++ ~Does colnbluth mean outsiders? I thought you didn't like the qualities of any non-drow.~ + OW#VIC26
  + ~GENDER(PLAYER1,MALE)~ + ~I don't know where you're going with this, but knock it off. I'm not interested.~ + 193
  + ~GENDER(PLAYER1,FEMALE)~ + ~I don't know where you're going with this, but knock it off. I'm not interested.~ + OW#VIC20
END

  IF ~~ OW#VIC26 // from: OW#VIC25.0
  SAY ~True for the most part, but I look upon you and I see great drive and determination. It surprises me that a race as long-lived as yours has not made better use of its time.~
  IF ~~ THEN GOTO OW#VIC27
END
 
  IF ~~ OW#VIC27 // from: OW#VIC26
  SAY ~Elven lives are long and static; we feel no urgency. Despite appearance, we become complacent. If the drow had your drive... it would be a Second Age of conquest.~
  ++ ~I'm so glad you approve.~ + OW#VIC28
  ++ ~That doesn't sound like any elves I know.~ + 203
  ++ ~Your meandering is beginning to grow tiresome, Viconia.~ + 204
END

  IF ~~ OW#VIC28 // from: OW#VIC27
  SAY ~Do not presume I think well of your kind. Though you display their finer qualities, in the end your race still fails to meet its potential.~
  ++ ~Life isn't about conquest, Viconia. Don't you think we're worth more than that?~ + 204
  + ~GENDER(PLAYER1,MALE)~ + ~I suppose you would know all about failed potential, wouldn't you?~ + 205
  + ~GENDER(PLAYER1,FEMALE)~ + ~I suppose you would know all about failed potential, wouldn't you?~ + OW#VIC21
END

  IF ~~ OW#VIC29 // from: 61-HALFELF
  SAY ~Yes, I have noticed the type of <PRO_MANWOMAN> that you are. I had always expected half-breeds to be sickly and intellectually diminished. Instead, I find you vivacious and discerning. A surprising change from other half-breeds we have encountered.~
  + ~GENDER(PLAYER1,FEMALE) !IfValidForPartyDialogue("Jaheira") !IfValidForPartyDialogue("Neera")~ + ~Shut up, Viconia. I'm not a 'half-breed' or a 'mongrel' or whatever it is you like to call us.~ + OW#VIC21
  + ~GENDER(PLAYER1,MALE) !IfValidForPartyDialogue("Jaheira") !IfValidForPartyDialogue("Neera")~ + ~Shut up, Viconia. I'm not a 'half-breed' or a 'mongrel' or whatever it is you like to call us.~ + 205
  + ~!IfValidForPartyDialogue("Jaheira") !IfValidForPartyDialogue("Neera")~ + ~And yet you are as much a bitch as I've heard drow are.~ + 204
  IF ~IfValidForPartyDialogue("Jaheira")~ EXTERN BJAHEIR OW#JAH1
  IF ~!IfValidForPartyDialogue("Jaheira") IfValidForPartyDialogue("Neera")~ EXTERN BNEERA OW#NEE1
END
END

APPEND BJAHEIR
IF ~~ OW#JAH1 // from: OW#VIC29
  SAY ~Your flattery is just as foul as your temper, drow. <CHARNAME>, do you truly intend to tolerate such talk from one such as she?~
  IF ~IfValidForPartyDialogue("Neera")~ EXTERN BNEERA OW#NEE1
  IF ~!IfValidForPartyDialogue("Neera")~ EXTERN BVICONI OW#VIC30
END
END

APPEND BNEERA
IF ~~ OW#NEE1 // from: OW#VIC29 OW#JAH1
  SAY ~Um. Wow. How's that for a backhanded compliment?~
  IF ~~ EXTERN BVICONI OW#VIC30
END
END

APPEND BVICONI  
  IF ~~ OW#VIC30 // from: OW#JAH1 OW#NEE1
  SAY ~As I said, not all of your kind are so agreeable.~
  + ~GENDER(PLAYER1,FEMALE)~ + ~Shut up, Viconia. I'm not a 'half-breed' or a 'mongrel' or whatever it is you like to call us.~ + OW#VIC21
  + ~GENDER(PLAYER1,MALE)~ + ~Shut up, Viconia. I'm not a 'half-breed' or a 'mongrel' or whatever it is you like to call us.~ + 205
  ++ ~And yet you are as much a bitch as I've heard drow are.~ + 204
END
  
  IF ~~ OW#VIC31 // from: 61-ELF
  SAY ~Yes, I have noticed the type of <PRO_MANWOMAN> that you are. It is strange. I expected darthiir to be weak, too preoccupied with their arts to be of much worth. And yet here you stand, a rare testament to the potential of your race.~
  ++ ~Am I meant to be flattered by such an observation?~ + OW#VIC32
  + ~GENDER(PLAYER1,MALE)~ + ~I don't know where you're going with this, but knock it off. I'm not interested.~ + 193
  + ~GENDER(PLAYER1,FEMALE)~ + ~I don't know where you're going with this, but knock it off. I'm not interested.~ + OW#VIC20
END
  
  IF ~~ OW#VIC32 // from: OW#VIC31
  SAY ~Are you not? I only speak the truth. Though I have clashed with elven warriors who can hold their own, most of your people lack the spark that other, lesser races have.~
  IF ~~ THEN GOTO OW#VIC33
END
  
  IF ~~ OW#VIC33 // from: OW#VIC32
  SAY ~It is not as if I claim that drow are different. Our long lives are static; we feel no urgency. Despite appearance, we become complacent. If the drow had the drive of humans or even half-breeds... it would be a Second Age of conquest.~
  ++ ~Life isn't about conquest, Viconia. The arts offer a longer legacy than any war.~ + 204
  + ~GENDER(PLAYER1,MALE)~ + ~Perhaps drive isn't what you should be learning from other races, Viconia.~ + 205
  + ~GENDER(PLAYER1,FEMALE)~ + ~Perhaps drive isn't what you should be learning from other races, Viconia.~ + OW#VIC21
END
END

// LT15 //
REPLACE BVICONI
IF WEIGHT #6 ~Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",16) !StateCheck(Player1,STATE_SLEEPING)~ 62 // from:
  SAY ~I have been thinking, and I think that I may have been exceedingly harsh in my treatment of you once again.~ [VICONI74]
  + ~OR(2) !Global("JaheiraRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Jaheira") OR(2) !Global("AerieRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Aerie")~ + ~You treat everyone else like dirt. Why should I be any different?~ + 209
  + ~OR(2) !Global("JaheiraRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Jaheira") OR(2) !Global("AerieRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Aerie")~ + ~Don't worry about it, Viconia.~ + 209
  + ~GENDER(PLAYER1,MALE) OR(2) !Global("JaheiraRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Jaheira") OR(2) !Global("AerieRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Aerie")~ + ~May have? Don't make me laugh. You're a bitch, plain and simple. Now get lost.~ + 211
  + ~GENDER(PLAYER1,FEMALE) OR(2) !Global("JaheiraRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Jaheira") OR(2) !Global("AerieRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Aerie")~ + ~May have? Don't make me laugh. Every time you talk is like venom. Now get lost.~ + OW#VIC35
  IF ~Global("JaheiraRomanceActive","GLOBAL",1) IfValidForPartyDialogue("Jaheira")~ EXTERN BJAHEIR 441
  IF ~OR(2) !Global("JaheiraRomanceActive","GLOBAL",1) !IfValidForPartyDialogue("Jaheira") Global("AerieRomanceActive","GLOBAL",1) IfValidForPartyDialogue("Aerie")~ EXTERN BAERIE 442
END
END

REPLACE BJAHEIR
IF ~~ THEN BEGIN 441 // from:
  SAY ~You spit your venom in so many directions, drow, I find it surprising that you think none would fall on <PRO_HIMHER>. Perhaps you think your motives are not transparent.~ [JAHEIRI3]
  IF ~~ THEN EXTERN ~BVICONI~ 554
END
END

REPLACE BVICONI
IF ~~ 556 // from:
  SAY ~Calm yourself, half-elf. You earned this anger by disrupting my words to <CHARNAME>. I was simply saying that I regret my earlier words to <PRO_HIMHER>... and I regret little.~
  ++ ~You treat everyone else like dirt. Why should I be any different?~ + 209
  ++ ~Don't worry about it, Viconia.~ + 209
  + ~GENDER(PLAYER1,MALE)~ + ~Don't make me laugh. You're a bitch, plain and simple. Now get lost.~ + 211
  + ~GENDER(PLAYER1,FEMALE)~ + ~Don't make me laugh. Jaheira is right: you're venomous. Now get lost.~ + OW#VIC35
END
END

REPLACE BAERIE
IF ~~ THEN BEGIN 442 // from:
  SAY ~You are "exceedingly harsh" in your treatment of everyone, Viconia. Why should <PRO_HESHE> be any different?~ [AERIED5]
  IF ~~ THEN EXTERN ~BVICONI~ 557
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 557 // from:
  SAY ~Well, for starters, <PRO_HESHE> is far more worthy of my respect than a mooning cripple like yourself. Perhaps you should flap helplessly a bit further away and allow your betters to speak.~ [VICONIC4]
  IF ~~ THEN EXTERN ~BAERIE~ 443
END
END

REPLACE BAERIE
IF ~~ THEN BEGIN 443 // from:
  SAY ~I can't imagine what you think to accomplish. You think <CHARNAME> doesn't see the saliva dripping from your fangs? You're not worthy of <PRO_HIMHER>, Viconia.~
  IF ~~ THEN EXTERN ~BVICONI~ 558
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 559 // from:
  SAY ~It takes strength to gain my attention, little fool. I am sure <PRO_HESHE> has no interest in one who can barely pull herself together to utter a sentence.~
  IF ~~ THEN GOTO 560
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 561 // from: 560.1 560.0
  SAY ~I see. Obviously, you are weaker than I thought. Enjoy the cripple, fool, but when you finally find her stale and slaver after me, you'll be left wanting.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ EXIT
END
END

REPLACE BAERIE
IF ~~ THEN BEGIN 445 // from:
  SAY ~F-fine, then. If... if that's what you want, <CHARNAME>, then she's all yours. Obviously, you are not the <PRO_MANWOMAN> I thought you to be.~
  IF ~~ THEN DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)
~ EXTERN ~BVICONI~ 562
END
END

REPLACE BVICONI
IF ~~ 562 // from:
  SAY ~Now that the fool is dealt with, there is the matter of... my apology. I do not do so often, <CHARNAME>, but as I said... I may have been too harsh when we spoke last.~
  ++ ~You treat everyone else like dirt. Why should I be any different?~ + 209
  ++ ~Don't worry about it, Viconia.~ + 209
  + ~GENDER(PLAYER1,MALE)~ + ~Give me a break! You're a bitch, and there's nothing more to it!~ + 211
  + ~GENDER(PLAYER1,FEMALE)~ + ~Give me a break! You're a venomous spider, and there's nothing more to it!~ + OW#VIC35
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 209 // from: 562.1 562.0 556.1 556.0 62.1 62.0
  SAY #9721 /* ~Understand, <CHARNAME>, I have not been on the surface for all that long. Sometimes I forget that things here are different from the world I once knew.~ */
  IF ~Gender(Player1,MALE)~ THEN GOTO 210
  IF ~Gender(Player1,FEMALE)~ THEN GOTO OW#VIC34
END
END

REPLACE BVICONI
IF ~~ 210 // from: 209.0
  SAY ~I have toyed with your feelings unfairly, placing you down with the other males I have known... and you have not been like them. It was... wrong of me.~
  ++ ~I am sick of you running hot and cold all the time. Just leave me alone and I'll be happy!~ + 212
  ++ ~Eating crow again, eh? I could get to like this.~ + 213
  ++ ~I... guess it's understandable. Don't worry about it.~ + 215
  + ~Race(Player1,HALF_ELF)~ + ~If you are truly sorry for your words, then you'll stop calling half-elves 'mongrel' or 'half-breed.'~ DO ~SetGlobal("OW#VICHE","GLOBAL",1)~ + OW#VIC36
END
END

APPEND BVICONI
IF ~~ OW#VIC34 // from: 209F
  SAY ~I have treated you as if you were a rival vying for Lolth's favor. As if you were prepared to strike when I least expected it. But you are... not one of the females from back home. It was... wrong of me to treat you as such.~
  ++ ~I am sick of you running hot and cold all the time. Just leave me alone and I'll be happy!~ + OW#VIC35
  ++ ~Begging for mercy from a surfacer? I could get to like this.~ + 213
  ++ ~I... guess it's understandable. Don't worry about it.~ + 215
  + ~Race(Player1,HALF_ELF)~ + ~If you are truly sorry for your words, then you'll stop calling half-elves 'mongrel' or 'half-breed'.~ DO ~SetGlobal("OW#VICHE","GLOBAL",1)~ + OW#VIC36
END

IF ~~ OW#VIC35 // from: OW#VIC34 562.3 556.3 62.3
  SAY ~I try to apologize and you treat me thus? Sniveling coward, you... are not worthy of my concern. I shall remain silent then. I leave you to your dismal existence.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ EXIT
END

IF ~~ OW#VIC36 // from: OW#VIC34.3 210.3
  SAY ~You—you make a strong demand, <CHARNAME>. Very well. If it means making amends, I will offer your kind a bit more grace. But enough with this sentimental talk. Let us continue on our way before I retch out of pure disgust.~
  IF ~~ THEN EXIT
END
END

// LT 17 //
REPLACE BVICONI
IF ~~ 220 // from: 219.0
  SAY ~There I was hunted by the darthiir... surface elves... and their honed hatred drove me further. I was sure I would perish, never to see the Underdark again.~
  ++ ~What happened next?~ + 223
  + ~GENDER(PLAYER1,MALE)~ + ~You've a flair for melodrama, Viconia. But I'm losing interest... tell it to someone else.~ + 222
  + ~GENDER(PLAYER1,FEMALE)~ + ~You're a fair storyteller, Viconia, but I'm afraid I'm not in the mood. Another time, perhaps.~ + 222
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 221 // from: 63.1
  SAY ~Again I am brushed off by your moody silence. Set a signal fire then, to let me know when you are available for simple discourse. I wait with bated breath.~
  IF ~~ THEN EXIT
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 225 // from: 224.0
  SAY #26983 /* ~He was Calishite, I believe. They are fond of slaves. The price for my safety was the favors I bestowed... erotic arts that the drow have honed for an eon.~ */
  IF ~  GENDER(PLAYER1,MALE)
~ THEN GOTO 226
  IF ~  GENDER(PLAYER1,FEMALE)
~ THEN GOTO OW#VIC37
END
END

APPEND BVICONI
IF ~~ OW#VIC37 // from: 225F
  SAY ~Does it nauseate you that I had to run my dark hands along his sweaty folds and tickle him artfully with my tongue, that he exerted himself wildly as I passionately bit his shoulder?~
  ++ ~Why would you think I wanted to hear about this? Leave me alone, Viconia.~ + OW#VIC40
  ++ ~That's horrible... I can't believe he made you do those things.~ + OW#VIC38
  ++ ~I suppose you did what you had to do.~ + OW#VIC38
END

IF ~~ OW#VIC38 // from: OW#VIC37.2 OW#VIC37.1
  SAY ~It wasn't such a foul thing. The merchant was quickly my pawn, and the caravan went as I wished. Alas, his heart gave out one night... The guards thought it murder and chased me away.~
  IF ~~ THEN GOTO OW#VIC39
END

IF ~~ OW#VIC39 // from: OW#VIC38
  SAY ~Oh, do not look at me in such a manner. Survival comes first in this world and I only used the knowledge that was already imparted upon me. Is that so terrible?~
  ++ ~Not at all.~ + OW#VIC41
  ++ ~I think it's horrifying... Are you okay?~ + OW#VIC42
  ++ ~Oh, get away from me already. I tire of your ridiculous games.~ + OW#VIC40
END

IF ~~ OW#VIC40 // from: OW#VIC39.2 OW#VIC37.0
  SAY ~Does your fragile surfacer femininity recoil before my deeds? Cower before my manner, if you must, <CHARNAME>... you disgust me.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ EXIT
END

IF ~~ OW#VIC41 // from: OW#VIC39.0
  SAY ~Good, I am pleased you have some sense... Or did you find my story all too fascinating? *chuckle* Perhaps another time, ssin'urninness...~
  IF ~~ THEN EXIT
END

IF ~~ OW#VIC42 // from: OW#VIC39
  SAY ~What? Is this meant to be a pathetic display of concern? It was a simple transaction that benefited us both. Do not make me into a victim just to suit your surfacer ideals. You will not win my respect with cowardice.~
  IF ~~ THEN EXIT
END
END

// LT19 //
REPLACE BVICONI
IF WEIGHT #8 ~Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",20) !StateCheck(Player1,STATE_SLEEPING)~ 64 // from:
  SAY ~Tell me... has there ever been anyone special to you? A thief of your heart?~ [VICONI76]
  ++ ~If there were, I certainly wouldn't tell you, Viconia.~ + 67
  ++ ~I don't know. Not so far there hasn't been.~ + 65
  + ~GENDER(PLAYER1,MALE)~ + ~We don't have time to discuss this now.~ + 232
  + ~GENDER(PLAYER1,FEMALE)~ + ~We don't have time to discuss this now.~ + OW#VIC45
END
END

REPLACE BVICONI
IF ~~ 65 // from: 64.1
  SAY ~Never a special one who awaited their hero's return? The idea has value. I myself hope to retire to a home that doesn't change by the day.~
  + ~GENDER(PLAYER1,MALE)~ + ~I doubt a self-centered drow such as yourself would ever be satisfied with the quiet life.~ + 66
  + ~GENDER(PLAYER1,FEMALE)~ + ~Could a woman such as yourself ever be satisfied with the quiet life?~ + OW#VIC43
  ++ ~I said that there was nobody, and I meant it.~ + 67
  ++ ~There may be such a person... it could be that the answer to your question is playing itself out right now.~ + 68
END
END

REPLACE BVICONI
IF ~~ 67 // from: 65.1 64.0
  SAY ~No? Is it not possible then? Could she exist: a woman who makes your pulse quicken by her closeness... who enflames you by a mere glance?~
  ++ ~I suppose I could admit that such a woman could exist, yes.~ + 69
  ++ ~I think the answer to that question is playing itself out as we speak.~ + 68
  ++ ~No, there isn't. And if there were, I can tell you truly it would not be a creature such as you!~ + 233
  + ~GENDER(PLAYER1,MALE)~ + ~I've had enough of your head games, Viconia. Leave me be!~ + 232
  + ~GENDER(PLAYER1,FEMALE)~ + ~Is this meant to be a game, Viconia? I'll not play it.~ + OW#VIC45
END
END

REPLACE BVICONI
IF ~~ 68 // from: 67.1 65.2
  SAY ~You think so? I cannot wait for the final act of this play, then... I am sure it will be worth waiting for.~
  ++ ~Oh, it will not disappoint, I'm sure. I've rehearsed the scene in my mind time and time again.~ + 69
  ++ ~When the heart beats true, its song is a delight to hear.~ + 69
  + ~GENDER(PLAYER1,MALE)~ + ~Get over yourself, Viconia. Let's just continue on, shall we?~ + 232
  + ~GENDER(PLAYER1,FEMALE)~ + ~And wait you will, Viconia. Let's continue on, shall we?~ + OW#VIC45
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 69 // from: 68.1 68.0 67.0
  SAY #9787 /* ~Your heart is heavy with lust and burning desire, and beats proudly and strongly... but shall it be mine, or is it another's?~ */
  IF ~~ THEN REPLY #9788 /* ~It is yours certainly, Viconia. But do be gentle with it.~ */ GOTO 70
  IF ~~ THEN REPLY #27153 /* ~And what would you say if I told you my heart belonged to someone else?~ */ GOTO 234
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #9789 /* ~*chuckle* All right, my heart is not your plaything just yet, so let's move on, shall we?~ */ GOTO 70
  + ~GENDER(PLAYER1,FEMALE)~ + ~*chuckle* All right, my heart is not your plaything just yet. Do refrain from marring it.~ + 70
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #27154 /* ~I've no interest in discussing my heart. Let's move on.~ */ GOTO 232
  + ~GENDER(PLAYER1,FEMALE)~ + ~I've no interest in discussing my heart. Let's move on.~ + OW#VIC45
END
END

REPLACE BVICONI
IF ~~ 70 // from: 69.2 69.0
  SAY ~Let's continue holding your heart and testing its mettle, but with a measure of restraint then.~
  + ~GENDER(PLAYER1,MALE)~ + ~I have little interest in restraint... Only bold and forthright action matter in times such as these.~ + 72
  + ~GENDER(PLAYER1,FEMALE)~ + ~What about the mettle of your heart? Is this a game to you? Or do you long for something more?~ + OW#VIC53
  + ~GENDER(PLAYER1,MALE)~ + ~Perfect. I would appreciate seeing some restraint in you for once.~ + 71
  + ~GENDER(PLAYER1,FEMALE)~ + ~A bit of restraint would suit me for now. Tell me... what are relationships like between drow women? Or drow men for that matter?~ + OW#VIC46
  + ~GENDER(PLAYER1,MALE)~ + ~I said enough with the wordplay. Let's continue in our travels.~ + 235
  + ~GENDER(PLAYER1,MALE)~ + ~The mettle of my heart is not for you to test, Viconia. Enough with your head games.~ + 235
  + ~GENDER(PLAYER1,FEMALE)~ + ~The mettle of my heart is not for you to test, Viconia. Enough with your games.~ + 235
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 234 // from: 69.1
  SAY ~I would say you are a liar, but if true, I would challenge the one you name. We drow are a selfish, proprietary lot, but that is a discussion for another time.~
  IF ~~ THEN EXIT
END
END

APPEND BVICONI
IF ~~ OW#VIC43 // from: 65.1
  SAY ~Do you think my soul so dark that it cannot yearn for peace and happiness? The differences between us are not so great.~
  IF ~~ THEN GOTO OW#VIC44
END

IF ~~ OW#VIC44 // from: OW#VIC43
  SAY ~Are we not both dark creatures, driven to places and means we had never imagined? But enough. The road calls.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#VIC45 // from: 69.5 68.3 67.4 64.3
  SAY ~You have ever the mysterious charm to you, <CHARNAME>. I wonder: is this your attempt to draw me closer or push me away? I shall figure you out soon enough, ssin'urninness.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#VIC46 // from: 70.3
  SAY ~Attempting to change the subject, are we? Or do you wish to know what I have in mind for you?~
  IF ~~ THEN GOTO OW#VIC47
END

IF ~~ THEN BEGIN OW#VIC47 // from: OW#VIC46
  SAY ~Males may lay with each other, if they wish, but only so long as it does not inconvenience the matron mother.~
  IF ~~ THEN GOTO OW#VIC48
END

IF ~~ THEN BEGIN OW#VIC48 // from: OW#VIC47
  SAY ~As for females... it is more complicated. Laying with other females is common, especially among the younger priestesses.~
  IF ~~ THEN GOTO OW#VIC49
END

IF ~~ THEN BEGIN OW#VIC49 // from: OW#VIC48
  SAY ~It is an easy way to gain favor in a powerful alliance. But it is known to all parties that there is no true loyalty or love. A moment of carelessness can turn a night of pleasure into a blood-soaked grave.~
  IF ~~ THEN GOTO OW#VIC50
END

IF ~~ THEN BEGIN OW#VIC50 // from: OW#VIC49
  SAY ~Some priestesses attempt to skirt the issue by taking only commoners as lovers. It is foolish to underestimate any drow female, of course.~
  IF ~~ THEN GOTO OW#VIC51
END

IF ~~ THEN BEGIN OW#VIC51 // from: OW#VIC50
  SAY ~There are many cautionary tales of a common female being hired by a priestess to seduce her rival before slaying her...~
  IF ~~ THEN GOTO OW#VIC52
END

IF ~~ THEN BEGIN OW#VIC52 // from: OW#VIC51
  SAY ~...and as many tales of the female double crossing the one who hired her.~
  ++ ~So do you consider me a rival to be conquered? Or a companion to treasure?~ + OW#VIC53
  ++ ~That sounds... quite difficult. Excuse me, Viconia. I need some time to think.~ + OW#VIC54
END

IF ~~ THEN BEGIN OW#VIC53 // from: OW#VIC52.0 70.1
  SAY ~I would not dare share my thoughts just yet... but I suppose I have a bit of fondness for you. Come now. Let us carry on.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#VIC54 // from: OW#VIC52.1
  SAY ~Yes... I imagine it sounds quite harsh for a surfacer. Very well, do take care not to overwhelm yourself. I... I would rather dislike seeing you upset.~
  IF ~~ THEN EXIT
END
END

// LT21 //
REPLACE BVICONI
IF WEIGHT #9 ~Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",22) !StateCheck(Player1,STATE_SLEEPING)~ THEN BEGIN 74 // from:
  SAY ~What was life like before you were an adventurer? Didn't it seem simpler, less complicated?~ [VICONI77]
  ++ ~What do you mean?~ + 75
  ++ ~It did, didn't it?~ + 77
  + ~GENDER(PLAYER1,MALE)~ + ~I don't know what you're playing at, Viconia, but I'm not interested.~ + 237
  + ~GENDER(PLAYER1,FEMALE)~ + ~Can we talk about this some other time? My attention is elsewhere at the moment.~ + OW#VIC55
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 77 // from: 238.2 75.1 74.1
  SAY ~It would be nice, wouldn't it, <CHARNAME>? To leave the insidious schemes and psychopathic madmen for others to battle and prevail over?~
  + ~GENDER(PLAYER1,FEMALE)~ + ~There is nothing to stop you from finding a life of peace, Viconia.~ + 78
  + ~GENDER(PLAYER1,MALE)~ + ~You could leave this wretched excuse for a life anytime, Viconia.~ + 78
  ++ ~I suppose that would be something to think about. There are many things about this life I would like to leave behind.~ + 78
  ++ ~I don't think you even know what you're talking about.~ + 239
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 80 // from: 78.1
  SAY ~I will definitely consider its value and place in my life, <CHARNAME>. I appreciate your words of friendship as well... they are not words I am familiar with.~
  ++ ~I wouldn't mind changing the definition of our friendship.~ + 243
  ++ ~I sense that you're a good person, Viconia. Someone not unlike most of us.~ + 244
  + ~GENDER(PLAYER1,MALE)~ + ~I meant no friendship by them. Don't confuse my meaning.~ + 245
  + ~GENDER(PLAYER1,FEMALE)~ + ~I meant nothing so frivolous. You are measured in your thoughts; that does not mean I hold you closely.~ + OW#VIC56
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 238 // from: 75.2
  SAY ~Do you? And you think that such excitement will grip your senses forever? Is there no longing for peace within you, <CHARNAME>?~
  + ~GENDER(PLAYER1,MALE)~ + ~I don't know where this mood of yours came from, Viconia, but stow it.~ + 239
  + ~GENDER(PLAYER1,FEMALE)~ + ~What I long for isn't any business of yours, Viconia. ~ + 239
  ++ ~No... I enjoy the excitement of this life. Is that so hard to understand?~ + 240
  ++ ~I suppose there is. What are you trying to say?~ + 77
END
END
  
APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC55 // from: 74.3
  SAY ~It is always another time with you. Very well, do let me know when you deign to entertain my thoughts.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#VIC56 // from: 80.3
  SAY ~An admirably pragmatic stance, <CHARNAME>. I find you ever intriguing in this dance of temptation. Perhaps you will hold me closely yet.~
  IF ~~ THEN EXIT
END
END


// LT23 //
REPLACE BVICONI
IF ~~ THEN BEGIN 84 // from: 83.0
  SAY ~Variety is the spice of life. The drudgery of having the same partner... it would have to be a unique and special person, indeed.~
  + ~GENDER(PLAYER1,MALE)~ + ~You wish marriage redefined to suit your flagrantly wanton ways, I suppose?~ + 85
  + ~GENDER(PLAYER1,FEMALE)~ + ~You wish marriage redefined to suit your flagrantly wanton ways, I suppose?~ + OW#VIC57
  ++ ~Marriage can be a wonderful thing, Viconia.~ + 86
  ++ ~Why? How do the drow treat marriage?~ + 151
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 86 // from: 153.0 84.1 83.1
  SAY ~From what I have seen, surface custom is not so different from ours. Of course, drow culture allows for "husbands" to be disposed of and replaced.~
  ++ ~Are you saying that the drow women actually kill their husbands?~ + 155
  ++ ~What about a drow woman marrying another woman? Or a man marrying a man?~ + OW#VIC58
  ++ ~I take it that you dislike our form of marriage, then?~ + 88
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 88 // from: 248.1 87.1 86.1
  SAY ~Perhaps. I haven't devoted much thought to it, though I've noticed that the role of male and female are reversed here on the surface.~
  + ~GENDER(PLAYER1,MALE)~ + ~They aren't reversed, Viconia. Men don't murder their wives.~ + 89
  + ~GENDER(PLAYER1,FEMALE)~ + ~It is not as extreme as it seems to be in your homeland but yes... It is difficult to be a woman, at times.~ + OW#VIC61
  + ~GENDER(PLAYER1,MALE)~ + ~Any man who gains your affection is one who would do well to watch his back.~ + 250
  + ~GENDER(PLAYER1,FEMALE)~ + ~I suppose I'm lucky to be a woman—any man who gained your attention would have to watch his back.~ + OW#VIC62
  ++ ~Maybe. Let's keep moving, shall we?~ + 251
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 158 // from: 156.0
  SAY ~The second last to die by my hand was Riklaunim, a devious, controlling snake whose head leapt from his shoulders with a look of surprise I found most humorous.~
  + ~GENDER(PLAYER1,FEMALE)~ + ~What do you mean, controlling? I find it hard to imagine anyone making you do anything you did not wish.~ + OW#VIC63
  + ~GENDER(PLAYER1,FEMALE)~ + ~Do you prefer the drow way of doing things, then?~ + 88
  IF ~GENDER(PLAYER1,MALE)~ THEN GOTO 159
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC57 // from: 84.1
  SAY ~Must you always see me as a villain? I do not hide behind shallow affectations and self-deception, <CHARNAME>! I am honest in who I am.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#VIC58 // from: 86.1
  SAY ~It simply is not done. Males do not get to choose who they marry. To even propose such would be laughable.~
  IF ~~ THEN GOTO OW#VIC59
END

  IF ~~ THEN BEGIN OW#VIC59 // from: OW#VIC58
  SAY ~As for the other matter, no drow female would dare invite such a potent rival into her life through marriage.~
  IF ~~ THEN GOTO OW#VIC60
END

  IF ~~ THEN BEGIN OW#VIC60 // from: OW#VIC59
  SAY ~Furthermore, no female would take the insult or risk of a position typically occupied by mere males.~
  ++ ~What do you mean risk? Do drow women actually kill their husbands?~ + 155
  ++ ~That seems... very difficult. What do you think of surfacer marriages, then? Are they better or worse than your drow customs?~ + 88
END

IF ~~ THEN BEGIN OW#VIC61 // from: 88.1
  SAY ~Less difficult now that the two of us each have powerful females to rely on, hm? But come, I trust you have heard enough of drow customs.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#VIC62 // from: 88.3
  SAY ~Well put, <CHARNAME>. A word of advice, though—one should always be on guard around a drow, regardless of gender.~
  IF ~~ THEN EXIT
END

  IF ~~ THEN BEGIN OW#VIC63 // from: 158.0
  SAY ~It is an embarrassment for a male to have manipulated me so.~
  IF ~~ THEN GOTO OW#VIC64
END
  
  IF ~~ THEN BEGIN OW#VIC64 // from: OW#VIC63
  SAY ~He seemed a reasonable enough husband, at first. He was enjoyable in bed and clever enough to carry out discreet tasks on my behalf.~
  IF ~~ THEN GOTO OW#VIC65
END
 
  IF ~~ THEN BEGIN OW#VIC65 // from: OW#VIC64
  SAY ~But over time he began to... to know my weaknesses. How to say just the right thing to make me doubt myself.~
  IF ~~ THEN GOTO OW#VIC66
END
  
  IF ~~ THEN BEGIN OW#VIC66 // from: OW#VIC65
  SAY ~Before long, I found myself turning to him for approval before I took any action, no matter how small.~
  IF ~~ THEN GOTO OW#VIC67
END
 
  IF ~~ THEN BEGIN OW#VIC67 // from: OW#VIC66
  SAY ~I was worthless without his guidance. Stupid enough to be mistaken for a male.~
  IF ~~ THEN GOTO OW#VIC68
END
 
  IF ~~ THEN BEGIN OW#VIC68 // from: OW#VIC67
  SAY ~It was not until I left him behind while carrying out a task in another city that I began to realize what he had done to me.~
  IF ~~ THEN GOTO OW#VIC69
END
 
  IF ~~ THEN BEGIN OW#VIC69 // from: OW#VIC68
  SAY ~I would not let it go unpunished.~
  ++ ~He deserved what you gave him.~ + OW#VIC70
  ++ ~Did Lolth not punish you for falling to the schemes of a 'lowly male'?~ + OW#VIC74
  ++ ~What he did was cruel but is it any worse than what males are subjected to by females?~ + OW#VIC75
END
  
  IF ~~ THEN BEGIN OW#VIC70 // from: OW#VIC69.0
  SAY ~I lured him to a chapel under the guise of seeking his advice. I feigned distress to lower his guard.~
  IF ~~ THEN GOTO OW#VIC71
END
 
  IF ~~ THEN BEGIN OW#VIC71 // from: OW#VIC70
  SAY ~When he was assured of his successful manipulations, I drew a sword and ended him.~
  IF ~~ THEN GOTO OW#VIC72
END
  
  IF ~~ THEN BEGIN OW#VIC72 // from: OW#VIC71
  SAY ~I dedicated his slaughter to Lolth, to ensure she did not have designs against me for my weakness... but in truth his slaughter was for me and me alone.~
  IF ~~ THEN GOTO OW#VIC73
END  

  IF ~~ THEN BEGIN OW#VIC73 // from: OW#VIC72
  SAY ~But enough. It won't do to linger on fond memories. We have many tasks to attend.~
  IF ~~ THEN EXIT
END
  
  IF ~~ THEN BEGIN OW#VIC74 // from: OW#VIC69.1
  SAY ~She surely would have, had I not acted quickly. I knew I had to both appease her and to ensure this husband of mine was put in his place.~
  IF ~~ THEN GOTO OW#VIC70
END  

  IF ~~ THEN BEGIN OW#VIC75 // from: OW#VIC69.2
  SAY ~Fool! Do not presume to understand what he... what he did to me.~
  IF ~~ THEN GOTO OW#VIC76
END

  IF ~~ THEN BEGIN OW#VIC76 // from: OW#VIC75
  SAY ~I have been subjected to many tortures in my lifetime, both in my homeland and on the surface. Few compare to Riklaunim's schemes.~
  IF ~~ THEN GOTO OW#VIC77
END
  
  IF ~~ THEN BEGIN OW#VIC77 // from: OW#VIC76
  SAY ~I tire of this discussion. Let us depart.~
  IF ~~ THEN EXIT
END
END

// LT25 //
REPLACE BVICONI
IF ~~ THEN BEGIN 252 // from: 92.0
  SAY #9933 /* ~Does it fire your ambitions, <CHARNAME>? Is there a lust within you superseding mere passion, a desire to lord over others as a conqueror and superior?~ */
  IF ~~ THEN REPLY #27332 /* ~Yes, I intend to have power for myself. ~ */ GOTO 253
  IF ~~ THEN REPLY #27333 /* ~I've no interest in lording over others, Viconia.~ */ GOTO 255
  IF ~~ THEN REPLY #27334 /* ~I do not wish to discuss this with you.~ */ GOTO 255
  + ~GENDER(PLAYER1,FEMALE)~ + ~I've no interest in lording over others, Viconia.~ + OW#VIC79 
  + ~GENDER(PLAYER1,FEMALE)~ + ~I do not wish to discuss this with you.~ + OW#VIC79
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 253 // from: 252.0
  SAY #27335 /* ~You wish to have power, do you? I... I think...~ */
  IF ~GENDER(PLAYER1, MALE)~ THEN GOTO 254
  IF ~GENDER(PLAYER1, FEMALE)~ THEN GOTO OW#VIC78
END
END

APPEND BVICONI
  IF ~~ THEN BEGIN OW#VIC78 // from: 253F
  SAY ~...I think you are a pathetic imitation of drow ambition. Do you think you could ever hope to rise above your station? You are not meant for the power of the gods.~
  IF ~~ THEN EXIT
END

  IF ~~ THEN BEGIN OW#VIC79 // from: 252.3 252.2
  SAY ~Ah, I see. Like other surfacer females, you are cowardly and meek. You wilt before the mere idea of power, prefering to serve males. Pathetic.~
  IF ~~ THEN EXIT
END
END

// LT27 //
REPLACE BVICONI
IF WEIGHT #12 ~Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",28) !StateCheck(Player1,STATE_SLEEPING)~ THEN BEGIN 93 // from:
  SAY ~Please, disregard the things I said to you earlier. They were... ill-conceived.~ [OW#VIC02]
  IF ~GENDER(PLAYER1,MALE)~ THEN GOTO OW#VIC80
  IF ~GENDER(PLAYER1,FEMALE)~ THEN GOTO OW#VIC81
END
END

APPEND BVICONI
  IF ~~ THEN BEGIN OW#VIC80 // from: 93M
  SAY ~You... you are not drow and not worthy of such insults.~ [OW#VIC03]
  ++ ~Why should I? You have crossed the line once too often!~ + 256
  ++ ~Very well. Apology accepted.~ + 257
END

  IF ~~ THEN BEGIN OW#VIC81 // from: 93F
  SAY ~You... we come from different lives. I shouldn’t hold you to the same expectations that I would another drow.~
  ++ ~Why should I forgive you over and over again? You have crossed the line once too often!~ + 256
  ++ ~Very well. Apology accepted.~ + 257
END
END

// LT29 - NO CHANGE //

// LT31 //
REPLACE BJAHEIR
IF ~~ THEN BEGIN 444 // from:
  SAY #56374 /* ~Are we to be entertained by another of your stories, drow? No doubt they consist of little but one set of lies strung to another. Why you bother is beyond me.~ [JAHEIRI4] */
  IF ~!Global("OW#VICHE","GLOBAL",1)~ THEN EXTERN ~BVICONI~ 563
  IF ~Global("OW#VICHE","GLOBAL",1)~ THEN EXTERN ~BVICONI~ OW#VIC82
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 563 // from:
  SAY ~I have no need of lies, half-breed. But obviously you find cause to be jealous of my relationship with your <PRO_MANWOMAN>.~ [VICONID3]
  IF ~~ THEN EXTERN ~BJAHEIR~ 445
END
END

APPEND BVICONI
  IF ~~ THEN BEGIN OW#VIC82 // from: BJAHEIR 444+VICHE
  SAY ~I have no need of lies, Jaheira. But obviously you find cause to be jealous of my relationship with your <PRO_MANWOMAN>.~ [OW#VIC04]
  IF ~~ THEN EXTERN ~BJAHEIR~ 445
END
END

REPLACE BJAHEIR
IF ~~ THEN BEGIN 445 // from:
  SAY ~Jealous? I am <CHARNAME>'s friend. I would warn <PRO_HIMHER> of a nearby snake readying to attack the same I would warn <PRO_HIMHER> away from your lascivious attentions.~
  IF ~~ THEN EXTERN ~BVICONI~ 564
END
END

REPLACE BJAHEIR
IF ~~ THEN BEGIN 447 // from: 446.0
  SAY #56387 /* ~What say you, <CHARNAME>? I give fair warning of this serpent's intentions. Warn her off before she entwines her way around your heart and it is too late.~ */
  ++ ~I'll do as I like with Viconia, Jaheira. Back off.~ + 448
  ++ ~I value your opinion, Jaheira. Consider me duly warned.~ + 449
  ++ ~I have no feelings of that kind for Viconia... surely she knows that, although I mean no offense.~ EXTERN BVICONI 565
  + ~GENDER(PLAYER1,MALE) !Global("OW#VICHE","GLOBAL",1)~ + ~Hah! I could never love such a heartless bitch! Don't even worry about it!~ EXTERN BVICONI 565
  + ~GENDER(PLAYER1,MALE) Global("OW#VICHE","GLOBAL",1)~ + ~Hah! I could never love such a heartless bitch! Don't even worry about it!~ EXTERN BVICONI OW#VIC83
  + ~GENDER(PLAYER1,FEMALE) !Global("OW#VICHE","GLOBAL",1)~ + ~Hah! I could never love such a heartless bitch! Don't even worry about it!~ EXTERN BVICONI OW#VIC84
  + ~GENDER(PLAYER1,FEMALE) Global("OW#VICHE","GLOBAL",1)~ + ~Hah! I could never love such a heartless bitch! Don't even worry about it!~ EXTERN BVICONI OW#VIC85
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC83 // from: BJAHEIR 447M+VICHE
  SAY ~What would I want from such a pathetically weak fool as you? You let a woman who crawls in dirt dictate your actions. I'll not associate with you further, male.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC84 // from: BJAHEIR 447F
  SAY ~What would I want from such a pathetically weak fool as you? You let a mongrel dictate your actions. I'll not associate with you further, iblith.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC85 // from: BJAHEIR 447F+VICHE
  SAY ~What would I want from such a pathetically weak fool as you? You let a woman who crawls in dirt dictate your actions. I'll not associate with you further, iblith.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ EXIT
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 279 // from: 566.0 95.0
  SAY ~I had worshipped the Spider Queen for an age and a half, likely longer than you have been alive, but there came a time when my faith in Lolth was no more.~
  IF ~~ THEN GOTO 280
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 287 // from: 347.0
  SAY #10169 /* ~But I refused. I was disgusted with my queen, so I cursed my mother and endangered my House. In my naivete, I thought that I would survive after my actions.~ */
  ++ ~But... you obviously did survive. What happened next?~ + 288
  + ~GENDER(PLAYER1,MALE)~ + ~You betrayed your family and your god? Perhaps you deserved whatever you got.~ + 289
  + ~GENDER(PLAYER1,MALE)~ + ~A pretty story, Viconia. Come, let us continue our travels.~ + 290
  + ~GENDER(PLAYER1,FEMALE)~ + ~You betrayed your family and your god? What they asked of you was terrible, but did you really have the right to refuse?~ + 289
  + ~GENDER(PLAYER1,FEMALE)~ + ~That is a story I must take some time to consider. Come, let us continue our travels.~ + 290
END
END

// LT33 //
REPLACE BVICONI
IF WEIGHT #15 ~  Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",34) Global("OW#Sacrifice","Global",1) !StateCheck(Player1,STATE_SLEEPING)~ THEN BEGIN 96 // from:
  SAY #10261 /* ~I am ready to continue my tale... if you are willing to hear it.~ [VICONI83] */
  ++ ~Not right now, Viconia. Another time, perhaps.~ + 291
  ++ ~Certainly, Viconia... I'd be interested to hear it.~ DO ~SetGlobal("OW#VALAS","GLOBAL",1)~ + 292
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 297 // from: 296.0
  SAY #10283 /* ~I would have died, in fact, were it not for... if it were not for my brother. My poor, foolish brother. Valas...~ */
  + ~GENDER(PLAYER1,MALE)~ + ~Is that a tear I see running down your cheek? Shedding a tear for a mere male?~ + 298
  + ~GENDER(PLAYER1,FEMALE)~ + ~Is that a tear I see running down your cheek? I wouldn't think you'd value the life of a male.~ + 298
  ++ ~Your... brother saved you? I take it you were close?~ + 299
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 298 // from: 297.0
  SAY #27356 /* ~He... he was no mere male! Is it so difficult for you to believe that I might have cared for another once?!~ */
  + ~GENDER(PLAYER1,MALE)~ + ~Give me a break, Viconia. You care for no one.~ + 300
  + ~GENDER(PLAYER1,MALE)~ + ~It surprises me, that is all. It seems contrary to what you have said about the drow b efore.~ + 301
  + ~GENDER(PLAYER1,FEMALE)~ + ~Care? Maybe. But to love someone as much as yourself? I have doubts.~ + OW#VIC86
  + ~GENDER(PLAYER1,FEMALE)~ + ~I'm sorry, Viconia. I didn't mean it like that. It only seemed contrary to what you have said about the drow before.~ + 301
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC86 // from: BVICONI 298.2
  SAY ~These are the last tears of mine you shall ever see, elg'caress! Oloth plynn dos!~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ EXIT
END
END

// LT35 //
REPLACE BVICONI
IF WEIGHT #16 ~Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",36) !StateCheck(Player1,STATE_SLEEPING)~ THEN BEGIN 97 // from:
  SAY #10382 /* ~Tell me something... did you have much of a family?~ [VICONI84] */
  + ~GENDER(PLAYER1,MALE)~ + ~Viconia, you're talking again. I've got no desire to do the same.~ + 303 
  + ~GENDER(PLAYER1,FEMALE)~ + ~This is a difficult topic for me, Viconia. Can we discuss it later?~ + OW#VIC87
  ++ ~I've always thought of Gorion as a father and often of Imoen as a sister.~ + 304
  ++ ~Why? What brings this on?~ + 305
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 305 // from: 304.0 97.2
  SAY #10426 /* ~I cannot understand the relationships... the closeness that the families of the surface retain with each other. In the Underdark, things are very different.~ */
  + ~GENDER(PLAYER1,MALE)~ + ~So you've said before, and I've no desire to hear more of it.~ + 303
  + ~GENDER(PLAYER1,FEMALE)~ + ~As you've said before. I don't have the stomach to hear more of it.~ + OW#VIC87
  ++ ~What was your family like, then?~ + 427
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 309 // from: 308.0
  SAY #27363 /* ~There are normally no... "brothers," although some males are favored more than others. Most simply exist to serve Queen and House, but this is... not always the case.~ */
  IF ~~ THEN REPLY #27364 /* ~The whole arrangement sounds horrible and devoid of caring. How the drow survive is beyond me.~ */ GOTO 430
  IF ~~ THEN REPLY #27365 /* ~Is there nothing to be found amongst the drow, then, but cruelty and evil?~ */ GOTO 430
  IF ~Global("OW#VALAS","GLOBAL",1)~ THEN REPLY #27366 /* ~You mentioned your brother before... he was a special case?~ */ GOTO 311
  + ~Global("OW#VALAS","GLOBAL",0)~ + ~You make it sound like you knew someone who was a special case.~ + 311
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 314 // from: 313.0
  SAY #27466 /* ~In the end... he saved my life. He... prevented my sacrifice and killed our mother, giving me the opportunity to flee. ~ */
  ++ ~What happened to him, then?~ + 315
  + ~GENDER(PLAYER1,MALE)~ + ~A pretty story, Viconia, but we really should continue our travels.~ + 316
  + ~GENDER(PLAYER1,MALE)~ + ~It figures that you manipulated men into doing your bidding even then.~ + 317
  + ~GENDER(PLAYER1,FEMALE)~ + ~Thank you for sharing your story, Viconia, but we should really continue our travels.~ + 316
  + ~GENDER(PLAYER1,FEMALE)~ + ~Was this sibling bond a gambit of yours, then? Something to ensure you would have a timely savior in a worst case scenario?~ + 317
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC87 // from: 305.1 97.1
  SAY ~As you wish.~
  IF ~~ THEN EXIT
END
END

// LT37 //
REPLACE BVICONI
IF WEIGHT #17 ~Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",38) !StateCheck(Player1,STATE_SLEEPING)~ THEN BEGIN 98 // from:
  SAY #10438 /* ~My brother is what finally made me break my faith fully from the Spider Queen. His actions, I mean... saving me from sacrifice.~ [VICONI85] */
  + ~GENDER(PLAYER1,MALE)~ + ~Eh? What's this? What are you babbling about now?~ + 320 
  + ~GENDER(PLAYER1,FEMALE)~ + ~This is rather sudden, Viconia. I didn't expect you to spout out your tragic past for me.~ + OW#VIC88
  + ~Global("OW#SACRIFICE","GLOBAL",1)~ + ~I thought you lost your faith when you refused to sacrifice the baby.~ + 319
  ++ ~Viconia, I've no time for your nonsense today.~ + 321
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 319 // from: 320.0 98.1
  SAY #10442 /* ~I had begun to question Lolth's appetite for power and absolute devotion with the child, but I did not cast her out of my heart fully until Valas saved my life.~ */
  ++ ~Why would your brother's saving you do that?~ + 322
  + ~GENDER(PLAYER1,MALE)~ + ~Sometimes I wonder why you insist on telling me all these things.~ + 326
  + ~GENDER(PLAYER1,MALE)~ + ~Yes, Viconia, that's very interesting. Can we just continue on now?~ + 327
  + ~GENDER(PLAYER1,FEMALE)~ + ~Your stories are always so gruesome, Viconia. Why do you tell me all this?~ + 326
  + ~GENDER(PLAYER1,FEMALE)~ + ~I know this is important to you, Viconia, but we don't have the time.~ + 327
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 320 // from: 98.0
  SAY #10443 /* ~I am not "babbling." If I began suddenly, it is because I have been pondering this matter silently for some time. I am simply trying to explain something to you.~ */
  IF ~!Global("OW#SACRIFICE","GLOBAL",1)~ THEN GOTO OW#VIC89
  IF ~Global("OW#SACRIFICE","GLOBAL",1)~ THEN GOTO 319
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 325 // from: 349.0
  SAY #10451 /* ~I was forced to flee the Underdark, making my way quickly to the surface before the other drow could stop me, cursing and crying the entire way.~ */
  + ~GENDER(PLAYER1,MALE)~ + ~Without your power, that must have been a difficult journey.~ + 328
  + ~GENDER(PLAYER1,MALE)~ + ~It sounds like you got what you deserved.~ + 329
  + ~GENDER(PLAYER1,FEMALE)~ + ~You left behind the life and goddess you knew. It must have been very difficult... and lonely.~ + 328
  + ~GENDER(PLAYER1,FEMALE)~ + ~From what I know of drow culture, they would say you got what you deserve. What do you think?~ + OW#VIC90
  ++ ~If Lolth was able to do that to your brother, I'm surprised she didn't do worse to you.~ + 331
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC88 // from: 98
  SAY ~I am not "spouting." If I began suddenly, it is because I have been pondering this matter silently for some time. I am simply trying to explain something to you.~
  IF ~!Global("OW#SACRIFICE","GLOBAL",1)~ THEN GOTO OW#VIC89
  IF ~Global("OW#SACRIFICE","GLOBAL",1)~ THEN GOTO 319
END

IF ~~ THEN BEGIN OW#VIC89 // from: OW#VIC88 320
  SAY ~I had begun to question Lolth's appetite for power and absolute devotion after a demand to sacrifice a child, but I did not cast her out of my heart fully until Valas saved my life.~
  ++ ~Why would your brother's saving you do that?~ + 322
  + ~GENDER(PLAYER1,MALE)~ + ~Sometimes I wonder why you insist on telling me all these things.~ + 326
  + ~GENDER(PLAYER1,MALE)~ + ~Yes, Viconia, that's very interesting. Can we just continue on now?~ + 327
  + ~GENDER(PLAYER1,FEMALE)~ + ~Your stories are always so gruesome, Viconia. Why do you tell me all this?~ + 326
  + ~GENDER(PLAYER1,FEMALE)~ + ~I know this is important to you, Viconia, but we don't have the time.~ + 327
END

IF ~~ THEN BEGIN OW#VIC90 // from: 325.3
  SAY ~What I deserve? Did Valas get what he deserved? Would you rather have seen me flayed upon the sacrificial altar?~
  IF ~~ THEN GOTO OW#VIC91
END

IF ~~ THEN BEGIN OW#VIC91 // from: OW#VIC90
  SAY ~Does it please you to imagine me writhing with regret and self-loathing? Sometimes you make me ill to my stomach, <CHARNAME>.~
  IF ~~ THEN EXIT
END
END

// LT39 //
REPLACE BVICONI
IF WEIGHT #18 ~  Global("ViconiaMatch","GLOBAL",1) Global("LoveTalk","LOCALS",40) !StateCheck(Player1,STATE_SLEEPING)~ THEN BEGIN 99 // from:
  SAY #10458 /* ~If you would... If you would please sit with me for a moment before you retire, I would be thankful. I find myself uncharacteristically overcome with anxiety, and I'm not... eager... to be alone for the evening.~ [VICONI86] */
  ++ ~Certainly. Viconia, you're shaking! What is the matter?~ + 332
  + ~GENDER(PLAYER1,MALE)~ + ~Forget it, Viconia... I'm not about to fall victim to another one of your head games.~ + 333 
  + ~GENDER(PLAYER1,FEMALE)~ + ~Forget it, Viconia... I'm not about to fall victim to another one of your games.~ + 333
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 333 // from: 99.1
  SAY #10462 /* ~Please, <CHARNAME>... do not make me beg. I implore you to stay with me but a few moments so that I may put myself at ease...~ */
  + ~GENDER(PLAYER1,MALE)~ + ~Actually, I would rather enjoy seeing you beg, Viconia.~ + 334
  + ~GENDER(PLAYER1,FEMALE)~ + ~Don't be dramatic Viconia. I can hardly imagine you begging for anything.~ + OW#VIC93
  ++ ~Very well. A few moments. Hold, now... you are shaking visibly! What is the matter?~ + 332
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 340 // from: 339.0
  SAY #27506 /* ~<CHARNAME>, I am frightened to my very core! Do not leave me alone! Stay with me this night. I... I need to feel your flesh next to mine, to embrace your strength...~ */
  + ~GENDER(PLAYER1,MALE)~ + ~I can think of nothing less appealing.~ + 342
  + ~GENDER(PLAYER1,MALE)~ + ~I am not interested in laying with you, Viconia.~ + 435
  + ~GENDER(PLAYER1,MALE)~ + ~All right... I will stay with you, if that is what you wish.~ + 344
  + ~GENDER(PLAYER1,FEMALE)~ + ~I don't think I can do that, Viconia.~ + OW#VIC94
  + ~GENDER(PLAYER1,FEMALE)~ + ~I am not interested in laying with you, Viconia.~ + OW#VIC95
  + ~GENDER(PLAYER1,FEMALE)~ + ~All right... I will stay with you, if that is what you wish.~ + OW#VIC97
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 342 // from: 340.0
  SAY #27518 /* ~Let me partake of you, <CHARNAME>, drink of your courage this night. See what a drow female may offer: I shall inflame your passions, your senses... Stay with me.~ */
  IF ~~ THEN REPLY #27522 /* ~I came here to comfort you, not to spend the night. I shall sleep by myself!~ */ GOTO 335
  IF ~~ THEN REPLY #27529 /* ~Viconia... not like this. Not because you are desperate... it isn't right.~ */ GOTO 436
  IF ~~ THEN REPLY #27524 /* ~How could I refuse your wish?~ */ GOTO OW#VIC92
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 345 // from: 436.0
  SAY #27531 /* ~Do not deny me, <CHARNAME>... and do not deny yourself.~ */
  ++ ~No, Viconia, even though I might wish to, I cannot.~ + 335
  + ~GENDER(PLAYER1,MALE)~ + ~Very well, Viconia. If you wish it to be, then I shall stay.~ + 344
  + ~GENDER(PLAYER1,FEMALE)~ + ~Very well, Viconia. If you wish it to be, then I shall stay. But it will not be for my pleasure. Only yours.~ + OW#VIC100
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC92 // from: 342.2
  SAY ~Come to my arms out of view of prying eyes... place your hand against my darkly trembling heart, and I will show you the boundaries of passion as only I can...~
  IF ~~ THEN DO ~SetGlobal("SleptViconia","GLOBAL",1) SetGlobal("LoveTalk","LOCALS",41) StartCutSceneMode() StartCutScene("Cut34a")~
EXIT
END

IF ~~ THEN BEGIN OW#VIC93 // from: 333.0
  SAY ~Hmph. If you will not offer me any comfort, then be on your way, <CHARNAME>. I will stay here by myself if need be.~
  ++ ~All right, fine, I'll stay for a moment. By the gods, Viconia... you're shaking! What is the matter?~ + 332
  ++ ~Stay by yourself, then, for all I care.~ + 335
END

IF ~~ THEN BEGIN OW#VIC94 // from: 340.3
  SAY ~Let me partake of you, <CHARNAME>. Let me show you all the dark pleasures that the drow can offer. I can bring you passion and ecstacy... Stay with me.~
  ++ ~I came here to comfort you, not to bed you. Let me help.~ + OW#VIC98
  ++ ~Viconia... I can't deny your allure, but this isn't the right time.~ + OW#VIC99
  ++ ~How could I refuse your wish? But it will not be for my pleasure. Only yours.~ + OW#VIC100
END

IF ~~ THEN BEGIN OW#VIC95 // from: 340.4
  SAY ~I... have a need, <CHARNAME>. A need that must be fulfilled... Your beauty—your strength—is the only thing that will sate me.~
  IF ~~ THEN GOTO OW#VIC96
END

IF ~~ THEN BEGIN OW#VIC96 // from: OW#VIC95
  SAY ~Do not deny me this, <CHARNAME>... I know you need me as I need you.~
  ++ ~I told you I was not interested, Viconia, and I meant it.~ GOTO 335
  ++ ~I... do not doubt your ability, Viconia. And you are beautiful. But not like this, not in this manner...~ GOTO OW#VIC99
  ++ ~Very well, Viconia... I shall stay with you this night if that is what you wish. But it will not be for my pleasure. Only yours.~ GOTO OW#VIC100
END

IF ~~ THEN BEGIN OW#VIC97 // from: 340.5
  SAY ~It is. Come to my arms out of view of prying eyes... place your hand against my darkly trembling heart, and I will show you the boundaries of passion as only I can...~
  IF ~~ THEN DO ~SetGlobal("SleptViconia","GLOBAL",1) SetGlobal("LoveTalk","LOCALS",41) StartCutSceneMode() StartCutScene("Cut34a")~
EXIT
END

IF ~~ THEN BEGIN OW#VIC98 // from: OW#VIC94.0
  SAY ~Help me? Do I strike you as a sniveling child? Go, <CHARNAME>. Leave me alone to my misery.~
  IF ~~ THEN DO ~RestParty()
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC99 // from: OW#VIC94.1
  SAY ~When can it be perfect, <CHARNAME>? You are a breath away from being a goddess. I have seen you look upon me and it fills me with want.~
  IF ~~ THEN GOTO 345
END

IF ~~ THEN BEGIN OW#VIC100 // from: OW#VIC96.2 OW#VIC94.2 345.2
  SAY ~My pleasure? If you are so certain then... very well. Who am I to deny you, my ssin'urninness? Place your hand against my darkly trembling heart and show me the boundaries of your passion.~
  IF ~~ THEN DO ~SetGlobal("SleptViconia","GLOBAL",1) SetGlobal("LoveTalk","LOCALS",41) StartCutSceneMode() StartCutScene("Cut34a")~
EXIT
END
END


// LT41 //
REPLACE BVICONI
IF WEIGHT #19 ~  !StateCheck(Player1,STATE_SLEEPING) GENDER(PLAYER1,MALE)
Global("LoveTalk","LOCALS",42)
Global("SleptViconia","GLOBAL",1)
~ THEN BEGIN 100 // from:
  SAY #10465 /* ~Well, I see that you are finally awake. I hope that your pathetic exertions of last night brought at least one of us some measure of pleasure.~ [VICONI87] */
  IF ~~ THEN REPLY #10466 /* ~Pathetic? It sure didn't take you long to run cold again.~ */ GOTO 350
  IF ~~ THEN REPLY #10491 /* ~I was only trying to comfort you, Viconia... I didn't promise anything amazing.~ */ GOTO 351
  IF ~~ THEN REPLY #10494 /* ~I enjoyed myself just fine, thank you.~ */ GOTO 352
END
END

REPLACE BVICONI
IF WEIGHT #20 ~ !StateCheck(Player1,STATE_SLEEPING) GENDER(PLAYER1,MALE) Global("LoveTalk","LOCALS",42) Global("SleptViconia","GLOBAL",0)~ THEN BEGIN 101 // from:
  SAY #10513 /* ~Finally awake, are you? I have been watching you through the night, and each moment I do so, my stomach has churned with vileness. Your very presence makes me ill!~ [VICONI88] */
  IF ~~ THEN REPLY #10515 /* ~Is this all because I refused to sleep with you?~ */ GOTO 358
  IF ~~ THEN REPLY #10516 /* ~Well, your vicious personality does little for me either.~ */ GOTO 359
  IF ~~ THEN REPLY #10517 /* ~If this is how you intend to act, Viconia, then just leave me be.~ */ GOTO 360
END
END

APPEND BVICONI
IF WEIGHT #20 ~ !StateCheck(Player1,STATE_SLEEPING) GENDER(PLAYER1,FEMALE) Global("LoveTalk","LOCALS",42) Global("SleptViconia","GLOBAL",0)~ THEN BEGIN OW#VIC244 // from:
  SAY ~Finally awake, are you? I have been watching you through the night, and each moment I do so, my stomach has churned with vileness. Your very presence makes me ill!~ [VICONI88]
  ++ ~Why do you suddenly lash out, Viconia? Is this all because I refused to sleep with you?~ + OW#VIC101
  ++ ~Well, your vicious personality does little for me either.~ + OW#VIC102
  ++ ~If this is how you intend to act, Viconia, then just leave me be.~ + OW#VIC103
END

IF ~~ THEN BEGIN OW#VIC101 // from: OW#VIC244.3
  SAY ~Ha! Do you think me so fragile and yourself so desirable? You've proven yourself to be just another cowering surfacer female. Do you fear me and my dark charms, <CHARNAME>? I am glad you did not stay, lest more ignorance flow from your mouth and into my ears!~
  ++ ~I won't let you talk to me like this. Why don't we just avoid this situation in the future, alright?~ + 361
  ++ ~If this is how you're going to act, all of a sudden, just leave me be.~ + OW#VIC103
  ++ ~I don't believe you, Viconia. You opened up to me... and now you're snapping shut again. Why?~ + 362
END

IF ~~ THEN BEGIN OW#VIC102 // from: OW#VIC244.4
  SAY ~Is that so? Let us just avoid each other in the future, then, so that both of us may make an attempt to keep our bile down. Would that be satisfactory to you, ogglin?~
  ++ ~Fine by me.~ + 361
  ++ ~No, it isn't! I don't believe you, Viconia. You opened up to me... and now you're snapping shut again. Why?~ + 362
END

IF ~~ THEN BEGIN OW#VIC103 // from: OW#VIC244 OW#VIC101.1 358.1
  SAY ~Yes, I shall leave you be, <CHARNAME>! I shall stay far away from your condescension and judgment and even further from your clumsy attempts at seduction. Stay equally distant from me, iblith!~
  IF ~~ THEN EXIT
END

IF WEIGHT #19 ~!StateCheck(Player1,STATE_SLEEPING) GENDER(PLAYER1,FEMALE) Global("LoveTalk","LOCALS",42) Global("SleptViconia","GLOBAL",1)~ THEN BEGIN OW#VIC104 // from:
  SAY ~Well. I see that you are finally awake. Do you know that you are glowing? You must be quite satisfied to have put me in such a vulnerable position.~ [OW#VIC05]
  ++ ~It sure didn't take you long to run cold again.~ + OW#VIC105
  ++ ~I was only trying to comfort you, Viconia... I didn't have any ill intent.~ + OW#VIC106  
  ++ ~I admit, it was rather pleasant to hear your cry out for me.~ + OW#VIC107
END

IF ~~ THEN BEGIN OW#VIC105 // from: OW#VIC104.0
  SAY ~I am merely disappointed. I thought a female such as yourself would use such an opportunity to ensure the submission of her rival. My skin crawls at the memory of your gentle hands.~
  ++ ~Well, you seemed to enjoy yourself well enough last night.~ + OW#VIC108
  ++ ~I don't understand you. Last night you were practically begging for me to hold you.~ + OW#VIC109
  ++ ~You want me to be domineering, Viconia? Then I command you to stand away from me! I won't be treated like this!~ + OW#VIC110
END

IF ~~ THEN BEGIN OW#VIC106 // from: OW#VIC104.1
  SAY ~If only you had! Look at you, so meek and cowering before the barest hint of my temper. I have seen limp and blind fish with greater ambition than you.~
  ++ ~Well, you seemed to enjoy yourself well enough last night.~ + OW#VIC108
  ++ ~I don't understand you. Last night you were practically begging for me to hold you.~ + OW#VIC109
  ++ ~You want me to be domineering, Viconia? Then I command you to stand away from me! I won't be treated like this!~ + OW#VIC110
END

IF ~~ THEN BEGIN OW#VIC107 // from: OW#VIC104.2
  SAY ~Ah yes, smile and gloat that you have conquered me while you can. Do you think me so easily manipulated? I was sure you would attempt to strike me down while you had your way with me. That you didn't only speaks of how meek a female you truly are.~
  ++ ~Well, you seemed to enjoy yourself well enough last night.~ + OW#VIC108
  ++ ~I don't understand you. Last night you were practically begging for me to hold you.~ + OW#VIC109
  ++ ~You want me to be domineering, Viconia? Then I command you to stand away from me! I won't be treated like this!~ + OW#VIC110
END

IF ~~ THEN BEGIN OW#VIC108 // from: OW#VIC107.0 OW#VIC106.0 OW#VIC105.0
  SAY ~Yes, you seem to know your way around a female's body. Am I meant to be impressed? You have accomplished nothing more than what a well-trained male could.~
  ++ ~If this is how you're going to act, then just leave me alone, all right?~ + OW#VIC110
  ++ ~Your paranoia and temper have me at my limit! I can't believe I let you talk me into this!~ + OW#VIC111
  ++ ~I don't believe you, Viconia. You opened up to me... and now you snap shut again. Why?~ + 357
END

IF ~~ THEN BEGIN OW#VIC109 // from: OW#VIC107.1 OW#VIC106.1 OW#VIC105.1
  SAY ~Yes, and you were all too eager to grasp at my weakness. It was my fault for showing it... but do not expect such a mistake again!~
  ++ ~If this is how you're going to act, then just leave me alone, all right?~ + OW#VIC110
  ++ ~Your paranoia and temper have me at my limit! I can't believe I let you talk me into this!~ + OW#VIC111
  ++ ~I don't believe you, Viconia. You opened up to me... and now you snap shut again. Why?~ + 357
END

IF ~~ THEN BEGIN OW#VIC110 // from: OW#VIC109.0 OW#VIC108.0 OW#VIC107.2 OW#VIC106.2 OW#VIC105.2
  SAY ~Yes, excellent! I will do just that, <CHARNAME>! I will shout my curses to the trees and skies and await your treacherous schemes!~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#VIC111 // from: OW#VIC109.1 OW#VIC108.1
  SAY ~Concern yourself with it no longer, then! I shall keep my distance and await your next attempt to slither past my defenses!~
IF ~~ THEN EXIT
END
END

// LT43 //
REPLACE BVICONI
IF WEIGHT #21 ~  Global("LoveTalk","LOCALS",44)~ THEN BEGIN 102 // from:
  SAY ~I have been thinking about how you have refused to take up your destiny as the <PRO_SONDAUGHTER> of Bhaal...~ [VICONI89]
  IF ~~ THEN GOTO 363
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 363 // from: 102.0
  SAY ~You have no impetus to carve an empire, and you are certainly no <PRO_LADYLORD> of Murder. I have decided you are weak and cowardly, not fit for the godsblood flowing within you.~
  ++ ~My destiny is my own, Viconia. I'll not discuss it with you.~ + 364
  ++ ~What brings this on?~ + 365
  ++ ~If you're going to spout filth every time you open your mouth, just keep it shut. I tire of you.~ + 361
END
END

// LT45 //
REPLACE BVICONI
IF WEIGHT #22 ~  Global("LoveTalk","LOCALS",46) GENDER(PLAYER1,MALE)~ THEN BEGIN 103 // from:
  SAY #10537 /* ~Do not stand so close to me. It is bad enough that I have to smell your stench on the occasional breeze... must I also bask in your rancid aura?~ [VICONI90] */
  IF ~~ THEN REPLY #10538 /* ~I'm not even near you, Viconia. What twisted game is this?~ */ GOTO 367
  IF ~~ THEN REPLY #10539 /* ~No, you don't. You can leave our group, if that is what you wish.~ */ GOTO 368
END
END

APPEND BVICONI
IF WEIGHT #22 ~  Global("LoveTalk","LOCALS",46) GENDER(PLAYER1,FEMALE)~ THEN BEGIN OW#VIC112 // from:
  SAY ~Do not stand so close to me. I do not know what you are scheming, but you will not catch me unawares!~
  ++ ~I'm not even near you, Viconia. What twisted game is this?~ + 367
  ++ ~Do you really think I would hurt you? If you don't believe you can trust me, then by all means, leave.~ + OW#VIC113
END

IF ~~ THEN BEGIN OW#VIC113 // from: OW#VIC112.1
  SAY ~I have no desire to leave, <CHARNAME>. I simply wish to make this known: I expect a knife at my back and I will not go down easily.~
  ++ ~I've had enough of this. Leave, will you?~ + OW#VIC114
  ++ ~Fine. Stay if you must, but stop spouting accusations!~ + OW#VIC115
  ++ ~Stay if you must, then... but do not speak to me anymore. I am through with your twisted games.~ + OW#VIC116
  ++ ~Stay, then. But I want to know where this resentment is coming from. Why are you saying these things?~ + 367
END

IF ~~ THEN BEGIN OW#VIC114 // from: OW#VIC113.0
  SAY ~Nothing would please me more. Aluve', mrimm d'ssinss... oloth plynn dos!~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
LeaveParty()
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC115 // from: OW#VIC113.1
  SAY ~Are you so easily shaken when I speak the truth? Very well. I shall remain quiet, then... and as far away from you as possible.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#VIC116 // from: OW#VIC113.2
  SAY ~A'dos quarth! At your command! You shall hear nothing more from these lips, ogglin!~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ EXIT
END
END

// LT47 //
REPLACE BVICONI
IF ~~ THEN BEGIN 373 // from: 372.0 104.1
  SAY #10583 /* ~You wish to know of me? You wish to learn what I am like? I shall tell you the truth of it, then.~ */
  IF ~GENDER(PLAYER1,MALE)~ THEN GOTO 374
  IF ~GENDER(PLAYER1,FEMALE)~ THEN GOTO OW#VIC117
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC117 // from: 373F
  SAY ~I have lied to you, <CHARNAME>, lies upon lies. My tale of sparing the child? A lie. I sacrificed it without a second thought. It was all for power and strength so I might slaughter my foes.~
  IF ~~ THEN GOTO OW#VIC118
END

IF ~~ THEN BEGIN OW#VIC118 // from: OW#VIC117
  SAY ~And I did. My sisters were the greatest among them and they fell before me again and again.~
  IF ~~ THEN GOTO OW#VIC119
END

IF ~~ THEN BEGIN OW#VIC119 // from: OW#VIC118
  SAY ~I am drenched with blood, <CHARNAME>. I do not tolerate competition from other females and you are no exception.~
  IF ~~ THEN GOTO OW#VIC120
END

IF ~~ THEN BEGIN OW#VIC120 // from: OW#VIC119
  SAY ~So, then. What do you think of that, <CHARNAME>? What do you think of me now?~
  ++ ~I think you are a foul and perverse creature, Viconia. Do not speak to me again.~ + 378
  ++ ~I think you want this relationship of ours, such as it is, to be over with. So be it.~ + 378
  ++ ~You think to threaten me, Viconia? After all I have done for you? Then leave and do not show yourself again lest I cut your miserable life short.~ + OW#VIC121
  ++ ~I think you are lying. If you were so eager for power, then how did you find yourself cast out of the Underdark?~ + OW#VIC122
END

IF ~~ THEN BEGIN OW#VIC121 // from: OW#VIC120.2
  SAY ~Finally, some wisdom shines through your dim intellect! I shall begone, then, and we will not meet again. Jal khaless zhah waela!~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
LeaveParty()
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC122 // from: OW#VIC120.3
  SAY ~Are you so simple that you do not understand the concept of a lie? My house was not weakened by my failure to sacrifice, but rather my hunger for power.~
  IF ~~ THEN GOTO OW#VIC122B
END

IF ~~ THEN BEGIN OW#VIC122B // from: OW#VIC122
  SAY ~I hollowed out the walls of House DeVir until it was only my mother and myself left. When other houses saw that we were ripe for the plundering, I fled to avoid my inevitable demise.~
  IF ~~ THEN GOTO OW#VIC123
END

IF ~~ THEN BEGIN OW#VIC123 // from: OW#VIC122
  SAY ~My thirst for bloodshed has never been abated. Turn away from me, spit on me and curse my name, I command you!~
  ++ ~Very well. If you want this relationship, such as it is, to be over with, so be it!~ + OW#VIC124
  ++ ~No! I will not allow you to push me away, Viconia!~ + OW#VIC125
  ++ ~I am not afraid of your or your power.~ + OW#VIC125
END

IF ~~ THEN BEGIN OW#VIC124 // from: OW#VIC123.0
  SAY ~Finally you show some sense! I am drow, ssin'urn fool... never forget that! Jal khaless zhah waela!~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC125 // from: OW#VIC123.2 OW#VIC123.1
  SAY ~Fool! Stubborn fool! Jal khaless zhah waela! Why must I trust you?! WHY?! In trust lies death!!~
  IF ~~ THEN GOTO OW#VIC126
END

IF ~~ THEN BEGIN OW#VIC126 // from: OW#VIC125
  SAY ~Leave me alone! I will not be deceived! Stay away!~
  IF ~~ THEN EXIT
END
END

// LT49 //
REPLACE BVICONI
IF WEIGHT #24 ~!StateCheck(Player1,STATE_SLEEPING) Global("LoveTalk","LOCALS",50)~ THEN BEGIN 105 // from:
  SAY #10586 /* ~I... I cast my white flag before you. I can struggle no more. You have... you have defeated me.~ [VICONI92] */
  ++ ~What are you talking about? Defeated you?~ DO ~SetGlobal("LoveTalk","LOCALS",51)~ + 385
  + ~GENDER(PLAYER1,MALE)~ + ~Ohhh no, I'm not falling for this again. Just stay away from me, you crazy bitch.~ DO ~SetGlobal("LoveTalk","LOCALS",51)~ + 384
  + ~GENDER(PLAYER1,FEMALE)~ + ~Ohhh no, I'm not falling for this again. Just stay away from me!~ DO ~SetGlobal("LoveTalk","LOCALS",51)~ + 384
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 384 // from: 105.1
  SAY #10590 /* ~I... I understand, <CHARNAME>. I shall simply apologize for my behavior, then, and leave you alone from now on.~ */
  + ~GENDER(PLAYER1,MALE)~ + ~I think that's for the best for all concerned.~ + 390
  + ~GENDER(PLAYER1,FEMALE)~ + ~I think that's for the best for all concerned.~ + OW#VIC127
  ++ ~Wait... maybe I've been hasty. Tell me what you mean by "defeated"... I don't understand.~ + 385
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 389 // from: 388.0
  SAY #10598 /* ~If you will have me, I shall not push you away again... stay with me tonight, <CHARNAME>, let us be together in earnest. Let me savor the unfamiliar fear that goes with this trust.~ */
  + ~GENDER(PLAYER1,MALE)~ + ~This will never work out. I think it's best that this relationship doesn't continue, Viconia.~ + 390
  + ~GENDER(PLAYER1,FEMALE)~ + ~This will never work out. I think it's best that this relationship doesn't continue, Viconia.~ + OW#VIC127
  ++ ~I don't trust you, Viconia. Not after the last time.~ + 391
  + ~GENDER(PLAYER1,MALE)~ + ~I don't think this is the right time for this, Viconia.~ + 392
  + ~GENDER(PLAYER1,FEMALE)~ + ~I don't think this is the right time for this, Viconia.~ + OW#VIC128
  + ~GENDER(PLAYER1,MALE)~ + ~All right, Viconia. I will stay with you.~ + 393
  + ~GENDER(PLAYER1,FEMALE)~ + ~All right, Viconia. I will stay with you.~ + OW#VIC129
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 391 // from: 389.1
  SAY #27968 /* ~You would not let me repel you, no matter how I tried. I am defeated by your stubborn will and strange regard. My need is real, <CHARNAME>... stay with me tonight.~ */
  + ~GENDER(PLAYER1,MALE)~ + ~I'm sorry, Viconia. I think it is best if this relationship does not continue... it will never work out.~ + 390
  + ~GENDER(PLAYER1,MALE)~ + ~I don't think the time is right for this.~ + 392
  + ~GENDER(PLAYER1,MALE)~ + ~Very well... I shall.~ + 393
  + ~GENDER(PLAYER1,FEMALE)~ + ~I'm sorry, Viconia. I think it is best if this relationship does not continue... it will never work out.~ + OW#VIC127
  + ~GENDER(PLAYER1,FEMALE)~ + ~I don't think the time is right for this.~ + OW#VIC128
  + ~GENDER(PLAYER1,FEMALE)~ + ~Very well... I shall.~ + OW#VIC129
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC127 // from: 389.1 384.1
  SAY ~Yes, perhaps it is for the best. Aluve' mrimm d'ssinss. I shall bother you no more.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
RestParty()
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC128 // from: 391.1 389.2
  SAY ~There is no right time for such as us: Tomorrow could bring death. Allow my need, <CHARNAME>. Refuse... and I shall bother you no more.~
  ++ ~Then perhaps it is best if this ends here, Viconia. You know this will never work out between us.~ + OW#VIC127
  ++ ~Very well, Viconia... I shall stay with you.~ + OW#VIC129
  ++ ~I will stay with you, Viconia, but I won't sleep with you.~ + OW#VIC130
END

IF ~~ THEN BEGIN OW#VIC129 // from: OW#VIC128.1
  SAY ~Come to me, then, my mrimm d'ssinss. You have defeated me... now taste your victory...~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",2)
  SetGlobal("OW#VIC49","GLOBAL",1)
  RestParty()
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC130 // from: OW#VIC128.2
  SAY ~Ever frustrating, aren't you, <CHARNAME>? Very well, I shall not press the matter. Your company is enough.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",2)
  RestParty()
~ EXIT
END
END

// LT51 //
REPLACE BVICONI
IF WEIGHT #25 ~!StateCheck(Player1,STATE_SLEEPING) Global("LoveTalk","LOCALS",52) GENDER(PLAYER1,MALE)~ THEN BEGIN 106 // from:
  SAY #10605 /* ~A good morning to you. Or, at least, as close a morning as we come with these strange hours that we keep. I trust your exertions were... worthwhile?~ [VICONI93] */
  IF ~~ THEN REPLY #10606 /* ~Hmm... this isn't a lead-up to another round of verbal abuse, is it?~ */ GOTO 394
  IF ~~ THEN REPLY #10609 /* ~I enjoyed pleasing you as much as I enjoyed myself. I hope I stack up well enough against these drow males of yours.~ */ GOTO 395
  IF ~~ THEN REPLY #10625 /* ~Very worthwhile indeed.~ */ GOTO 396
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 397 // from: 396.0 395.0 394.0
  SAY #27997 /* ~I... I am lucky, <CHARNAME>, to have found you on the surface. To think that I would need to come so far, to such an alien place, to find someone that I could... trust.~ */
  IF ~GENDER(PLAYER1,MALE)~ THEN GOTO 398
  IF ~GENDER(PLAYER1,FEMALE)~ THEN GOTO OW#VIC136
END
END

APPEND BVICONI
IF WEIGHT #25 ~!StateCheck(Player1,STATE_SLEEPING) Global("LoveTalk","LOCALS",52) Global("OW#VIC49","GLOBAL",1)~ THEN BEGIN OW#VIC131 // from:
  SAY ~A good morning to you. Or, at least, as close a morning as we come with these strange hours that we keep. I trust your exertions were... worthwhile?~ [VICONI93]
  ++ ~Hmm... this isn't a lead-up to another round of verbal abuse, is it?~ + 394
  ++ ~I enjoyed pleasing you as much as I enjoyed myself. I hope I meet the standards of such a discerning drow.~ + OW#VIC133
  ++ ~Very worthwhile indeed.~ + 396
END

IF WEIGHT #25 ~!StateCheck(Player1,STATE_SLEEPING) Global("LoveTalk","LOCALS",52) Global("OW#VIC49","GLOBAL",0) GENDER(PLAYER1,FEMALE)~ THEN BEGIN OW#VIC132 // from:
  SAY ~A good morning to you. Or, at least, as close a morning as we come with these strange hours that we keep. I trust you found our late-night talks worthwhile?~ [OW#VIC06]
  ++ ~Hmm... this isn't a lead-up to another round of verbal abuse, is it?~ + OW#VIC134
  ++ ~Very worthwhile indeed.~ + OW#VIC135
END

IF ~~ THEN BEGIN OW#VIC133 // from: OW#VIC131.2
  SAY ~Hah! I've taken my share of female lovers in the past. I trust I've displayed our rather remarkable skills, yes? But you have a charming enthusiasm that surpasses even my more experienced companions.~
  IF ~~ THEN GOTO 397
END

IF ~~ THEN BEGIN OW#VIC134 // from: OW#VIC132.0
  SAY ~No, <CHARNAME>, do not worry. Besides, I enjoyed myself immensely. Spending time simply... talking and being with you was far more satisfying than I anticipated.~
  IF ~~ THEN GOTO 397
END

IF ~~ THEN BEGIN OW#VIC135 // from: OW#VIC132.1
  SAY ~I trust we will have more evening talks in the future? I found it all very... soothing.~
  IF ~~ THEN GOTO 397
END

IF ~~ THEN BEGIN OW#VIC136 // from: 397F
  SAY ~You are not so terrible, <CHARNAME>... for a surfacer.~
  ++ ~And you are not so terrible... for a drow.~ + OW#VIC137
  ++ ~I think I understand what you mean, Viconia... and I thank you.~ + OW#VIC137
  ++ ~That's your idea of a compliment?~ + 400
END

IF ~~ THEN BEGIN OW#VIC137 // from: OW#VIC136.1 OW#VIC136.2
  SAY ~Ha! I am a horrible excuse for a drow. If my sisters saw me so smitten for a potential rival, they would flay my skin bare, but with you it does not seem such a bad thing.~
  IF ~~ THEN EXIT
END
END

// LT53 - NO CHANGES //

// LT55 //
REPLACE BVICONI
IF WEIGHT #28 ~!StateCheck(Player1,STATE_SLEEPING) Global("LoveTalk","LOCALS",56)~ THEN BEGIN 417 // from:
  SAY #25214 /* ~Do your people have any kind of rite of passage into adulthood? I'm curious.~ [VICONI95] */
  IF ~~ THEN REPLY #10492 /* ~I am not interested in discussing this right now, all right?~ */ GOTO 418
  ++ ~Intimate acts are considered the standard, but it varies by culture. I was raised in Candlekeep—they have their own way of doing things.~ + OW#VIC138
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 419 // from: 417.1
  SAY ~The drow have a formal ritual, though it does vary from place to place. "The Blooding" must be performed by both sexes upon reaching the age of maturity.~
  IF ~~ THEN GOTO 420
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 423 // from: 422.0
  SAY ~It gained me respect in a society ruled by cruelty and ambition. I had lain with another long before... many times, in fact. That is no measure of a drow.~
  IF ~~ THEN GOTO 424
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 425 // from: 422.1
  SAY ~Of course it is horrible. Drow society is founded on horror and cruelty, if you remember. Laying with another would be no measure of a drow, that is for certain.~
  IF ~~ THEN GOTO 424
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC138 // from: 417.1
  SAY ~Indeed? If you require it, I can perhaps take you somewhere private to prove your <PRO_MANWOMAN>hood. Or is there already a specific moment that bears more meaning to you?~
  ++ ~When I came of age, Gorion gave me a gift: a fine journal to keep my own story. Look—I still have it.~ + OW#VIC139
  + ~IfValidForPartyDialogue("Imoen")~ + ~Ha! One evening Imoen and I snuck into the wine cellar and drank ourselves into a stupor. Winthrop was furious.~ EXTERN IMOEN2J OW#IMO1
  + ~!IfValidForPartyDialogue("Imoen")~ + ~Ha! One evening Imoen and I snuck into the wine cellar and drank ourselves into a stupor. Winthrop was furious.~ + OW#VIC140
  + ~!InParty("Imoen")~ + ~By the gods, a woman wishes to lie with me? I must write home at once—no one thought this day would come!~ + OW#VIC141
  + ~InParty("Imoen")~ + ~Imoen, I have made it with a woman! Inform the men!~ EXTERN IMOEN2J OW#IMO2
  ++ ~There were some things... but it all pales next to the night Gorion was killed.~ + OW#VIC142
END

IF ~~ THEN BEGIN OW#VIC139 // from: OW#VIC138.0
  SAY ~I have seen you write in this on occasion. That studious nature comes from your foster father, does it?~
  IF ~~ THEN GOTO 419
END

IF ~~ THEN BEGIN OW#VIC140 // from: OW#VIC138.2 OW#IMO1
  SAY ~It was a bit of independence, then? To take your own actions, regardless of what your elders wanted or the virtue of common sense.~
  IF ~~ THEN GOTO 419
END

IF ~~ THEN BEGIN OW#VIC141 // from: OW#VIC138.3 OW#IMO2
  SAY ~*sigh* I do not know what I expected by suggesting such a thing. Calm yourself, <CHARNAME>. We have things to discuss first.~
  IF ~~ THEN GOTO 419
END

IF ~~ THEN BEGIN OW#VIC142 // from: OW#VIC138.4
  SAY ~Yes... Yes, it always comes back to blood, doesn't it?~
  IF ~~ THEN GOTO 419
END
END

APPEND IMOEN2J
IF ~~ THEN BEGIN OW#IMO1 // from: OW#VIC138.1
  SAY ~Ugh. I've never been so sick after a night of drinking. I still can't stomach a dry red.~
  IF ~~ THEN EXTERN BVICONI OW#VIC140
END

IF ~~ THEN BEGIN OW#IMO2 // from: OW#VIC138.4
  SAY ~Aye, Captain! By dusk every man, woman, and child this side of Waterdeep will know of your tawdry deeds!~
  IF ~~ THEN EXTERN BVICONI OW#VIC141
END
END

// LT57 //
REPLACE IMOEN2
IF ~True()~ THEN BEGIN 1 // from:
  SAY #49256 /* ~Are you all right? I was so scared... You came all this way to get me, and we were almost...~ [IMOEN76] */
  IF ~~ THEN DO ~SetGlobal("OW#IMOENSAFE","GLOBAL",1)
~ GOTO 0
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 439 // from: 438.0
  SAY #28080 /* ~Closest friend? How close is that? A social gracing or intimate counsel? What does closest mean?~ */
  + ~GLOBAL("OW#IMOENSAFE","GLOBAL",0)~ + ~We are like siblings. She's kind of annoying sometimes, but I care dearly deeply for her.~ + 441
  + ~GLOBAL("OW#IMOENSAFE","GLOBAL",1)~ + ~We are like siblings. She's kind of annoying sometimes, but I care dearly deeply for her.~ + OW#VIC143
  ++ ~Listen, Viconia, can we consider this conversation over? I'm not really in the mood for talking about Imoen, all right?~ + 442
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC143 // from: 439.0 438.3
  SAY ~You must be close to Imoen, since you rushed so quickly to rescue her from an uncertain fate.~
  IF ~!Dead("c6bodhi")~ THEN GOTO OW#VIC144
  IF ~Dead("c6bodhi")~ THEN GOTO OW#VIC145
END
  
  IF ~~ THEN BEGIN OW#VIC144 // from: 138A
  SAY ~Now both your souls hang in the balance and Irenicus grows ever stronger. Was it worth the effort, I wonder?~
  ++ ~Viconia, can we just drop it? All right? Enough.~ + 442
  ++ ~Irenicus and Bodhi will meet their end at my hand. I swear it.~ + OW#VIC146
  ++ ~He grows stronger and so do I. We shall see whose will is the greater.~ + OW#VIC148
END

  IF ~~ THEN BEGIN OW#VIC145 // from: 138B
  SAY ~Her soul is saved... as was mine. And yet your soul still hangs in the balance. Was it worth the effort, I wonder?~
  ++ ~Viconia, can we just drop it? All right? Enough.~ + 442
  ++ ~Irenicus will meet his end at my hand. I swear it.~ + OW#VIC146
  ++ ~He grows stronger and so do I. We shall see whose will is the greater.~ + OW#VIC148
END

IF ~~ THEN BEGIN OW#VIC146 // from: OW#VIC145.1 OW#VIC144.1
  SAY ~I hope you are right, <CHARNAME>. These adventures we have had together have been truly wondrous. I should like to see them continue. That is to say, I... That is to say...~
  IF ~~ THEN GOTO OW#VIC147
END

IF ~~ THEN BEGIN OW#VIC147 // from: OW#VIC148 OW#VIC146
  SAY ~My life would be emptier without you in it.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#VIC148 // from: OW#VIC145.2 139.2
  SAY ~Indeed. I have no doubt that you will not meet your end easily. Try to stay alive, <CHARNAME>.~
  IF ~~ THEN GOTO OW#VIC147
END
END

// LT59 //
REPLACE BVICONI
IF WEIGHT #30 ~!StateCheck(Player1,STATE_SLEEPING) Global("LoveTalk","LOCALS",60)~ THEN BEGIN 446 // from:
  SAY #28108 /* ~Have you given any thought to what you will do once this whole business is over with?~ [VICONI97] */
  ++ ~I've devoted most of my thought to survival.~ + 447
  ++ ~I'm not sure... I was hoping on being somewhere with you, however.~ + 448
  + ~GLOBAL("PCKeepOwner","GLOBAL",1)~ + ~I want to continue tending to the de'Arnise keep, creating a bastion of might and safety.~ + OW#VIC149
  + ~GLOBAL("RangerProtector","GLOBAL",1)~ + ~Imnesvale and its lands need me. There are countless more adventures to be had… and a bit of stability would suit me.~ + OW#VIC151
  + ~GLOBAL("PaladinOrder","GLOBAL",1)~ + ~I will continue spreading the message of the Radiant Heart. I will right wrongs and defend the weak.~ + OW#VIC153
  + ~GLOBAL("JoinLathander","GLOBAL",1)~ + ~The temple of Lathander needs me for now, but perhaps I may take to the road and spread the holy word.~ + OW#VIC155
  + ~GLOBAL("JoinHelm","GLOBAL",1)~ + ~The temple of Helm needs me for now, but perhaps I may take to the road and spread the holy word.~ + OW#VIC155
  + ~GLOBAL("JoinTalos","GLOBAL",1)~ + ~The temple of Talos needs me for now, but perhaps I may take to the road and spread the holy word.~ + OW#VIC155
  + ~GLOBAL("DruidStronghold","GLOBAL",1)~ + ~The land around Trademeet is still out of balance. I'll restore it to what it once was.~ + OW#VIC157
  + ~GLOBAL("PCSphere","GLOBAL",1)~ + ~There are still mysteries for me and my apprentices to unlock in the Planar Sphere.~ + OW#VIC159
  + ~GLOBAL("PlayerThiefGuild","GLOBAL",1)~ + ~If the Shadow Thieves hope to recover from the war with the vampires, we have a long road ahead of us.~ + OW#VIC161
  + ~GLOBAL("Playhouse","GLOBAL",1)~ + ~Running the playhouse has been a dream come true, but it would be nice to take the show on the road.~ + OW#VIC163
  ++ ~Why do you care?~ + 449
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC149 // from: 446-FIGHTER
  SAY ~Of course, <PRO_LADYLORD> <CHARNAME>. Ruling land would suit you well—and perhaps you will have room for a priestess at your side, hm?~
  IF ~~ THEN GOTO OW#VIC150
END

IF ~~ THEN BEGIN OW#VIC150 // from: OW#VIC149
  SAY ~With a little ambition, I see us carving an empire, ruling a small kingdom, and living in the hedonistic luxury we are meant to!~
  ++ ~I have no interest in lording over others, Viconia. I thought you knew that.~ + 450
  ++ ~That doesn't sound like such a bad idea.~ + 451
  ++ ~Get your head out of the clouds already.~ + 452
END

IF ~~ THEN BEGIN OW#VIC151 // from: 446-RANGER
  SAY ~I suppose such humble ambitions should not surprise me. I imagine you as meant for more than a dirty hovel, however.~
  IF ~~ THEN GOTO OW#VIC152
END

IF ~~ THEN BEGIN OW#VIC152 // from: OW#VIC151
  SAY ~If you are intent on living in the wilds, I see us as conquerors rather than wardens. The villagers would tithe to us and the land's resources would be ours to manage. None would dare trespass on our hospitality!~
  ++ ~I have no interest in lording over others, Viconia. I thought you knew that.~ + 450
  ++ ~That doesn't sound like such a bad idea.~ + 451
  ++ ~Get your head out of the clouds already.~ + 452
END

IF ~~ THEN BEGIN OW#VIC153 // from: 446-PALADIN
  SAY ~Your penchant for kindness is as persistent as it is frustrating. I suppose it has worked to my benefit, so I'll let it pass for now.~
  IF ~~ THEN GOTO OW#VIC154
END

IF ~~ THEN BEGIN OW#VIC154 // from: OW#VIC153
  SAY ~You could accomplish so much more if you weren't at the beck and call of filthy peasants—leading the way into a glorious new future!~
  ++ ~I have no interest in lording over others, Viconia. I thought you knew that.~ + 450
  ++ ~That doesn't sound like such a bad idea.~ + 451
  ++ ~Get your head out of the clouds already.~ + 452
END

IF ~~ THEN BEGIN OW#VIC155 // from: 446-CLERIC
  SAY ~Forgive me if I am skeptical of your god's value. If you wish to proselytize I will not stop you... but do not be surprised if I also whisper the words of Shar into a few ears.~
  IF ~~ THEN GOTO OW#VIC156
END

IF ~~ THEN BEGIN OW#VIC156 // from: OW#VIC155
  SAY ~Perhaps we could erect twin temples, one for each of our gods. We would amass followers, power, and wealth. Enough to buy us all the luxuries and securities we could desire!~
  ++ ~I have no interest in lording over others, Viconia. I thought you knew that.~ + 450
  ++ ~That doesn't sound like such a bad idea.~ + 451
  ++ ~Get your head out of the clouds already.~ + 452
END

IF ~~ THEN BEGIN OW#VIC157 // from: 446-DRUID
  SAY ~*sigh* I was afraid you would say that. The grove is pretty, I grant you, but it is not my first choice of residence.~
  IF ~~ THEN GOTO OW#VIC158
END

IF ~~ THEN BEGIN OW#VIC158 // from: OW#VIC157
  SAY ~Perhaps I could live in the town and keep the people in line for you. We could even turn Trademeet into our own stronghold and run it as we see fit.~
  ++ ~I have no interest in lording over others, Viconia. I thought you knew that.~ + 450
  ++ ~That doesn't sound like such a bad idea.~ + 451
  ++ ~Get your head out of the clouds already.~ + 452
END

IF ~~ THEN BEGIN OW#VIC159 // from: 446-MAGE
  SAY ~The promise of power lurks with its walls. With your skills I have no doubt you will find a way to unlock it. When you do, nothing shall stand in your way.~
  IF ~~ THEN GOTO OW#VIC160
END

IF ~~ THEN BEGIN OW#VIC160 // from: OW#VIC159
  SAY ~And then we can put it to good use, hm? Perhaps we could find some land to conquer and rule, a place where you might practice your magic in peace.~
  ++ ~I have no interest in lording over others, Viconia. I thought you knew that.~ + 450
  ++ ~That doesn't sound like such a bad idea.~ + 451
  ++ ~Get your head out of the clouds already.~ + 452
END

IF ~~ THEN BEGIN OW#VIC161 // from: 446-THIEF
  SAY ~You wish to stay in Athkatla, then? An interesting proposition. We already have connections and allies; it is only natural to expand upon them.~
  IF ~~ THEN GOTO OW#VIC162
END

IF ~~ THEN BEGIN OW#VIC162 // from: OW#VIC161
  SAY ~Build enough power and loyalty and soon *we* will be the ones running the Shadow Thieves!~
  ++ ~I have no interest in lording over others, Viconia. I thought you knew that.~ + 450
  ++ ~That doesn't sound like such a bad idea.~ + 451
  ++ ~Get your head out of the clouds already.~ + 452
END

IF ~~ THEN BEGIN OW#VIC163 // from: 446-BARD
  SAY ~Ah, yes. You do enjoy those fanciful performances. Theater is not something drow indulge in, but I do find the fervor you inspire in your audience to be most fascinating.~
  IF ~~ THEN GOTO OW#VIC164
END

IF ~~ THEN BEGIN OW#VIC164 // from: OW#VIC163
  SAY ~Perhaps we could put that passion to better use, hm? Imagine, if you will, inciting an uprising to install yourself as the ruler of a small kingdom.~
  ++ ~I have no interest in lording over others, Viconia. I thought you knew that.~ + 450
  ++ ~That doesn't sound like such a bad idea.~ + 451
  ++ ~Get your head out of the clouds already.~ + 452
END
END

// LT61 //
REPLACE BVICONI
IF WEIGHT #31 ~!StateCheck(Player1,STATE_SLEEPING) Global("LoveTalk","LOCALS",62) GENDER(PLAYER1,MALE)~ THEN BEGIN 455 // from:
  SAY #28143 /* ~We are to stop and rest now, are we? I suppose that is good and well, as I am exhausted nearly to the point of dropping. Come, then, my mrann d'ssinss, and let us get our coupling over with quickly.~ [VICONI98] */
  IF ~~ THEN REPLY #28146 /* ~"Over with"? You don't make that sound very appealing.~ */ GOTO 458
  IF ~~ THEN REPLY #28147 /* ~If you are too tired, Viconia, there is certainly no need for us to lie together.~ */ GOTO 458
  IF ~~ THEN REPLY #28148 /* ~Why quickly? After our most recent nights, I was positive that you were always in the mood for this.~ */ GOTO 458
END
END

APPEND BVICONI
IF WEIGHT #31 ~!StateCheck(Player1,STATE_SLEEPING) Global("LoveTalk","LOCALS",62) GENDER(PLAYER1,FEMALE)~ THEN BEGIN OW#VIC165 // from:
  SAY ~We are to stop and rest now, are we? I suppose that is good and well, as I would like to speak with you a moment where others cannot hear.~ [OW#VIC07]
  IF ~~ THEN GOTO OW#VIC166
END

IF ~~ THEN BEGIN OW#VIC166 // from: OW#VIC165
  SAY ~There is something I wish to try with you. The drow have a long tradition of... it is called har'luth, a rope bondage. It is designed to be quite pleasurable to those who receive it.~
  IF ~~ THEN GOTO OW#VIC167
END

IF ~~ THEN BEGIN OW#VIC167 // from: OW#VIC166
  SAY ~Traditionally a male would be restrained by an interested female to show his submission to her. In return, she would treat him gently before releasing him as a gesture of good intent.~
  IF ~~ THEN GOTO OW#VIC168
END

IF ~~ THEN BEGIN OW#VIC168 // from: OW#VIC167
  SAY ~I have heard that... some lovers of the same sex do this as well. It is meant to show trust and commitment.~
  ++ ~I take it that this is something you would like to do as well?~ + OW#VIC169
  ++ ~This doesn't sound like it's for me, Viconia.~ + OW#VIC170
  ++ ~I thought drow of the same gender didn't marry.~ + OW#VIC171
END

IF ~~ THEN BEGIN OW#VIC169 // from: OW#VIC168.0
  SAY ~It is. Come, mrimm d'ssinss. I bought this silk rope when last we were at the market. I was assured that it would be leave no mark upon your delicate flesh.~
  ++ ~I trust you, Viconia.~ + OW#VIC174
  ++ ~Hold on... I thought I would be the one tying *you* up.~ + OW#VIC178
  ++ ~Wait, Viconia. I'm not sure about this.~ + OW#VIC170
END

IF ~~ THEN BEGIN OW#VIC170 // from: OW#VIC169.2 OW#VIC168.1
  SAY ~I... I see. I understand, <CHARNAME>. As a surfacer it must be quite difficult to... to trust a drow such as myself.~
  ++ ~That's not it at all, Viconia. Of course I trust you. This is just too much for me.~ + OW#VIC181
  ++ ~It's nothing personal, Viconia. I just don't know what you'll do when I'm restrained like that.~ + OW#VIC175
END

IF ~~ THEN BEGIN OW#VIC171 // from: OW#VIC168.2
  SAY ~They do not. There are too many risks involved in such a proposition.~
  IF ~~ THEN GOTO OW#VIC172
END

IF ~~ THEN BEGIN OW#VIC172 // from: OW#VIC171
  SAY ~However there are... What would be the right word? Groups? Groups who do not abide by the usual way of things. These are often commoners who have little to gain or lose and so they have devised these quaint rituals.~
  IF ~~ THEN GOTO OW#VIC173
END

IF ~~ THEN BEGIN OW#VIC173 // from: OW#VIC172
  SAY ~I put little stock in them before now. Before you.~
  ++ ~This means a lot to you, doesn’t it? Then I want to do it.~ + OW#VIC174
  ++ ~That's wonderful, Viconia, but I don't think I'd be comfortable with that.~ + OW#VIC170
END

IF ~~ THEN BEGIN OW#VIC174 // from: 191.0 OW#VIC173.0 OW#VIC169.0
  SAY ~That... brings me a great deal of pleasure to hear, <CHARNAME>. Half as much pleasure as I hope to bring you.~
  ++ ~I want this with you, Viconia, but I don't want to make love.~ + OW#VIC176
  ++ ~I am at your mercy, Viconia. Do to me as you desire.~ + OW#VIC177
END

IF ~~ THEN BEGIN OW#VIC175 // from: OW#VIC181.1 OW#VIC170.1
  SAY ~Of course. Let us discuss it no more and get some rest, hm?~
  IF ~~ THEN DO ~SetGlobal("LoveTalk","LOCALS",65) SetGlobal("OW#NOTRUST","GLOBAL",1)
RestParty()
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC176 // from: OW#VIC174.0
  SAY ~You have my word, <CHARNAME>. I do not take your trust lightly. Submit yourself to me and know that I will take care of you.~
  IF ~~ THEN DO ~SetGlobal("LoveTalk","LOCALS",63)
  StartCutSceneMode()
  StartCutScene("OW#black")
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC177 // from: OW#VIC174.1
  SAY ~Very good, my ssinssrigg. Submit yourself to me and know that I will take care of you.~
  IF ~~ THEN DO ~SetGlobal("LoveTalk","LOCALS",63)
  StartCutSceneMode()
  StartCutScene("OW#black")
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC178 // from: OW#VIC169.1
  SAY ~Is that what you thought? You thought you would once again demand that I trust you while never once having to trust me?~
  + ~Global("SleptViconia","Global",0)~ + ~What do you mean? When have I demanded trust from you?~ + OW#VIC183
  + ~Global("SleptViconia","Global",1)~ + ~What do you mean? When have I demanded trust from you?~ + OW#VIC184
  ++ ~Don't do this, Viconia. I don't have the energy for it.~ + OW#VIC179
END

IF ~~ THEN BEGIN OW#VIC179 // from: OW#VIC178.1
  SAY ~No energy to discuss this, but plenty of energy to see me submit to you once more?~
  IF ~~ THEN GOTO OW#VIC180
END

IF ~~ THEN BEGIN OW#VIC180 // from: OW#VIC194 OW#VIC179
  SAY ~Let us speak of it no more, then, and get some rest.~
  IF ~~ THEN DO ~SetGlobal("LoveTalk","LOCALS",65) SetGlobal("OW#NOTRUST","GLOBAL",1)
RestParty()
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC181 // from: OW#VIC170.0
  SAY ~Of course it is. Drow customs tend to be quite intense in comparison to surface cultures. I should never have brought it up.~
  ++ ~What's wrong? Viconia, look at me. What is this really about?~ + OW#VIC182
  ++ ~I'm glad you understand. There's no need to be upset~ + OW#VIC175
END

IF ~~ THEN BEGIN OW#VIC182 // from: OW#VIC181.0
  SAY ~You... you always have me at a disadvantage, don't you, <CHARNAME>? You always demand trust from me but it can never be given the other way around.~
  + ~Global("SleptViconia","Global",0)~ + ~What do you mean? When have I demanded trust from you?~ + OW#VIC183
  + ~Global("SleptViconia","Global",1)~ + ~What do you mean? When have I demanded trust from you?~ + OW#VIC184
  ++ ~I trust you with my life every day. ~ + OW#VIC185
END

IF ~~ THEN BEGIN OW#VIC183 // from: OW#VIC182.0
  SAY ~Every moment of every day. You take me throughout Baldur's Gate, Athkatla, and countless other places.~
  IF ~~ THEN GOTO OW#VIC185
END

IF ~~ THEN BEGIN OW#VIC184 // from: OW#VIC182.1
  SAY ~The first time we slept together. You were... very kind and gentle, of course. You put my pleasure first. But still you demanded I trust you while never showing such... vulnerability in return.~
  IF ~~ THEN GOTO OW#VIC185
END

IF ~~ THEN BEGIN OW#VIC185 // from: OW#VIC184 OW#VIC183 OW#VIC182.2
  SAY ~You expect me to trust that you will protect me from any who would slay me for my very existence. You expect me to trust that you will not see me as a mere stepping stone to greater power!~
  ++ ~That's what this is about? You've been keeping score this whole time?~ + OW#VIC186
  ++ ~Stop, Viconia. I'm not the villain here~ + OW#VIC189
END

IF ~~ THEN BEGIN OW#VIC186 // from: OW#VIC185.0
  SAY ~Yes! Yes, this 'whole time!' Do you still not understand what it means to be a drow?~
  IF ~~ THEN GOTO OW#VIC187
END

IF ~~ THEN BEGIN OW#VIC187 // from: OW#VIC193 OW#VIC186
  SAY ~Every kindness is only a counterweight to a cruelty that has already happened or will soon take place.~
  IF ~~ THEN GOTO OW#VIC188
END

IF ~~ THEN BEGIN OW#VIC188 // from: OW#VIC187
  SAY ~How can you expect me to see your kindness anything but a manipulation?~
  ++ ~Viconia, I had no idea. What can I do to put your troubled heart at ease?~ + OW#VIC195
  ++ ~That's enough. I can't do this anymore, Viconia. Every day with you is a trial and I just... I'm too tired.~ + OW#VIC194
END

IF ~~ THEN BEGIN OW#VIC189 // from: OW#VIC185.1
  SAY ~No. You are not.~
  IF ~~ THEN GOTO OW#VIC190
END

IF ~~ THEN BEGIN OW#VIC190 // from: OW#VIC189
  SAY ~Forgive me, <CHARNAME>. I let my emotions run away with me. We both grow tired and it is time to rest. We can talk in the morning.~
  ++ ~In the morning, then. Rest well, Viconia.~ + OW#VIC191
  ++ ~Let's talk about this now. Viconia, I'm worried about you.~ + OW#VIC192
END

IF ~~ THEN BEGIN OW#VIC191 // from: OW#VIC190.0
  SAY ~Rest well.~
  IF ~~ THEN DO ~SetGlobal("LoveTalk","LOCALS",65) SetGlobal("OW#NOTRUST","GLOBAL",1)
RestParty()
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC192 // from: OW#VIC190.1
  SAY ~...Thank you, <CHARNAME>. That is not a sentiment I hear often.~
  IF ~~ THEN GOTO OW#VIC193
END

IF ~~ THEN BEGIN OW#VIC193 // from: OW#VIC192
  SAY ~I have told you before about drow culture.~
  IF ~~ THEN GOTO OW#VIC187
END

IF ~~ THEN BEGIN OW#VIC194 // from: OW#VIC188.1
  SAY ~I see. Yes, I am a rather tiring companion. Always the mood swings and the flaring temper.~
  IF ~~ THEN GOTO OW#VIC180
END

IF ~~ THEN BEGIN OW#VIC195 // from: OW#VIC188.0
  SAY ~I truly... am no longer sure. I thought perhaps har'luth would be a fine display of vulnerability, but I no longer think that to be the case.~
  IF ~~ THEN GOTO OW#VIC196
END

IF ~~ THEN BEGIN OW#VIC196 // from: OW#VIC195
  SAY ~I may crave your trust but neither do I relish putting you in a position which brings you discomfort.~
  IF ~~ THEN GOTO OW#VIC197
END

IF ~~ THEN BEGIN OW#VIC197 // from: OW#VIC196
  SAY ~I suppose I have no choice but to ask: What would you do to show your trust?~
  ++ ~I understand now what you were seeking. Take out the rope. I trust you.~ + OW#VIC174
  ++ ~Would you perhaps let me simply hold you? Or you could hold me, if you prefer.~ + OW#VIC198
  ++ ~Nevermind, Viconia. Just talking about all of this leaves me tired.~ + OW#VIC194
END

IF ~~ THEN BEGIN OW#VIC198 // from: OW#VIC197.1
  SAY ~ Perhaps... I will try this arrangement, though I find the thought of it rather strange. I suppose that... that some rest is not uncalled for.~
  IF ~~ THEN DO ~SetGlobal("LoveTalk","LOCALS",65)
  SetGlobal("OW#VicTrust","Global",1)
RestParty()
~ EXIT
END
END

// LT63 //
REPLACE BVICONI
IF WEIGHT #32 ~!StateCheck(Player1,STATE_SLEEPING) Global("LoveTalk","LOCALS",64) GENDER(PLAYER1,MALE)~ THEN BEGIN 463 // from:
  SAY #28176 /* ~Is it—is it time to awaken already?~ [VICONI99] */
  IF ~~ THEN GOTO 464
END
END

APPEND BVICONI
IF WEIGHT #32 ~!StateCheck(Player1,STATE_SLEEPING) Global("LoveTalk","LOCALS",64) GENDER(PLAYER1,FEMALE)~ THEN BEGIN OW#VIC199 // from:
  SAY ~There you are, <CHARNAME>. Relax a moment while I free you from your bonds.~
  ++ ~I feel... good. And tired.~ + OW#VIC200
  ++ ~It was nice, but I think I would still prefer to do the tying.~ + OW#VIC201
  ++ ~Mmm. 's good.~ + OW#VIC202
END

IF ~~ THEN BEGIN OW#VIC200 // from: OW#VIC199.0
  SAY ~I shall endeavor not to wear you out so much next time.~
  IF ~~ THEN GOTO OW#VIC203
END

IF ~~ THEN BEGIN OW#VIC201 // from: OW#VIC199.1
  SAY ~Ever willful, mrimm d'ssinss. Very well. Next time I will allow you to take charge.~
  IF ~~ THEN GOTO OW#VIC203
END

IF ~~ THEN BEGIN OW#VIC202 // from: OW#VIC199.2
  SAY ~*chuckle* You look quite beautiful when you are like this.~
  IF ~~ THEN GOTO OW#VIC203
END

IF ~~ THEN BEGIN OW#VIC203 // from: OW#VIC202 OW#VIC201 OW#VIC200
  SAY ~It was... enjoyable, then? You do not regret trusting one such as... such as myself?~
  ++ ~Not now, Viconia. I need some rest. We'll talk in the morning.~ + OW#VIC204
  ++ ~Viconia? Is something wrong?~ + OW#VIC208
  ++ ~Trust didn't figure into it. Even tied up I could protect myself from anything you might have tried.~ + OW#VIC205
END

IF ~~ THEN BEGIN OW#VIC204 // from: OW#VIC208.1 OW#VIC203.0
  SAY ~I... Yes, I understand. In the morning, then.~
  IF ~~ THEN DO ~SetGlobal("OW#NOTRUST","GLOBAL",1)
RestParty()
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC205 // from: OW#VIC203.2
  SAY ~Your manner is as appealing as that of a surfacer male. I see that this was, perhaps, a waste of both our time.~
  ++ ~I'm sorry, Viconia. I meant it as a joke.~ + OW#VIC207
  ++ ~If you're going to act like this then yes, it was a waste.~ + OW#VIC206
END

IF ~~ THEN BEGIN OW#VIC206 // from: OW#VIC205.1
  SAY ~Obviously so. I suppose I was a fool to expect any conviction from a limp sycophant like yourself. I'll not make the mistake again, I assure you.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
RestParty()
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC207 // from: OW#VIC205.0
  SAY ~A joke. Yes.~
  IF ~~ THEN GOTO OW#VIC208
END

IF ~~ THEN BEGIN OW#VIC208 // from: OW#VIC207 OW#VIC203.1
  SAY ~What a fool I am. I thought all of this would somehow... make everything better.~
  ++ ~I thought you were enjoying yourself.~ + OW#VIC209
  ++ ~Haven't we had enough of your mood swings for one <DAYNIGHT>? Can't we just rest now?~ + OW#VIC204
END

IF ~~ THEN BEGIN OW#VIC209 // from: OW#VIC208.0
  SAY ~In the moment I felt wonderful. Now I... I wonder if yet again I have revealed how little I fit into the surface world.~
  ++ ~Surface or Underdark... What do either of them matter? You're here with me.~ + OW#VIC212
  ++ ~I don't belong anywhere either. It's what drew us together.~ + OW#VIC212
  ++ ~Of course you don't fit in. It's not in your nature.~ + OW#VIC210
END

IF ~~ THEN BEGIN OW#VIC210 // from: OW#VIC209.2
  SAY ~Yes. It's rather apparent now, isn't it?~
  IF ~~ THEN GOTO OW#VIC211
END

IF ~~ THEN BEGIN OW#VIC211 // from: OW#VIC210
  SAY ~Regardless... thank you for indulging me. I will leave you to rest. It's been quite the <DAYNIGHT>.~
  IF ~~ THEN DO ~SetGlobal("OW#NOTRUST","GLOBAL",1)
RestParty()
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC212 // from: OW#VIC209.1 OW#VIC209.0
  SAY ~You are quite the wordsmith when you wish to be, <CHARNAME>.~
  IF ~~ THEN GOTO OW#VIC213
END

IF ~~ THEN BEGIN OW#VIC213 // from: OW#VIC212
  SAY ~But I grow weary and I suspect you do as well. Let us not linger on such sentimentality any longer.~
  ++ ~Wait, Viconia. This has been a long <DAYNIGHT> for you. Let me hold you.~ + OW#VIC214
  ++ ~Enough sentimentality indeed. If I wanted to listen to this sort of navel-gazing I'd kiss a poet.~ + OW#VIC215
END

IF ~~ THEN BEGIN OW#VIC214 // from: OW#VIC213.0
  SAY ~Hold me? I... would like that, I think. Very well, <CHARNAME>. Let us rest in one another's arms.~
  IF ~~ THEN DO ~SetGlobal("OW#VICTRUST","GLOBAL",1)
RestParty()
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC215 // from: OW#VIC213.1
  SAY ~Is that so? Sometimes I wonder who is the more temperamental of the two of us.~
  ++ ~I was only teasing, Viconia. Come here. It's been a long <DAYNIGHT> for both of us and I'd like to hold you as we sleep.~ + OW#VIC214
  ++ ~Then let's stop before we begin another round of arguments. It's time to get some rest.~ + OW#VIC216
END

IF ~~ THEN BEGIN OW#VIC216 // from: OW#VIC215.1
  SAY ~Indeed it is. Rest well, <CHARNAME>.~
  IF ~~ THEN DO ~RestParty()
~ EXIT
END
END

// LT65 //
REPLACE BVICONI
IF WEIGHT #32 ~!StateCheck(Player1,STATE_SLEEPING) Global("LoveTalk","LOCALS",64) GENDER(PLAYER1,MALE)~ THEN BEGIN 463 // from:
  SAY #28176 /* ~Is it—is it time to awaken already?~ [VICONI99] */
  IF ~~ THEN GOTO 464
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 464 // from: 463.0
  SAY #28180 /* ~I must admit, <CHARNAME>, that I slept more deeply than I have in some time. I have not felt safer in... a long time... than I did in your arms. A unique experience.~ */
  ++ ~It was just sleep, Viconia, nothing more.~ + 465
  + ~GENDER(PLAYER1,MALE)~ + ~I hold you in too high regard to think of you as here only to service my pleasure, Viconia. You are far more than that.~ + 467
  + ~GENDER(PLAYER1,FEMALE)~ + ~I feel safe with you too, Viconia. Far more than I do with anyone else.~ + 467
  ++ ~It was nothing special.~ + 465
END
END

REPLACE BVICONI
IF WEIGHT #33 ~!StateCheck(Player1,STATE_SLEEPING) GENDER(PLAYER1,MALE) Global("LoveTalk","LOCALS",66)~ THEN BEGIN 468 // from:
  SAY #28190 /* ~You are awake, I see. That is good. I have been watching you for some time... thinking. I wish to share my thoughts with you.~ [VICONIA1] */
  IF ~~ THEN REPLY #28192 /* ~I'm listening.~ */ GOTO 469
  IF ~~ THEN REPLY #28193 /* ~I really haven't time for this, Viconia. Let's get moving.~ */ GOTO 574
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 471 // from: 470.0
  SAY #28197 /* ~Find someone more like yourself to lavish attentions on. Our union is foolish, and the drow have a saying: "The foolish find surprises, and among them waits death." I am no fool.~ */
  IF ~~ THEN REPLY #28198 /* ~No, Viconia! Stay with me, I know we can make this work!~ */ GOTO 472
  IF ~~ THEN REPLY #28199 /* ~Are you sure about this? I... have deep feelings for you, Viconia. I would not want you to waste what could be.~ */ GOTO 473
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #28201 /* ~Fine. If this is what you wish, so be it.~ */ GOTO 474
  + ~GENDER(PLAYER1,FEMALE)~ + ~Fine. If this is what you wish, so be it.~ + OW#VIC245
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #28202 /* ~After all we've had, this is the excuse you're giving me? You are an idiot, drow, to give up on me so easily!~ */ GOTO 475
  + ~GENDER(PLAYER1,FEMALE)~ + ~After all we've had, this is the excuse you're giving me? You are an idiot, drow, to give up on me so easily!~ + OW#VIC221
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 574 // from: 468.1
  SAY #61006 /* ~No. You and I do not consider time the same, and it will not kill you to listen to what I have to say, <CHARNAME>.~ */
  IF ~GENDER(PLAYER1,MALE)~ THEN GOTO 469
  IF ~GENDER(PLAYER1,FEMALE)~ THEN GOTO OW#VIC219
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC219 // from: OW#VIC218.0 574F
  SAY ~I have considered my actions lately and feel ill at ease. I dally with you as if I were a mere surface woman. One with no cares. And yet so often I feel your knife at my back.~
  IF ~~ THEN GOTO OW#VIC220
END

IF ~~ THEN BEGIN OW#VIC220 // from: OW#VIC219
  SAY ~I know this is not your intention. You have given me... protection, of sorts, and a fair amount of affection. And yet trust between us is elusive and formless. I will not continue on like this.~
  IF ~~ THEN GOTO 471
END

IF ~~ THEN BEGIN OW#VIC221 // from: 471.4
  SAY ~Am I? Your display only makes this easier. So cloying, even for a surfacer! I have no plans to go anywhere, <CHARNAME>, unless you are too weak to face me.~
  ++ ~Get out of here! Get out of my sight!~ + 476
  ++ ~No... that's fine. Stay, if you must.~ + OW#VIC222
END

IF ~~ THEN BEGIN OW#VIC222 // from: OW#VIC221.1
  SAY ~Very well, I shall stay. But take your wicked eyes from me... and let us continue our travels.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC245 // from: 471.2
  SAY ~Excellent. You are very sensible, for a surfacer. It is ended cleanly, so let us just continue our travels without further conflict and we shall both rest easier.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ EXIT
END
END

APPEND VICONIJ
IF WEIGHT #33 ~Global("OW#VicTrust","GLOBAL",1)~ THEN BEGIN OW#VIC217 // from:
  SAY ~Is it—is it time to awaken already?~ [VICONI99]
  IF ~~ THEN DO ~SetGlobal("OW#VicTrust","GLOBAL",2)~ EXTERN ~BVICONI~ 464
END

IF WEIGHT #33 ~Global("OW#NOTRUST","GLOBAL",1)~ THEN BEGIN OW#VIC218 // from:
  SAY ~You are awake, I see. That is good. I have been watching you for some time... thinking. I wish to share my thoughts with you.~ [VICONIA1]
  ++ ~I'm listening.~ DO ~SetGlobal("OW#NOTRUST","GLOBAL",2)~ EXTERN ~BVICONI~ OW#VIC219
  ++ ~I really haven't time for this, Viconia. Let's get moving.~ DO ~SetGlobal("OW#NOTRUST","GLOBAL",2)~ EXTERN ~BVICONI~ 574
END
END

// LT67 //
REPLACE BVICONI
IF WEIGHT #34 ~!StateCheck(Player1,STATE_SLEEPING) Global("LoveTalk","LOCALS",68)~ THEN BEGIN 478 // from:
  SAY #28213 /* ~I have... I have an odd feeling. I do not... think I have ever felt like this before...~ [VICONIA2] */
  + ~GENDER(PLAYER1,MALE)~ + ~Hm? What is it? Compassion?~ + 479
  + ~GENDER(PLAYER1,FEMALE)~ + ~Hm? What is it? Compassion?~ + OW#VIC223
  ++ ~What kind of feeling?~ + 480
  + ~GENDER(PLAYER1,MALE)~ + ~Ignore it for now; we have to keep moving.~ + 482
  + ~GENDER(PLAYER1,FEMALE)~ + ~Ignore it for now; we have to keep moving.~ + OW#VIC224
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 482 // from: 481.1 478.2
  SAY #28229 /* ~I am not imagining this! And do not patronize me, you idiot jaluk! I will not have it!~ */
  IF ~~ THEN REPLY #28231 /* ~Well, what can you tell me about this "feeling," then?~ */ GOTO 484
  IF ~~ THEN REPLY #28232 /* ~Calm down, calm down. There's probably nothing that can be done about it anyway.~ */ GOTO 484
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC223 // from: 478.1
  SAY ~I will not be patronized by you, you idiot kivvil! Next time you have something smart to say, shove your head underwater before I do it for you!~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#VIC224 // from: 481.2 478.4
  SAY ~I am not imagining this! And do not patronize me, you idiot kivvil! I will not have it!~
  ++ ~Well, what can you tell me about this "feeling," then?~ + 484
  ++ ~Calm down, calm down. There's probably nothing that can be done about it anyway.~ + 484
END
END

// LT69 - NO CHANGE //

// LT71 //
REPLACE BVICONI
IF ~~ THEN BEGIN 492 // from: 495.0 491.0 490.1
  SAY ~That was a Handmaiden of Lolth and a yochlol. Gated assassins. To think that she would go to such efforts to gather me up—it is almost beyond belief.~
  IF ~~ THEN GOTO 493
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 494 // from: 493.0
  SAY #28262 /* ~And... what will she do to take me next? The Spider Queen is not so easily dissuaded. <CHARNAME>, I despise this terror that threatens to swallow me!~ */
  IF ~~ THEN REPLY #28264 /* ~If she sends more, I'll deal with them the same as I did these ones. Do not worry.~ */ GOTO 496
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #28265 /* ~Calm yourself, Viconia!~ */ GOTO 497
  + ~GENDER(PLAYER1,FEMALE)~ + ~Calm yourself, Viconia!~ + OW#VIC225
  IF ~~ THEN REPLY #28266 /* ~What do you intend to do?~ */ GOTO 498
  IF ~~ THEN REPLY #28270 /* ~How do you think I feel?! If she sends more of those things, all of us are in danger, not just you!~ */ GOTO 499
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 499 // from: 494.3
  SAY #28271 /* ~And what would you have me do, <CHARNAME>? Leave? Return to the Underdark and plead for mercy? There is no mercy for me! There is no mercy!~ */
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #28272 /* ~You don't deserve mercy, Viconia. You're a dark-hearted thing, and I'm sorry I laid eyes upon you.~ */ GOTO 500
  + ~GENDER(PLAYER1,FEMALE)~ + ~You don't deserve mercy, Viconia. You're a dark-hearted thing, and I'm sorry I laid eyes upon you.~ + OW#VIC226
  IF ~~ THEN REPLY #28273 /* ~Yes, leave... find some way to save yourself, but I won't have you endangering me or the others!~ */ GOTO 501
  IF ~~ THEN REPLY #28274 /* ~No. Stay here... it is the safest place for you. We will find a way around this.~ */ GOTO 502
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC225 // from: 494.2
  SAY ~I am calm, fool... but my fear is justified... the Spider Queen is a thing to be feared! I... I must think, <CHARNAME>. Please, leave me be for a while...~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#VIC226 // from: 499.1
  SAY ~Is that what you think?! Iblith! Darkness take you, <CHARNAME>. I shall pray for your destruction forever!~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
LeaveParty()
EscapeArea()
~ EXIT
END
END

// LT73 //
REPLACE BVICONI
IF WEIGHT #37 ~!StateCheck(Player1,STATE_SLEEPING) Global("LoveTalk","LOCALS",74)~ THEN BEGIN 503 // from:
  SAY #28279 /* ~Back away from me, you pathetic fool! Do not cast your eyes upon me. I told you to let me be, iblith! Are you so insipid and moronic that you cannot understand such simple instruction?!~ [VICONIA5] */
  IF ~~ THEN REPLY #28283 /* ~I said nothing to you, Viconia! What brings this on?!~ */ GOTO 504
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #28284 /* ~Again you turn suddenly hostile? What happened to your promise?~ */ GOTO 505
  + ~GENDER(PLAYER1,FEMALE)~ + ~Again you turn suddenly hostile? What happened to your promise?~ + OW#VIC227
  IF ~~ THEN REPLY #28285 /* ~I have had enough of your selfishness and games, Viconia! Begone with you, and make both our lives easier!~ */ GOTO 506
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC227 // from: 503.2
  SAY ~To the deepest pit of the Abyss with my promise! I shall do as I like, you ignorant fool! I... you are an affront to me! I... I wish... this had... never been!~
  ++ ~Why do you turn your head? Those are tears in your eyes! Why are you saying these things to me?! Why?!~ + 507
  ++ ~You want this to end, do you? Well, I am tired of trying so hard! So be it!~ + 506
END
END

// LT75 //
REPLACE BVICONI
IF ~~ THEN BEGIN 515 // from: 514.0
  SAY #28308 /* ~If it... if it means anything to you, <CHARNAME>, I do truly love you.~ */
  IF ~GENDER(PLAYER1,MALE)~ THEN GOTO 516
  IF ~GENDER(PLAYER1,FEMALE)~ THEN GOTO OW#VIC228
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC228 // from: 515F
  SAY ~Aluve' ussta valm'valsharess... farewell, my bound queen. Until we meet again.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
LeaveParty()
GivePartyAllEquipment()
EscapeArea()
~ EXIT
END
END

/////////////////
//// EVENTS ////
///////////////

// VAMPIRISM //
REPLACE BODHIAMB
IF ~~ THEN BEGIN 15 // from:
  SAY ~But does <PRO_HESHE> fear your loss? Let's find out. Follow me further, <CHARNAME>, and you will lose more than you can fathom. Starting now!~
  IF ~~ THEN DO ~ClearAllActions()
StartCutSceneMode()
StartCutSceneEx("Cut53d",FALSE)
~ UNSOLVED_JOURNAL #3716 /* ~The final battle with Bodhi

Bodhi appeared in an ambush shortly before I reached her haven, warning me that she was aware of my pursuit and stealing from me the one person that is dearest to my heart: Viconia. Before she vanished and unleashed more of her undead creations upon me, Bodhi warned me that if I continue, I will lose even more than I thought possible. I cannot give up on the Rhynn Lanthorn... but now the life and immortal soul of the one I love is at stake as well!~ */ EXIT
END
END

REPLACE VICONIP
IF WEIGHT #0 ~Global("ViconiaVampire","GLOBAL",5)
~ THEN BEGIN 6 // from:
  SAY #56601 /* ~You have... you have saved me, freed my spirit from a most foul contamination. I am in your debt.~ [VICONIB9] */
  IF ~~ THEN REPLY #56602 /* ~No, I am in *your* debt. You restored my spirit with your beguiling ways long ago.~ */ DO ~EraseJournalEntry(32084)
EraseJournalEntry(32085)
EraseJournalEntry(16351)
EraseJournalEntry(7002)
EraseJournalEntry(3716)
EraseJournalEntry(5814)
EraseJournalEntry(16331)
EraseJournalEntry(15710)
EraseJournalEntry(6589)
EraseJournalEntry(11864)
EraseJournalEntry(3374)
EraseJournalEntry(3377)
EraseJournalEntry(3927)
SetGlobal("ViconiaVampire","GLOBAL",6)
~ SOLVED_JOURNAL #7122 /* ~The final battle with Bodhi

While I had feared for some time that Bodhi's final revenge on me would be to take away Viconia forever, it seems that the information in the lorebook was right... Amaunator's idol has restored Viconia not only to life, but has removed the vampiric curse from her as well. ~ */ GOTO 8
  IF ~~ THEN REPLY #56603 /* ~Your weakness nearly cost us all our lives. I trust this will not happen again.~ */ DO ~EraseJournalEntry(32084)
EraseJournalEntry(32085)
EraseJournalEntry(16351)
EraseJournalEntry(7002)
EraseJournalEntry(3716)
EraseJournalEntry(5814)
EraseJournalEntry(16331)
EraseJournalEntry(15710)
EraseJournalEntry(6589)
EraseJournalEntry(11864)
EraseJournalEntry(3374)
EraseJournalEntry(3377)
EraseJournalEntry(3927)
SetGlobal("ViconiaVampire","GLOBAL",6)
~ UNSOLVED_JOURNAL #7122 /* ~The final battle with Bodhi

While I had feared for some time that Bodhi's final revenge on me would be to take away Viconia forever, it seems that the information in the lorebook was right... Amaunator's idol has restored Viconia not only to life, but has removed the vampiric curse from her as well. ~ */ GOTO 7
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #56604 /* ~As well you should be, but I will not hold that over you. I only wish that you return to me.~ */ DO ~EraseJournalEntry(32084)
EraseJournalEntry(32085)
EraseJournalEntry(16351)
EraseJournalEntry(7002)
EraseJournalEntry(3716)
EraseJournalEntry(5814)
EraseJournalEntry(16331)
EraseJournalEntry(15710)
EraseJournalEntry(6589)
EraseJournalEntry(11864)
EraseJournalEntry(3374)
EraseJournalEntry(3377)
EraseJournalEntry(3927)
SetGlobal("ViconiaVampire","GLOBAL",6)
~ SOLVED_JOURNAL #7122 /* ~The final battle with Bodhi

While I had feared for some time that Bodhi's final revenge on me would be to take away Viconia forever, it seems that the information in the lorebook was right... Amaunator's idol has restored Viconia not only to life, but has removed the vampiric curse from her as well. ~ */ GOTO 9
  + ~GENDER(PLAYER1,FEMALE)~ + ~As well you should be, but I will not hold that over you. I only wish that you return to me.~ DO ~EraseJournalEntry(32084)
EraseJournalEntry(32085)
EraseJournalEntry(16351)
EraseJournalEntry(7002)
EraseJournalEntry(3716)
EraseJournalEntry(5814)
EraseJournalEntry(16331)
EraseJournalEntry(15710)
EraseJournalEntry(6589)
EraseJournalEntry(11864)
EraseJournalEntry(3374)
EraseJournalEntry(3377)
EraseJournalEntry(3927)
SetGlobal("ViconiaVampire","GLOBAL",6)
~ SOLVED_JOURNAL #7122 /* ~The final battle with Bodhi

While I had feared for some time that Bodhi's final revenge on me would be to take away Viconia forever, it seems that the information in the lorebook was right... Amaunator's idol has restored Viconia not only to life, but has removed the vampiric curse from her as well. ~ */ GOTO OW#VIC229
END
END

APPEND VICONIP
IF ~~ THEN BEGIN OW#VIC229 // from: 6.3
  SAY ~I welcome the invitation. No doubt you have missed the allure of another competent female. Thank you, <CHARNAME>. I...~
  IF ~~ THEN GOTO 10
END
END

// SULDANESSELLAR //
REPLACE VICONIJ
IF ~~ THEN BEGIN 180 // from: 179.0
  SAY ~Whether loyalty is a trait you would ascribe to me does not matter. I would offer my last breath in your defense. You are... unique amongst <PRO_MENWOMEN>, and I salute you.~
  IF ~~ THEN GOTO 181
END
END

/////////////////
//// BANTER ////
///////////////

// ANOMEN //
REPLACE BVICONI
IF WEIGHT #43 /* Triggers after states #: 31 32 33 34 48 61 62 63 64 74 82 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 131 417 437 446 455 463 468 478 487 490 503 508 580 605 even though they appear after this state */
~ !Global("ViconiaRomanceActive","GLOBAL",2)
OR(2) Global("AnomenRomanceActive","GLOBAL",3) Global("AnomenMatch","Global",0)
See("Anomen")
InParty("Anomen")
!StateCheck("Anomen",STATE_SLEEPING)
!Global("AnomenIsKnight","GLOBAL",1)
Global("BViconia3","LOCALS",0)
~ THEN BEGIN 10 // from:
  SAY #8539 /* ~Anomen, tell me, what drew such a handsome, powerful, and charismatic individual like yourself to the dreary, hectic life of adventuring?~ [VICONI51] */
  IF ~~ THEN DO ~SetGlobal("BViconia3","LOCALS",1)
~ EXTERN ~BANOMEN~ 583
END
END

REPLACE BANOMEN
IF ~~ THEN BEGIN 47 // from:
  SAY #8542 /* ~Well, Viconia, you don't have to sleep so far away next time. Your hands across these muscles would be more welcome than the brush of canvas, I'd venture.~ */
  IF ~~ THEN REPLY #8544 /* ~Anomen, snap out of it. She's playing you like a cheap violin.~ */ EXTERN ~BVICONI~ 12
  IF ~~ THEN REPLY #8558 /* ~Could you two wait until tonight before you start talking dirty and whispering sweet nothings?~ */ GOTO 586
  IF ~GENDER(PLAYER1,MALE)~ THEN REPLY #8559 /* ~Hey, Anomen... step aside! From where I'm standing, it doesn't look much like Viconia's buying what you're selling.~ */ GOTO 584
  + ~GENDER(PLAYER1,FEMALE)~ + ~You're embarrassing yourself, Anomen. From where I'm standing, it doesn't look much like Viconia's buying what you're selling.~ + 584
END
END

REPLACE BANOMEN
IF ~~ THEN BEGIN 585 // from: 584.0
  SAY #37399 /* ~And who would be foolish enough to cast blame? After all, we are all fully cognizant of this group dynamic, and are equally informed of who the true leader is here, <CHARNAME>.~ */
  IF ~GENDER(PLAYER1,MALE)~ THEN GOTO 50
  IF ~GENDER(PLAYER1,FEMALE)~ THEN GOTO OW#ANO4
END
END

REPLACE BANOMEN
IF ~~ THEN BEGIN 586 // from: 50.0 47.1
  SAY #37400 /* ~You needn't be so impudent, child. The woman is pleasing to the eye and doth stir the loins, and I was merely complimenting upon her comeliness.~ */
  IF ~GENDER(PLAYER1,MALE)~ THEN GOTO 52
  IF ~GENDER(PLAYER1,FEMALE)~ THEN GOTO OW#ANO3
END
END

APPEND BANOMEN
IF ~~ THEN BEGIN OW#ANO3 // from: 586F
  SAY ~Perhaps my words have sparked jealousy in you, <CHARNAME>? Fear not, my lady, as I have the stamina for more than one partner.~
  IF ~~ THEN EXTERN ~BVICONI~ OW#VIC230
END

IF ~~ THEN BEGIN OW#ANO4 // from: 585F
  SAY ~And what would you do if I don't move away? Would you watch us as we fall into one another's embrace? You're more than welcome to enjoy the show.~
  ++ ~Enough of your flights of fancy, Anomen. I'm not interested and neither is Viconia.~ + 586
  ++ ~Let's just keep it together and let this slide. It's not worth arguing about.~ + 51
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC230 // from: BANOMEN 633
  SAY ~Ha! Do you see how quickly an undisciplined male becomes overconfident in his virility? Fear not, <CHARNAME>. He is only a passing amusement. I find your gentle figure far more enticing.~
  IF ~~ THEN EXIT
END
END

// JAHEIRA //
REPLACE BVICONI
IF WEIGHT #52 /* Triggers after states #: 31 32 33 34 48 61 62 63 64 74 82 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 131 417 437 446 455 463 468 478 487 490 503 508 580 600 605 even though they appear after this state */
~  See("Jaheira")
InParty("Jaheira")
!StateCheck("Jaheira",STATE_SLEEPING)
!GLOBAL("OW#VICHE","GLOBAL",1)
Global("BViconia11c","LOCALS",0)
~ THEN BEGIN 25 // from:
  SAY #8653 /* ~Tell me, Harper, who was who with your parentage? Father the darthiir, mother the rivvil? Or father human, mother elven? It's always confusing with crossbred mongrels.~ [VICONI48] */
  IF ~~ THEN DO ~SetGlobal("BViconia11c","LOCALS",1)
~ EXTERN ~BJAHEIR~ 21
END
END

APPEND BVICONI
IF WEIGHT #52 /* Triggers after states #: 31 32 33 34 48 61 62 63 64 74 82 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 131 417 437 446 455 463 468 478 487 490 503 508 580 600 605 even though they appear after this state */
~See("Jaheira") InParty("Jaheira") !StateCheck("Jaheira",STATE_SLEEPING) GLOBAL("OW#VICHE","GLOBAL",1) Global("BViconia11c","LOCALS",0)~ THEN BEGIN OW#VIC231 // from:
  SAY ~Tell me, Harper, is it true that you were once a noble as well?~
  IF ~~ THEN DO ~SetGlobal("BViconia11c","LOCALS",1)
~ EXTERN ~BJAHEIR~ OW#JAH2
END

IF ~~ THEN BEGIN OW#VIC232 // from: OW#JAH2
  SAY ~It occurs to me that we both come from the ashes of nobility. Was your mother the noble? Or was it your father, in the usual surfacer perversion of things?~
  IF ~~ THEN EXTERN ~BJAHEIR~ OW#JAH3
END
END

APPEND BJAHEIR
IF ~~ THEN BEGIN OW#JAH2 // from: OW#VIC231
  SAY ~Only for the fleeting memories of my childhood. Why is it that you ask, drow?~
  IF ~~ THEN EXTERN ~BVICONI~ OW#VIC232
END

IF ~~ THEN BEGIN OW#JAH3 // from: OW#VIC232
  SAY ~Two people in love, swine. Do not even dream to compare us. Whatever commonalities we may share are mere accident.~
  IF ~~ THEN EXIT
END
END

////////////////////////
// ROMANCE CONFLICTS //
//////////////////////

// Anomen //
REPLACE BANOMEN
IF WEIGHT #4 ~  Global("AnomenMatch","GLOBAL",1)
Global("LoveTalk","LOCALS",10)
~ THEN BEGIN 153 // from:
  SAY #35217 /* ~*sigh* Speaking of my father has left me plenty of time to think. Perhaps too much. It is as if an ill wind has blown across my soul.~ [ANOMEN71] */
  IF ~  OR(2)
!Global("ViconiaRomanceActive","GLOBAL",1)
!IfValidForPartyDialogue("Viconia")
~ THEN REPLY #35218 /* ~Why? What are you thinking of?~ */ GOTO 154
  IF ~  OR(2)
!Global("ViconiaRomanceActive","GLOBAL",1)
!IfValidForPartyDialogue("Viconia")
~ THEN REPLY #35219 /* ~I've no time for your melancholy, Anomen.~ */ GOTO 161
  IF ~  OR(2)
!Global("ViconiaRomanceActive","GLOBAL",1)
!IfValidForPartyDialogue("Viconia")
~ THEN REPLY #35220 /* ~This is no time for reminiscing, Anomen. Let us continue on.~ */ GOTO 162
  IF ~  Global("ViconiaRomanceActive","GLOBAL",1)
  IfValidForPartyDialogue("Viconia")
~ THEN EXTERN ~BVICONI~ OW#VIC233
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC233 // from: BANOMEN 153
  SAY ~And your voice is an ill wind blowing across what little peace there is to be found in this world. Do you rivvin males not know to keep your silence unless spoken to?~
  IF ~~ THEN EXTERN ~BANOMEN~ OW#ANO5
END
END

APPEND BANOMEN
IF ~~ THEN BEGIN OW#ANO5 // from: BVICONI OW#VIC233
  SAY ~My humblest apologies, Viconia. I was under the impression that I was speaking with <CHARNAME> and not you. Surely <PRO_HESHE> does not abide by the backwards views your culture holds.~
  ++ ~Actually, Anomen, I agree with Viconia. I'd rather not hear you prattle on.~ + OW#ANO6
  ++ ~That's enough, Viconia. I want to hear what Anomen has to say.~ + OW#ANO7
END

IF ~~ THEN BEGIN OW#ANO6 // from: OW#ANO5.0
  SAY ~I see. I had thought you a better <PRO_MANWOMAN> than this, <CHARNAME>. Very well. You shall hear no more from me.~
  IF ~~ THEN DO ~SetGlobal("AnomenRomanceActive","GLOBAL",3)
~ EXIT
END

IF ~~ THEN BEGIN OW#ANO7 // from: OW#ANO5.1
  SAY ~Thank you, <CHARNAME>. As I was saying, thoughts of my father have left me ill at ease.~
  ++ ~Why? What are you thinking of?~ + 154
  ++ ~I've no time for your melancholy, Anomen.~ + 161
  ++ ~This is no time for reminiscing, Anomen. Let us continue on.~ + 162
END
END

// Jaheira //
REPLACE BJAHEIR
IF WEIGHT #14 ~  Global("JaheiraMatch","GLOBAL",1)
Global("LoveTalk","LOCALS",22)
!StateCheck(Player1,STATE_SLEEPING)
~ THEN BEGIN 188 // from:
  SAY #21151 /* ~I... I worry sometimes...~ [JAHEIR83] */
  IF ~  OR(2)
!Global("ViconiaRomanceActive","GLOBAL",1)
!IsValidForPartyDialogue("Viconia")
OR(2)
!Global("AerieRomanceActive","GLOBAL",1)
!IsValidForPartyDialogue("Aerie")
~ THEN GOTO 189
  IF ~  Global("ViconiaRomanceActive","GLOBAL",1)
IsValidForPartyDialogue("Viconia")
!GLOBAL("OW#VICHE","GLOBAL",1)
~ THEN EXTERN ~BVICONI~ 567
  IF ~  Global("ViconiaRomanceActive","GLOBAL",1)
IsValidForPartyDialogue("Viconia")
GLOBAL("OW#VICHE","GLOBAL",1)
~ THEN EXTERN ~BVICONI~ OW#VIC234
  IF ~  OR(2)
!Global("ViconiaRomanceActive","GLOBAL",1)
!IsValidForPartyDialogue("Viconia")
Global("AerieRomanceActive","GLOBAL",1)
IsValidForPartyDialogue("Aerie")
~ THEN EXTERN ~BAERIE~ 446
END
END

APPEND BVICONI
IF ~~ THEN BEGIN OW#VIC234 // from: BJAHEIR 188
  SAY ~You worry too often. And speak your mind more than the rest of us would like to hear. <CHARNAME> need not hear every vapid thought that enters your head.~ [OW#VIC08]
  IF ~~ THEN EXTERN ~BJAHEIR~ 450
END
END

// Dorn //
REPLACE VICONIJ
IF ~~ THEN BEGIN 418 // from:
  SAY ~You're not <CHARNAME>'s type, half-orc. <PRO_HESHE> prefers a more tender embrace.~
  IF ~~ THEN EXTERN ~DORNJ~ 123
END
END

REPLACE DORNJ
IF ~~ THEN BEGIN 123 // from:
  SAY ~Let <PRO_HIMHER> speak for <PRO_HIMHER>self. What say you, <CHARNAME>? You want this as much as I, admit it.~
  IF ~~ THEN REPLY #96582 /* ~I do want it. But you'll have to work harder than that.~ */ GOTO 126
  IF ~~ THEN REPLY #96589 /* ~I do. Gods help me.~ */ GOTO 130
  IF ~~ THEN REPLY #96590 /* ~I'm not sure about that. You seem to want it very, very badly.~ */ GOTO 125
  IF ~~ THEN REPLY #96591 /* ~I'll not be coerced into making a decision before I'm ready.~ */ GOTO 126
END
END

// Hexxat //
APPEND VICONIJ
IF ~Global("OWH_viconiaconflict","GLOBAL",2)~ THEN BEGIN OW#VIC235 // from: 
  SAY ~It is time that the three of us spoke.~
  IF ~~ DO ~SetGlobal("OWH_viconiaconflict","GLOBAL",3)~ GOTO OW#VIC236
END
  
IF ~~ THEN BEGIN OW#VIC236 // from: OW#VIC235
  SAY ~Clearly there is a... mutual attraction between all of us and we must see this resolved.~
  IF ~~ THEN EXTERN ~HEXXATJ~ OW#HEX1
END

IF ~~ THEN BEGIN OW#VIC237 // from: OW#HEX2
  SAY ~Were this only a casual dalliance, I would entertain such a suggestion. This, however, is different.~
  IF ~~ THEN GOTO OW#VIC239
END

IF ~~ THEN BEGIN OW#VIC238 // from: OW#HEX1.2
  SAY ~Your enthusiasm amuses me, <CHARNAME>, but I meant what I said.~
  IF ~~ THEN GOTO OW#VIC239
END

IF ~~ THEN BEGIN OW#VIC239 // from: OW#VIC238 OW#VIC237; OW#HEX1.0
  SAY ~Drow are not known for their generosity with lovers and I am no exception.~
  IF ~~ THEN EXTERN ~HEXXATJ~ OW#HEX3
END

IF ~~ THEN BEGIN OW#VIC240 // from: OW#HEX3.0
  SAY ~I... I see. I confess I expected a different outcome.~
  IF ~~ THEN GOTO OW#VIC241
END

IF ~~ THEN BEGIN OW#VIC241 // from: OW#VIC240
  SAY ~Be happy then. I will not come between you.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ EXIT
END

IF ~~ THEN BEGIN OW#VIC242 // from: OW#HEX5
  SAY ~I... I admit I am rather surprised by your words, <CHARNAME>. I thought... But yes, Hexxat. Perhaps I will come to you soon enough.~
  IF ~~ THEN EXTERN ~HEXXATJ~ OW#HEX6
END
END

APPEND HEXXATJ
IF ~~ THEN BEGIN OW#HEX1 // from: OW#VIC236
  SAY ~Indeed there is. I can think of perhaps one solution.~
  ++ ~What do you mean, Viconia?~ EXTERN VICONIJ OW#VIC239 
  ++ ~What do you mean, Hexxat?~ + OW#HEX2
  ++ ~Oh. Uh. Yes, let's try Hexxat's idea.~ EXTERN VICONIJ OW#VIC238 
END

IF ~~ THEN BEGIN OW#HEX2 // from: OW#HEX1.1
  SAY ~Come now, <CHARNAME>. You're a smart woman. I'm sure you can take a guess.~
  IF ~~ THEN EXTERN ~VICONIJ~ OW#VIC237
END

IF ~~ THEN BEGIN OW#HEX3 // from: OW#VIC239
  SAY ~A shame to hear, Viconia, but I will not press the matter.~
  ++ ~I'm sorry, Viconia. I have something special with Hexxat.~ EXTERN VICONIJ OW#VIC240
  ++ ~It's been fun Hexxat, but it is Viconia who has won me.~ + OW#HEX4
  ++ ~I don't think I'm made for all this romantic drama. You two seem good for each other—I don't want to get in the way.~ + OW#HEX5
END

IF ~~ THEN BEGIN OW#HEX4 // from: OW#HEX3.1
  SAY ~Very well. I will miss your attention, <CHARNAME>, but it is good to see such passion between the two of you.~
  IF ~~ THEN DO ~SetGlobal("HexxatRomanceActive","GLOBAL",3)
~ EXIT
END

IF ~~ THEN BEGIN OW#HEX5 // from: OW#HEX3.2
  SAY ~Indeed? This is an unexpected outcome. And you, Viconia?~
  IF ~~ THEN EXTERN ~VICONIJ~ OW#VIC242
END

IF ~~ THEN BEGIN OW#HEX6 // from: OW#VIC241
  SAY ~I will look forward to it, then.~
  IF ~~ THEN DO ~SetGlobal("HexxatRomanceActive","GLOBAL",3) SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ EXIT
END
END

// Rasaad //
APPEND RASAADJ
IF ~Global("OWR_viconiaconflict","GLOBAL",2)~ THEN BEGIN OW#RAS1 // from: 
  SAY ~May I borrow a moment of your time, <CHARNAME?>~
  ++ ~Of course, Rasaad. What can I do for you?~ DO ~SetGlobal("OWR_viconiaconflict","GLOBAL",3)~ + OW#RAS2
  ++ ~As long as it's only a moment.~ DO ~SetGlobal("OWR_viconiaconflict","GLOBAL",3)~ + OW#RAS2
  ++ ~Now's not really the time, Rasaad.~ DO ~SetGlobal("OWR_viconiaconflict","GLOBAL",3)~ + OW#RAS2
END

IF ~~ THEN BEGIN OW#RAS2 // from: OW#RAS1
  SAY ~I promise to be quick. It is about Viconia. For as dour a woman as she usually is, she is less so around you. The two of you seem quite smitten.~
  ++ ~She's a good friend—and that's all. You have nothing to worry about, Rasaad.~ + OW#RAS5
  ++ ~It's complicated. I've grown so fond of you both.~ + OW#RAS3
  ++ ~Viconia is like no one I've ever met. I think I'm falling for her.~ + OW#RAS6
END

IF ~~ THEN BEGIN OW#RAS3 // from: OW#RAS2.1
  SAY ~And I of you. Nevertheless, I think it is important to make a choice as to whom you will give your heart.~
  IF ~~ THEN GOTO OW#RAS4
END

IF ~~ THEN BEGIN OW#RAS4 // from: OW#RAS3
  SAY ~Please, tell me which of us you see a future with. No matter your choice, you will always be a friend.~
  ++ ~If I must choose... then it is you.~ + OW#RAS5
  ++ ~Viconia is the one who calls to me.~ + OW#RAS6
END

IF ~~ THEN BEGIN OW#RAS5 // from: OW#RAS4.0 OW#RAS2.0
  SAY ~I am glad to hear it. I would not have resented you if it was something more, but I admit you have grown dear to my heart.~
  IF ~~ THEN DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
~ GOTO OW#RAS8
END

IF ~~ THEN BEGIN OW#RAS6 // from: OW#RAS4.1 OW#RAS2.2
  SAY ~I... cannot say I am not disappointed. The Moonmaiden teaches us to always search out the light, however.~
  IF ~~ THEN DO ~SetGlobal("RasaadRomanceActive","GLOBAL",3)
~ GOTO OW#RAS7
END

IF ~~ THEN BEGIN OW#RAS7 // from: OW#RAS6
  SAY ~It is my hope that you will be a bit of light in her otherwise dark life... and that she will be one for you as well.~
  IF ~~ THEN GOTO OW#RAS8
END

IF ~~ THEN BEGIN OW#RAS8 // from: OW#RAS7 OW#RAS5
  SAY ~Let us continue, shall we?~
  IF ~~ THEN EXIT
END
END

// Phaere //
REPLACE VICONIJ
IF ~~ THEN BEGIN 99 // from: 97.1
  SAY ~Do not make me laugh, <CHARNAME>. You seem to forget that a powerful female will see you as nothing more than a plaything. If this is some manner of ploy, I would suggest you reconsider.~
  IF ~~ THEN REPLY #51248 /* ~And if it is a ploy? What's wrong with that?~ */ GOTO 100
  IF ~~ THEN REPLY #51249 /* ~I'll do as I like, Viconia. Now drop it.~ */ GOTO 101
END
END

REPLACE VICONIJ
IF WEIGHT #3 ~  Global("ViconiaCheckMad2","GLOBAL",1)
See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
OR(2)
Global("ViconiaRomanceActive","GLOBAL",1)
Global("ViconiaRomanceActive","GLOBAL",2)
Global("PhaereInnuendo","GLOBAL",3)
!Range("Phaere",6)
Global("ViconiaMad3","LOCALS",0)
~ THEN BEGIN 108 // from:
  SAY #52238 /* ~That was quite odd, <CHARNAME>. I was sure that Phaere intended to seduce you. How did you squirm from her grasp?~ */
  IF ~Gender(Player1,MALE)~ THEN GOTO 109
  IF ~Gender(Player1,FEMALE)~ THEN GOTO OW#VIC243
END
END

APPEND VICONIJ
IF ~~ THEN BEGIN OW#VIC243 // from: 108
  SAY ~It was wise to avoid her attentions. An ambitious female like that would not hesitate to use you up and throw you aside. ...I am glad you are safe.~
  IF ~~ THEN DO ~SetGlobal("ViconiaMad3","LOCALS",1)
~ EXIT
END
END