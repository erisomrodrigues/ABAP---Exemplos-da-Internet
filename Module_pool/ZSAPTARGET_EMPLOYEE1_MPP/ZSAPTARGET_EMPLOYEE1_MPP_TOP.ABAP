*&---------------------------------------------------------------------*
*& Include ZSAPTARGET_EMPLOYEE1_MPP_TOP             - Module Pool      ZSAPTARGET_EMPLOYEE1_MPP
*&---------------------------------------------------------------------*
PROGRAM ZSAPTARGET_EMPLOYEE1_MPP.

TYPES: BEGIN OF TY_EMP,
        mandt         TYPE zemployeeinfo-mandt,
        employee_id   TYPE zemployeeinfo-employee_id,
        employee_name TYPE zemployeeinfo-employee_name,
        employee_addr TYPE zemployeeinfo-employee_addr,
        gender        TYPE zemployeeinfo-gender,
        dob           TYPE zemployeeinfo-dob,
        doj           TYPE zemployeeinfo-doj,
        designation   TYPE zemployeeinfo-designation,
        company_name  TYPE zemployeeinfo-company_name,
      END OF ty_emp.

DATA: EMP_ID  TYPE zemployeeinfo-employee_id,
      GS_EMP  TYPE ty_emp,
      GS_EMP1 TYPE ty_emp,
      GT_EMP  TYPE TABLE OF ty_emp.
