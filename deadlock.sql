
/* 

select ' 
  deadlock.sql : demonstrates deadlock.
  (I ve used demo this to hammer a vendor once.. ;-)

  pre-reqs :
   - log on two sssion on sqlplus, same user.name,
   - run this script from one session
   - you will be prompted to copy/paste
     some lines into other session.


   I ve been haunted by deadlocks before,
   and I know how it feels if the wrath of
   management-politics and developer-ignorance
   comes down to point to the Database....

   Hence I looked up my old demo given to
   a US vendor of logistics software.

   Regards,

   PdV

' as docu ; 

 */

-- set doc on
-- set echo on

DROP TABLE dl ;

CREATE TABLE dl ( dl_id numeric, dl_payload VARCHAR(32) ) ;

\set AUTOCOMMIT off 

BEGIN ;

INSERT INTO dl VALUES ( 1, '1st sess: record 1, first' );
INSERT INTO dl VALUES ( 2, '1st sess: record 2, second' );

COMMIT ;

END;

BEGIN ;

UPDATE dl SET dl_payload = '1st sess: upd_first record' WHERE dl_id = 1 ;

select '
/* ------------------------------------------------------

  You now have a table with two records,
  one of which is locked by an update-statement.

  Now go and update records 2 and 1, in that order,
  from another sesion.
  The other sesion will hang on the update of record 1
  because rec-1 is locked (uncommitted) by this session.

  Copy/Paste the following two update-statments into 2nd session,
  the session will hang on the 2nd line, but no errors yet...

  BEGIN;
  UPDATE dl SET dl_payload = ''2nd sess: update second''  WHERE dl_id = 2;
  UPDATE dl SET dl_payload = ''2nd sess: cause hangup'' WHERE dl_id = 1;
  END ;

  See 2nd session hang....then hit return here to continue 1st session.

  -----------------------------------------------------
*/
' as docu ; 

\prompt 'Press Enter key to continue...'  petc

select '
/* -----------------------------------------------------
   now what will happen if we try to update record 2 as well...
   ---------------------------------------------------------
*/
' as docu ; 

UPDATE dl SET dl_payload = '1st sess: upd_2nd_while locked' WHERE dl_id = 2;

END ;

select ' 
/* -----------------------------------------------------------

   Find out which session reported the deadlock, and why....
   Also go and find out what is in the alert and tracefiles.

   Tracefile (udump) will tell you it is Always an application-error
   (just to support our claim: it is the app!).


   Keep in mind the following:

   1. There is very little a database can to to prevent
      deadlocks: only te app can prevent them..
      The app should lock (or at least try to lock)
      all data before updating (for update [nowait] ).

   2. A slow system increases the risk of deadlock:
      transacton take longer, locks are held longer,
      and changes of other proceses interfering increase.

   3. Single-tread or single-batch systems can avoid
      deadlocks but are only a workaround, not a fix.

   Good lock !

   PdV

   -----------------------------------------------------------
*/
' as docu ; 

