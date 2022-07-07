*-----------------------------------------------------------------------------*
* TableOfLeapYear | EndTheProgram.prg
*-----------------------------------------------------------------------------*
#include "tly_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE EndTheProgram()
*-----------------------------------------------------------------------------*

  LOCAL nI
  LOCAL aControls
  PRIVATE aFrmControls
  PRIVATE aFormProperty

  DECLARE WINDOW win_Main
  DECLARE WINDOW win_EndTheProgram

  aControls := {}
  aFrmControls := {}
  aFormProperty := {}

  IF !IsWIndowDefined( win_EndTheProgram )


#IFDEF _HMG_2_

    LOAD WINDOW EndTheProgram2 AS win_EndTheProgram

    win_EndTheProgram.TitleBar := .F.
    win_EndTheProgram.SysMenu  := .T.
    win_EndTheProgram.Sizable  := .F.

#ENDIF


#IFDEF _HMG_3_

    LOAD WINDOW EndTheProgram3 AS win_EndTheProgram

#ENDIF


    SetProperty( "win_EndTheProgram" , "btn_YES" , "Action" , { || win_EndTheProgram_btn_YES() } )
    SetProperty( "win_EndTheProgram" , "btn_NOT" , "Action" , { || win_EndTheProgram_btn_NOT() } )


    ON KEY ALT+F4 OF win_EndTheProgram ACTION { || NIL }


    AADD( aFrm , { "win_EndTheProgram"    , ;
                 win_EndTheProgram.Row  , ;
                 win_EndTheProgram.Col  , ;
               } )


#IFDEF _HMG_2_

    aControls := _GetAllControlsInForm( "win_EndTheProgram" )

#ENDIF


#IFDEF _HMG_3_

    aControls := _GetArrayOfAllControlsForForm( "win_EndTheProgram" )

#ENDIF


    FOR nI := 1 TO LEN( aControls )

      AADD( aFrmControls ,;
      { "win_EndTheProgram" , aControls[ nI ] ,;
        GetProperty( "win_EndTheProgram" , aControls[ nI ] , "Row"      ) ,;
        GetProperty( "win_EndTheProgram" , aControls[ nI ] , "Col"      ) ,;
        GetProperty( "win_EndTheProgram" , aControls[ nI ] , "Width"    ) ,;
        GetProperty( "win_EndTheProgram" , aControls[ nI ] , "Height"   ) ,;
        GetProperty( "win_EndTheProgram" , aControls[ nI ] , "FontSize" )  ;
      } )

    NEXT nI


    AADD( aFormProperty ,;
    { "win_EndTheProgram" , ;
      GetProperty( "win_EndTheProgram" , "Row"    ) ,;
      GetProperty( "win_EndTheProgram" , "Col"    ) ,;
      GetProperty( "win_EndTheProgram" , "Width"  ) ,;
      GetProperty( "win_EndTheProgram" , "Height" )  ;
    } )

    win_EndTheProgram.Activate

  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
#include "EndTheProgram_Events.prg"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
