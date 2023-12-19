*&---------------------------------------------------------------------*
*& Module Pool      ZSAPTARGET_EMPLOYEE1_MPP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

INCLUDE ZSAPTARGET_EMPLOYEE1_MPP_TOP            .    " Global Data

* INCLUDE ZSAPTARGET_EMPLOYEE1_MPP_O01            .  " PBO-Modules
* INCLUDE ZSAPTARGET_EMPLOYEE1_MPP_I01            .  " PAI-Modules
* INCLUDE ZSAPTARGET_EMPLOYEE1_MPP_F01            .  " FORM-Routines

*&SPWIZARD: DECLARATION OF TABLECONTROL 'ZSAPTAR1_EMP' ITSELF
CONTROLS: ZSAPTAR1_EMP TYPE TABLEVIEW USING SCREEN 0100.

*&SPWIZARD: OUTPUT MODULE FOR TC 'ZSAPTAR1_EMP'. DO NOT CHANGE THIS LINE
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE ZSAPTAR1_EMP_CHANGE_TC_ATTR OUTPUT.
  DESCRIBE TABLE GT_EMP LINES ZSAPTAR1_EMP-lines.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'ZSAPTAR1_EMP'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MODIFY TABLE
MODULE ZSAPTAR1_EMP_MODIFY INPUT.
  MODIFY GT_EMP
    FROM GS_EMP
    INDEX ZSAPTAR1_EMP-CURRENT_LINE.
ENDMODULE.

*&SPWIZARD: INPUT MODUL FOR TC 'ZSAPTAR1_EMP'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MARK TABLE
MODULE ZSAPTAR1_EMP_MARK INPUT.
  DATA: g_ZSAPTAR1_EMP_wa2 like line of GT_EMP.
    if ZSAPTAR1_EMP-line_sel_mode = 1
    and GS_EMP-MANDT = 'X'.
     loop at GT_EMP into g_ZSAPTAR1_EMP_wa2
       where MANDT = 'X'.
       g_ZSAPTAR1_EMP_wa2-MANDT = ''.
       modify GT_EMP
         from g_ZSAPTAR1_EMP_wa2
         transporting MANDT.
     endloop.
  endif.
  MODIFY GT_EMP
    FROM GS_EMP
    INDEX ZSAPTAR1_EMP-CURRENT_LINE
    TRANSPORTING MANDT.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
  LOOP AT SCREEN.
    IF SCREEN-name = 'GS_EMP-EMPLOYEE_ID' OR SCREEN-name = 'GS_EMP-EMPLOYEE_NAME'
    OR SCREEN-name = 'GS_EMP-EMPLOYEE_ADDR' OR SCREEN-name = 'GS_EMP-GENDER'
    OR SCREEN-name = 'GS_EMP-DOB' OR SCREEN-name = 'GS_EMP-DOJ'
    OR SCREEN-name = 'GS_EMP-DESIGNATION' OR SCREEN-name = 'GS_EMP-COMPANY_NAME'.
    SCREEN-input = 1.
    MODIFY SCREEN.
    ENDIF.
  ENDLOOP.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  IF SY-ucomm = 'SEARCH'.
    SELECT  MANDT,
            EMPLOYEE_ID,
            EMPLOYEE_NAME,
            EMPLOYEE_ADDR,
            GENDER,
            DOB,
            DOJ,
            DESIGNATION,
            COMPANY_NAME
            FROM zemployeeinfo
            INTO TABLE @gt_emp
            WHERE employee_id = @emp_id.
      IF SY-SUBRC = 0.
        CALL SCREEN 100.
      ELSE.
        MESSAGE 'RECORD NOT FOUND' TYPE 'I'.
      ENDIF.
  ELSEIF SY-ucomm = 'RESET'.
    CLEAR: emp_id, GS_EMP.
    REFRESH GT_EMP.
  ELSEIF SY-ucomm = 'CHANGE'.
    LOOP AT SCREEN.
    IF SCREEN-name = 'GS_EMP-EMPLOYEE_ID' OR SCREEN-name = 'GS_EMP-EMPLOYEE_NAME'
    OR SCREEN-name = 'GS_EMP-EMPLOYEE_ADDR' OR SCREEN-name = 'GS_EMP-GENDER'
    OR SCREEN-name = 'GS_EMP-DOB' OR SCREEN-name = 'GS_EMP-DOJ'
    OR SCREEN-name = 'GS_EMP-DESIGNATION' OR SCREEN-name = 'GS_EMP-COMPANY_NAME'.
    SCREEN-input = 1.
    SCREEN-ACTIVE = 1.
    SCREEN-COLOR = 7.
    ENDIF.
    MODIFY SCREEN.
    ENDLOOP.
  ELSEIF SY-ucomm = 'CREATE'.
    LOOP AT SCREEN.
    IF SCREEN-name = 'GS_EMP-EMPLOYEE_ID' OR SCREEN-name = 'GS_EMP-EMPLOYEE_NAME'
    OR SCREEN-name = 'GS_EMP-EMPLOYEE_ADDR' OR SCREEN-name = 'GS_EMP-GENDER'
    OR SCREEN-name = 'GS_EMP-DOB' OR SCREEN-name = 'GS_EMP-DOJ'
    OR SCREEN-name = 'GS_EMP-DESIGNATION' OR SCREEN-name = 'GS_EMP-COMPANY_NAME'.
    SCREEN-input = 1.     .
    SCREEN-ACTIVE = 1.
    MODIFY SCREEN.
    ENDIF.
    ENDLOOP.
      APPEND INITIAL LINE TO gt_emp.
      ELSEIF SY-ucomm = 'SAVE'.
        IF gs_emp IS NOT INITIAL.
          MOVE-CORRESPONDING GS_EMP TO GS_EMP1.
          MODIFY zemployeeinfo FROM gs_emp1.
          IF SY-SUBRC = 0.
            CLEAR: gs_emp.
            MESSAGE 'DATA CREATED SUCCESSFULLY' TYPE 'S'.
          ELSE.
            MESSAGE 'DATA IS NOT CREATED, MIGHT BE CREATED SAME EXPLOYEE ID BEFORE' TYPE 'I'.
          ENDIF.
        ENDIF.
  ENDIF.
ENDMODULE.
