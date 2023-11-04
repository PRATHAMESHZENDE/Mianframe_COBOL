       PROGRAM-ID. HomeWork.
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
       01 STDMRK1      PIC 9(2) VALUE 28.
       01 STDMRK2      PIC 9(2) VALUE 72.
       01 STDMRK3      PIC 9(2) VALUE 85.
       01 STDMRK4      PIC 9(2) VALUE 92.
       01 STDMRK5      PIC 9(2) VALUE 66.
       01 TOTAL        PIC 9(4).
       01 AVG_OF_CLASS PIC 9(2)V999.
      ***************************************
       01 TEMP_IN_DEGREE PIC 9(3)V99 VALUE 50.
       01 TEMP_IN_FARENHEIT PIC 9(3)V99.


      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.

       FIRST-PARAGRAPH.

            COMPUTE TOTAL= STDMRK1 + STDMRK2 + STDMRK3 + STDMRK4 +,
            STDMRK5
            COMPUTE AVG_OF_CLASS= TOTAL/5
            DISPLAY "CALCULATE AVERAGE MARKS OF STUDENTS"
            DISPLAY AVG_OF_CLASS

            COMPUTE TEMP_IN_FARENHEIT = (TEMP_IN_DEGREE *(9/5)) + 32
            DISPLAY "FARENHEIT = " TEMP_IN_FARENHEIT
            STOP RUN.

       END PROGRAM HomeWork.
