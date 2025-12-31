REPORT zstudent_master.

DATA: gs_student TYPE zstudent,
      lv_doj     TYPE d.

PARAMETERS:
  p_id   TYPE zstudent-stud_id,
  p_name TYPE zstudent-stud_name,
  p_dept TYPE zstudent-dept,
  p_year TYPE zstudent-stud_year,
  p_doj  TYPE c LENGTH 8.

START-OF-SELECTION.

  lv_doj = p_doj.

  gs_student-stud_id   = p_id.
  gs_student-stud_name = p_name.
  gs_student-dept      = p_dept.
  gs_student-stud_year = p_year.
  gs_student-doj       = lv_doj.

  INSERT zstudent FROM gs_student.

  IF sy-subrc = 0.
    WRITE: 'Student record inserted successfully'.
  ELSE.
    WRITE: 'Error inserting student record'.
  ENDIF.