*-----------------------------------------------------------------------------*
* TableOfLeapYear | MakeNavigation.prg
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


#IFDEF _HMG_2_

              ONMOUSEHOVER win_Main_lbl_OnMouseHover( 1 )
              ONMOUSELEAVE win_Main_lbl_OnMouseLeave( 1 )

#ENDIF


            CASE cValue == "2"

              ACTION win_Main_label( "1900" )


#IFDEF _HMG_2_

              ONMOUSEHOVER win_Main_lbl_OnMouseHover( 2 )
              ONMOUSELEAVE win_Main_lbl_OnMouseLeave( 2 )

#ENDIF


            CASE cValue == "3"

              ACTION win_Main_label( "2000" )


#IFDEF _HMG_2_

              ONMOUSEHOVER win_Main_lbl_OnMouseHover( 3 )
              ONMOUSELEAVE win_Main_lbl_OnMouseLeave( 3 )

#ENDIF


            CASE cValue == "4"

              ACTION win_Main_label( "2100" )


#IFDEF _HMG_2_

              ONMOUSEHOVER win_Main_lbl_OnMouseHover( 4 )
              ONMOUSELEAVE win_Main_lbl_OnMouseLeave( 4 )

#ENDIF


            CASE cValue == "5"

              ACTION win_Main_label( "2200" )


#IFDEF _HMG_2_

              ONMOUSEHOVER win_Main_lbl_OnMouseHover( 5 )
              ONMOUSELEAVE win_Main_lbl_OnMouseLeave( 5 )

#ENDIF


          END CASE

          AUTOSIZE .F.
          BACKCOLOR Nil
          FONTCOLOR Nil
          CENTERALIGN .T.
#IFDEF _HMG_2_
          VCENTERALIGN .T.
#ENDIF
          BORDER .T.
        END LABEL


      ENDIF


    NEXT nX


  NEXT nY


#IFDEF _HMG_3_


    HMG_ChangeWindowStyle( win_Main.Label_Menu_1.HANDLE , 0x00800200 , Nil , .F. , .T. )
    HMG_ChangeWindowStyle( win_Main.Label_Menu_2.HANDLE , 0x00800200 , Nil , .F. , .T. )
    HMG_ChangeWindowStyle( win_Main.Label_Menu_3.HANDLE , 0x00800200 , Nil , .F. , .T. )
    HMG_ChangeWindowStyle( win_Main.Label_Menu_4.HANDLE , 0x00800200 , Nil , .F. , .T. )
    HMG_ChangeWindowStyle( win_Main.Label_Menu_5.HANDLE , 0x00800200 , Nil , .F. , .T. )


    EventProcessAllHookMessage( EventCreate( "win_Main_lbl_OnMouseHoverLeave" , win_Main.Label_Menu_1.HANDLE ) , .T.)
    EventProcessAllHookMessage( EventCreate( "win_Main_lbl_OnMouseHoverLeave" , win_Main.Label_Menu_2.HANDLE ) , .T.)
    EventProcessAllHookMessage( EventCreate( "win_Main_lbl_OnMouseHoverLeave" , win_Main.Label_Menu_3.HANDLE ) , .T.)
    EventProcessAllHookMessage( EventCreate( "win_Main_lbl_OnMouseHoverLeave" , win_Main.Label_Menu_4.HANDLE ) , .T.)
    EventProcessAllHookMessage( EventCreate( "win_Main_lbl_OnMouseHoverLeave" , win_Main.Label_Menu_5.HANDLE ) , .T.)


#ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_label( xcYear )
*-----------------------------------------------------------------------------*

  DECLARE WINDOW win_Main


  Do_Events()
  win_Main.SetFocus()


  DO CASE

    CASE xcYear == "1800"

      win_Main.Label_Menu_1.BackColor := BLUE
      win_Main.Label_Menu_2.BackColor := GRAY
      win_Main.Label_Menu_3.BackColor := GRAY
      win_Main.Label_Menu_4.BackColor := GRAY
      win_Main.Label_Menu_5.BackColor := GRAY
      nYear := 1800
      Do_Events()


    CASE xcYear == "1900"

      win_Main.Label_Menu_1.BackColor := GRAY
      win_Main.Label_Menu_2.BackColor := BLUE
      win_Main.Label_Menu_3.BackColor := GRAY
      win_Main.Label_Menu_4.BackColor := GRAY
      win_Main.Label_Menu_5.BackColor := GRAY
      nYear := 1900
      Do_Events()


   CASE xcYear == "2000"

      win_Main.Label_Menu_1.BackColor := GRAY
      win_Main.Label_Menu_2.BackColor := GRAY
      win_Main.Label_Menu_3.BackColor := BLUE
      win_Main.Label_Menu_4.BackColor := GRAY
      win_Main.Label_Menu_5.BackColor := GRAY
      nYear := 2000
      Do_Events()


    CASE xcYear == "2100"

      win_Main.Label_Menu_1.BackColor := GRAY
      win_Main.Label_Menu_2.BackColor := GRAY
      win_Main.Label_Menu_3.BackColor := GRAY
      win_Main.Label_Menu_4.BackColor := BLUE
      win_Main.Label_Menu_5.BackColor := GRAY
      nYear := 2100
      Do_Events()


    CASE xcYear == "2200"

      win_Main.Label_Menu_1.BackColor := GRAY
      win_Main.Label_Menu_2.BackColor := GRAY
      win_Main.Label_Menu_3.BackColor := GRAY
      win_Main.Label_Menu_4.BackColor := GRAY
      win_Main.Label_Menu_5.BackColor := BLUE
      nYear := 2200
      Do_Events()


  END CASE


  MakeTableOfLeapYears()
  Do_Events()

RETURN
*-----------------------------------------------------------------------------*


#IFDEF _HMG_2_
*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_OnMouseHover( xcLabel )
*-----------------------------------------------------------------------------*

  LOCAL RGB


  IF xcLabel == 1


    RGB := GetProperty( "win_Main" , "Label_Menu_1" , "BackColor" )


    IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 128

        win_Main.Label_Menu_1.BackColor := { 128 , 128 , 255 }

    ENDIF


  ENDIF


  IF xcLabel == 2


    RGB := GetProperty( "win_Main" , "Label_Menu_2" , "BackColor" )


    IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 128

        win_Main.Label_Menu_2.BackColor :=  { 128 , 128 , 255 }

    ENDIF


  ENDIF


  IF xcLabel == 3


    RGB := GetProperty( "win_Main" , "Label_Menu_3" , "BackColor" )


    IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 128

        win_Main.Label_Menu_3.BackColor :=  { 128 , 128 , 255 }

    ENDIF


  ENDIF


  IF xcLabel == 4


    RGB := GetProperty( "win_Main" , "Label_Menu_4" , "BackColor" )


    IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 128

        win_Main.Label_Menu_4.BackColor :=  { 128 , 128 , 255 }

    ENDIF


  ENDIF


  IF xcLabel == 5


    RGB := GetProperty( "win_Main" , "Label_Menu_5" , "BackColor" )


    IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 128

        win_Main.Label_Menu_5.BackColor :=  { 128 , 128 , 255 }

    ENDIF


  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_OnMouseLeave( xcLabel )
*-----------------------------------------------------------------------------*

  LOCAL RGB


  IF xcLabel == 1


    RGB := GetProperty( "win_Main" , "Label_Menu_1" , "BackColor" )


    IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

      win_Main.Label_Menu_1.BackColor := { 128 , 128 , 128 }

    ENDIF


  ENDIF


  IF xcLabel == 2


    RGB := GetProperty( "win_Main" , "Label_Menu_2" , "BackColor" )


    IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

      win_Main.Label_Menu_2.BackColor := { 128 , 128 , 128 }

    ENDIF


  ENDIF


  IF xcLabel == 3


    RGB := GetProperty( "win_Main" , "Label_Menu_3" , "BackColor" )


    IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

      win_Main.Label_Menu_3.BackColor := { 128 , 128 , 128 }

    ENDIF


  ENDIF


  IF xcLabel == 4


    RGB := GetProperty( "win_Main" , "Label_Menu_4" , "BackColor" )


    IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

      win_Main.Label_Menu_4.BackColor := { 128 , 128 , 128 }

    ENDIF


  ENDIF


  IF xcLabel == 5


    RGB := GetProperty( "win_Main" , "Label_Menu_5" , "BackColor" )


    IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

      win_Main.Label_Menu_5.BackColor := { 128 , 128 , 128 }

    ENDIF


  ENDIF


RETURN
*-----------------------------------------------------------------------------*
#ENDIF



#IFDEF _HMG_3_
*-----------------------------------------------------------------------------*
// http://www.hmgforum.com/viewtopic.php?f=9&t=4806
*-----------------------------------------------------------------------------*
FUNCTION win_Main_lbl_OnMouseHoverLeave()
*-----------------------------------------------------------------------------*

  STATIC lTracking := .F.
  LOCAL  nHWnd := EventHWND()
  LOCAL  nMsg  := EventMSG()
  LOCAL  cControl
  LOCAL  cForm


  SWITCH nMsg

    CASE WM_MOUSEMOVE


      IF ! lTracking

        GetControlNameByHandle( nHWnd , @cControl , @cForm )


        IF cControl == "Label_Menu_1"


          RGB := GetProperty ( "win_Main" , "Label_Menu_1" , "BackColor" )


          IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 128

              SetProperty( cForm , cControl , "BackColor" , { 128 , 128 , 255 } )

          ENDIF


        ENDIF


        IF cControl == "Label_Menu_2"


          RGB := GetProperty ( "win_Main" , "Label_Menu_2" , "BackColor" )


          IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 128

            SetProperty( cForm , cControl , "BackColor" , { 128 , 128 , 255 } )


          ENDIF


        ENDIF


       IF cControl == "Label_Menu_3"


          RGB := GetProperty ( "win_Main" , "Label_Menu_3" , "BackColor" )


          IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 128

            SetProperty( cForm , cControl , "BackColor" , { 128 , 128 , 255 } )


          ENDIF


        ENDIF


       IF cControl == "Label_Menu_4"


          RGB := GetProperty ( "win_Main" , "Label_Menu_4" , "BackColor" )


          IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 128

            SetProperty( cForm , cControl , "BackColor" , { 128 , 128 , 255 } )


          ENDIF


        ENDIF


       IF cControl == "Label_Menu_5"


          RGB := GetProperty ( "win_Main" , "Label_Menu_5" , "BackColor" )


          IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 128

            SetProperty( cForm , cControl , "BackColor" , { 128 , 128 , 255 } )


          ENDIF


        ENDIF


        lTracking := TrackMouseEvent( nHWnd )  // TME_LEAVE is default flag

      ENDIF


      EXIT


    CASE WM_MOUSELEAVE

      GetControlNameByHandle( nHWnd , @cControl , @cForm )


      IF cControl == "Label_Menu_1"


        RGB := GetProperty ( "win_Main" , "Label_Menu_1" , "BackColor" )


        IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

            SetProperty( cForm , cControl , "BackColor" , { 128 , 128 , 128 } )

        ENDIF


      ENDIF


      IF cControl == "Label_Menu_2"


        RGB := GetProperty ( "win_Main" , "Label_Menu_2" , "BackColor" )


        IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

            SetProperty( cForm , cControl , "BackColor" , { 128 , 128 , 128 } )

        ENDIF


      ENDIF


      IF cControl == "Label_Menu_3"


        RGB := GetProperty ( "win_Main" , "Label_Menu_3" , "BackColor" )


        IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

            SetProperty( cForm , cControl , "BackColor" , { 128 , 128 , 128 } )

        ENDIF


      ENDIF


      IF cControl == "Label_Menu_4"


        RGB := GetProperty ( "win_Main" , "Label_Menu_4" , "BackColor" )


        IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

            SetProperty( cForm , cControl , "BackColor" , { 128 , 128 , 128 } )

        ENDIF


      ENDIF


      IF cControl == "Label_Menu_5"


        RGB := GetProperty ( "win_Main" , "Label_Menu_5" , "BackColor" )


        IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

            SetProperty( cForm , cControl , "BackColor" , { 128 , 128 , 128 } )

        ENDIF


      ENDIF


      lTracking := .F.

      EXIT


  ENDSWITCH


RETURN Nil
*-----------------------------------------------------------------------------*
#ENDIF


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
