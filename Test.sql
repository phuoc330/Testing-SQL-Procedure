DECLARE
    p_scm_header_data   xx_po_scm_hdr_obj;-- := xx_po_scm_hdr_obj();
    p_lines_1           xx_po_scm_lines_obj;
    p_lines_2           xx_po_scm_lines_obj;
    p_lines_tab         xx_po_scm_lines_tab;
    lc_return_code      varchar2(100);
    lc_return_msg       varchar2(2000);
BEGIN

--SELECT po_headers_interface_s.NEXTVAL
--INTO p_scm_header_data.record_id
--FROM dual;
p_scm_header_data := xx_po_scm_hdr_obj(po_headers_interface_s.nextval,'I','10451011-1214','USD','000008765',1214,'O','CC',NULL,NULL,
'CL','0000000',to_char(SYSDATE,'DD-MON-RR'),to_char(SYSDATE,'DD-MON-RR'),NULL,NULL,'VW',4,10,NULL,NULL,10,'Y','SHIP PER ROUTING GUIDE SCM'
,'Y',to_char(SYSDATE,'DD-MON-RR'),to_char(SYSDATE,'DD-MON-RR'),to_char(SYSDATE,'DD-MON-RR'),NULL,NULL,'O',NULL,NULL,0.007,10,30,NULL
,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4286,'1045101','4286',NULL,NULL/*'U' record_status*/,NULL,NULL,NULL,'NEW','SCM',NULL,NULL,NULL,NULL,
to_char(SYSDATE,'DD-MON-RR'),NULL,to_char(SYSDATE,'DD-MON-RR'),NULL,NULL,NULL);

p_lines_1 := xx_po_scm_lines_obj(po_lines_interface_s.NEXTVAL,20498004,'I','10451011-1214',1,0725799,11,1214,to_char(SYSDATE,'DD-MON-RR'),
to_char(SYSDATE,'DD-MON-RR'),NULL,'EA',10,NULL,NULL,NULL,'SPNumber',10,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'SCM',NULL,NULL,NULL,NULL,
to_char(SYSDATE,'DD-MON-RR'),NULL,to_char(SYSDATE,'DD-MON-RR'),NULL,NULL,NULL);

p_lines_2 := xx_po_scm_lines_obj(po_lines_interface_s.NEXTVAL,20498004,'I','10451011-1214',2,02055367,6,1214,to_char(SYSDATE,'DD-MON-RR'),
to_char(SYSDATE,'DD-MON-RR'),NULL,'EA',10,NULL,NULL,NULL,'SPNumber',10,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'SCM',NULL,NULL,NULL,NULL,
to_char(SYSDATE,'DD-MON-RR'),NULL,to_char(SYSDATE,'DD-MON-RR'),NULL,NULL,NULL); 

p_lines_tab := xx_po_scm_lines_tab();
p_lines_tab.extend;
p_lines_tab(1) := p_lines_1;
p_lines_tab.extend;
p_lines_tab(2) := p_lines_2;

xx_po_scm_data_insert.load_scm_data(p_scm_header_data,p_lines_tab,lc_return_code,lc_return_msg);
--dbms_output.put_line(p_scm_header_data.record_id);
--dbms_output.put_line(p_lines_1.record_id);
--dbms_output.put_line(p_scm_header_data.record_id);
--dbms_output.put_line('Lines table data record id'||p_lines_tab(1).record_line_id||' - '||p_lines_tab(1).record_id);
--dbms_output.put_line('Lines table data record id'||p_lines_tab(2).record_line_id||' - '||p_lines_tab(2).record_id);
dbms_output.put_line(lc_return_code||' - '||lc_return_msg);
END;
