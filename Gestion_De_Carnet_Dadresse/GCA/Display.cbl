       IDENTIFICATION DIVISION. 
       PROGRAM-ID. Display-File.
               
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT contacts ASSIGN TO 'CONTACTS.idx'
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS ID_Contact . 

       DATA DIVISION. 
       FILE SECTION. 
       FD contacts.
       01 contact-record.
           05 ID_Contact Pic 9(5).
           05 First_Name PIC  X(50).
           05 Last_Name PIC X(50).
           05 Phone PIC X(10).
           05 Email PIC X(50).
           05 Description PIC X(240).

       WORKING-STORAGE SECTION. 
       01 ws-file-status PIC XX.


       PROCEDURE DIVISION.
           
           OPEN I-O contacts.    

           PERFORM UNTIL ws-file-status = "10"  
               READ contacts NEXT
               AT END
                   MOVE "10" TO ws-file-status  
               NOT AT END
                   DISPLAY "Contact : " First_Name " | " Last_Name " | " 
           Phone " | " Email" | "Description
           END-READ
           END-PERFORM.
           
           CLOSE contacts.
           STOP RUN.
           