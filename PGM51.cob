       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. PGM50.
      *           LEARN HOW SEARCH ALL WORKS IN COBOL
      *
      *SEARCH ALL IS A BINARY SEARCH IT WORKS ONLY WHEN ENTRIES IN TABLE
      *IS SORTED ASCEND OR DESCEND THE INDEX DOES NOT REQUIRE
      *INITIALIZATION IT IS FASTER THAN SEARCH OPERATION
      *
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
      *
       01 WS-TABLE.
           05 WS-A  OCCURS 7 ASCENDING KEY WS-NUM INDEXED BY I.
           10 WS-NUM   PIC 9(1).
      *
       PROCEDURE DIVISION.
      *
       MAIN-PROCEDURE.
      *
            MOVE "1234567" TO WS-TABLE
            SEARCH ALL WS-A
            AT END DISPLAY "NO ENTRY FOUND "
            WHEN WS-NUM(I) = 1
            DISPLAY "RECORD FOUND"
            DISPLAY "WS-NUM " WS-NUM(I) "  " I
            END-SEARCH
            STOP RUN.
