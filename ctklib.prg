*-----------------------------------------------------------------------------*
* TableOfLeapYear | ctklib.prg
*-----------------------------------------------------------------------------*
#include "tly_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE Do_Events()
*-----------------------------------------------------------------------------*

  DO EVENTS

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE CTK_DrawBorder( xcForm )
*-----------------------------------------------------------------------------*

  LOCAL nControlRow := 0
  LOCAL nControlCol := 0
  LOCAL nControlWid := GetProperty( xcForm, "Width" )
  LOCAL nControlHig := GetProperty( xcForm, "Height" )

  LOCAL nBordrRow
  LOCAL nBordrCol
  LOCAL nBordrWid
  LOCAL nBordrHig

  LOCAL nPenWidth
  LOCAL color

  nPenWidth := 2
  color     := BLUE

  nBordrRow := nControlRow  + INT( nPenWidth / 2 )
  nBordrCol := nControlCol  + INT( nPenWidth / 2 )
  nBordrWid := nControlWid  - nPenWidth
  nBordrHig := nControlHig  - nPenWidth

  // TOP
  DRAW LINE IN WINDOW &xcForm                    ;
    AT nBordrRow           , nBordrCol           ;
    TO nBordrRow           , nBordrCol+nBordrWid ;
    PENCOLOR Color                               ;
    PENWIDTH nPenWidth

  // LEFT
  DRAW LINE IN WINDOW &xcForm                    ;
    AT nBordrRow           , nBordrCol           ;
    TO nBordrRow+nBordrHig , nBordrCol           ;
    PENCOLOR Color                               ;
    PENWIDTH nPenWidth

  // BOTTOM
  DRAW LINE IN WINDOW &xcForm                    ;
    AT nBordrRow+nBordrHig , nBordrCol           ;
    TO nBordrRow+nBordrHig , nBordrCol+nBordrWid ;
    PENCOLOR Color                               ;
    PENWIDTH nPenWidth

  // RIGHT
  DRAW LINE IN WINDOW &xcForm                    ;
    AT nBordrRow           , nBordrCol+nBordrWid ;
    TO nBordrRow+nBordrHig , nBordrCol+nBordrWid ;
    PENCOLOR Color                               ;
    PENWIDTH nPenWidth

  Do_Events()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE CTK_DrawCross( xcForm )
*-----------------------------------------------------------------------------*

  LOCAL nControlRow := 0
  LOCAL nControlCol := 0
  LOCAL nControlWid := GetProperty( xcForm, "Width" )
  LOCAL nControlHig := GetProperty( xcForm, "Height" )

  LOCAL nBordrRow
  LOCAL nBordrCol
  LOCAL nBordrWid
  LOCAL nBordrHig

  LOCAL nPenWidth
  LOCAL color

  nPenWidth := 2
  color     := RED

  nBordrRow := nControlRow  + INT( nPenWidth / 2 )
  nBordrCol := nControlCol  + INT( nPenWidth / 2 )
  nBordrWid := nControlWid  - nPenWidth
  nBordrHig := nControlHig  - nPenWidth

  // => \
  DRAW LINE IN WINDOW &xcForm                    ;
    AT nBordrRow           , nBordrCol           ;
    TO nBordrRow+nBordrHig , nBordrCol+nBordrWid ;
    PENCOLOR Color                               ;
    PENWIDTH nPenWidth

  // => /
  DRAW LINE IN WINDOW &xcForm                    ;
    AT nBordrRow+nBordrHig , nBordrCol           ;
    TO nBordrRow           , nBordrCol+nBordrWid ;
    PENCOLOR Color                               ;
    PENWIDTH nPenWidth

  Do_Events()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE CTK_DrawHalf( xcForm )
*-----------------------------------------------------------------------------*

  LOCAL nControlRow := 0
  LOCAL nControlCol := 0
  LOCAL nControlWid := GetProperty( xcForm, "Width" )
  LOCAL nControlHig := GetProperty( xcForm, "Height" )

  LOCAL nBordrRow
  LOCAL nBordrCol
  LOCAL nBordrWid
  LOCAL nBordrHig

  LOCAL nPenWidth
  LOCAL color

  nPenWidth := 2
  color     := RED

  nBordrRow := nControlRow  + INT( nPenWidth / 2 )
  nBordrCol := nControlCol  + INT( nPenWidth / 2 )
  nBordrWid := nControlWid  - nPenWidth
  nBordrHig := nControlHig  - nPenWidth

  // => -
  DRAW LINE IN WINDOW &xcForm                   ;
    AT ROUND( nControlHig / 2 , 0 ) , nControlRow         ;
    TO ROUND( nControlHig / 2 , 0 ) , nControlWid ;
    PENCOLOR Color                              ;
    PENWIDTH nPenWidth

  // => |
  DRAW LINE IN WINDOW &xcForm                    ;
    AT nControlRow , ROUND( nControlWid / 2  , 0 )        ;
    TO nControlWid , ROUND( nControlWid / 2  , 0 ) ;
    PENCOLOR Color                               ;
    PENWIDTH nPenWidth

  Do_Events()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
FUNCTION CTK_Minimize( xaFrm )
*-----------------------------------------------------------------------------*

  LOCAL nI
  LOCAL nFrm

  nFrm := LEN( xaFrm )


  IF nFrm > 0

    FOR nI := 1 TO nFrm - 1

      SetProperty( xaFrm[ nI , 1 ] , "Col" , -5000  )

    NEXT I

  ENDIF


  DoMethod ( xaFrm[ nFrm , 1 ] , 'Minimize' )


RETURN xaFrm
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
FUNCTION CTK_Release( xaFrm )
*-----------------------------------------------------------------------------*

  LOCAL aLocal
  LOCAL nI
  LOCAL nFrm

  aLocal := {}

  nFrm := LEN( xaFrm )


  IF nFrm > 1

    xaFrm[ nFrm , 1 ] := Nil


    FOR nI := 1 TO nFrm


      IF xaFrm[ nI , 1 ] <> Nil

        AADD( aLocal , { xaFrm[ nI , 1 ] , xaFrm[ nI , 2 ] , xaFrm[ nI , 3 ] } )

      ENDIF


    NEXT I


  ENDIF


RETURN aLocal
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
FUNCTION CTK_Restore( xaFrm )
*-----------------------------------------------------------------------------*

  LOCAL nI
  LOCAL nFrm

  nFrm := LEN( xaFrm )


  IF nFrm > 1

    FOR nI := 1 TO nFrm - 1

      SetProperty( xaFrm[ nI , 1 ] , 'Row' , xaFrm[ nI , 2 ] )
      SetProperty( xaFrm[ nI , 1 ] , 'Col' , xaFrm[ nI , 3 ] )

    NEXT nI


    SetProperty( xaFrm[ nI , 1 ] , 'Row' , xaFrm[ nI , 2 ] )
    SetProperty( xaFrm[ nI , 1 ] , 'Col' , xaFrm[ nI , 3 ] )

    DoMethod ( xaFrm[ nFrm , 1 ] , 'SetFocus' )

  ENDIF


  Do_Events()

  aFrm[ 1 , 2 ] := APP_ROW
  aFrm[ 1 , 3 ] := APP_COL

  Do_Events()


RETURN xaFrm
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE SetCenterMainWindow()
*-----------------------------------------------------------------------------*

  DECLARE WINDOW win_Main

  win_Main.Row  := ROUND( ( GetDesktopRealHeight() / 2 ) - ( APP_HEIGHT / 2 ) , 0 )
  win_Main.Col  := ROUND( ( GetDesktopRealWidth()  / 2 ) - ( APP_WIDTH  / 2 ) , 0 )

  Do_Events()

  APP_ROW    := win_Main.Row
  APP_COL    := win_Main.Col

  Do_Events()

  aFrm[ 1 , 2 ] := APP_ROW
  aFrm[ 1 , 3 ] := APP_COL

  Do_Events()

*-----------------------------------------------------------------------------*
RETURN
*-----------------------------------------------------------------------------*



*-----------------------------------------------------------------------------*
PROCEDURE SetCenterModalWindow( xaFormControl )
*-----------------------------------------------------------------------------*

  DECLARE WINDOW win_Main


  SetProperty( xaFormControl[ 1 , 1 ] , "Width"     , INT( xaFormControl[ 1 , 4 ] * APP_ADJUST_X ) )
  SetProperty( xaFormControl[ 1 , 1 ] , "Height"    , INT( xaFormControl[ 1 , 5 ] * APP_ADJUST_Y ) )


  DO CASE

    CASE INT( GetDesktopRealWidth() ) > INT( win_Main.Width )

    SetProperty( xaFormControl[ 1 , 1 ] , "Row" , INT( APP_ROW + ( APP_HEIGHT - GetProperty( xaFormControl[ 1 , 1 ] , "Height" ) ) / 2 ) )
    SetProperty( xaFormControl[ 1 , 1 ] , "Col" , INT( APP_COL + ( APP_WIDTH  - GetProperty( xaFormControl[ 1 , 1 ] , "Width"  ) ) / 2 ) )


    CASE INT( GetDesktopRealWidth() ) < INT( win_Main.Width )

      SetProperty( xaFormControl[ 1 , 1 ] , "Row" , INT( (  APP_ROW  ) + ( GetDesktopRealHeight() - win_Main.Height )  / 2 ) )
      SetProperty( xaFormControl[ 1 , 1 ] , "Col" , INT( (  APP_COL  ) + ( GetDesktopRealWidth()  - win_Main.Width  )  / 2 ) )


    CASE INT( GetDesktopRealWidth() ) == INT( win_Main.Width )

      SetProperty( xaFormControl[ 1 , 1 ] , "Row" , INT( ( GetDesktopRealHeight() - GetProperty( xaFormControl[ 1 , 1 ] , "Height" ) ) / 2 ) )
      SetProperty( xaFormControl[ 1 , 1 ] , "Col" , INT( ( GetDesktopRealWidth()  - GetProperty( xaFormControl[ 1 , 1 ] , "Width"  ) ) / 2 ) )


  END CASE


  Do_Events()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE CheckMainResolution()
*-----------------------------------------------------------------------------*

    APP_ROW    := GetProperty( "win_Main" , "Row" )
    APP_COL    := GetProperty( "win_Main" , "Col" )
    APP_HEIGHT := GetProperty( "win_Main" , "Height" )
    APP_WIDTH  := GetProperty( "win_Main" , "Width" )

    APP_ADJUST_Y :=  ( GetDesktopRealHeight() / APP_HEIGHT )
    SetProperty( "win_Main" , "Height" , GetProperty( "win_Main" , "Height" ) * APP_ADJUST_Y )
    APP_ADJUST_X := ( GetDesktopRealWidth() / APP_WIDTH )
    SetProperty( "win_Main" , "Width" , GetProperty( "win_Main" , "Width" ) * APP_ADJUST_X )
    Do_Events()


    DO CASE

      CASE INT( GetDesktopRealHeight() ) == INT( GetProperty( "win_Main" , "Height" ) ) ;
           .AND. ;
           INT( GetDesktopRealWidth() ) == INT( GetProperty( "win_Main" , "Width" ) )


        win_Main.btn_Center.Hide
        win_Main.btn_Max.Hide


      CASE INT( GetDesktopRealHeight() ) < INT( GetProperty( "win_Main" , "Height" ) ) ;
           .AND. ;
           INT( GetDesktopRealWidth() ) < INT( GetProperty( "win_Main" , "Width" ) )

             win_Main.btn_Center.Hide
             win_Main.btn_Max.Hide


      CASE INT( GetDesktopRealHeight() ) > INT( GetProperty( "win_Main" , "Height" ) ) ;
               .AND. ;
           INT( GetDesktopRealWidth() ) > INT( GetProperty( "win_Main" , "Width" ) )

             win_Main.btn_Center.Show
             win_Main.btn_Max.Hide


    END CASE


    Do_Events()

    SetProperty( "win_Main" , "btn_Center" , "Col" , APP_WIDTH - 175 * APP_ADJUST_X )
    SetProperty( "win_Main" , "btn_Max"    , "Col" , APP_WIDTH - 140 * APP_ADJUST_X )
    SetProperty( "win_Main" , "btn_About"  , "Col" , APP_WIDTH - 105 * APP_ADJUST_X )
    SetProperty( "win_Main" , "btn_MinPR"  , "Col" , APP_WIDTH -  70 * APP_ADJUST_X )
    SetProperty( "win_Main" , "btn_ExitPR" , "Col" , APP_WIDTH -  35 * APP_ADJUST_X )
    Do_Events()


RETURN
*-----------------------------------------------------------------------------*


#DEFINE HTCAPTION          2
#DEFINE WM_NCLBUTTONDOWN 161

*------------------------------------------------------------------------------*
PROCEDURE MoveActiveWindow( cForm )
*------------------------------------------------------------------------------*

  LOCAL hWnd

  LOCAL nMouseRow      := GetCursorRow()
  LOCAL nMouseCol      := GetCursorCol()
  LOCAL nFormRow       := GetProperty( cForm , 'Row' )
  LOCAL nFormCol       := GetProperty( cForm , 'Col' )
  LOCAL nFormHeight    := GetProperty( cForm , 'Height' )
  LOCAL nFormWidth     := GetProperty( cForm , 'Width' )
  LOCAL nDesktopHeight := GetDesktopRealHeight()
  LOCAL nDesktopWidth  := GetDesktopRealWidth()

  LOCAL nAPPRow := 0
  LOCAL nAPPCol := 0

  DEFAULT hWnd := GetActiveWindow()

  DECLARE WINDOW win_Main


  IF nMouseRow >= nFormRow .AND. nMouseRow <= ( nFormRow + 80 - 1 )

    IF nFormCol >=  0

      PostMessage( hWnd , WM_NCLBUTTONDOWN , HTCAPTION , 0 )

    ENDIF


  ENDIF


  Do_Events()

  nAPPRow := GetProperty( cForm , 'Row' )
  nAPPCol := GetProperty( cForm , 'Col' )

  Do_Events()


  IF nAPPCol < 0

    nAPPCol := SetProperty( cForm , 'Col' , 0 )

  ELSE


    IF nAPPCol + nFormWidth > nDesktopWidth

      SetProperty( cForm , 'Col' , nDesktopWidth - nFormWidth )
      nAPPCol :=  GetProperty( cForm , 'Col' )

     ELSE

      SetProperty( cForm , 'Col' , nAPPCol )

    ENDIF


  ENDIF


  IF nAPPRow < 0

    nAPPRow := SetProperty( cForm , 'Row' , 0 )

  ELSE


    IF nAPPRow + nFormHeight > nDesktopHeight

      SetProperty( cForm , 'Row' , nDesktopHeight - nFormHeight )
      nAPPRow := GetProperty( cForm , 'Row' )

    ELSE

      SetProperty( cForm , 'Row' , nAPPRow )

    ENDIF


  ENDIF


  Do_Events()

  APP_ROW    := nAPPRow
  APP_COL    := nAPPCol

  Do_Events()

  aFrm[ 1 , 2 ] := APP_ROW
  aFrm[ 1 , 3 ] := APP_COL

  Do_Events()

RETURN


#IFDEF _HMG_2_
//*****************************************************************************************
//* borrowed from [MiniGUI]\samples\advanced\FitToDesktop\FitToDesktop.prg
//*****************************************************************************************

#pragma BEGINDUMP

#include <mgdefs.h>

HB_FUNC (GETDESKTOPREALTOP)
{
  RECT rect;
  SystemParametersInfo( SPI_GETWORKAREA, 1, &rect, 0 );

  hb_retni(rect.top);
}

HB_FUNC (GETDESKTOPREALLEFT)
{
  RECT rect;
  SystemParametersInfo( SPI_GETWORKAREA, 1, &rect, 0 );

  hb_retni(rect.left);
}

HB_FUNC (GETDESKTOPREALWIDTH)
{
  RECT rect;
  SystemParametersInfo( SPI_GETWORKAREA, 1, &rect, 0 );

  hb_retni(rect.right - rect.left);
}

HB_FUNC (GETDESKTOPREALHEIGHT)
{
  RECT rect;
  SystemParametersInfo( SPI_GETWORKAREA, 1, &rect, 0 );

  hb_retni(rect.bottom - rect.top);
}

#pragma ENDDUMP
#ENDIF

*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE SetAdjustControls( xaFrmControls )
*-----------------------------------------------------------------------------*

  LOCAL nI

  IF LEN( xaFrmControls ) > 0


    FOR nI := 1 TO LEN( xaFrmControls )

      SetProperty( xaFrmControls[ nI , 1 ] , xaFrmControls[ nI , 2 ] , "Row"    , ( xaFrmControls[ nI , 3 ] * APP_ADJUST_Y ) )
      SetProperty( xaFrmControls[ nI , 1 ] , xaFrmControls[ nI , 2 ] , "Col"    , ( xaFrmControls[ nI , 4 ] * APP_ADJUST_X ) )
      SetProperty( xaFrmControls[ nI , 1 ] , xaFrmControls[ nI , 2 ] , "Width"  , ( xaFrmControls[ nI , 5 ] * APP_ADJUST_X ) )
      SetProperty( xaFrmControls[ nI , 1 ] , xaFrmControls[ nI , 2 ] , "Height" , ( xaFrmControls[ nI , 6 ] * APP_ADJUST_Y ) )


      IF .NOT. "frm_" $  xaFrmControls[ nI , 2 ]

        SetProperty( xaFrmControls[ nI , 1 ] , xaFrmControls[ nI , 2 ] , "FontSize" , ROUND( xaFrmControls[ nI , 7 ] * APP_ADJUST_Y , 0 ) )

      ENDIF


    NEXT nI


  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
// http://hmgforum.com/viewtopic.php?t=5131
FUNCTION _GetAllControlsInForm( cFormName )
*-----------------------------------------------------------------------------*

  LOCAL nFormHandle
  LOCAL i
  LOCAL nControlCount
  LOCAL aRetVal := {}
  LOCAL x


  nFormHandle := GetFormHandle ( cFormName )

  nControlCount := LEN( _HMG_aControlHandles )


  FOR i := 1 To nControlCount

    IF _HMG_aControlParentHandles[ i ] == nFormHandle

      IF VALTYPE( _HMG_aControlHandles[ i ] ) == 'N'

         IF !EMPTY( _HMG_aControlNames[ i ] )

            IF ASCAN( aRetVal , _HMG_aControlNames[ i ] ) == 0

               AADD( aRetVal , _HMG_aControlNames[ i ] )

            ENDIF

         ENDIF

      ELSEIF VALTYPE( _HMG_aControlHandles [ i ] ) == 'A'

         FOR x := 1 TO LEN( _HMG_aControlHandles[ i ] )

            IF !EMPTY( _HMG_aControlNames[ i ] )

               IF ASCAN( aRetVal , _HMG_aControlNames[ i ] ) == 0

                  AADD( aRetVal , _HMG_aControlNames [ i ] )

               ENDIF

            ENDIF

         NEXT x

      ENDIF

   ENDIF

NEXT i


RETURN aRetVal
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
// http://hmgforum.com/viewtopic.php?t=5131
FUNCTION _GetArrayOfAllControlsForForm ( cFormName )
*-----------------------------------------------------------------------------*

  LOCAL nFormHandle
  LOCAL i
  LOCAL nControlCount
  LOCAL x

  PRIVATE aRetVal1 := {}
  PRIVATE aRetVal2 := {}

  nFormHandle    := GetFormHandle ( cFormName )
  nControlCount  := LEN( _HMG_SYSDATA [ 3 ] )


  FOR i := 1 TO nControlCount

    IF _HMG_SYSDATA [ 4 ] [ i ] == nFormHandle

      IF VALTYPE( _HMG_SYSDATA [ 3 ] [ i ] ) == 'N'

          AddCtrl( i )

      ELSEIF VALTYPE( _HMG_SYSDATA [ 3 ] [ i ] ) == 'A'

         FOR x := 1 TO LEN( _HMG_SYSDATA [ 3 ] [ i ] )

               AddCtrl( i )

         NEXT x

      ELSE

          AddCtrl( i )

      ENDIF

    ENDIF

  NEXT i


RETURN aRetVal1
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
FUNCTION AddCtrl( nIndx )
*-----------------------------------------------------------------------------*


  If !EMPTY( _HMG_SYSDATA [ 2 ] [ nIndx ] )

    If ASCAN( aRetVal2, _HMG_SYSDATA [ 2 ] [ nIndx ] ) == 0

      IF !EMPTY( _HMG_SYSDATA [ 3 ] [ nIndx ] )

        AADD( aRetVal1 , _HMG_SYSDATA [ 2 ] [ nIndx ] )

      ENDIF

    ENDIF

  ELSE

    IF !EMPTY( _HMG_SYSDATA [ 3 ] [ nIndx ] )

       AADD( aRetVal1 , _HMG_SYSDATA [ 2 ] [ nIndx ] )

    ENDIF

  ENDIF

RETURN Nil
*-----------------------------------------------------------------------------*


#IFDEF _HMG_3_
*-----------------------------------------------------------------------------*
#pragma BEGINDUMP

#include "SET_COMPILE_HMG_UNICODE.ch"
#include "HMG_UNICODE.h"

#include <windows.h>
#include "hbapi.h"

// https://msdn.microsoft.com/en-us/library/windows/desktop/ms646265(v=vs.85).aspx
// TrackMouseEvent(nHWnd, [nFlags], [nHoverTime]) --> lSuccess
HB_FUNC( TRACKMOUSEEVENT )
{
  TRACKMOUSEEVENT tmi;

  tmi.cbSize      = sizeof( TRACKMOUSEEVENT );
  tmi.dwFlags     = HB_ISNUM(3) ? (DWORD) hb_parni(2) : TME_LEAVE;
  tmi.hwndTrack   = (HWND) HMG_parnl(1);
  tmi.dwHoverTime = HB_ISNUM(3) ? (DWORD) hb_parni(3) : HOVER_DEFAULT;

  hb_retl(TrackMouseEvent(&tmi));
}

#pragma ENDDUMP
*-----------------------------------------------------------------------------*
#ENDIF


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
