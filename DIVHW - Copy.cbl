       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. DIVHW.
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

       01 A PIC 9(2) VALUE 10.
       01 B PIC 9(2) VALUE 20.
       01 C PIC 9(2) .
       01 D PIC 9(2) .
       01 DIV PIC 9(3)V999.
       01 REM PIC 9(3).

      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
            DIVIDE A INTO B GIVING DIV
            DISPLAY DIV

            DIVIDE A INTO B GIVING C
            DISPLAY C

            DIVIDE A INTO B GIVING C REMAINDER D
            DISPLAY C," ", D

            *> DIVIDE 10 INTO A
            DISPLAY A

            DIVIDE A BY 10 GIVING DIV
            DISPLAY DIV

            DIVIDE 10 INTO A,B GIVING C,D


            STOP RUN.
