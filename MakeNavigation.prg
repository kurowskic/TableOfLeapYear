*-----------------------------------------------------------------------------*
#include "tly_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE MakeNavigation()
*-----------------------------------------------------------------------------*

  LOCAL nX
  LOCAL nY

  LOCAL nBreak := 5

  LOCAL maxX := 5
  LOCAL maxY := 1

  LOCAL nWidth  := ( ROUND( ( ( 1530 - ( 200 * 2 ) - ( nBreak * ( maxX - 1 ) ) ) / maxX ) , 0 ) ) // * APP_ADJUST_X
  LOCAL nHeigth := ( 70 ) * APP_ADJUST_Y

  LOCAL cLabel
  LOCAL cValue

  DECLARE WINDOW win_Main


  FOR nY := 1 TO maxY

    FOR nX := 1 TO maxX

      cValue := STRZERO( nX + ( maxX * ( nY - 1 ) ) , 1 )

      cLabel := "Label_Menu_" + cValue


      IF !IsControlDefined( &cLabel , win_Main )

        DEFINE LABEL &(cLabel)
          PARENT    win_Main
          ROW       ( 30 + ( nHeigth * ( nY ) ) + ( ( nY - 1 ) * nBreak ) ) * APP_ADJUST_Y
          COL       ( 200 + 3 + ( nWidth * ( nX - 1 ) ) + ( ( nX - 1 ) * nBreak ) ) * APP_ADJUST_X
          WIDTH     nWidth * APP_ADJUST_X
          HEIGHT    nHeigth * APP_ADJUST_Y
          VALUE ALLTRIM( STR( 1700 + ( nX * 100 ) ) ) + "-" + ALLTRIM( STR( 1799 + ( nX * 100 ) ) )
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

          DO CASE
            CASE cValue == "1"
              ACTION win_Main_label( "1800" )

            CASE cValue == "2"
              ACTION win_Main_label( "1900" )

            CASE cValue == "3"
              ACTION win_Main_label( "2000" )

            CASE cValue == "4"
              ACTION win_Main_label( "2100" )

            CASE cValue == "5"
              ACTION win_Main_label( "2200" )

          END CASE

          AUTOSIZE .F.
          BACKCOLOR NIL
          FONTCOLOR NIL
          CENTERALIGN .T.
#IFDEF _HMG_2_
          VCENTERALIGN .T.
#ENDIF
          BORDER .T.
        END LABEL


      ENDIF


    NEXT nX


  NEXT nY


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_label( xcYear )
*-----------------------------------------------------------------------------*

  DECLARE WINDOW win_Main


  Do_Events()
  win_Main.lbl_BackGround.Setfocus()


  DO CASE

    CASE xcYear == "1800"
      win_Main.Label_Menu_1.backcolor:=BLUE
      win_Main.Label_Menu_2.backcolor:=GRAY
      win_Main.Label_Menu_3.backcolor:=GRAY
      win_Main.Label_Menu_4.backcolor:=GRAY
      win_Main.Label_Menu_5.backcolor:=GRAY
      nYear := 1800
      Do_Events()

    CASE xcYear == "1900"
      win_Main.Label_Menu_1.backcolor:=GRAY
      win_Main.Label_Menu_2.backcolor:=BLUE
      win_Main.Label_Menu_3.backcolor:=GRAY
      win_Main.Label_Menu_4.backcolor:=GRAY
      win_Main.Label_Menu_5.backcolor:=GRAY
      nYear := 1900
      Do_Events()

   CASE xcYear == "2000"
      win_Main.Label_Menu_1.backcolor:=GRAY
      win_Main.Label_Menu_2.backcolor:=GRAY
      win_Main.Label_Menu_3.backcolor:=BLUE
      win_Main.Label_Menu_4.backcolor:=GRAY
      win_Main.Label_Menu_5.backcolor:=GRAY
      nYear := 2000
      Do_Events()

    CASE xcYear == "2100"
      win_Main.Label_Menu_1.backcolor:=GRAY
      win_Main.Label_Menu_2.backcolor:=GRAY
      win_Main.Label_Menu_3.backcolor:=GRAY
      win_Main.Label_Menu_4.backcolor:=BLUE
      win_Main.Label_Menu_5.backcolor:=GRAY
      nYear := 2100
      Do_Events()

    CASE xcYear == "2200"
      win_Main.Label_Menu_1.backcolor:=GRAY
      win_Main.Label_Menu_2.backcolor:=GRAY
      win_Main.Label_Menu_3.backcolor:=GRAY
      win_Main.Label_Menu_4.backcolor:=GRAY
      win_Main.Label_Menu_5.backcolor:=BLUE
      nYear := 2200
      Do_Events()

  END CASE


  MakeTableOfLeapYears()
  Do_Events()

RETURN

*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
