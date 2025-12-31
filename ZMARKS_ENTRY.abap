REPORT zmarks_entry.

DATA: gs_marks TYPE zmarks.

PARAMETERS:
  p_id    TYPE zmarks-stud_id,
  p_sub   TYPE zmarks-subject,
  p_marks TYPE zmarks-marks.

START-OF-SELECTION.

  IF p_marks >= 75.
    gs_marks-grade = 'A'.
  ELSEIF p_marks >= 60.
    gs_marks-grade = 'B'.
  ELSEIF p_marks >= 40.
    gs_marks-grade = 'C'.
  ELSE.
    gs_marks-grade = 'F'.
  ENDIF.

  gs_marks-stud_id = p_id.
  gs_marks-subject = p_sub.
  gs_marks-marks   = p_marks.

  INSERT zmarks FROM gs_marks.

  IF sy-subrc = 0.
    WRITE: 'Marks inserted successfully. Grade:', gs_marks-grade.
  ELSE.
    WRITE: 'Error inserting marks'.
  ENDIF.