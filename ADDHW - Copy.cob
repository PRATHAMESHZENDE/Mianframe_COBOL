      ***************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. YOUR-PROGRAM-NAME.
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
       01 A   PIC 9(2) VALUE 10.
       01 B   PIC 9(2) VALUE 20.
       01 C   PIC 9(2) VALUE 30.
       01 D   PIC 9(2) VALUE 40.
       01 SUMA PIC 9(3).
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
            ADD A TO B GIVING SUMA
            DISPLAY SUMA


            ADD A,B,C TO D GIVING SUMA
            DISPLAY "A+B+C+D " SUMA

            ADD A,B TO C GIVING D
           DISPLAY "A+B " D

           ADD A TO B,C
           DISPLAY A,B,C

           ADD A,B GIVING C,D
           DISPLAY A,B,C,D

           ADD 10 TO A
           DISPLAY A

           ADD 10,20 TO A
           DISPLAY A

           ADD 10,A TO B
           DISPLAY A, B

           ADD 20 TO A,B
           DISPLAY A,B


             STOP RUN.
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
