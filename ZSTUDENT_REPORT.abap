REPORT zstudent_report.

TYPES: BEGIN OF ty_report,
         stud_id   TYPE zstudent-stud_id,
         stud_name TYPE zstudent-stud_name,
         dept      TYPE zstudent-dept,
         subject   TYPE zmarks-subject,
         marks     TYPE zmarks-marks,
         grade     TYPE zmarks-grade,
       END OF ty_report.

DATA: gt_report TYPE TABLE OF ty_report,
      gs_report TYPE ty_report.

START-OF-SELECTION.

  SELECT a~stud_id
         a~stud_name
         a~dept
         b~subject
         b~marks
         b~grade
    INTO TABLE gt_report
    FROM zstudent AS a
    INNER JOIN zmarks AS b
      ON a~stud_id = b~stud_id.

  LOOP AT gt_report INTO gs_report.
    WRITE: / gs_report-stud_id,
             gs_report-stud_name,
             gs_report-dept,
             gs_report-subject,
             gs_report-marks,
             gs_report-grade.
  ENDLOOP.