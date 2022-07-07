*-----------------------------------------------------------------------------*
* TableOfLeapYear | MakeTableOfLeapYears.prg
*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
#include "tly_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE MakeTableOfLeapYears()
*-----------------------------------------------------------------------------*

  LOCAL nLeapYear
  LOCAL nX
  LOCAL nY

  LOCAL nBreak := 5

  LOCAL maxX := 10
  LOCAL maxY := 10

  LOCAL nWidth  := ( ROUND( ( ( 1530 - ( 200 * 2 ) - ( nBreak * ( maxX - 1 ) ) ) / maxX ) , 0 ) ) 
  LOCAL nHeigth := ( ROUND( ( ( 0820 - ( 200 * 2 ) - ( nBreak * ( maxY - 1 ) ) ) / maxY ) , 0 ) ) 


  FOR nY := 1 TO maxY

    FOR nX := 1 TO maxX

      cValue := STRZERO( nX + ( maxX * ( nY - 1 ) ) - 1 , 3 )


      IF VAL ( cValue ) < 100

        cValue := SUBSTR( cValue , 2 , 2 )

      ENDIF


      cLabel := "Label_" + cValue
      nLeapYear := nYear + VAL( cValue )


      IF !IsControlDefined( &cLabel , win_Main )

        DEFINE LABEL &(cLabel)
          PARENT    win_Main
          ROW       ( 200 + ( nHeigth * ( nY ) ) + ( ( nY - 1 ) * nBreak ) ) * APP_ADJUST_Y
          COL       ( 200 + 3 + ( nWidth * ( nX - 1 ) ) + ( ( nX - 1 ) * nBreak ) ) * APP_ADJUST_X
          WIDTH     nWidth  * APP_ADJUST_X
          HEIGHT    nHeigth * APP_ADJUST_Y
          VALUE ALLTRIM( STR( nLeapYear ) )
          FONTNAME fTIMES
          FONTSIZE 16 * APP_ADJUST_X
          TOOLTIP ""
          FONTBOLD .T.
          FONTITALIC .F.
          FONTUNDERLINE .F.
          FONTSTRIKEOUT .F.
          HELPID Nil
          VISIBLE .T.
          TRANSPARENT .F.
          ACTION Nil
          AUTOSIZE .F.
          IF ISLEAP( CTOD ( "02/01/" + STR( nLeapYear ) ) )
            BACKCOLOR YELLOW
          ELSE
            BACKCOLOR GREEN
          ENDIF
          FONTCOLOR Nil
          CENTERALIGN .T.


#IFDEF _HMG_2_

          VCENTERALIGN .T.

#ENDIF


          BORDER .T.
        END LABEL

      ELSE

        SetProperty( "win_Main" , cLabel , "Value" , ALLTRIM( STR( nLeapYear ) ))


        IF ISLEAP( CTOD ( "02/01/" + STR( nLeapYear ) ) )

          SetProperty( "win_Main" , cLabel , "BackColor" , YELLOW )

        ELSE

          SetProperty( "win_Main" , cLabel , "BackColor" , GREEN )

        ENDIF


        Do_Events()

      ENDIF


    NEXT nX


  NEXT nY


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
