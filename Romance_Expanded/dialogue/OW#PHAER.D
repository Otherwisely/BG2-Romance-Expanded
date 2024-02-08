BEGIN ~OW#PHAER~

// TAVERN //
REPLACE UDPHAE01
IF ~~ THEN BEGIN 13 // from: 12.0
  SAY #51168 /* ~Amongst the drow, only the strong survive... You could have slaves at your beck and call, rewards at your fingertips... the favor of Lolth. How does this sound?~ */
  IF ~~ THEN REPLY #51173 /* ~Sounds good to me!~ */ GOTO 14
  IF ~~ THEN REPLY #51174 /* ~What's the catch?~ */ GOTO 16
  IF ~~ THEN REPLY #51175 /* ~I don't think I'm interested in anything you have to offer.~ */ GOTO 18
  IF ~~ THEN REPLY #51177 /* ~I think I'd rather have you.~ */ GOTO 20
END
END

REPLACE UDPHAE01
IF ~~ THEN BEGIN 20 // from: 13.3
  SAY #51211 /* ~Ahhh, is that so? Perhaps I may just show you the carnal delights of which only I am capable... but only if you prove yourself worthy of that honor.~ */
  IF ~~ THEN DO ~SetGlobal("CheckMad","AR2202",1)
SetGlobal("CheckMad","AR2202",1)
SetGlobal("CheckMad","AR2202",1)
SetGlobal("PhaereInnuendo","GLOBAL",1)
~ EXTERN ~UDSOLA01~ 81
END
END

REPLACE UDPHAE01
IF ~~ THEN BEGIN 38 // from: 36.2 34.2 28.2 25.3
  SAY #51313 /* ~Yes, enjoy the time you have to yourself. You are fortunate, Veldrin, that my gaze has fallen upon you. With you by my side, things will be made much easier.~ */
    IF ~~ THEN GOTO 39
END
END

REPLACE UDPHAE01
IF ~~ THEN BEGIN 39 // from: 38.1
  SAY ~And, if you are an obedient and intelligent servant... and an imaginative lover, should I desire... you may engineer to make things even easier for yourself.~
  IF ~~ THEN EXIT
END
END

// CHAMBERS //

REPLACE UDPHAE01
IF ~~ THEN BEGIN 96 // from: 95.0
  SAY #51759 /* ~"All love is foolish." You have done well, Veldrin... you have earned a place of honor in this House by serving me well. This shall not stop, naturally.~ */
  IF ~~ THEN GOTO 97
END
END

REPLACE UDPHAE01
IF ~  Global("PhaereJob","GLOBAL",7)
GlobalLT("PhaereInnuendo","GLOBAL",2)
~ THEN BEGIN 100 // from:
  SAY ~I find you useful, Veldrin. You are a strong and powerful servant... worthy of my bed. You shall remain here for a time and please me... Come.~
  IF ~Gender(Player1,MALE)~ THEN REPLY #51781 /* ~I... I can't, Phaere.~ */ GOTO 101
  + ~Gender(Player1,FEMALE)~ + ~I... I can't, Phaere.~ + OW#PHA1
  IF ~Gender(Player1,MALE)~ THEN REPLY #51782 /* ~Is this really necessary?~ */ GOTO 102
  + ~Gender(Player1,FEMALE)~ + ~Is this really necessary?~ + OW#PHA2
  IF ~~ THEN REPLY #51783 /* ~If... if I must, then I suppose I have no choice...~ */ GOTO 103
  IF ~~ THEN REPLY #51784 /* ~I'm all for that!~ */ GOTO 103
END
END

REPLACE UDPHAE01
IF ~~ THEN BEGIN 108 // from: 105.4 105.2 105.0
  SAY #51834 /* ~*snort* You are not a good liar, Veldrin. Is this a game, hmm? Come to me, my dark lovely one... come and I shall fix your little "problem"...~ */
  IF ~Gender(Player1,MALE)~ THEN REPLY #51835 /* ~No! I do not want to do this!~ */ GOTO 104
  + ~Gender(Player1,FEMALE)~ + ~No! I do not want to do this!~ + OW#PHA3
  IF ~~ THEN REPLY #51836 /* ~It's not a game... it's just that... that I belong to another.~ */ GOTO 106
  IF ~~ THEN REPLY #51837 /* ~Very well, if I have no choice.~ */ GOTO 103
END
END

REPLACE UDPHAE01
IF ~~ THEN BEGIN 110 // from: 166 106.7 106.3 106.2 106.1 106.0
  SAY #51840 /* ~*snort* The female who fights by your side? What do I care if you dally with her? But I shall have her executed before I allow you to choose her over me.~ */
  IF ~~ THEN REPLY #51841 /* ~Well, all right, it's not her... It's, uh, someone else you don't know...~ */ GOTO 111
  IF ~Gender(Player1,MALE)~ THEN REPLY #51842 /* ~But I still can't do this, Phaere...~ */ GOTO 101
  + ~Gender(Player1,FEMALE)~ + ~But I still can't do this, Phaere...~ + OW#PHA1
  IF ~Gender(Player1,MALE)~ THEN REPLY #51843 /* ~Well, perhaps it's not someone... it's, ah, a more personal problem...~ */ GOTO 105
  + ~Gender(Player1,FEMALE)~ + ~Well, perhaps it's not someone... it's, ah, a more personal problem...~ + OW#PHA4
  IF ~~ THEN REPLY #51844 /* ~Very well. I suppose I have no choice here.~ */ GOTO 103
END
END

REPLACE UDPHAE01
IF ~~ THEN BEGIN 166 // from: 106.6 106.5 106.4
  SAY #102460 /* ~*snort* The male who fights by your side? What do I care if you dally with him? But I shall have him executed before I allow you to choose him over me.~ */
  IF ~~ THEN REPLY #102461 /* ~Well, all right, it's not him... It's, uh, someone else you don't know...~ */ GOTO 111
  IF ~Gender(Player1,MALE)~ THEN REPLY #51842 /* ~But I still can't do this, Phaere...~ */ GOTO 101
  + ~Gender(Player1,FEMALE)~ + ~But I still can't do this, Phaere...~ + OW#PHA1
  IF ~Gender(Player1,MALE)~ THEN REPLY #51843 /* ~Well, perhaps it's not someone... it's, ah, a more personal problem...~ */ GOTO 105
  + ~Gender(Player1,FEMALE)~ + ~Well, perhaps it's not someone... it's, ah, a more personal problem...~ + OW#PHA4
  IF ~~ THEN REPLY #51844 /* ~Very well. I suppose I have no choice here.~ */ GOTO 103
END
END

APPEND UDPHAE01
  IF ~~ THEN BEGIN OW#PHA1 // from: OW#PHA2.1 166.3 110.3 100.1
  SAY ~What do you mean, "can't"? Are you not interested in the favor of House Despana? Why do you balk?!~
  ++ ~Because I do not wish to do this!~ + OW#PHA3
  ++ ~Because I mean what I say... I "can't"!~ + OW#PHA4
  ++ ~Because I, ah, belong to another.~ + 106
  ++ ~Well, if you command it, I suppose I have no choice...~ + 103
END

IF ~~ THEN BEGIN OW#PHA2 // from: OW#PHA1 100.3
  SAY ~Of course it is necessary, fool. Do you not wish the favor of my house? The delights of my body? I know you to be a powerful woman, Veldrin. This sudden meekness does not become you.~
  ++ ~No, I do not wish this.~ + OW#PHA3
  ++ ~I can't do this, Phaere.~ + OW#PHA1
  ++ ~If... if I must, then I suppose I have no choice...~ + 103
END

IF ~~ THEN BEGIN OW#PHA3 // from: OW#PHA5.0 OW#PHA2.0 OW#PHA1.0 108.1
  SAY ~Your wishes do not come into this. Do not act so meek, Veldrin, when I know that the Spider Queen has blessed you with her strength. Come to me and know pleasure... or refuse and pay the ultimate price.~
  ++ ~No! I still won't do this with you, no matter what you say!~ + 107
  ++ ~I... I really can't, Phaere... I mean I *really* can't.~ + OW#PHA4
  ++ ~I cannot. I, ah, belong to another.~ + 106
  ++ ~Very well. If I must, I suppose I have no choice...~ + 103
END

IF ~~ THEN BEGIN OW#PHA4 // from: OW#PHA1.1 OW#PHA3.1 166.4 110.4
  SAY ~What nonsense do you speak? You have hands and a tongue. I am sure I can put you to some use.~
  + ~CheckStatLT(Player1,13,CHR) CheckStatGT(Player1,16,INT)~ + ~I, ah... swore an oath to Lolth. I, ah... cannot speak of it.~ + 108
  + ~CheckStatGT(Player1,12,CHR) CheckStatGT(Player1,16,INT)~ + ~I swore an oath to Lolth to remain celibate. I cannot speak more of it.~ + 109
  + ~CheckStatLT(Player1,15,CHR) CheckStatGT(Player1,14,INT)~ + ~It's... it's a curse. A curse that, uh, you can't remove. It prevents me from, um, becoming... ah, intimate.~ + 108
  + ~CheckStatGT(Player1,14,CHR) CheckStatGT(Player1,14,INT)~ + ~I am afflicted with an insidious curse, Phaere. It is not easily removed, I am afraid... I can do nothing about it.~ + 109
  + ~CheckStatLT(Player1,17,CHR)~ + ~I... ah... you see, it’s my time of the month...~ + OW#PHA5
  + ~CheckStatGT(Player1,16,CHR)~ + ~It’s not that I’m not capable, Phaere, it is that I have designs that could bring you further pleasure still. There is a certain device that I seek to have crafted... made from the bone of a silver dragon.~ + OW#PHA6
  ++ ~Uh... well, maybe it's not a physical issue, but I still can't...~ + 101
  ++ ~I... I suppose you caught me. Fine... if I have no choice...~ + 103
END

IF ~~ THEN BEGIN OW#PHA5 // from: OW#PHA4.4
  SAY ~*snort* You think I will wilt at a bit of blood? Come, Veldrin. A bit of pleasure will ease any aches you have.~
  ++ ~No! I do not want to do this!~ + OW#PHA2
  ++ ~It's not just that... I belong to another.~ + 106
  ++ ~Very well, if I have no choice.~ + 103
END

IF ~~ THEN BEGIN OW#PHA6 // from: OW#PHA4.5
    SAY ~Oh. My, my, Veldrin! I did not expect you to have such exquisite tastes! Very well. It is rare that I see fit to delay my pleasure, but the thought of you bringing such a magnificent creature low and using its death to serve your betters... I await the moment eagerly.~
  IF ~~ THEN DO ~SetGlobal("CheckMad","AR2204",1)
SetGlobal("CheckMad","AR2204",1)
SetGlobal("CheckMad","AR2204",1)
SetGlobal("PhaereInnuendo","GLOBAL",3)
~ GOTO 98
END
END

//////////////////////////
// COMPANION REACTIONS //
////////////////////////

// AERIE //
REPLACE AERIEJ
IF ~  Global("AerieCheckMad2","GLOBAL",1)
See(Player1)
!StateCheck(Player1,STATE_SLEEPING)
OR(2)
Global("AerieRomanceActive","GLOBAL",1)
Global("AerieRomanceActive","GLOBAL",2)
Global("PhaereInnuendo","GLOBAL",2)
!Range("Phaere",6)
Global("AerieMad2","LOCALS",0)
~ THEN BEGIN 124 // from:
  SAY #52252 /* ~You... you let that drow woman... touch you, didn't you? You let such an evil thing... all over you? I just... I just can't understand why you would allow such a thing to happen!~ */
  ++ ~Aerie, please listen to me. I didn't want to do anything with her. She forced me.~ DO ~SetGlobal("AerieMad2","LOCALS",1)~ + OW#AER1
  ++ ~Here's the crybaby routine again. When will you understand that this world isn't a fairytale?~ DO ~SetGlobal("AerieMad2","LOCALS",1)~ + OW#AER3
END
END

APPEND AERIEJ
IF ~~ THEN BEGIN OW#AER1 // from: 124.0
  SAY ~F-Forced you? No, that's... that's far worse than what I thought. I...~
  IF ~~ THEN GOTO OW#AER2
END

IF ~~ THEN BEGIN OW#AER2 // from: OW#AER1
  SAY ~Oh, I'm sorry! I made assumptions and you... you went through something horrible! I won’t let her near you again! I promise!~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#AER3 // from: 124.1
  SAY ~I... I think I know the cruelty of this world far better than you!~
IF ~~ THEN GOTO 125
END
END

// ANOMEN //
APPEND ANOMENJ
IF ~Global("OWANO_phaere","GLOBAL",1)~ THEN BEGIN OW#ANO8 // from:
  SAY ~What in the blazes just happened? Were you... *flirting* with that woman?~
  ++ ~Can you blame me? She's quite easy on the eyes.~ DO ~SetGlobal("OWANO_phaere","GLOBAL",2)~ + OW#ANO9
  ++ ~I'm just blending in with the locals. There's no need for you to worry.~ DO ~SetGlobal("OWANO_phaere","GLOBAL",2)~ + OW#ANO10
  ++ ~I don't recall asking for your input.~ DO ~SetGlobal("OWANO_phaere","GLOBAL",2)~ + OW#ANO11
END

IF ~~ THEN BEGIN OW#ANO9 // from: OW#ANO8.0
  SAY ~That is quite beside the point! We're in enemy territory, <CHARNAME>. She is as like to cut you as kiss you.~
  ++ ~I'm just blending in with the locals. There's no need for you to worry~ + OW#ANO10
  ++ ~That's all part of the appeal. Now quiet down and let me handle this.~ + OW#ANO12
END

IF ~~ THEN BEGIN OW#ANO10 // from: OW#ANO9.0 OW#ANO8.1
  SAY ~And yet worry I shall! Do not... do not do anything reckless. These drow are far more adept at games of manipulation than you or I could ever hope to be.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#ANO11 // from: OW#ANO8.2
  SAY ~Indeed you did not.~
  IF ~~ THEN GOTO OW#ANO12
END

IF ~~ THEN BEGIN OW#ANO12 // from: OW#ANO11 OW#ANO9.1
  SAY ~I see that my thoughts matter little to you. Very well. Enjoy your dalliance with the spider-kisser. You won't hear a word from me on the matter.~
  IF ~~ THEN DO ~SetGlobal("AnomenRomanceActive","GLOBAL",3)
~ EXIT
END

IF ~Global("OWANO_phaere","GLOBAL",3)~ THEN BEGIN OW#ANO13 // from:
  SAY ~Well, you two were in there for quite a while. Is there... anything I should know?~
  ++ ~I didn’t have a choice, Anomen. Let’s leave it at that.~ DO ~SetGlobal("OWANO_phaere","Global",4)~ + OW#ANO14
  ++ ~Eager for all the sordid details?~ DO ~SetGlobal("OWANO_phaere","Global",4)~ + OW#ANO15
  ++ ~Shut up. I don’t want to hear any more of your condescension.~ DO ~SetGlobal("OWANO_phaere","Global",4)~ + OW#ANO16
END

IF ~~ THEN BEGIN OW#ANO14 // from: OW#ANO13.0
  SAY ~I see. Apologies, my <PRO_LADYLORD>. I shouldn’t have made assumptions. Rest assured that I will not allow that woman to lay her hands on you again.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#ANO15 // from: OW#ANO13.1
  SAY ~I certainly am not! I thought perhaps you had an explanation for your actions, but perhaps I was too generous in that assumption.~
  IF ~~ THEN GOTO OW#ANO16
END

IF ~~ THEN BEGIN OW#ANO16 // from: OW#ANO15 OW#ANO13.2
  SAY ~Very well. If I am such a bother, I shan’t interfere with any of your other poor choices.~
  IF ~~ THEN DO ~SetGlobal("AnomenRomanceActive","GLOBAL",3)
~ EXIT
END

IF ~  Global("OWANO_phaere","GLOBAL",5)~ THEN BEGIN OW#ANO17 // from:
  SAY ~You're... you're back. So soon! Not that I, er, expected anything untoward would occur. Perhaps we should continue onward, then?~
  IF ~~ THEN DO ~SetGlobal("OWANO_phaere","Global",6)
~ EXIT
END
END

// Hexxat //
APPEND HEXXATJ
IF ~Global("OWH_phaere","GLOBAL",1)~ THEN BEGIN OW#HEX7 // from:
  SAY ~Did the drow woman satisfy you, <CHARNAME>?~
  ++ ~It wasn't like that, Hexxat.~ DO ~SetGlobal("OWH_phaere","GLOBAL",2)~ + OW#HEX8
  ++ ~I wish you had been there.~ DO ~SetGlobal("OWH_phaere","GLOBAL",2)~ + OW#HEX10
END

IF ~~ THEN BEGIN OW#HEX8 // from: OW#HEX7.0
  SAY ~Relax, <CHARNAME>. If I felt threatened by the woman I would have said as much the first time she laid eyes on you.~
  IF ~~ THEN GOTO OW#HEX9
END

IF ~~ THEN BEGIN OW#HEX9 // from: OW#HEX8
  SAY ~I don’t mind the occasional dalliance, especially when it brings us closer to our goal. For now, let us continue.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#HEX10 // from: OW#HEX9.1
  SAY ~Me too. You’ll have to fill me in on the details later. I’m quite curious.~
  IF ~~ THEN EXIT
END
END

// Jaheira //
REPLACE JAHEIRAJ
IF ~~ THEN BEGIN 445 // from: 441.3
  SAY ~I am sorry too, and disappointed, but I suppose it could not be avoided... with your supposed station in this guise. I shall... attempt to forget about it.~
  IF ~~ THEN EXIT
END
END

// Rasaad //
APPEND RASAADJ
IF ~Global("OWR_phaere","GLOBAL",1)~ THEN BEGIN OW#RAS9 // from:
  SAY ~Are you alright?~
  ++ ~No. I don’t think I am.~ DO ~SetGlobal("OWR_phaere","GLOBAL",2)~ + OW#RAS10
  ++ ~It was nothing, Rasaad. I’ve been through far worse ordeals.~ DO ~SetGlobal("OWR_phaere","GLOBAL",2)~ + OW#RAS13
  ++ ~I'm better than alright!~ DO ~SetGlobal("OWR_phaere","GLOBAL",2)~ + OW#RAS14
END

IF ~~ THEN BEGIN OW#RAS10 // from: OW#RAS9.0
  SAY ~<CHARNAME>... I am so sorry. I should have protected you. I wanted to protect you.~
  IF ~~ THEN GOTO OW#RAS11
END

IF ~~ THEN BEGIN OW#RAS11 // from: OW#RAS10
  SAY ~It is... not in my nature to desire revenge. And yet still I would have it for your sake.~
  IF ~~ THEN GOTO OW#RAS12
END

IF ~~ THEN BEGIN OW#RAS12 // from: OW#RAS11 OW#RAS13
  SAY ~With luck we will find an opportunity to set this right.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN OW#RAS13 // from: OW#RAS9.1
  SAY ~That does not mean you should have to endure it alone.~
  IF ~~ THEN GOTO OW#RAS11
END

IF ~~ THEN BEGIN OW#RAS14 // from: OW#RAS9.2
  SAY ~That is... good. I admit I had feared a much worse experience was in store for you.~
  IF ~~ THEN GOTO OW#RAS15
END

IF ~~ THEN BEGIN OW#RAS15 // from: OW#RAS14
  SAY ~Let us continue onward.~
  IF ~~ THEN EXIT
END
END

// Viconia - Located in OW#VICON //