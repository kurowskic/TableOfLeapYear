*-----------------------------------------------------------------------------*
PROCEDURE win_main_OnInit()
*-----------------------------------------------------------------------------*

  win_Main.Hide

  AutoAdjustControls( "win_Main" )

  CenterMainWindow()

  CTK_DrawBorder( "win_Main" )

  MakeTableOfLeapYears()
  MakeNavigation()

  win_Main.Label_Menu_1.backcolor:=GRAY
  win_Main.Label_Menu_2.backcolor:=GRAY
  win_Main.Label_Menu_3.backcolor:=BLUE
  win_Main.Label_Menu_4.backcolor:=GRAY
  win_Main.Label_Menu_5.backcolor:=GRAY

  win_Main.Show
  DO_Events()

  win_Main_buttons_Disable()
  DO_Events()

  win_Main_buttons_Enable()
  DO_Events()

RETURN
*-----------------------------------------------------------------------------*


#IFDEF _HMG_3_
*-----------------------------------------------------------------------------*
PROCEDURE win_main_OnPaint()
*-----------------------------------------------------------------------------*

  Show_TitleBar()
  DO_Events()

RETURN
*-----------------------------------------------------------------------------*
#ENDIF


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_btn_About_Action()
*-----------------------------------------------------------------------------*

  About()

  Do_Events()
  win_Main.lbl_BackGround.Setfocus()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_btn_ExitPR()
*-----------------------------------------------------------------------------*

  EndTheProgram()

  Do_Events()
  win_Main.lbl_BackGround.Setfocus()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_btn_MinPR()
*-----------------------------------------------------------------------------*

  aFrm := CTK_Minimize( aFrm )

  Do_Events()
  win_Main.lbl_BackGround.Setfocus()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_buttons_Disable()
*-----------------------------------------------------------------------------*

  win_Main.btn_about.Enabled       := FALSE
  win_Main.btn_minPR.Enabled       := FALSE
  win_Main.btn_ExitPR.Enabled      := FALSE

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_buttons_Enable()
*-----------------------------------------------------------------------------*

  win_Main.btn_about.Enabled       := TRUE
  win_Main.btn_minPR.Enabled       := TRUE
  win_Main.btn_ExitPR.Enabled      := TRUE

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
