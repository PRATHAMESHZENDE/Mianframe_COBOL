       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID. EVENODDHW.
       ENVIRONMENT DIVISION.
      *
       CONFIGURATION SECTION.
      *
       INPUT-OUTPUT SECTION.
      *
       DATA DIVISION.
      *
       FILE SECTION.
      *
       WORKING-STORAGE SECTION.
       01 WS-INPUT.
           02 WS-NUM      PIC 9(3) VALUE ZERO.
           02 WS-CHOICE   PIC A(1) VALUE "Y".
       01 WS-OUTPUT.
          02 WS-REMAINDER PIC 9(3) VALUE ZERO.
          02 WS-QUOTIONT  PIC 9(3).
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
       00-PARA1.
          PERFORM UNTIL WS-CHOICE = "N"
            DISPLAY "      CHECK A NUMBER IS EVEN OR ODD."
            DISPLAY "       ENTER A NUMBER ."
            ACCEPT WS-NUM
             DIVIDE WS-NUM BY 2 GIVING WS-QUOTIONT
             REMAINDER WS-REMAINDER
                IF WS-REMAINDER IS NOT EQUAL TO 0
                    DISPLAY "--------------------------------------"
                    DISPLAY "-         ODD NUMBER                 -"
                    DISPLAY "--------------------------------------"
                ELSE
                    DISPLAY "--------------------------------------"
                    DISPLAY "-         EVEN NUMBER                -"
                    DISPLAY "--------------------------------------"
                END-IF
             DISPLAY "**************************************"
             DISPLAY "   DO YOU WANT TO CONTINUE ? (Y/N) "
             DISPLAY "**************************************"
             ACCEPT WS-CHOICE
          END-PERFORM
         DISPLAY "    ******** PROGRAM END ********"
       STOP RUN.
