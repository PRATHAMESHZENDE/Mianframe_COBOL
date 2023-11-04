       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. PGM52.
       ENVIRONMENT DIVISION.
      *SHOWS HOW A SEQUQNTIAL UPDATE WORKS
       CONFIGURATION SECTION.
      *-----------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
                SELECT OLD-MASTER ASSIGN TO      "D:\Vidhushi Gyanpeeth\
      -"Program File Cobol\INPUT FOLDER\OldMaster.txt"
            FILE STATUS IS WS-STATUS1
              ORGANIZATION IS LINE SEQUENTIAL.
      *
          SELECT TRANS-FILE ASSIGN TO            "D:\Vidhushi Gyanpeeth\
      -"Program File Cobol\INPUT FOLDER\TransFile.txt"
            FILE STATUS IS WS-STATUS2
              ORGANIZATION IS LINE SEQUENTIAL.
      *
.         SELECT NEW-MASTER ASSIGN TO            "D:\Vidhushi Gyanpeeth\
      -"Program File Cobol\OUTPUT FOLDER\NewMaster.txt"
            FILE STATUS IS WS-STATUS3
              ORGANIZATION IS LINE SEQUENTIAL.
      *
       DATA DIVISION.
      *
       FILE SECTION.
       FD OLD-MASTER.
      *      RECORD CONTAINS 100 CHARACTERS
      *     RECORDING MODE IS F
      *     FILE-IDBLOCK CONTAINS 1000 CHARACTERS.
        01 OLD-MASTER-REC.
            05 OM-ACCT-NO    PIC X(5).
            05 OM-AMOUNT     PIC 9(5).
      *
       FD TRANS-FILE.
       01 TRANS-REC.
           05 T-ACCT-NO    PIC X(5).
            05 T-AMOUNT     PIC 9(5).
            05 FILLER       PIC X(90).
      *
       FD NEW-MASTER.
       01 NEW-MASTER-REC.
           05 NM-ACCT-NO    PIC X(5).
            05 NM-AMOUNT     PIC 9(5).
      *
       WORKING-STORAGE SECTION.
      *
       01 WS-STATUS1   PIC 99.
       01 WS-STATUS2   PIC 99.
       01 WS-STATUS3   PIC 99.
      *
       PROCEDURE DIVISION.
      *
       000-MAIN-MODULE.
      *
      * this para controls the direction of the prigram logic
      *
             DISPLAY "PROGRAM START"
             PERFORM 100-INITIALIZATION-RTN
             PERFORM 200-READ-MASTER
             PERFORM 300-READ-TRANS
             PERFORM 400-COMPARE-RTN
             UNTIL OM-ACCT-NO = HIGH-VALUES
             AND
                   T-ACCT-NO = HIGH-VALUES
      *HIGH VAKUES US THE HIGHEST POSSIBLE NUMBER THAT A COMPUTER
      *CAN GENERATE . IT IS ALSO A FIGURATIVE CONSTANT IN COBOL.
      *IF THE OLD MASTER FILE AND THE TRANSCATION FILE ARE NOT OF SAME
      *LENGTH IT'S RECOMMENDED TO USE HIGH-VALUES
            PERFORM 500-CLOSE-RTN
            DISPLAY "PROGRAM END."
            STOP RUN.
      *
       100-INITIALIZATION-RTN.
      *
      *it is invoked by 000-MAIN-MODULE and it opens all the files
      *
            OPEN INPUT OLD-MASTER
            OPEN INPUT TRANS-FILE
            OPEN OUTPUT NEW-MASTER
            .
      *
       200-READ-MASTER.
      *this para is invoked from 00-main-module 600-regukar-update and
      * 700-NEW-ACCOUNT
      *it reads master records
      *
                 READ OLD-MASTER
                 AT END MOVE HIGH-VALUES TO OM-ACCT-NO
                 END-READ.
      *
       300-READ-TRANS.
      *
      *this para is invoked from 000-MAIN-MODULE and 700-no-update
      *reads trans records
      *
                 READ TRANS-FILE
                 AT END MOVE HIGH-VALUES TO T-ACCT-NO
                 END-READ.
      *
       400-COMPARE-RTN .
      *
      *is performed from 000-main-module . it compares the accouunt
      *number of old master with transaction file to decude what action
      *to take.
      *
            EVALUATE TRUE
                WHEN T-ACCT-NO = OM-ACCT-NO
                PERFORM 600-REGULAR-UPDATE
                WHEN T-ACCT-NO < OM-ACCT-NO
                PERFORM 700-NEW-ACCOUNT
                WHEN OTHER
                PERFORM 800-NO-UPDATE
            END-EVALUATE.
      *
       500-CLOSE-RTN.
      *
      *it is invoked by 000-MAIN-MODULE and it opens all the files
      *
             CLOSE OLD-MASTER
             TRANS-FILE
             NEW-MASTER.
      *
       600-REGULAR-UPDATE.
      *
      *is performed fro 400-comp-rtn it combines the old0master and
      *transaction file to produce a new master recirds
      *
      *
            MOVE SPACES TO NEW-MASTER-REC
            MOVE OLD-MASTER-REC TO NEW-MASTER-REC
            COMPUTE NM-AMOUNT = T-AMOUNT + OM-AMOUNT
            WRITE NEW-MASTER-REC
            PERFORM 200-READ-MASTER
            PERFORM 300-READ-TRANS.
      *
       700-NEW-ACCOUNT.
      *
      *it is performed from 400-cpompare rtn adds new account to the new
      *master fro transaction file
      *
           MOVE SPACES TO NEW-MASTER-REC
           MOVE T-ACCT-NO TO NM-ACCT-NO
           MOVE T-AMOUNT TO NM-AMOUNT
           WRITE NEW-MASTER-REC
           PERFORM 300-READ-TRANS.
      *
       800-NO-UPDATE.
      *
      *it is performed by 400-comp-rtn it copies old master to
      *new master
            WRITE NEW-MASTER-REC FROM OLD-MASTER-REC
            PERFORM 200-READ-MASTER.
