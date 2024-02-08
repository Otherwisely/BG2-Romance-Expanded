BEGIN ~OW#JAHEI~

/////////////////
// LOVE TALKS //
///////////////

// LT21 //
REPLACE BJAHEIR
IF ~~ THEN BEGIN 450 // from:
  SAY #56398 /* ~My words were for <PRO_HIMHER>, drow. You shall know I am addressing you if I spit in your direction.~ [JAHEIRF9] */
  IF ~~ THEN EXTERN ~BVICONI~ 568
END
END

REPLACE BJAHEIR
IF ~~ THEN BEGIN 451 // from:
  SAY #56400 /* ~<CHARNAME>'s and my own relationship is none of your concern, if you could even conceive of such a notion. I shall speak to <PRO_HIMHER>, and you will be silent.~ */
  IF ~~ THEN GOTO 189
END
END

// PHAERE - IN OW#PHAER //

///////////////
//// MISC ////
/////////////
REPLACE JAHEIRAJ
IF ~~ THEN BEGIN 325 // from:
  SAY #39398 /* ~No, <PRO_HESHE> is not. <PRO_HESHE> has no interest in anything you might have to sell, woman.~ */
  IF ~~ THEN EXTERN ~MADAM~ 17
END
END