*-----------------------------------------------------------------------------*
* TableOfLeapYear | tly_hmg.ch
*-----------------------------------------------------------------------------*
#include "tly_ver.ch"
*-----------------------------------------------------------------------------*

#DEFINE  _PRG1_      '2022'
#DEFINE  _PRG2_      '188'
#DEFINE  _PRG3_      '1'

#DEFINE  _DB1_       ''
#DEFINE  _DB2_       ''
#DEFINE  _DB3_       ''


#DEFINE  _OLD_PRG1_  '2022'
#DEFINE  _OLD_PRG2_  '187'
#DEFINE  _OLD_PRG3_  '2'

#DEFINE  _OLD_DB1_   ''
#DEFINE  _OLD_DB2_   ''
#DEFINE  _OLD_DB3_   ''


#DEFINE NAZWA_PR     "Table of Leap Years 1800-2299"

#DEFINE WERSJA_PR    _PRG1_+"."+_PRG2_+"."+_PRG3_
#DEFINE WERSJA_DB    _DB1_+"."+_DB2_+"."+_DB3_


#INCLUDE  "hmg.ch"

#DEFINE  FALSE .F.
#DEFINE  TRUE  .T.

#define CRLF CHR( 13 ) + CHR( 10 )
#define CR CHR( 13 )
#define LF CHR( 10 )


#IFNDEF __XHARBOUR__

   #XCOMMAND TRY                => bError := errorBlock( {|oError| break( oError ) } ) ;;
                                   BEGIN SEQUENCE
   #XCOMMAND CATCH [<!oError!>] => errorBlock( bError ) ;;
                                   RECOVER [USING <oError>] <-oError-> ;;
                                   errorBlock( bError )
#ENDIF


MEMVAR APP_ROW
MEMVAR APP_COL
MEMVAR APP_HEIGHT
MEMVAR APP_WIDTH
MEMVAR aFrm
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
