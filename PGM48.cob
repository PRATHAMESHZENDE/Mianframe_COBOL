       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. PGM48.
      *DIFF BETWEEN CONTINUE AND NEXT
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
      *-----------------------
       INPUT-OUTPUT SECTION.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
      *-----------------------
       WORKING-STORAGE SECTION.
       01 EMP-SAL         PIC 9(6) VALUE 100000.
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
            IF EMP-SAL = 100000
                CONTINUE
              ELSE
                ADD 50000 TO EMP-SAL
            END-IF
            DISPLAY "EMP SALARY " EMP-SAL
            DISPLAY "MY NAME IS PRATHAMESH"
      ***********************************************************
              IF EMP-SAL = 100000
                NEXT SENTENCE
              ELSE
                ADD 50000 TO EMP-SAL
             END-IF
             DISPLAY "EMP SALARY " EMP-SAL
             DISPLAY "MY NAME IS PRATHAMESH"
      *
            STOP RUN.

      *THE SCOPE OF THE NEXT SENTENCE FINISHES AFTER GETIING A FULLSTOP
      *IN CONTINUE THE SCOPE FINISHES AFTER MEETING THE SCOPE-TERMINATOR
      *END-IF
      *CONTINUE WAS INTRODUCED IN 1985 , WHILE NEXT SENTENCE IN 1974
