

CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
  EXPORTING
    p_object       = 'GRAPHICS'
    p_name         = 'ENJOY'
    p_id           = 'BMAP'
    p_btype        = 'BCOL'
  RECEIVING
    p_bmp          = gv_comp_logo
  EXCEPTIONS
    not_found      = 1
    internal_error = 2
    OTHERS         = 3.
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
