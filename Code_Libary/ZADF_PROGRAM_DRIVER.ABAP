*&---------------------------------------------------------------------*
*& Report ZPRG_CALLING_PDF_FORM_78
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprg_calling_pdf_form_78.

DATA lwa_parameters TYPE sfpoutputparams.
DATA lv_funcname TYPE funcname.
DATA lv_result TYPE sfpjoboutput.

PARAMETERS: p_vbeln TYPE vbeln_va.

lwa_parameters-nodialog = 'X'.
lwa_parameters-preview = 'X'.

CALL FUNCTION 'FP_JOB_OPEN'
  CHANGING
    ie_outputparams = lwa_parameters
  EXCEPTIONS
    cancel          = 1
    usage_error     = 2
    system_error    = 3
    internal_error  = 4
    OTHERS          = 5.
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'
  EXPORTING
    i_name     = 'ZADOBE_SALES_78'
  IMPORTING
    e_funcname = lv_funcname
*   E_INTERFACE_TYPE           =
*   EV_FUNCNAME_INBOUND        =
  .

CALL FUNCTION lv_funcname
  EXPORTING
*   /1BCDWB/DOCPARAMS        =
    p_vbeln        = p_vbeln
* IMPORTING
*   /1BCDWB/FORMOUTPUT       =
  EXCEPTIONS
    usage_error    = 1
    system_error   = 2
    internal_error = 3
    OTHERS         = 4.
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.



CALL FUNCTION 'FP_JOB_CLOSE'
  IMPORTING
    e_result       = lv_result
  EXCEPTIONS
    usage_error    = 1
    system_error   = 2
    internal_error = 3
    OTHERS         = 4.
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
