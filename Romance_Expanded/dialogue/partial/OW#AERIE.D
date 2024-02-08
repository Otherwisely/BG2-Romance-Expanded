BEGIN ~OW#AERIE~

/////////////////
// LOVE TALKS //
///////////////

// LT7 //
REPLACE BVICONI
IF ~~ THEN BEGIN 537 // from:
  SAY #56242 /* ~Must you act so pathetically within the earshot of others? What is it that you expect <PRO_HIMHER> to say? That <PRO_HESHE> thinks your scars add character? Ha. Are you truly so witless?~ [VICONIC5] */
  IF ~~ THEN EXTERN ~BAERIE~ 416
END
END

REPLACE BAERIE
IF ~~ THEN BEGIN 416 // from:
  SAY #56243 /* ~I was talking to <PRO_HIMHER>, not to you! You've made your feelings on everything apparent enough!~ [AERIED3] */
  IF ~~ THEN EXTERN ~BVICONI~ 538
END
END

// LT13 //
REPLACE BAERIE
IF ~~ THEN BEGIN 423 // from:
  SAY #56270 /* ~You are no martyr, Viconia. You don't fool me! And... and I am not interested in *your* travels—I was asking <CHARNAME> about <PRO_HISHERS>!~ */
  IF ~~ THEN REPLY #56271 /* ~I have been traveling since I left Candlekeep many, many months ago.~ */ GOTO 168
  IF ~~ THEN REPLY #56272 /* ~I am not interested in discussing my travels, Aerie.~ */ GOTO 172
  IF ~~ THEN REPLY #56273 /* ~Viconia's right... if you want to whine about your difficulties, do it somewhere else.~ */ GOTO 173
END
END

// LT17 //
REPLACE BAERIE
IF ~~ THEN BEGIN 426 // from:
  SAY #56283 /* ~Oh yes, I know! I've seen you sizing <PRO_HIMHER> up like... like <PRO_HESHE>'s some piece of steak! You think the rest of us don't know?~ [AERIED7] */
  IF ~~ THEN EXTERN ~BVICONI~ 542
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 543 // from:
  SAY #56286 /* ~If <CHARNAME> shows you the slightest attention, it is out of pity for a poor little dove. The same cannot be said for anyone's interest in *me*.~ */
  IF ~~ THEN EXTERN ~BAERIE~ 428
END
END

// LT25 //
REPLACE BVICONI
IF ~~ THEN BEGIN 544 // from:
  SAY #56306 /* ~Indeed you are. I have little idea why <PRO_HESHE> even keeps you about.~ [VICONIC8] */
  IF ~~ THEN EXTERN ~BAERIE~ 431
END
END

REPLACE BAERIE
IF ~~ THEN BEGIN 431 // from:
  SAY #56307 /* ~Shut up, drow! Shut up! Ugh! As if anyone would listen to... to the opinions of some poisonous serpent! Spend your venom elsewhere, Viconia; <PRO_HESHE> won't listen to you!~ [AERIED8] */
  IF ~~ THEN EXTERN ~BVICONI~ 545
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 545 // from:
  SAY #56308 /* ~What if <PRO_HESHE> will? Perhaps my charms appeal more than yours. You might amuse for a few moments, but <CHARNAME> deserves someone of vigor like me.~ */
  IF ~~ THEN EXTERN ~BAERIE~ 432
END
END

REPLACE BVICONI
IF ~~ THEN BEGIN 547 // from:
  SAY #56312 /* ~Perhaps we should ask <PRO_HIMHER>. What of it, <CHARNAME>? You don't actually see anything in this cripple, do you? Put her in her place, as it should be.~ */
  IF ~~ THEN REPLY #56313 /* ~Knock it off, Viconia! You don't hold a candle to Aerie when it comes to beauty in any form!~ */ GOTO 548
  IF ~~ THEN REPLY #56314 /* ~I like Aerie. I'm not going to put her in her place, and neither will you.~ */ GOTO 549
  IF ~~ THEN REPLY #56315 /* ~I may not be interested in Aerie, but I don't want to hurt her feelings, Viconia.~ */ GOTO 550
  IF ~~ THEN REPLY #56316 /* ~Of course I don't see anything in Aerie. It's a trial just having her around half the time.~ */ EXTERN ~BAERIE~ 436
END
END

REPLACE BAERIE
IF ~~ THEN BEGIN 435 // from:
  SAY #56321 /* ~Obviously, you two... deserve each other then. I... I'll just go and sleep elsewhere then, and be alone. You are not the person I mistook you for, <CHARNAME>.~ */
  IF ~~ THEN DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)
RestPartyEx(0,0,FALSE)
~ EXIT
END
END

///////////////
//// MISC ////
/////////////
REPLACE AERIEJ
IF ~~ THEN BEGIN 45 // from:
  SAY #39399 /* ~N-no! No, <PRO_HESHE> isn't! <CHARNAME> has more than enough company, and no need for your... your... filth!~ */
  IF ~~ THEN DO ~SetGlobal("MadamUpset","GLOBAL",1)
~ EXTERN ~MADAM~ 17
END
END