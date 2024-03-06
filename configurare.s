;Echipa THETA-configurare sistem pentru masina de spalat vase
;Badea Cosmin Sebastian
;Costea Antonia Ioana
;Halmaghi Alexandra-Maria
;Hancu Alexandra

.org 3200H ;definim un spatiu de memorie

CS_ENTRY_POINT:

	ld IX, CS_DISPLAY_TEXT_CHOOSE     ;incarcam in IX, bloc afisare
	call 05FEH; functia scan pentru citire pana o tasta este apasata
	
	CP KEY_A					;se verifica apasarea tastei A
	JP Z, CS_CONFIG_SELECTION	;daca a fost apasata, ne trimite in configurarea de selectie a programului

	CP KEY_B					;se verifica apasarea tastei B
	JP Z, CS_CONFIG_LATE		;daca a fost apasata, ne trimite in configurarea pornirii intarziate
	
	CP KEY_C					;se verifica apasarea tastei C
	JP Z, CS_CONFIG_EXPRESS		;daca a fost apasata, ne trimite in configurarea functiei expres
	
	CP KEY_D					;se verifica apasarea tastei D
	JP Z, CS_CONFIG_HALF		;daca a fost apasata, ne trimite in configurarea functiei half
	
	CP KEY_DEL
	JP Z, CS_EXIT
	
	CP KEY_PGUP
	JP Z, CS_CONFIG_SELECTION

	JP CS_ENTRY_POINT			;daca este apasata alta tasta, nu se intampla nimic (se intoarce la intrarea entry point-ului)
	
CS_CONFIG_SELECTION:

	ld IX, CS_CFG_TXT
	call 05FEH
	
	CP KEY_A
	JP Z, CS_CS_P1
	
	CP KEY_B
	JP Z, CS_CS_P2
	
	CP KEY_C
	JP Z, CS_CS_P3
	
	CP KEY_D
	JP Z, CS_CS_P4
	
	CP KEY_E
	JP Z, CS_CS_P5
	
	CP KEY_F
	JP Z, CS_CS_P6
	
	CP KEY_PGDN
	JP Z, CS_ENTRY_POINT
	
	CP KEY_PGUP
	JP Z, CS_CONFIG_LATE
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_CONFIG_SELECTION

CS_CS_P1:
	ld IX, CS_CS_P1_TXT
	call 05FEH
	
	CP KEY_0
	JP Z, CS_OFF_STATE
	
	CP KEY_1
	JP Z, CS_ON_STATE
	
	CP KEY_PGDN
	JP Z, CS_CONFIG_SELECTION
	
	CP KEY_B
	JP Z, CS_CS_P2
	
	CP KEY_C
	JP Z, CS_CS_P3
	
	CP KEY_D
	JP Z, CS_CS_P4
	
	CP KEY_E
	JP Z, CS_CS_P5
	
	CP KEY_F
	JP Z, CS_CS_P6
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_CS_P1
	

CS_CS_P2:
	ld IX, CS_CS_P2_TXT
	call 05FEH
	
	CP KEY_0
	JP Z, CS_OFF_STATE
	
	CP KEY_1
	JP Z, CS_ON_STATE
	
	CP KEY_PGDN
	JP Z, CS_CONFIG_SELECTION
	
	CP KEY_A
	JP Z, CS_CS_P1
	
	CP KEY_C
	JP Z, CS_CS_P3
	
	CP KEY_D
	JP Z, CS_CS_P4
	
	CP KEY_E
	JP Z, CS_CS_P5
	
	CP KEY_F
	JP Z, CS_CS_P6
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_CS_P2
	
CS_CS_P3:
	ld IX, CS_CS_P3_TXT
	call 05FEH
	
	CP KEY_0
	JP Z, CS_OFF_STATE
	
	CP KEY_1
	JP Z, CS_ON_STATE
	
	CP KEY_PGDN
	JP Z, CS_CONFIG_SELECTION
	
	CP KEY_A
	JP Z, CS_CS_P1
	
	CP KEY_B
	JP Z, CS_CS_P2
	
	CP KEY_D
	JP Z, CS_CS_P4
	
	CP KEY_E
	JP Z, CS_CS_P5
	
	CP KEY_F
	JP Z, CS_CS_P6
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_CS_P3
	
CS_CS_P4:
	ld IX, CS_CS_P4_TXT
	call 05FEH
	
	CP KEY_0
	JP Z, CS_OFF_STATE
	
	CP KEY_1
	JP Z, CS_ON_STATE
	
	CP KEY_PGDN
	JP Z, CS_CONFIG_SELECTION
	
	CP KEY_A
	JP Z, CS_CS_P1
	
	CP KEY_B
	JP Z, CS_CS_P2
	
	CP KEY_C
	JP Z, CS_CS_P3
	
	CP KEY_E
	JP Z, CS_CS_P5
	
	CP KEY_F
	JP Z, CS_CS_P6
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_CS_P4
	
CS_CS_P5:
	ld IX, CS_CS_P5_TXT
	call 05FEH
	
	CP KEY_0
	JP Z, CS_OFF_STATE
	
	CP KEY_1
	JP Z, CS_ON_STATE
	
	CP KEY_PGDN
	JP Z, CS_CONFIG_SELECTION
	
	CP KEY_A
	JP Z, CS_CS_P1
	
	CP KEY_B
	JP Z, CS_CS_P2
	
	CP KEY_C
	JP Z, CS_CS_P3
	
	CP KEY_D
	JP Z, CS_CS_P4
	
	CP KEY_F
	JP Z, CS_CS_P6
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_CS_P5
	
CS_CS_P6:
	ld IX, CS_CS_P6_TXT
	call 05FEH
	
	CP KEY_0
	JP Z, CS_OFF_STATE
	
	CP KEY_1
	JP Z, CS_ON_STATE
	
	CP KEY_PGDN
	JP Z, CS_CONFIG_SELECTION
	
	CP KEY_A
	JP Z, CS_CS_P1
	
	CP KEY_B
	JP Z, CS_CS_P2
	
	CP KEY_C
	JP Z, CS_CS_P3
	
	CP KEY_D
	JP Z, CS_CS_P4
	
	CP KEY_E
	JP Z, CS_CS_P5
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_CS_P6

CS_CONFIG_LATE:
	ld IX, CS_LATE_TXT
	call 05FEH
	
	CP KEY_A
	JP Z, CS_CL_P30
	
	CP KEY_B
	JP Z, CS_CL_P60
	
	CP KEY_C
	JP Z, CS_CL_P90
	
	CP KEY_PGDN
	JP Z, CS_ENTRY_POINT
	
	CP KEY_PGUP
	JP Z, CS_CONFIG_EXPRESS
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_CONFIG_LATE
	
CS_CL_P30:
	ld IX, CS_CL_P30_TXT
	call 05FEH
	
	CP KEY_B
	JP Z, CS_CL_P60
	
	CP KEY_C
	JP Z, CS_CL_P90
	
	CP KEY_0
	JP Z, CS_OFF_STATE
	
	CP KEY_1
	JP Z, CS_ON_STATE
	
	CP KEY_PGDN
	JP Z, CS_CONFIG_LATE
	
	CP KEY_PGUP
	JP Z, CS_CL_P60
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_CL_P30 
	
CS_CL_P60:
	ld IX, CS_CL_P60_TXT
	call 05FEH
	
	CP KEY_A
	JP Z, CS_CL_P30
	
	CP KEY_C
	JP Z, CS_CL_P90
	
	CP KEY_0
	JP Z, CS_OFF_STATE
	
	CP KEY_1
	JP Z, CS_ON_STATE
	
	CP KEY_PGDN
	JP Z, CS_CONFIG_LATE
	
	CP KEY_PGUP
	JP Z, CS_CL_P90
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_CL_P60 
	
CS_CL_P90:
	ld IX, CS_CL_P90_TXT
	call 05FEH
	
	CP KEY_A
	JP Z, CS_CL_P30
	
	CP KEY_B
	JP Z, CS_CL_P60
	
	CP KEY_0
	JP Z, CS_OFF_STATE
	
	CP KEY_1
	JP Z, CS_ON_STATE
	
	CP KEY_PGDN
	JP Z, CS_CONFIG_LATE
	
	CP KEY_PGUP
	JP Z, CS_CL_P30
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_CL_P90

CS_CONFIG_EXPRESS:
	ld IX, CS_EXPRESS_TXT
	call 05FEH
	
	CP KEY_0
	JP Z, CS_OFF_STATE
	
	CP KEY_1
	JP Z, CS_ON_STATE
	
	CP KEY_PGDN
	JP Z, CS_ENTRY_POINT
	
	CP KEY_PGUP
	JP Z, CS_CONFIG_HALF
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_CONFIG_EXPRESS
	
CS_CONFIG_HALF:
	ld IX, CS_HALF_TXT
	call 05FEH
	
	CP KEY_0
	JP Z, CS_OFF_STATE
	
	CP KEY_1
	JP Z, CS_ON_STATE
	
	CP KEY_PGDN
	JP Z, CS_ENTRY_POINT
	
	CP KEY_PGUP
	JP Z, CS_ENTRY_POINT
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_CONFIG_HALF
	
CS_ON_STATE:
	ld IX, CS_ON_TXT
	call 05FEH
	
	CP KEY_0
	JP Z, CS_OFF_STATE
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_ON_STATE
	
CS_OFF_STATE:
	ld IX, CS_OFF_TXT
	call 05FEH
	
	CP KEY_1
	JP Z, CS_ON_STATE
	
	CP KEY_INSERT
	JP Z, CS_ENTRY_POINT
	
	JP CS_OFF_STATE

CS_EXIT:
	ld IX, CS_EXIT_TXT
	call 0624H

;!!!!TEXT SEGMENT!!!!

CS_DISPLAY_TEXT_CHOOSE:
	.db 08FH;	"E"
	.db 0AEH;	"S"
	.db 0BDH;	"O"
	.db 0BDH;	"O"
	.db 027H;	"h"
	.db 08DH;	"C"
	
CS_CFG_TXT:
	.db 0AFH;	"G"
	.db 05H; 	"I"
	.db 0FH;    "F"
	.db 023H;   "N"
	.db 0BDH;	"O"
	.db 08DH;	"C"
	
CS_LATE_TXT:
	.db 0
	.db 0
	.db 08FH;	"E"
	.db 087H;	"T"
	.db 03FH;   "A"
	.db 085H;   "L"
	
CS_EXPRESS_TXT:
	.db 0AEH;	"S"
	.db 08FH;	"E"
	.db 03H;	"R"
	.db 01FH;	"P"
	.db 037H;   "X"
	.db 08FH;	"E"
	
CS_HALF_TXT:
	.db 0
	.db 0
	.db 0FH;	"F"
	.db 085H;   "L"
	.db 03FH;   "A"
	.db 027H;	"h"

CS_CS_P1_TXT:
	.db 030H ;"1"
	.db 03H;	"R"
	.db 0AFH;	"G"
	.db 0BDH;	"O"
	.db 03H;	"R"
	.db 01FH;	"P"

CS_CS_P2_TXT:
	.db 09BH ;"2"
	.db 03H;	"R"
	.db 0AFH;	"G"
	.db 0BDH;	"O"
	.db 03H;	"R"
	.db 01FH;	"P"
	
CS_CS_P3_TXT:
	.db 0BAH ;"3"
	.db 03H;	"R"
	.db 0AFH;	"G"
	.db 0BDH;	"O"
	.db 03H;	"R"
	.db 01FH;	"P"
	
CS_CS_P4_TXT:
	.db 036H ;"4"
	.db 03H;	"R"
	.db 0AFH;	"G"
	.db 0BDH;	"O"
	.db 03H;	"R"
	.db 01FH;	"P"
	
CS_CS_P5_TXT:
	.db 0AEH;	"5"
	.db 03H;	"R"
	.db 0AFH;	"G"
	.db 0BDH;	"O"
	.db 03H;	"R"
	.db 01FH;	"P"
	
CS_CS_P6_TXT:
	.db 0AFH;	"6"
	.db 03H;	"R"
	.db 0AFH;	"G"
	.db 0BDH;	"O"
	.db 03H;	"R"
	.db 01FH;	"P"
	
CS_CL_P30_TXT:
	.db 0BDH;	"O"
	.db 0BAH ;  "3"
	.db 08FH;	"E"
	.db 087H;	"T"
	.db 03FH;   "A"
	.db 085H;   "L"
	
CS_CL_P60_TXT:
	.db 0BDH;	"O"
	.db 0AFH ;  "6"
	.db 08FH;	"E"
	.db 087H;	"T"
	.db 03FH;   "A"
	.db 085H;   "L"
	
CS_CL_P90_TXT:
	.db 0BDH;	"O"
	.db 0BEH ;  "9"
	.db 08FH;	"E"
	.db 087H;	"T"
	.db 03FH;   "A"
	.db 085H;   "L"
	
CS_ON_TXT:
	.db 0
	.db 0
	.db 023H;	"N"
	.db 0BDH;	"O"
	.db 0
	.db 0
	
CS_OFF_TXT:
	.db 0
	.db 0
	.db 0FH;	"F"
	.db 0FH;	"F"
	.db 0BDH;	"O"
	.db 0
	
CS_EXIT_TXT:
	.db 087H;	"T"
	.db 05H; 	"I"
	.db 037H;   "X"
	.db 08FH;	"E"


SCAN 	   .equ 05FEH ;directiva preprocesare, la fel ca un define
KEY_0	   .equ 00H
KEY_1	   .equ 01H
KEY_A 	   .equ 0Ah
KEY_B 	   .equ 0BH
KEY_C 	   .equ 0CH
KEY_D	   .equ 0DH
KEY_E	   .equ 0EH
KEY_F	   .equ 0FH
KEY_DEL    .equ 1CH
KEY_INSERT .equ 16H
KEY_PGDN   .equ 1BH
KEY_PGUP   .equ 1AH

.end
	rst 38H
