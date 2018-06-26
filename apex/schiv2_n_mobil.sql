set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end;
/
 
 
--application/set_environment
prompt  APPLICATION 104 - SCHIV2_MOBIL
--
-- Application Export:
--   Application:     104
--   Name:            SCHIV2_MOBIL
--   Date and Time:   09:38 Tuesday June 26, 2018
--   Exported By:     ORA01
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         4.2.6.00.03
--   Instance ID:     61821513498300
--
-- Import:
--   Using Application Builder
--   or
--   Using SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application
 
-- Application Statistics:
--   Pages:                     13
--     Items:                   50
--     Validations:              1
--     Processes:               20
--     Regions:                 35
--     Buttons:                 17
--     Dynamic Actions:          5
--   Shared Components:
--     Logic:
--       Items:                  1
--     Navigation:
--       Tab Sets:               1
--         Tabs:                 1
--       Lists:                 12
--       Breadcrumbs:            1
--       NavBar Entries:         1
--     Security:
--       Authentication:         1
--       Authorization:          4
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 2
--         Region:              16
--         Label:                3
--         List:                 5
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:               1
--     Globalization:
--     Reports:
 
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_040200 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,2590310986472872));
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2012.01.01');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,104);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(nvl(wwv_flow_application_install.get_application_id,104));
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(nvl(wwv_flow_application_install.get_application_id,104));
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => nvl(wwv_flow_application_install.get_application_id,104),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,104),
  p_owner => nvl(wwv_flow_application_install.get_schema,'ORA01'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'SCHIV2_MOBIL'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'F_104'),
  p_page_view_logging => 'YES',
  p_page_protection_enabled_y_n=> 'Y',
  p_checksum_salt=> '33FBA345188BA145A4573D9710CEE8A2E288B2273857177CEECDC87668B6F786',
  p_max_session_length_sec=> null,
  p_compatibility_mode=> '4.2',
  p_html_escaping_mode=> 'E',
  p_flow_language=> 'en',
  p_flow_language_derived_from=> 'FLOW_PRIMARY_LANGUAGE',
  p_allow_feedback_yn=> 'N',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,''),
  p_publish_yn=> 'N',
  p_documentation_banner=> '',
  p_authentication=> 'PLUGIN',
  p_authentication_id=> 4511315083699779 + wwv_flow_api.g_id_offset,
  p_logout_url=> '',
  p_application_tab_set=> 0,
  p_logo_image => 'TEXT:SCHIV2_MOBIL',
  p_public_url_prefix => '',
  p_public_user=> '',
  p_dbauth_url_prefix => '',
  p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,''),
  p_cust_authentication_process=> '',
  p_cust_authentication_page=> '',
  p_flow_version=> 'release 1.0',
  p_flow_status=> 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> 'This application is currently unavailable at this time.',
  p_build_status=> 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_browser_cache=>'N',
  p_browser_frame=>'D',
  p_deep_linking=>'Y',
  p_vpd=> '',
  p_vpd_teardown_code=> '',
  p_authorize_public_pages_yn=>'N',
  p_csv_encoding=> 'Y',
  p_include_legacy_javascript=> 'N',
  p_default_error_display_loc=> 'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_substitution_string_01 => 'GENERAL_DATE',
  p_substitution_value_01  => 'DD.MM.YYYY',
  p_last_updated_by => 'ORA01',
  p_last_upd_yyyymmddhh24miss=> '20180626093843',
  p_ui_type_name => null,
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

----------------
--package app map
--
prompt  ...user interfaces
--
 
begin
 
--application/user interface/jquery_mobile_smartphone
wwv_flow_api.create_user_interface (
  p_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_ui_type_name => 'JQM_SMARTPHONE'
 ,p_display_name => 'jQuery Mobile Smartphone'
 ,p_display_seq => 10
 ,p_use_auto_detect => false
 ,p_is_default => true
 ,p_theme_id => 50
 ,p_home_url => 'f?p=&APP_ID.:1:&SESSION.'
 ,p_login_url => 'f?p=&APP_ID.:LOGIN_JQM_SMARTPHONE:&SESSION.'
 ,p_global_page_id => 0
  );
null;
 
end;
/

prompt  ...plug-in settings
--
 
begin
 
--application/plug-in setting/item_type_native_yes_no
wwv_flow_api.create_plugin_setting (
  p_id => 4507723345699768 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_plugin_type => 'ITEM TYPE'
 ,p_plugin => 'NATIVE_YES_NO'
 ,p_attribute_01 => 'Y'
 ,p_attribute_03 => 'N'
  );
null;
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
--application/shared_components/security/authorization/schiv2_dozent
wwv_flow_api.create_security_scheme (
  p_id => 4519224877775851 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SCHIV2_DOZENT'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'DECLARE'||unistr('\000a')||
''||unistr('\000a')||
'dozent NUMBER(1,0) := 0;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'select dozent into dozent from schiv2_users where userid = :APP_USERID;'||unistr('\000a')||
''||unistr('\000a')||
'return dozent >= 1;'||unistr('\000a')||
''||unistr('\000a')||
'end;'
 ,p_error_message => 'Your are not a dozent.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/schiv2_dozent1
wwv_flow_api.create_security_scheme (
  p_id => 4528332382869086 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SCHIV2_DOZENT1'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'DECLARE'||unistr('\000a')||
''||unistr('\000a')||
'dozent NUMBER(1,0) := 0;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'select dozent into dozent from schiv2_users where userid = :APP_USERID;'||unistr('\000a')||
''||unistr('\000a')||
'return dozent >= 1;'||unistr('\000a')||
''||unistr('\000a')||
'end;'
 ,p_error_message => 'Your are not a dozent.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/schiv2_dozent2
wwv_flow_api.create_security_scheme (
  p_id => 4537307348168147 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SCHIV2_DOZENT2'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'DECLARE'||unistr('\000a')||
''||unistr('\000a')||
'dozent NUMBER(1,0) := 0;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'select dozent into dozent from schiv2_users where userid = :APP_USERID;'||unistr('\000a')||
''||unistr('\000a')||
'return dozent >= 1;'||unistr('\000a')||
''||unistr('\000a')||
'end;'
 ,p_error_message => 'Your are not a dozent.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
--application/shared_components/security/authorization/schiv2_dozent3
wwv_flow_api.create_security_scheme (
  p_id => 4566608859416937 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'SCHIV2_DOZENT3'
 ,p_scheme_type => 'NATIVE_FUNCTION_BODY'
 ,p_attribute_01 => 'DECLARE'||unistr('\000a')||
''||unistr('\000a')||
'dozent NUMBER(1,0) := 0;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'select dozent into dozent from schiv2_users where userid = :APP_USERID;'||unistr('\000a')||
''||unistr('\000a')||
'return dozent >= 1;'||unistr('\000a')||
''||unistr('\000a')||
'end;'
 ,p_error_message => 'Your are not a dozent.'
 ,p_caching => 'BY_USER_BY_SESSION'
  );
 
end;
/

--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
wwv_flow_api.create_icon_bar_item(
  p_id => 4511214454699779 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 200,
  p_icon_image => '',
  p_icon_subtext=> 'Logout',
  p_icon_target=> '&LOGOUT_URL.',
  p_icon_image_alt=> 'Logout',
  p_icon_height=> 32,
  p_icon_width=> 32,
  p_icon_height2=> 24,
  p_icon_width2=> 24,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> '',
  p_begins_on_new_line=> '',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
 
end;
/

prompt  ...application processes
--
prompt  ...application items
--
--application/shared_components/logic/application_items/app_userid
 
begin
 
wwv_flow_api.create_flow_item (
  p_id => 4515227690742962 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'APP_USERID'
 ,p_scope => 'APP'
 ,p_data_type => 'VARCHAR'
 ,p_is_persistent => 'Y'
 ,p_protection_level => 'I'
  );
 
end;
/

prompt  ...application level computations
--
 
begin
 
null;
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
--application/shared_components/navigation/tabs/standard/t_home
wwv_flow_api.create_tab (
  p_id=> 4513330372699784 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 10,
  p_tab_name=> 'T_HOME',
  p_tab_text => 'Home',
  p_tab_step => 1,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'',
  p_tab_comment  => '');
 
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Shared Lists of values
--
prompt  ...Application Trees
--
--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
null;
 
end;
/

--application/comments
prompt  ...comments: requires application express 2.2 or higher
--
 
--application/pages/page_00000
prompt  ...PAGE 0: Global Page - jQuery Mobile Smartphone
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 0
 ,p_user_interface_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_name => 'Global Page - jQuery Mobile Smartphone'
 ,p_step_title => 'Global Page - jQuery Mobile Smartphone'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'D'
 ,p_cache_page_yn => 'N'
 ,p_last_updated_by => 'ORA01'
 ,p_last_upd_yyyymmddhh24miss => '20180610192433'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4512707738699782 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Header',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509129492699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '101',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> 'Header');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4513027670699783 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Footer',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4508911828699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 100,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_08',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '103',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> 'Footer');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 4512918992699783 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 0,
  p_button_sequence=> 20,
  p_button_plug_id => 4512707738699782+wwv_flow_api.g_id_offset,
  p_button_name    => 'LOGOUT',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(4510508727699775+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Logout',
  p_button_position=> 'REGION_TEMPLATE_NEXT',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:::',
  p_button_condition=> '103',
  p_button_condition_type=> 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4512813867699783 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 0,
  p_button_sequence=> 10,
  p_button_plug_id => 4512707738699782+wwv_flow_api.g_id_offset,
  p_button_name    => 'HOME',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(4510508727699775+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Home',
  p_button_position=> 'REGION_TEMPLATE_PREVIOUS',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:::',
  p_button_condition=> '103',
  p_button_condition_type=> 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_button_cattributes=>'data-icon="home" data-iconpos="notext" data-direction="reverse"',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 0
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00103
prompt  ...PAGE 103: Login Mobil
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 103
 ,p_user_interface_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_name => 'Login Mobil'
 ,p_step_title => 'Login'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Login_Mobil'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'ORA01'
 ,p_last_upd_yyyymmddhh24miss => '20180610191906'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4582215043669218 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 103,
  p_plug_name=> 'Login',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4582408356669219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 103,
  p_name=>'P103_PASSWORD',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 4582215043669218+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'Password',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4582620193669219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 103,
  p_name=>'P103_LOGIN',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 4582215043669218+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default=> 'Login',
  p_prompt=>'Login',
  p_source=>'LOGIN',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(4510605552699775 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4582811225669219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 103,
  p_name=>'P103_USERNAME',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 4582215043669218+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'Username',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 40,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'apex_authentication.send_login_username_cookie ('||unistr('\000a')||
'    p_username => lower(:P103_USERNAME) );';

wwv_flow_api.create_page_process(
  p_id     => 4583221689669219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 103,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Set Username Cookie',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'DECLARE'||unistr('\000a')||
''||unistr('\000a')||
'result boolean := false;'||unistr('\000a')||
'user NUMBER(30,0) := 0;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'result := SCHIV2_LOGIN('||unistr('\000a')||
'  p_username => :P103_USERNAME,'||unistr('\000a')||
'  p_password => :P103_PASSWORD );'||unistr('\000a')||
''||unistr('\000a')||
'if (result = true)'||unistr('\000a')||
'then'||unistr('\000a')||
'wwv_flow_custom_auth_std.post_login('||unistr('\000a')||
'  P_UNAME => :P103_USERNAME,'||unistr('\000a')||
'  P_PASSWORD => :P103_PASSWORD,'||unistr('\000a')||
'  P_SESSION_ID => v(''APP_SESSION''),'||unistr('\000a')||
'  P_FLOW_PAGE => :APP_ID ||'':201'');'||unistr('\000a')||
''||unistr('\000a')||
'select userid into user from schiv2_users where ';

p:=p||'email = :P103_USERNAME;'||unistr('\000a')||
''||unistr('\000a')||
'apex_util.set_session_state(''APP_USERID'', user);'||unistr('\000a')||
''||unistr('\000a')||
'else'||unistr('\000a')||
''||unistr('\000a')||
'owa_util.redirect_url(''f?=&APP_ID.:101:&SESSION.'');'||unistr('\000a')||
''||unistr('\000a')||
'end if;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 4583020279669219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 103,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Login',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'101';

wwv_flow_api.create_page_process(
  p_id     => 4583631861669220 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 103,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear Page(s) Cache',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':P103_USERNAME := apex_authentication.get_login_username_cookie;';

wwv_flow_api.create_page_process(
  p_id     => 4583413262669219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 103,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get Username Cookie',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 103
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00201
prompt  ...PAGE 201: Home Student
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 201
 ,p_user_interface_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_name => 'Home Student'
 ,p_step_title => 'Home Student'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Home Student'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_inline_css => 
'ul.largeLinkList li a img {'||unistr('\000a')||
'  background-image: none !important; '||unistr('\000a')||
'}'
 ,p_step_template => 4507813583699769 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ORA01'
 ,p_last_upd_yyyymmddhh24miss => '20180611103206'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4564602730416935 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(10102845457612861 + wwv_flow_api.g_id_offset),
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4564824343416935 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Find dozent',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_2',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'Welcome &APP_USER.';

wwv_flow_api.create_page_plug (
  p_id=> 4565431555416936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'Welcome',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'7157004820225152';

wwv_flow_api.create_page_plug (
  p_id=> 4565632675416936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 201,
  p_plug_name=> 'My Inscriptions',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 4578529473446757 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 4675111157302337+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>4565927365416936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:201:P210_SEARCH_DOZENT:&P201_SEARCH_DOZENT.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>4565223062416936+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>4566121626416936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_branch_name=> 'Go to dozent site',
  p_branch_action=> 'f?p=&APP_ID.:202:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'BEFORE_HEADER',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_security_scheme => 4519224877775851+ wwv_flow_api.g_id_offset,
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4565014663416936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_SEARCH_DOZENT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 4564824343416935+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_placeholder=>'Search for dozent',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 100,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'RIGHT',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4565223062416936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 201,
  p_name=>'P201_FIND_DOZENT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 4564824343416935+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Find Dozent',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(4510419004699774 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 201
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00202
prompt  ...PAGE 202: Home Dozent
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 202
 ,p_user_interface_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_name => 'Home Dozent'
 ,p_step_title => 'Home Dozent'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Home Dozent'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_inline_css => 
'ul.largeLinkList li a img {'||unistr('\000a')||
'  background-image: none !important; '||unistr('\000a')||
'}'
 ,p_step_template => 4507813583699769 + wwv_flow_api.g_id_offset
 ,p_required_role => 4519224877775851 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ORA01'
 ,p_last_upd_yyyymmddhh24miss => '20180611102747'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4530629254877147 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 202,
  p_plug_name=> 'Breadcrumbs',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(10102845457612861 + wwv_flow_api.g_id_offset),
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4530820200877147 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 202,
  p_plug_name=> 'My Meetings',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509527573699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 4533106496156314 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 4675111157302337+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 4531018063877147 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 202,
  p_button_sequence=> 10,
  p_button_plug_id => 4530820200877147+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE_MEETING',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Create Meeting',
  p_button_position=> 'RIGHT_OF_TITLE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:220:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 202
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00210
prompt  ...PAGE 210: Search Dozent
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 210
 ,p_user_interface_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_name => 'Search Dozent'
 ,p_step_title => 'Search Dozent'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Search Dozent'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_inline_css => 
'ul.largeLinkList li a img {'||unistr('\000a')||
'  background-image: none !important; '||unistr('\000a')||
'}'
 ,p_step_template => 4507813583699769 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ORA01'
 ,p_last_upd_yyyymmddhh24miss => '20180626001709'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4556507514382503 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 210,
  p_plug_name=> 'Find dozent',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_2',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4557523189382506 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 210,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(10102845457612861 + wwv_flow_api.g_id_offset),
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4557727365382506 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 210,
  p_plug_name=> 'NULL',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4558102545382506 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 210,
  p_plug_name=> 'Dozenten',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 4559420722387443 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 4675111157302337+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4556717451382505 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 210,
  p_name=>'P210_FIND_DOZENT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 4556507514382503+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Find Dozent',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(4510419004699774 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4556905218382505 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 210,
  p_name=>'P210_SEARCH_DOZENT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 4556507514382503+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_placeholder=>'Search for dozent',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 100,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'RIGHT',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4557119849382505 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 210,
  p_name=>'P210_SHOW_ONLY_WITH',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 4556507514382503+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Show only dozents with meetings',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(4510419004699774 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P210_SHOW_ONLY',
  p_display_when2=>'0',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_is_persistent=> 'N',
  p_button_action => 'REDIRECT_PAGE',
  p_button_redirect_url => 'f?p=&APP_ID.:210:&SESSION.::&DEBUG.::P210_SHOW_ONLY:1',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4557315876382506 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 210,
  p_name=>'P210_SHOW_ALL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 4556507514382503+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Show all dozents',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(4510419004699774 + wwv_flow_api.g_id_offset),
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P210_SHOW_ONLY',
  p_display_when2=>'0',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_is_persistent=> 'N',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4557931227382506 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 210,
  p_name=>'P210_SHOW_ONLY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 4557727365382506+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Show All',
  p_source=>'0',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 210
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00211
prompt  ...PAGE 211: Dozent meetings
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 211
 ,p_user_interface_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_name => 'Dozent meetings'
 ,p_step_title => 'Dozent meetings'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Dozent meetings'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_inline_css => 
'ul.largeLinkList li a img {'||unistr('\000a')||
'  background-image: none !important; '||unistr('\000a')||
'}'
 ,p_step_template => 4507813583699769 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ORA01'
 ,p_last_upd_yyyymmddhh24miss => '20180611103235'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4561332330400815 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(10102845457612861 + wwv_flow_api.g_id_offset),
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4561506005400816 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_plug_name=> 'NULL',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 4509617422699773+ wwv_flow_api.g_id_offset,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4561909016400817 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 211,
  p_plug_name=> 'Dozent Meetings',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 4562618560405760 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 4675111157302337+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4561723620400816 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 211,
  p_name=>'P211_DOZENTID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 4561506005400816+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 211
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00212
prompt  ...PAGE 212: Inscription
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 212
 ,p_user_interface_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_name => 'Inscription'
 ,p_step_title => 'Inscription'
 ,p_step_sub_title => 'Inscription'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 4507813583699769 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ORA01'
 ,p_last_upd_yyyymmddhh24miss => '20180610183428'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4568722563427367 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 212,
  p_plug_name=> 'Inscription',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4569709130427369 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 212,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(10102845457612861 + wwv_flow_api.g_id_offset),
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4569903003427370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 212,
  p_plug_name=> 'NULL',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 4509617422699773+ wwv_flow_api.g_id_offset,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 4568911034427368 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 212,
  p_button_sequence=> 10,
  p_button_plug_id => 4568722563427367+wwv_flow_api.g_id_offset,
  p_button_name    => 'BACK',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Back',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4569131567427368 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 212,
  p_button_sequence=> 40,
  p_button_plug_id => 4568722563427367+wwv_flow_api.g_id_offset,
  p_button_name    => 'INSCRIPE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Inscripe',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>4571615254427371 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 212,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:211:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4569321561427368 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 212,
  p_name=>'P212_NOTE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 4568722563427367+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Note',
  p_placeholder=>'Note for Dozent',
  p_source=>'NOTE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 4000,
  p_cHeight=> 4,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 4510128070699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4569519376427368 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 212,
  p_name=>'P212_TEXT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 4568722563427367+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '&P212_DOZENT_NAME.'||unistr('\000a')||
'&P212_DESCRIPTION.'||unistr('\000a')||
'&P212_DATE.'||unistr('\000a')||
''||unistr('\000a')||
'&P212_NOTE_OLD.'||unistr('\000a')||
'',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4570130515427370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 212,
  p_name=>'P212_DESCRIPTION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 4569903003427370+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Description',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4570315854427370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 212,
  p_name=>'P212_MEETINGID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 4569903003427370+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Meetingid',
  p_source=>'MEETINGID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4570513622427370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 212,
  p_name=>'P212_DOZENT_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 4569903003427370+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4570727461427370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 212,
  p_name=>'P212_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 4569903003427370+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Date',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'insert into schiv2_inscriptions(meetingid, studentid, note, confirmed)'||unistr('\000a')||
'values(:P212_MEETINGID, :APP_USERID, :P212_NOTE, '||unistr('\000a')||
'(select autoconfirmation'||unistr('\000a')||
' from schiv2_meetings'||unistr('\000a')||
' where meetingid = :P212_MEETINGID));';

wwv_flow_api.create_page_process(
  p_id     => 4570900842427370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 212,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Insert inscription',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>4569131567427368 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'Submit inscription',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'12';

wwv_flow_api.create_page_process(
  p_id     => 4571110491427371 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 212,
  p_process_sequence=> 80,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'select lastname||'', ''||firstname'||unistr('\000a')||
'into :P212_DOZENT_NAME'||unistr('\000a')||
'from schiv2_users'||unistr('\000a')||
'where userid = (select dozentid '||unistr('\000a')||
'                from schiv2_meetings '||unistr('\000a')||
'                where meetingid = :P212_MEETINGID);'||unistr('\000a')||
''||unistr('\000a')||
'select TO_CHAR(timefrom, ''DD.MM.YYYY HH24:MI''), '||unistr('\000a')||
'       description'||unistr('\000a')||
'into :P212_DATE, '||unistr('\000a')||
'     :P212_DESCRIPTION'||unistr('\000a')||
'from schiv2_meetings'||unistr('\000a')||
'where meetingid = :P212_MEETINGID;';

wwv_flow_api.create_page_process(
  p_id     => 4571300539427371 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 212,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get meeting data',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P212_MEETINGID',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 212
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00213
prompt  ...PAGE 213: Inscription View
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 213
 ,p_user_interface_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_name => 'Inscription View'
 ,p_step_title => 'Inscription View'
 ,p_step_sub_title => 'Inscription View'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 4507813583699769 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ORA01'
 ,p_last_upd_yyyymmddhh24miss => '20180610183506'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4574007124431212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 213,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(10102845457612861 + wwv_flow_api.g_id_offset),
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4574202390431212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 213,
  p_plug_name=> 'Inscription',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4575207364431213 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 213,
  p_plug_name=> 'NULL',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 4509617422699773+ wwv_flow_api.g_id_offset,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 4574432702431212 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 213,
  p_button_sequence=> 50,
  p_button_plug_id => 4574202390431212+wwv_flow_api.g_id_offset,
  p_button_name    => 'SEND',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Send',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P213_CONFIRMED',
  p_button_condition2=> '-1',
  p_button_condition_type=> 'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4574604628431212 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 213,
  p_button_sequence=> 60,
  p_button_plug_id => 4574202390431212+wwv_flow_api.g_id_offset,
  p_button_name    => 'BACK',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Back',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>4577327241431214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 213,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 30,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4574801062431212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 213,
  p_name=>'P213_NOTE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 4574202390431212+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Note',
  p_placeholder=>'Note for Dozent',
  p_source=>'NOTE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 4000,
  p_cHeight=> 4,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P213_CONFIRMED',
  p_display_when2=>'-1',
  p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_field_template=> 4510128070699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4575021952431212 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 213,
  p_name=>'P213_TEXT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 4574202390431212+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '&P213_DOZENT_NAME.'||unistr('\000a')||
'&P213_DESCRIPTION.'||unistr('\000a')||
'&P213_DATE.'||unistr('\000a')||
''||unistr('\000a')||
'&P213_NOTE_OLD.'||unistr('\000a')||
'',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4575421041431213 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 213,
  p_name=>'P213_MEETINGID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 4575207364431213+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Meetingid',
  p_source=>'MEETINGID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4575615740431213 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 213,
  p_name=>'P213_CONFIRMED',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 110,
  p_item_plug_id => 4575207364431213+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Confirmed',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4575814030431213 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 213,
  p_name=>'P213_DESCRIPTION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 4575207364431213+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Description',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4576023546431214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 213,
  p_name=>'P213_NOTE_OLD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 4575207364431213+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Note Old',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4576223885431214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 213,
  p_name=>'P213_DOZENT_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 4575207364431213+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4576401676431214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 213,
  p_name=>'P213_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 4575207364431213+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Date',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
''||unistr('\000a')||
'if :P213_NOTE is not null then'||unistr('\000a')||
''||unistr('\000a')||
'update schiv2_inscriptions'||unistr('\000a')||
'set note = note||chr(10)||chr(13)||''Update: ''||:P213_NOTE'||unistr('\000a')||
'where meetingid = :P213_MEETINGID'||unistr('\000a')||
'  and studentid = :APP_USERID;'||unistr('\000a')||
''||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 4576628077431214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 213,
  p_process_sequence=> 60,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'update inscription',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>4574432702431212 + wwv_flow_api.g_id_offset,
  p_process_when=>'P213_CONFIRMED',
  p_process_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2',
  p_process_when2=>'-1',
  p_process_when_type2=>'',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'Update inscription',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'13';

wwv_flow_api.create_page_process(
  p_id     => 4576803135431214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 213,
  p_process_sequence=> 80,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'select lastname||'', ''||firstname'||unistr('\000a')||
'into :P213_DOZENT_NAME'||unistr('\000a')||
'from schiv2_users'||unistr('\000a')||
'where userid = (select dozentid '||unistr('\000a')||
'                from schiv2_meetings '||unistr('\000a')||
'                where meetingid = :P213_MEETINGID);'||unistr('\000a')||
''||unistr('\000a')||
'select TO_CHAR(timefrom, ''DD.MM.YYYY HH24:MI''), '||unistr('\000a')||
'       description'||unistr('\000a')||
'into :P213_DATE, '||unistr('\000a')||
'     :P213_DESCRIPTION'||unistr('\000a')||
'from schiv2_meetings'||unistr('\000a')||
'where meetingid = :P213_MEETINGID;'||unistr('\000a')||
''||unistr('\000a')||
'select confirmed,'||unistr('\000a')||
'       note'||unistr('\000a')||
'into :';

p:=p||'P213_CONFIRMED,'||unistr('\000a')||
'     :P213_NOTE_OLD'||unistr('\000a')||
'from schiv2_inscriptions'||unistr('\000a')||
'where meetingid = :P213_MEETINGID'||unistr('\000a')||
'    and studentid = :APP_USERID;';

wwv_flow_api.create_page_process(
  p_id     => 4577018802431214 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 213,
  p_process_sequence=> 50,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get meeting data',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P213_MEETINGID',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 213
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00220
prompt  ...PAGE 220: Meeting Mobil
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 220
 ,p_user_interface_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_name => 'Meeting Mobil'
 ,p_step_title => 'Meeting Mobil'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Meeting Mobil'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 4507813583699769 + wwv_flow_api.g_id_offset
 ,p_required_role => 4519224877775851 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ORA01'
 ,p_last_upd_yyyymmddhh24miss => '20180618010833'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4784705746840939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 220,
  p_plug_name=> 'Meeting',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4787700016840940 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 220,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(10102845457612861 + wwv_flow_api.g_id_offset),
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 4784901238840939 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 220,
  p_button_sequence=> 50,
  p_button_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_button_name    => 'APPLY_CHANGES',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Apply',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P220_MEETINGID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4785115290840939 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 220,
  p_button_sequence=> 10,
  p_button_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4785331294840939 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 220,
  p_button_sequence=> 40,
  p_button_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P220_MEETINGID',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>4790009546840941 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:201:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4785522121840939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_LENGTH_MINUTES',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 150,
  p_item_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '00',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>' :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_NUMBER_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 2,
  p_cMaxlength=> 2,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510323189699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '0',
  p_attribute_02 => '59',
  p_attribute_03 => 'right',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4785728666840939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_DESCRIPTION',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'Sprechstunde',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Description',
  p_source=>'DESCRIPTION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 4510323189699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4785928942840939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_FROM_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'TO_CHAR (SYSDATE, ''DD.MM.YYYY'')',
  p_item_default_type=> 'PLSQL_EXPRESSION',
  p_prompt=>'Time from',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'TIMEFROM',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 10,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 4510323189699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4786110627840939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_TO_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 210,
  p_item_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'TO_CHAR (SYSDATE, ''DD.MM.YYYY'')',
  p_item_default_type=> 'PLSQL_EXPRESSION',
  p_prompt=>'Time to (while repeating)',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'TIMETO',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 10,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_display_when=>'P220_MEETINGID',
  p_display_when_type=>'ITEM_IS_NULL',
  p_field_template=> 4510323189699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4786320891840940 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_UNITS',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 180,
  p_item_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Units',
  p_source=>'UNITS',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_NUMBER_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 2,
  p_cMaxlength=> 2,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 4510323189699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '1',
  p_attribute_03 => 'right',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4786501371840940 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_AUTOCONFIRMATION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 190,
  p_item_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Autoconfirmation',
  p_source=>'AUTOCONFIRMATION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_CHECKBOX',
  p_lov=> 'STATIC2:Autoconfirmation;1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '1',
  p_attribute_02 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4786709604840940 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_FROM_HOUR',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '13',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_NUMBER_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 2,
  p_cMaxlength=> 2,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510323189699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '0',
  p_attribute_02 => '23',
  p_attribute_03 => 'right',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4786919530840940 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_LENGTH_HOUR',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Length of Meeting',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_NUMBER_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 2,
  p_cMaxlength=> 2,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510323189699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '0',
  p_attribute_02 => '23',
  p_attribute_03 => 'right',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4787115123840940 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_MEETINGID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4787325562840940 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_FROM_MINUTES',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '00',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>' :',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_NUMBER_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 2,
  p_cMaxlength=> 2,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510323189699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '0',
  p_attribute_02 => '59',
  p_attribute_03 => 'right',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4787517423840940 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 220,
  p_name=>'P220_REPEAT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 200,
  p_item_plug_id => 4784705746840939+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Repeat this meeting',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_CHECKBOX',
  p_lov=> 'STATIC2:Weekly repeating;1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_display_when=>'P220_MEETINGID',
  p_display_when_type=>'ITEM_IS_NULL',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '1',
  p_attribute_02 => 'VERTICAL',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 4788019588840940 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 220,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P220_TO_DATE',
  p_validation_sequence=> 10,
  p_validation => 'TO_DATE(:P220_TO_DATE, ''DD.MM.YYYY'') >= TO_DATE(:P220_FROM_DATE, ''DD.MM.YYYY'')',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Time to must be equals or greater than time from.',
  p_always_execute=>'Y',
  p_when_button_pressed=> 4785331294840939 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_associated_item=> 4786110627840939 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 4789511263840941 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 220
 ,p_name => 'update'
 ,p_event_sequence => 20
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P220_FROM_DATE'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 4789815541840941 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 220
 ,p_event_id => 4789511263840941 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_JAVASCRIPT_CODE'
 ,p_attribute_01 => 'apex.item("P220_TO_DATE").setValue(apex.item("P220_FROM_DATE").getValue());'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 4792329096951570 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 220
 ,p_name => 'Display'
 ,p_event_sequence => 30
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P220_REPEAT'
 ,p_triggering_condition_type => 'NOT_NULL'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 4792600083951570 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 220
 ,p_event_id => 4792329096951570 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_SHOW'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P220_TO_DATE'
 ,p_attribute_01 => 'N'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 4792822784951570 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 220
 ,p_event_id => 4792329096951570 + wwv_flow_api.g_id_offset
 ,p_event_result => 'FALSE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_HIDE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P220_TO_DATE'
 ,p_attribute_01 => 'N'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'select '||unistr('\000a')||
'  description, '||unistr('\000a')||
'  TO_CHAR (timefrom, ''DD.MM.YYYY''), '||unistr('\000a')||
'  TO_CHAR (timefrom, ''HH24''), '||unistr('\000a')||
'  TO_CHAR (timefrom, ''MI''), '||unistr('\000a')||
'  TO_CHAR (timeto, ''HH24'') - TO_CHAR (timefrom, ''HH24''), '||unistr('\000a')||
'  TO_CHAR (timeto, ''MI'') - TO_CHAR (timefrom, ''MI''), '||unistr('\000a')||
'  units,'||unistr('\000a')||
'  (CASE WHEN autoconfirmation = 1 THEN 1 ELSE NULL END)'||unistr('\000a')||
'into '||unistr('\000a')||
'  :P220_DESCRIPTION, '||unistr('\000a')||
'  :P220_FROM_DATE,'||unistr('\000a')||
'  :P220_FROM_HOUR,'||unistr('\000a')||
'  :P220_FROM_MINUTES,'||unistr('\000a')||
'  :P220_LENGTH';

p:=p||'_HOUR,'||unistr('\000a')||
'  :P220_LENGTH_MINUTES,'||unistr('\000a')||
'  :P220_UNITS,'||unistr('\000a')||
'  :P220_AUTOCONFIRMATION'||unistr('\000a')||
'from schiv2_meetings'||unistr('\000a')||
'where meetingid = :P220_MEETINGID;';

wwv_flow_api.create_page_process(
  p_id     => 4788112397840941 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 220,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get meeting data',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P220_MEETINGID',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
''||unistr('\000a')||
'timefrom TIMESTAMP := TO_DATE(:P220_FROM_DATE||'' ''||:P220_FROM_HOUR||''.''||:P220_FROM_MINUTES, ''DD.MM.YYYY HH24.MI'');'||unistr('\000a')||
'timeto TIMESTAMP := timefrom + (:P220_LENGTH_HOUR/24) + (:P220_LENGTH_MINUTES/24/60);'||unistr('\000a')||
'dateto Date := TO_DATE(:P220_TO_DATE, ''DD.MM.YYYY'') + 1;'||unistr('\000a')||
''||unistr('\000a')||
'begin'||unistr('\000a')||
''||unistr('\000a')||
'WHILE timefrom < dateto'||unistr('\000a')||
'LOOP'||unistr('\000a')||
''||unistr('\000a')||
'insert into schiv2_meetings ('||unistr('\000a')||
'  dozentid, '||unistr('\000a')||
'  description, '||unistr('\000a')||
'  timefrom, '||unistr('\000a')||
'  timeto, '||unistr('\000a')||
'  units, '||unistr('\000a')||
'';

p:=p||'  autoconfirmation'||unistr('\000a')||
') values ('||unistr('\000a')||
'  :APP_USERID, '||unistr('\000a')||
'  :P220_DESCRIPTION, '||unistr('\000a')||
'  timefrom,'||unistr('\000a')||
'  timeto,'||unistr('\000a')||
'  :P220_UNITS, '||unistr('\000a')||
'  (CASE WHEN :P220_AUTOCONFIRMATION = 1 THEN 1 ELSE 0 END)'||unistr('\000a')||
');'||unistr('\000a')||
''||unistr('\000a')||
'timefrom := timefrom + 7;'||unistr('\000a')||
'timeto := timeto + 7;'||unistr('\000a')||
''||unistr('\000a')||
'END LOOP;'||unistr('\000a')||
''||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 4788322806840941 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 220,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Insert meeting',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>4785331294840939 + wwv_flow_api.g_id_offset,
  p_process_when=>'P220_MEETINGID',
  p_process_when_type=>'ITEM_IS_NULL',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'success',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'update schiv2_meetings set'||unistr('\000a')||
'  dozentid = :APP_USERID,'||unistr('\000a')||
'  description = :P220_DESCRIPTION,'||unistr('\000a')||
'  timefrom = TO_DATE(:P220_FROM_DATE||'' ''||:P220_FROM_HOUR||''.''||:P220_FROM_MINUTES, ''DD.MM.YYYY HH24.MI''),'||unistr('\000a')||
'  timeto = TO_DATE(:P220_FROM_DATE||'' ''||:P220_FROM_HOUR||''.''||:P220_FROM_MINUTES, ''DD.MM.YYYY HH24.MI'') + (:P220_LENGTH_HOUR/24) + (:P220_LENGTH_MINUTES/24/60),'||unistr('\000a')||
'  units = :P220_UNITS, '||unistr('\000a')||
'  autoconfirmation';

p:=p||' = (CASE WHEN :P220_AUTOCONFIRMATION = 1 THEN 1 ELSE 0 END)'||unistr('\000a')||
'where meetingid = :P220_MEETINGID;';

wwv_flow_api.create_page_process(
  p_id     => 4788525638840941 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 220,
  p_process_sequence=> 70,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'update meeting',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>4784901238840939 + wwv_flow_api.g_id_offset,
  p_process_when=>'P220_MEETINGID',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'Meeting updated',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'10';

wwv_flow_api.create_page_process(
  p_id     => 4788700763840941 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 220,
  p_process_sequence=> 80,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 220
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00221
prompt  ...PAGE 221: Meeting information
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 221
 ,p_user_interface_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_name => 'Meeting information'
 ,p_step_title => 'Meeting information'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Meeting information'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 4507813583699769 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ORA01'
 ,p_last_upd_yyyymmddhh24miss => '20180610192923'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4535114545168145 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 221,
  p_plug_name=> 'NULL',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4535522221168146 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 221,
  p_plug_name=> 'Edit Meeting',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_2',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_required_role => 4537307348168147+ wwv_flow_api.g_id_offset,
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4535902301168146 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 221,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(10102845457612861 + wwv_flow_api.g_id_offset),
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4536112017168146 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 221,
  p_plug_name=> 'Open meeting requests',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4508420088699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 4538727199256872 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'7171428009752980';

wwv_flow_api.create_page_plug (
  p_id=> 4536324518168147 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 221,
  p_plug_name=> 'Inscriptions',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 4508420088699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 4538513001252838 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 4535718023168146 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 221,
  p_button_sequence=> 10,
  p_button_plug_id => 4535522221168146+wwv_flow_api.g_id_offset,
  p_button_name    => 'EDIT_MEETING',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Edit Meeting',
  p_button_position=> 'TOP',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:220:&SESSION.::&DEBUG.:220:P220_MEETINGID:&P221_MEETINGID.',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4535317074168146 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 221,
  p_name=>'P221_MEETINGID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 4535114545168145+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Meetingid',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 221
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00222
prompt  ...PAGE 222: Inscription detaile
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 222
 ,p_user_interface_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_name => 'Inscription detaile'
 ,p_step_title => 'Inscription detaile'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Inscription detaile'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 4507813583699769 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ORA01'
 ,p_last_upd_yyyymmddhh24miss => '20180610213954'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4541526360314361 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 222,
  p_plug_name=> 'NULL',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4542301736314362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 222,
  p_plug_name=> 'Inscription information',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 4542514154314362 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 222,
  p_button_sequence=> 10,
  p_button_plug_id => 4542301736314362+wwv_flow_api.g_id_offset,
  p_button_name    => 'SUBMIT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Submit',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4542728555314362 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 222,
  p_button_sequence=> 30,
  p_button_plug_id => 4542301736314362+wwv_flow_api.g_id_offset,
  p_button_name    => 'BACK',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Back',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:221:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4542903553314362 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 222,
  p_button_sequence=> 20,
  p_button_plug_id => 4542301736314362+wwv_flow_api.g_id_offset,
  p_button_name    => 'CONFIRM',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'Y',
  p_button_image_alt=> 'Confirm',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P222_CONFIRMED',
  p_button_condition2=> '0',
  p_button_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4586625018823866 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 222,
  p_button_sequence=> 40,
  p_button_plug_id => 4542301736314362+wwv_flow_api.g_id_offset,
  p_button_name    => 'DECLINE',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Decline',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:224:&SESSION.::&DEBUG.::P224_STUDENTID,P224_MEETINGID:&P222_STUDENTID.,&P222_MEETINGID.',
  p_button_condition=> 'P222_CONFIRMED',
  p_button_condition2=> '0',
  p_button_condition_type=> 'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>4544207050314363 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 222,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:223:&SESSION.::&DEBUG.::P223_MEETINGID,P223_STUDENTID:&P222_MEETINGID.,&P222_STUDENTID.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>4542903553314362+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4541728350314362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 222,
  p_name=>'P222_MEETINGID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 4541526360314361+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Inscriptionid',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4541916778314362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 222,
  p_name=>'P222_STUDENTID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 4541526360314361+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Studentid',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4542121485314362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 222,
  p_name=>'P222_CONFIRMED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 4541526360314361+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Confirmed',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4543112353314362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 222,
  p_name=>'P222_NOTE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 4542301736314362+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Note',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
  p_cMaxlength=> 4000,
  p_cHeight=> 5,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4543311839314362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 222,
  p_name=>'P222_NOTE_OLD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 4542301736314362+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4543516276314363 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 222,
  p_name=>'P222_STUDENT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 4542301736314362+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Student',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'select note, '||unistr('\000a')||
'       confirmed'||unistr('\000a')||
'into :P222_NOTE_OLD,'||unistr('\000a')||
'     :P222_CONFIRMED'||unistr('\000a')||
'from schiv2_inscriptions'||unistr('\000a')||
'where meetingid = :P222_MEETINGID'||unistr('\000a')||
'  and studentid = :P222_STUDENTID;'||unistr('\000a')||
''||unistr('\000a')||
'select lastname||'', ''||firstname'||unistr('\000a')||
'into :P222_STUDENT'||unistr('\000a')||
'from schiv2_users'||unistr('\000a')||
'where userid = :P222_STUDENTID;';

wwv_flow_api.create_page_process(
  p_id     => 4543726159314363 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 222,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get Inscription information',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'if :P222_NOTE is not null then'||unistr('\000a')||
''||unistr('\000a')||
'update schiv2_inscriptions'||unistr('\000a')||
'set note = note||chr(10)||chr(13)|| (select lastname||'', ''||firstname'||unistr('\000a')||
'                            from schiv2_users'||unistr('\000a')||
'                            where userid = :APP_USERID) ||'': ''||:P222_NOTE'||unistr('\000a')||
'where meetingid = :P222_MEETINGID'||unistr('\000a')||
'  and studentid = :P222_STUDENTID;'||unistr('\000a')||
''||unistr('\000a')||
'end if;';

wwv_flow_api.create_page_process(
  p_id     => 4543908766314363 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 222,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Update inscriptions',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_success_message=> 'Updated',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 222
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00223
prompt  ...PAGE 223: confirm inscription
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 223
 ,p_user_interface_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_name => 'confirm inscription'
 ,p_step_title => 'confirm inscription'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'confirm inscription'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 4507813583699769 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ORA01'
 ,p_last_upd_yyyymmddhh24miss => '20180610182436'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4547313011368219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 223,
  p_plug_name=> 'NULL',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'NEVER',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'Update';

wwv_flow_api.create_page_plug (
  p_id=> 4547930104368219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 223,
  p_plug_name=> 'Update',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>4548802318368220 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 223,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:221:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_condition_type=> 'ALWAYS',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4547511174368219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 223,
  p_name=>'P223_MEETINGID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 4547313011368219+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Meetingid',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4547731126368219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 223,
  p_name=>'P223_STUDENTID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 4547313011368219+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Studentid',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 4548314604368219 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 223
 ,p_name => 'go back'
 ,p_event_sequence => 10
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
  );
wwv_flow_api.create_page_da_action (
  p_id => 4548616199368220 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 223
 ,p_event_id => 4548314604368219 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_SUBMIT_PAGE'
 ,p_attribute_02 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'update schiv2_inscriptions'||unistr('\000a')||
'set confirmed = 1'||unistr('\000a')||
'where meetingid = :P223_MEETINGID'||unistr('\000a')||
'  and studentid = :P223_STUDENTID;';

wwv_flow_api.create_page_process(
  p_id     => 4548108047368219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 223,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'update inscription',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 223
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00224
prompt  ...PAGE 224: decline inscription
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 224
 ,p_user_interface_id => 4511130458699779 + wwv_flow_api.g_id_offset
 ,p_name => 'decline inscription'
 ,p_step_title => 'decline inscription'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'decline inscription'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_step_template => 4507813583699769 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ORA01'
 ,p_last_upd_yyyymmddhh24miss => '20180610213649'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4550604371371630 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 224,
  p_plug_name=> 'NULL',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_1',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 4551213230371631 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 224,
  p_plug_name=> 'Decline Inscription',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 4509323607699773+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_new_grid         => false,
  p_plug_new_grid_row     => true,
  p_plug_new_grid_column  => true,
  p_plug_display_column=> null,
  p_plug_display_point=> 'BODY_3',
  p_plug_item_display_point=> 'ABOVE',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_list_template_id=> 4509902381699774+ wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_prn_template_id=> 4507813583699769+ wwv_flow_api.g_id_offset,
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 4551400284371631 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 224,
  p_button_sequence=> 30,
  p_button_plug_id => 4551213230371631+wwv_flow_api.g_id_offset,
  p_button_name    => 'BACK',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Back',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 4551615729371631 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 224,
  p_button_sequence=> 20,
  p_button_plug_id => 4551213230371631+wwv_flow_api.g_id_offset,
  p_button_name    => 'DECLINE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(4510419004699774+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Decline',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>4554110425371634 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 224,
  p_branch_name=> '',
  p_branch_action=> 'f?p=&APP_ID.:221:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4550820687371630 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 224,
  p_name=>'P224_MEETINGID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 4550604371371630+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Inscriptionid',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4551011447371630 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 224,
  p_name=>'P224_STUDENTID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 4550604371371630+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Studentid',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_04 => 'TEXT',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4551826930371631 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 224,
  p_name=>'P224_NOTE_OLD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 4551213230371631+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4552002354371631 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 224,
  p_name=>'P224_STUDENT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 4551213230371631+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Student',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>4552215807371632 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 224,
  p_name=>'P224_NOTE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 4551213230371631+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Why are you rejecting this request?',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 80,
  p_cMaxlength=> 4000,
  p_cHeight=> 5,
  p_new_grid=> false,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> null,
  p_rowspan=> null,
  p_grid_column=> null,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 4510227482699774+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 4553000244371633 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 224
 ,p_name => 'show decline'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P224_NOTE'
 ,p_triggering_condition_type => 'NOT_NULL'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 4553325530371634 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 224
 ,p_event_id => 4553000244371633 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_SHOW'
 ,p_affected_elements_type => 'BUTTON'
 ,p_affected_button_id => 4551615729371631 + wwv_flow_api.g_id_offset
 ,p_attribute_01 => 'N'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 4553521812371634 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 224
 ,p_event_id => 4553000244371633 + wwv_flow_api.g_id_offset
 ,p_event_result => 'FALSE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_HIDE'
 ,p_affected_elements_type => 'BUTTON'
 ,p_affected_button_id => 4551615729371631 + wwv_flow_api.g_id_offset
 ,p_attribute_01 => 'N'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 4553624822371634 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 224
 ,p_name => 'hide decline'
 ,p_event_sequence => 20
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'ready'
  );
wwv_flow_api.create_page_da_action (
  p_id => 4553918176371634 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 224
 ,p_event_id => 4553624822371634 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_HIDE'
 ,p_affected_elements_type => 'BUTTON'
 ,p_affected_button_id => 4551615729371631 + wwv_flow_api.g_id_offset
 ,p_attribute_01 => 'N'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'select note'||unistr('\000a')||
'into :P224_NOTE_OLD'||unistr('\000a')||
'from schiv2_inscriptions'||unistr('\000a')||
'where meetingid = :P224_MEETINGID'||unistr('\000a')||
'  and studentid = :P224_STUDENTID;'||unistr('\000a')||
''||unistr('\000a')||
'select lastname||'', ''||firstname'||unistr('\000a')||
'into :P224_STUDENT'||unistr('\000a')||
'from schiv2_users'||unistr('\000a')||
'where userid = :P224_STUDENTID;';

wwv_flow_api.create_page_process(
  p_id     => 4552426603371632 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 224,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get Inscription information',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'update schiv2_inscriptions'||unistr('\000a')||
'set note = note||chr(10)||chr(13)|| (select lastname||'', ''||firstname'||unistr('\000a')||
'                            from schiv2_users'||unistr('\000a')||
'                            where userid = :APP_USERID) ||'': ''||:P224_NOTE,'||unistr('\000a')||
'confirmed = -1'||unistr('\000a')||
'where meetingid = :P224_MEETINGID'||unistr('\000a')||
'  and studentid = :P224_STUDENTID;';

wwv_flow_api.create_page_process(
  p_id     => 4552603901371632 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 224,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Update inscriptions',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>4551615729371631 + wwv_flow_api.g_id_offset,
  p_process_success_message=> 'Updated',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'224';

wwv_flow_api.create_page_process(
  p_id     => 4552803948371633 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 224,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear Page(s) Cache',
  p_process_sql_clob => p,
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 224
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/lists/dozent_meetings
 
begin
 
wwv_flow_api.create_list (
  p_id=> 4518817297775849 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Dozent meetings',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'select null,'||unistr('\000a')||
'       description label,'||unistr('\000a')||
'       ''f?p=&APP_ID.:21:''||:APP_SESSION||''::::P21_MEETINGID:''||meetingid target,'||unistr('\000a')||
'       null is_current,'||unistr('\000a')||
'       case when (select count(meetingid)'||unistr('\000a')||
'                  from schiv2_inscriptions'||unistr('\000a')||
'                  where schiv2_inscriptions.meetingid = schiv2_meetings.meetingid'||unistr('\000a')||
'                  and confirmed = 0) != 0 then ''#APP_IMAGES#caret-right-8x.png'' else ''#APP_IMAGES#chevron-right-8x.png'' end image,'||unistr('\000a')||
'       ''width="20" height="20"'' image_attribute, '||unistr('\000a')||
'       null image_alt_attribute,'||unistr('\000a')||
'       case when TO_CHAR(timefrom, ''DD.MM.YYYY'') = TO_CHAR(timeto, ''DD.MM.YYYY'') then'||unistr('\000a')||
'                 TO_CHAR(timefrom, ''DD.MM.YYYY HH24:MI'')||'' - ''||TO_CHAR(timeto, ''HH24:MI'')'||unistr('\000a')||
'            else TO_CHAR(timefrom, ''DD.MM.YYYY HH24:MI'')||'' - ''||TO_CHAR(timeto, ''DD.MM.YYYY HH24:MI'') end attribute1, '||unistr('\000a')||
'       case when (select count(meetingid)'||unistr('\000a')||
'                  from schiv2_inscriptions'||unistr('\000a')||
'                  where schiv2_inscriptions.meetingid = schiv2_meetings.meetingid'||unistr('\000a')||
'                  and confirmed = 0) != 0 then ''Open requests, '' end || '||unistr('\000a')||
'       (select count(meetingid)'||unistr('\000a')||
'          from schiv2_inscriptions'||unistr('\000a')||
'          where schiv2_inscriptions.meetingid = schiv2_meetings.meetingid'||unistr('\000a')||
'            and confirmed >= 0)||'' / ''||units||'' Units in use''||case when autoconfirmation = 1 then '', Autoconfirmation'' end attribute2'||unistr('\000a')||
'from schiv2_meetings'||unistr('\000a')||
'where dozentid = :APP_USERID',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/dozent_meetings_mobil
 
begin
 
wwv_flow_api.create_list (
  p_id=> 4533106496156314 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Dozent meetings Mobil',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'select null,'||unistr('\000a')||
'       description label,'||unistr('\000a')||
'       ''f?p=&APP_ID.:221:''||:APP_SESSION||''::::P221_MEETINGID:''||meetingid target,'||unistr('\000a')||
'       null is_current,'||unistr('\000a')||
'       case when (select count(meetingid)'||unistr('\000a')||
'                  from schiv2_inscriptions'||unistr('\000a')||
'                  where schiv2_inscriptions.meetingid = schiv2_meetings.meetingid'||unistr('\000a')||
'                  and confirmed = 0) != 0 then ''#APP_IMAGES#caret-right-8x.png'' else ''#APP_IMAGES#chevron-right-8x.png'' end image,'||unistr('\000a')||
'       ''width="20" height="20"'' image_attribute, '||unistr('\000a')||
'       null image_alt_attribute,'||unistr('\000a')||
'       case when TO_CHAR(timefrom, ''DD.MM.YYYY'') = TO_CHAR(timeto, ''DD.MM.YYYY'') then'||unistr('\000a')||
'                 TO_CHAR(timefrom, ''DD.MM.YYYY HH24:MI'')||'' - ''||TO_CHAR(timeto, ''HH24:MI'')'||unistr('\000a')||
'            else TO_CHAR(timefrom, ''DD.MM.YYYY HH24:MI'')||'' - ''||TO_CHAR(timeto, ''DD.MM.YYYY HH24:MI'') end attribute1, '||unistr('\000a')||
'       case when (select count(meetingid)'||unistr('\000a')||
'                  from schiv2_inscriptions'||unistr('\000a')||
'                  where schiv2_inscriptions.meetingid = schiv2_meetings.meetingid'||unistr('\000a')||
'                  and confirmed = 0) != 0 then ''Open requests, '' end || '||unistr('\000a')||
'       case when units != 0 then (select count(meetingid)'||unistr('\000a')||
'                                    from schiv2_inscriptions'||unistr('\000a')||
'                                    where schiv2_inscriptions.meetingid = schiv2_meetings.meetingid'||unistr('\000a')||
'                                      and confirmed >= 0) ||'' / ''||units||'' Units in use'' else (select count(meetingid)'||unistr('\000a')||
'                                                                                                  from schiv2_inscriptions'||unistr('\000a')||
'                                                                                                  where schiv2_inscriptions.meetingid = schiv2_meetings.meetingid'||unistr('\000a')||
'                                                                                                    and confirmed >= 0)||'' Units in use'' end || '||unistr('\000a')||
'       case when autoconfirmation = 1 then '', Autoconfirmation'' end attribute2'||unistr('\000a')||
'from schiv2_meetings'||unistr('\000a')||
'where dozentid = :APP_USERID'||unistr('\000a')||
'and timeto >= sysdate;',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/dozent_open_meeting_requests
 
begin
 
wwv_flow_api.create_list (
  p_id=> 4536524264168147 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Dozent open meeting requests',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'select null,'||unistr('\000a')||
'        (select lastname||'', ''||firstname'||unistr('\000a')||
'         from schiv2_users'||unistr('\000a')||
'         where userid = studentid) label,'||unistr('\000a')||
'       ''f?p=&APP_ID.:22:''||:APP_SESSION||''::::P22_MEETINGID,P22_STUDENTID:''||meetingid||'',''||studentid target,'||unistr('\000a')||
'       null is_current,'||unistr('\000a')||
'       ''#APP_IMAGES#chevron-right-8x.png'' image,'||unistr('\000a')||
'       ''width="20" height="20"'' image_attribute, '||unistr('\000a')||
'       null image_alt_attribute,'||unistr('\000a')||
'       note attribute1,'||unistr('\000a')||
'       ''Confirm'' attribute2,'||unistr('\000a')||
'       ''uHotButton'' attribute3,'||unistr('\000a')||
'       ''f?p=&APP_ID.:23:''||:APP_SESSION||''::::P23_MEETINGID,P23_STUDENTID:''||meetingid||'',''||studentid attribute4,'||unistr('\000a')||
'       ''Decline'' attribute5,'||unistr('\000a')||
'       '''' attribute6,'||unistr('\000a')||
'       ''f?p=&APP_ID.:24:''||:APP_SESSION||''::::P24_MEETINGID,P24_STUDENTID:''||meetingid||'',''||studentid attribute7,'||unistr('\000a')||
'       ''Block Student'' attribute8,'||unistr('\000a')||
'       '''' attribute9,'||unistr('\000a')||
'       ''f?p=&APP_ID.:25:''||:APP_SESSION||''::::P25_STUDENTID:''||studentid attribute10'||unistr('\000a')||
'from schiv2_inscriptions'||unistr('\000a')||
'where meetingid = :P21_MEETINGID'||unistr('\000a')||
'  and confirmed = 0;',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/dozent_closed_meeting_reguests
 
begin
 
wwv_flow_api.create_list (
  p_id=> 4536912518168147 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Dozent closed meeting reguests',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'select null,'||unistr('\000a')||
'        (select lastname||'', ''||firstname'||unistr('\000a')||
'         from schiv2_users'||unistr('\000a')||
'         where userid = studentid) label,'||unistr('\000a')||
'       ''f?p=&APP_ID.:22:''||:APP_SESSION||''::::P22_MEETINGID,P22_STUDENTID:''||meetingid||'',''||studentid target,'||unistr('\000a')||
'       null is_current,'||unistr('\000a')||
'       ''#APP_IMAGES#chevron-right-8x.png'' image,'||unistr('\000a')||
'       ''width="20" height="20"'' image_attribute, '||unistr('\000a')||
'       null image_alt_attribute,'||unistr('\000a')||
'       note attribute1,'||unistr('\000a')||
'       ''Delete'' attribute2,'||unistr('\000a')||
'       '''' attribute3,'||unistr('\000a')||
'       ''f?p=&APP_ID.:24:''||:APP_SESSION||''::::P24_MEETINGID,P24_STUDENTID:''||meetingid||'',''||studentid attribute4'||unistr('\000a')||
'from schiv2_inscriptions'||unistr('\000a')||
'where meetingid = :P21_MEETINGID'||unistr('\000a')||
'  and confirmed = 1;',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/dozent_closed_meeting_reguests_mobil
 
begin
 
wwv_flow_api.create_list (
  p_id=> 4538513001252838 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Dozent closed meeting reguests Mobil',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'select null,'||unistr('\000a')||
'        (select lastname||'', ''||firstname'||unistr('\000a')||
'         from schiv2_users'||unistr('\000a')||
'         where userid = studentid) label,'||unistr('\000a')||
'       ''f?p=&APP_ID.:222:''||:APP_SESSION||''::::P222_MEETINGID,P222_STUDENTID:''||meetingid||'',''||studentid target,'||unistr('\000a')||
'       null is_current,'||unistr('\000a')||
'       ''#APP_IMAGES#chevron-right-8x.png'' image,'||unistr('\000a')||
'       ''width="20" height="20"'' image_attribute, '||unistr('\000a')||
'       null image_alt_attribute,'||unistr('\000a')||
'       note attribute1'||unistr('\000a')||
'from schiv2_inscriptions'||unistr('\000a')||
'where meetingid = :P221_MEETINGID'||unistr('\000a')||
'  and confirmed = 1;',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/dozent_open_meeting_reguests_mobil
 
begin
 
wwv_flow_api.create_list (
  p_id=> 4538727199256872 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Dozent open meeting reguests Mobil',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'select null,'||unistr('\000a')||
'        (select lastname||'', ''||firstname'||unistr('\000a')||
'         from schiv2_users'||unistr('\000a')||
'         where userid = studentid) label,'||unistr('\000a')||
'       ''f?p=&APP_ID.:222:''||:APP_SESSION||''::::P222_MEETINGID,P222_STUDENTID:''||meetingid||'',''||studentid target,'||unistr('\000a')||
'       null is_current,'||unistr('\000a')||
'       ''#APP_IMAGES#chevron-right-8x.png'' image,'||unistr('\000a')||
'       ''width="20" height="20"'' image_attribute, '||unistr('\000a')||
'       null image_alt_attribute,'||unistr('\000a')||
'       note attribute1'||unistr('\000a')||
'from schiv2_inscriptions'||unistr('\000a')||
'where meetingid = :P221_MEETINGID'||unistr('\000a')||
'  and confirmed = 0;',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/studen_dozenten
 
begin
 
wwv_flow_api.create_list (
  p_id=> 4558306215382507 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Studen dozenten',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'select null,'||unistr('\000a')||
'       lastname||'', ''||firstname label,'||unistr('\000a')||
'       ''f?p=&APP_ID.:11:''||:APP_SESSION||''::::P11_DOZENTID:''||userid target,'||unistr('\000a')||
'       null is_current,'||unistr('\000a')||
'       ''#APP_IMAGES#chevron-right-8x.png'' image,'||unistr('\000a')||
'       ''width="20" height="20"'' image_attribute, '||unistr('\000a')||
'       null image_alt_attribute,'||unistr('\000a')||
'       ''Meetings: ''||(select count(meetingid)'||unistr('\000a')||
'        from schiv2_meetings'||unistr('\000a')||
'        where dozentid = userid) attribute1'||unistr('\000a')||
'from schiv2_users'||unistr('\000a')||
'where dozent = 1'||unistr('\000a')||
'  and (select count(meetingid)'||unistr('\000a')||
'       from schiv2_meetings'||unistr('\000a')||
'       where dozentid = userid) >= nvl(:P10_SHOW_ONLY, 0)'||unistr('\000a')||
'  and (lower(schiv2_users.firstname) like lower(''%''||:P10_SEARCH_DOZENT||''%'')'||unistr('\000a')||
'   or lower(schiv2_users.lastname) like lower(''%''||:P10_SEARCH_DOZENT||''%'')'||unistr('\000a')||
'   or lower(schiv2_users.lastname||'' ''||schiv2_users.firstname) like lower(''%''||:P10_SEARCH_DOZENT||''%''))',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/studen_dozenten_mobil
 
begin
 
wwv_flow_api.create_list (
  p_id=> 4559420722387443 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Studen dozenten Mobil',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'select null,'||unistr('\000a')||
'       lastname||'', ''||firstname label,'||unistr('\000a')||
'       ''f?p=&APP_ID.:211:''||:APP_SESSION||''::::P211_DOZENTID:''||userid target,'||unistr('\000a')||
'       null is_current,'||unistr('\000a')||
'       ''#APP_IMAGES#chevron-right-8x.png'' image,'||unistr('\000a')||
'       ''width="20" height="20"'' image_attribute, '||unistr('\000a')||
'       null image_alt_attribute,'||unistr('\000a')||
'       ''Meetings: ''||((select count(meetingid)'||unistr('\000a')||
'                        from schiv2_meetings'||unistr('\000a')||
'                        where dozentid = userid'||unistr('\000a')||
'                          and timefrom >= sysdate) - (select count(meetingid)'||unistr('\000a')||
'                                                        from schiv2_inscriptions'||unistr('\000a')||
'                                                        where meetingid in (select meetingid'||unistr('\000a')||
'                                                                              from schiv2_meetings'||unistr('\000a')||
'                                                                              where dozentid = userid'||unistr('\000a')||
'                                                                                and timefrom >= sysdate)  '||unistr('\000a')||
'                                                          and studentid = :APP_USERID)) attribute1'||unistr('\000a')||
'from schiv2_users'||unistr('\000a')||
'where dozent = 1'||unistr('\000a')||
'  and disabled = 0'||unistr('\000a')||
'  and (select count(dozentid)'||unistr('\000a')||
'         from schiv2_BLOCKED_STUDENTS'||unistr('\000a')||
'         where dozentid = userid'||unistr('\000a')||
'           and studentid = :APP_USERID) = 0'||unistr('\000a')||
'  and ((select count(meetingid)'||unistr('\000a')||
'         from schiv2_meetings'||unistr('\000a')||
'         where dozentid = userid'||unistr('\000a')||
'           and TIMEFROM >= sysdate) - (select count(meetingid)'||unistr('\000a')||
'                                      from schiv2_inscriptions'||unistr('\000a')||
'                                      where meetingid in (select meetingid'||unistr('\000a')||
'                                                            from schiv2_meetings'||unistr('\000a')||
'                                                            where dozentid = userid'||unistr('\000a')||
'                                                              and TIMEFROM >= sysdate)  '||unistr('\000a')||
'                                        and studentid = :APP_USERID)) >= nvl(:P210_SHOW_ONLY, 0)'||unistr('\000a')||
'  and (lower(schiv2_users.firstname) like lower(''%''||:P210_SEARCH_DOZENT||''%'')'||unistr('\000a')||
'   or lower(schiv2_users.lastname) like lower(''%''||:P210_SEARCH_DOZENT||''%'')'||unistr('\000a')||
'   or lower(schiv2_users.lastname||'' ''||schiv2_users.firstname) like lower(''%''||:P210_SEARCH_DOZENT||''%''))'||unistr('\000a')||
'order by case when (select nvl(facultyid, 0) '||unistr('\000a')||
'                      from schiv2_users'||unistr('\000a')||
'                      where userid = :APP_USERID) = 0 then 0 else'||unistr('\000a')||
'           case when (select facultyid '||unistr('\000a')||
'                       from schiv2_users'||unistr('\000a')||
'                       where userid = :APP_USERID) = nvl(facultyid, 0) then 0 else 1 end end,'||unistr('\000a')||
'        lower(lastname), lower(firstname)',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/student_dozent_meetings
 
begin
 
wwv_flow_api.create_list (
  p_id=> 4562116499400817 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Student dozent meetings',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'select null,'||unistr('\000a')||
'       description label,'||unistr('\000a')||
'       ''f?p=&APP_ID.:12:''||:APP_SESSION||''::::P12_MEETINGID:''||meetingid target,'||unistr('\000a')||
'       null is_current,'||unistr('\000a')||
'       ''#APP_IMAGES#chevron-right-8x.png'' image,'||unistr('\000a')||
'       ''width="20" height="20"'' image_attribute, '||unistr('\000a')||
'       null image_alt_attribute,'||unistr('\000a')||
'       case when TO_CHAR(timefrom, ''DD.MM.YYYY'') = TO_CHAR(timeto, ''DD.MM.YYYY'') then'||unistr('\000a')||
'                 TO_CHAR(timefrom, ''DD.MM.YYYY HH24:MI'')||'' - ''||TO_CHAR(timeto, ''HH24:MI'')'||unistr('\000a')||
'            else TO_CHAR(timefrom, ''DD.MM.YYYY HH24:MI'')||'' - ''||TO_CHAR(timeto, ''DD.MM.YYYY HH24:MI'') end attribute1, '||unistr('\000a')||
'       ''Units available: ''||units attribute2'||unistr('\000a')||
'from schiv2_meetings'||unistr('\000a')||
'where dozentid = :P11_DOZENTID'||unistr('\000a')||
'  and (select count(meetingid)'||unistr('\000a')||
'       from schiv2_inscriptions'||unistr('\000a')||
'       where schiv2_inscriptions.meetingid = schiv2_meetings.meetingid'||unistr('\000a')||
'         and confirmed >= 0) < units'||unistr('\000a')||
'  and (select count(meetingid)'||unistr('\000a')||
'       from schiv2_inscriptions'||unistr('\000a')||
'       where schiv2_inscriptions.meetingid = schiv2_meetings.meetingid'||unistr('\000a')||
'         and studentid = :APP_USERID) = 0;',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/student_dozent_meetings_mobil
 
begin
 
wwv_flow_api.create_list (
  p_id=> 4562618560405760 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Student dozent meetings Mobil',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'select null,'||unistr('\000a')||
'       description label,'||unistr('\000a')||
'       ''f?p=&APP_ID.:212:''||:APP_SESSION||''::::P212_MEETINGID:''||meetingid target,'||unistr('\000a')||
'       null is_current,'||unistr('\000a')||
'       ''#APP_IMAGES#chevron-right-8x.png'' image,'||unistr('\000a')||
'       ''width="20" height="20"'' image_attribute, '||unistr('\000a')||
'       null image_alt_attribute,'||unistr('\000a')||
'       case when TO_CHAR(timefrom, ''DD.MM.YYYY'') = TO_CHAR(timeto, ''DD.MM.YYYY'') then'||unistr('\000a')||
'                 TO_CHAR(timefrom, ''DD.MM.YYYY HH24:MI'')||'' - ''||TO_CHAR(timeto, ''HH24:MI'')'||unistr('\000a')||
'            else TO_CHAR(timefrom, ''DD.MM.YYYY HH24:MI'')||'' - ''||TO_CHAR(timeto, ''DD.MM.YYYY HH24:MI'') end attribute1, '||unistr('\000a')||
'       case when units != 0 then ''Units available: ''||units end attribute2'||unistr('\000a')||
'from schiv2_meetings'||unistr('\000a')||
'where dozentid = :P211_DOZENTID'||unistr('\000a')||
'  and timefrom >= sysdate'||unistr('\000a')||
'  and (units = 0'||unistr('\000a')||
'       or (select count(meetingid)'||unistr('\000a')||
'             from schiv2_inscriptions'||unistr('\000a')||
'             where schiv2_inscriptions.meetingid = schiv2_meetings.meetingid'||unistr('\000a')||
'               and confirmed >= 0) < units)'||unistr('\000a')||
'  and (select count(meetingid)'||unistr('\000a')||
'       from schiv2_inscriptions'||unistr('\000a')||
'       where schiv2_inscriptions.meetingid = schiv2_meetings.meetingid'||unistr('\000a')||
'         and studentid = :APP_USERID) = 0;',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/student_inscriptions
 
begin
 
wwv_flow_api.create_list (
  p_id=> 4566209268416936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Student inscriptions',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'select null,'||unistr('\000a')||
'       schiv2_users.lastname||'', ''||schiv2_users.firstname label,'||unistr('\000a')||
'       ''f?p=&APP_ID.:13:''||:APP_SESSION||''::::P13_MEETINGID:''||schiv2_inscriptions.meetingid target,'||unistr('\000a')||
'       null is_current,'||unistr('\000a')||
'       ''#APP_IMAGES#chevron-right-8x.png'' image,'||unistr('\000a')||
'       ''width="20" height="20"'' image_attribute, '||unistr('\000a')||
'       null image_alt_attribute,'||unistr('\000a')||
'       schiv2_meetings.description attribute1, '||unistr('\000a')||
'       case when schiv2_inscriptions.confirmed = 1 then ''Confirmed'' else '||unistr('\000a')||
'           case when schiv2_inscriptions.confirmed = -1 then ''Declined'' else ''Open'' end '||unistr('\000a')||
'       end attribute2,'||unistr('\000a')||
'       schiv2_inscriptions.note attribute3'||unistr('\000a')||
' from SCHIV2_USERS SCHIV2_USERS,'||unistr('\000a')||
'    SCHIV2_MEETINGS SCHIV2_MEETINGS,'||unistr('\000a')||
'    SCHIV2_INSCRIPTIONS SCHIV2_INSCRIPTIONS'||unistr('\000a')||
' where schiv2_inscriptions.studentid = :APP_USERID'||unistr('\000a')||
'   and schiv2_inscriptions.meetingid = schiv2_meetings.meetingid'||unistr('\000a')||
'   and schiv2_meetings.dozentid = schiv2_users.userid;',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/lists/student_inscriptions_mobil
 
begin
 
wwv_flow_api.create_list (
  p_id=> 4578529473446757 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Student inscriptions Mobil',
  p_list_type=> 'SQL_QUERY',
  p_list_query=>'select null,'||unistr('\000a')||
'       schiv2_users.lastname||'', ''||schiv2_users.firstname label,'||unistr('\000a')||
'       ''f?p=&APP_ID.:213:''||:APP_SESSION||''::::P213_MEETINGID:''||schiv2_inscriptions.meetingid target,'||unistr('\000a')||
'       null is_current,'||unistr('\000a')||
'       ''#APP_IMAGES#chevron-right-8x.png'' image,'||unistr('\000a')||
'       ''width="20" height="20"'' image_attribute, '||unistr('\000a')||
'       null image_alt_attribute,'||unistr('\000a')||
'       schiv2_meetings.description attribute1, '||unistr('\000a')||
'       case when schiv2_inscriptions.confirmed = 1 then ''Confirmed'' else '||unistr('\000a')||
'           case when schiv2_inscriptions.confirmed = -1 then ''Declined'' else ''Open'' end '||unistr('\000a')||
'       end attribute2,'||unistr('\000a')||
'       schiv2_inscriptions.note attribute3'||unistr('\000a')||
' from SCHIV2_USERS SCHIV2_USERS,'||unistr('\000a')||
'    SCHIV2_MEETINGS SCHIV2_MEETINGS,'||unistr('\000a')||
'    SCHIV2_INSCRIPTIONS SCHIV2_INSCRIPTIONS'||unistr('\000a')||
' where schiv2_inscriptions.studentid = :APP_USERID'||unistr('\000a')||
'   and schiv2_inscriptions.meetingid = schiv2_meetings.meetingid'||unistr('\000a')||
'   and schiv2_meetings.dozentid = schiv2_users.userid'||unistr('\000a')||
'   and schiv2_meetings.timeto >= sysdate;',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT' );
 
null;
 
end;
/

--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
 
begin
 
wwv_flow_api.create_menu (
  p_id=> 4512422001699782 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> ' Breadcrumb');
 
null;
 
end;
/

prompt  ...page templates for application: 104
--
--application/shared_components/user_interface/templates/page/page
prompt  ......Page template 4507813583699769
 
begin
 
wwv_flow_api.create_template (
  p_id => 4507813583699769 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 50
 ,p_name => 'Page'
 ,p_is_popup => false
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_50/css/4_2.css'
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE.">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <meta charset="utf-8" />'||unistr('\000a')||
'  <meta name="apple-mobile-web-app-capable" content="yes">'||unistr('\000a')||
'  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scaleable=no">'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'  #TEMPLATE_CSS#'||unistr('\000a')||
'  #APEX_JAVASCRIPT#'||unistr('\000a')||
'  #TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'  #APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'  #HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'
 ,p_box => 
'<div id="#PAGE_STATIC_ID#" data-role="page" data-apex-page-transition="#PAGE_TRANSITION#" data-apex-popup-transition="#POPUP_TRANSITION#" data-theme="c" data-url="#REQUESTED_URL#">'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''||unistr('\000a')||
'#REGION_POSITION_01#'||unistr('\000a')||
''||unistr('\000a')||
'<div data-role="content" data-theme="c">'||unistr('\000a')||
'  <div id="messages">'||unistr('\000a')||
'    #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  #BOX_BODY#'||unistr('\000a')||
'</div><!-- /content -->'||
''||unistr('\000a')||
''||unistr('\000a')||
'#REGION_POSITION_08#'||unistr('\000a')||
''||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</div><!-- /page -->'
 ,p_footer_template => 
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="ui-bar ui-bar-d success" style="margin-bottom:20px;" id="success-message">'||unistr('\000a')||
'  <h4 style="display:inline-block;margin-top:5px;">#SUCCESS_MESSAGE#</h4>'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="ui-bar ui-bar-b notification" id="notification-message">'||unistr('\000a')||
'  <h4 style="display:inline-block; margin-top:5px;">#MESSAGE#</h4>'||unistr('\000a')||
'</div>'
 ,p_theme_class_id => 17
 ,p_grid_type => 'VARIABLE'
 ,p_grid_max_columns => 5
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => false
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '<div class="ui-grid-#USED_COLUMNS_ALPHA_MINUS# apex-grid-debug">#ROWS#</div>'
 ,p_grid_row_template => '#COLUMNS#'
 ,p_grid_column_template => '<div class="ui-block-#COLUMN_ALPHA#">#CONTENT#</div>'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document).on("apex-devbar-grid-debug-on", function(){'||unistr('\000a')||
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").addClass("ui-bar-e"); });'||unistr('\000a')||
''||unistr('\000a')||
'apex.jQuery(document).on("apex-devbar-grid-debug-off", function(){'||unistr('\000a')||
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").removeClass("ui-bar-e"); });'||unistr('\000a')||
''
 ,p_has_edit_links => false
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 4507926780699770
 
begin
 
wwv_flow_api.create_template (
  p_id => 4507926780699770 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_theme_id => 50
 ,p_name => 'Popup'
 ,p_is_popup => false
 ,p_css_file_urls => '#IMAGE_PREFIX#themes/theme_50/css/4_2.css'
 ,p_header_template => '<!DOCTYPE html>'||unistr('\000a')||
'<html lang="&BROWSER_LANGUAGE.">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'  <meta charset="utf-8" />'||unistr('\000a')||
'  <title>#TITLE#</title>'||unistr('\000a')||
'  #APEX_CSS#'||unistr('\000a')||
'  #TEMPLATE_CSS#'||unistr('\000a')||
'  #APEX_JAVASCRIPT#'||unistr('\000a')||
'  #TEMPLATE_JAVASCRIPT#'||unistr('\000a')||
'  #APPLICATION_JAVASCRIPT#'||unistr('\000a')||
'  #HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>'
 ,p_box => 
'<div id="#PAGE_STATIC_ID#" data-role="page" data-apex-page-transition="#PAGE_TRANSITION#" data-apex-popup-transition="#POPUP_TRANSITION#" data-theme="c">'||unistr('\000a')||
'#PAGE_CSS#'||unistr('\000a')||
'#FORM_OPEN#'||unistr('\000a')||
''||unistr('\000a')||
'<div data-role="content" data-theme="b">'||unistr('\000a')||
'  <div id="messages">'||unistr('\000a')||
'    #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  #BOX_BODY#'||unistr('\000a')||
'</div><!-- /content -->'||unistr('\000a')||
'#FORM_CLOSE#'||unistr('\000a')||
'#PAGE_JAVASCRIPT#'||unistr('\000a')||
'#GENERATED_CSS#'||unistr('\000a')||
'#'||
'GENERATED_JAVASCRIPT#'||unistr('\000a')||
'</div><!-- /page -->'||unistr('\000a')||
''
 ,p_footer_template => 
'</body>'||unistr('\000a')||
'</html>'
 ,p_success_message => '<div class="ui-bar ui-bar-d success" id="success-message">'||unistr('\000a')||
'  <h4 style="display:inline-block;margin-top:5px;">#SUCCESS_MESSAGE#</h4>'||unistr('\000a')||
'</div>'
 ,p_notification_message => '<div class="ui-bar ui-bar-b notification" id="notification-message">'||unistr('\000a')||
'  <h4 style="display:inline-block; margin-top:5px;">#MESSAGE#</h4>'||unistr('\000a')||
'</div>'
 ,p_theme_class_id => 17
 ,p_grid_type => 'VARIABLE'
 ,p_grid_max_columns => 5
 ,p_grid_always_use_max_columns => false
 ,p_grid_has_column_span => false
 ,p_grid_emit_empty_leading_cols => true
 ,p_grid_emit_empty_trail_cols => false
 ,p_grid_template => '<div class="ui-grid-#USED_COLUMNS_ALPHA_MINUS#">#ROWS#</div>'
 ,p_grid_row_template => '#COLUMNS#'
 ,p_grid_column_template => '<div class="ui-block-#COLUMN_ALPHA#">#CONTENT#</div>'
 ,p_grid_javascript_debug_code => 'apex.jQuery(document).on("apex-devbar-grid-debug-on", function(){'||unistr('\000a')||
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").addClass("ui-bar-e"); });'||unistr('\000a')||
''||unistr('\000a')||
'apex.jQuery(document).on("apex-devbar-grid-debug-off", function(){'||unistr('\000a')||
'    apex.jQuery(".apex-grid-debug > [class*=''ui-block-'']").removeClass("ui-bar-e"); });'||unistr('\000a')||
''
 ,p_has_edit_links => false
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/100_button
prompt  ......Button Template 4510419004699774
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 4510419004699774 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => '100% Button'
 ,p_template => 
'<button id="#BUTTON_ID#" type="button" onclick="#JAVASCRIPT#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
 ,p_hot_template => 
'<button id="#BUTTON_ID#" type="button" data-theme="b" onclick="#JAVASCRIPT#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 50
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/header_button
prompt  ......Button Template 4510508727699775
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 4510508727699775 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Header Button'
 ,p_template => 
'<a href="#LINK#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</a>'
 ,p_hot_template => 
'<a href="#LINK#" id="#BUTTON_ID#" class="#BUTTON_CSS_CLASSES#" data-theme="b" #BUTTON_ATTRIBUTES#>#LABEL#</a>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_template_comment => 'It looks like that the <button> tag when used in the header creates a bigger header bar! Have to investigate that'
 ,p_theme_id => 50
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/inline_button
prompt  ......Button Template 4510605552699775
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 4510605552699775 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Inline Button'
 ,p_template => 
'<button id="#BUTTON_ID#" type="button" data-inline="true" onclick="#JAVASCRIPT#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
 ,p_hot_template => 
'<button id="#BUTTON_ID#" type="button" data-inline="true" data-theme="b" onclick="#JAVASCRIPT#" class="#BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES#>#LABEL#</button>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 50
  );
null;
 
end;
/

---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/button_group_horizontal
prompt  ......region template 4508011544699771
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4508011544699771 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-role="controlgroup" data-type="horizontal" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'#CLOSE#'||unistr('\000a')||
'#DELETE#'||unistr('\000a')||
'#CREATE#'||unistr('\000a')||
'#EDIT#'||unistr('\000a')||
'#CHANGE#'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Button Group (Horizontal)'
 ,p_theme_id => 50
 ,p_theme_class_id => 17
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_group_vertical
prompt  ......region template 4508115671699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4508115671699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-role="controlgroup" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'#CLOSE#'||unistr('\000a')||
'#DELETE#'||unistr('\000a')||
'#CREATE#'||unistr('\000a')||
'#EDIT#'||unistr('\000a')||
'#CHANGE#'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Button Group (Vertical)'
 ,p_theme_id => 50
 ,p_theme_class_id => 17
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/collapsible_set_normal
prompt  ......region template 4508227149699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4508227149699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-role="collapsible-set" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'#SUB_REGIONS#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Collapsible Set-Normal'
 ,p_theme_id => 50
 ,p_theme_class_id => 1
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/collapsible_set_smaller
prompt  ......region template 4508314465699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4508314465699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-role="collapsible-set" data-mini="true" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'#SUB_REGIONS#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Collapsible Set-Smaller'
 ,p_theme_id => 50
 ,p_theme_class_id => 1
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/collapsible_normal_closed
prompt  ......region template 4508420088699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4508420088699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-role="collapsible" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<h3>#TITLE#</h3>'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Collapsible-Normal (Closed)'
 ,p_theme_id => 50
 ,p_theme_class_id => 1
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/collapsible_normal_open
prompt  ......region template 4508521995699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4508521995699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-role="collapsible" data-collapsed="false" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<h3>#TITLE#</h3>'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Collapsible-Normal (Open)'
 ,p_theme_id => 50
 ,p_theme_class_id => 1
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/collapsible_smaller_closed
prompt  ......region template 4508603884699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4508603884699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-role="collapsible" data-mini="true" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<h3>#TITLE#</h3>'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Collapsible-Smaller (Closed)'
 ,p_theme_id => 50
 ,p_theme_class_id => 1
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/collapsible_smaller_open
prompt  ......region template 4508716236699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4508716236699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-role="collapsible" data-collapsed="false" data-mini="true" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<h3>#TITLE#</h3>'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Collapsible-Smaller (Open)'
 ,p_theme_id => 50
 ,p_theme_class_id => 1
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/footer_toolbar_displays_at_bottom_of_page
prompt  ......region template 4508811268699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4508811268699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-role="footer" data-theme="b" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  #CHANGE#'||unistr('\000a')||
'  #BODY#'||unistr('\000a')||
'</div> <!-- /footer -->'
 ,p_page_plug_template_name => 'Footer Toolbar (Displays at Bottom of Page)'
 ,p_theme_id => 50
 ,p_theme_class_id => 22
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/footer_toolbar_fixed
prompt  ......region template 4508911828699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4508911828699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-id="#REGION_STATIC_ID#" data-role="footer" data-theme="b" data-position="fixed" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  #CHANGE#'||unistr('\000a')||
'  #BODY#'||unistr('\000a')||
'</div> <!-- /footer -->'
 ,p_page_plug_template_name => 'Footer Toolbar (Fixed)'
 ,p_theme_id => 50
 ,p_theme_class_id => 22
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/footer_toolbar_fullscreen
prompt  ......region template 4509019947699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4509019947699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-id="#REGION_STATIC_ID#" data-role="footer" data-theme="b" data-position="fixed" data-fullscreen="true" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  #CHANGE#'||unistr('\000a')||
'  #BODY#'||unistr('\000a')||
'</div> <!-- /footer -->'
 ,p_page_plug_template_name => 'Footer Toolbar (Fullscreen)'
 ,p_theme_id => 50
 ,p_theme_class_id => 22
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/header_toolbar_fixed
prompt  ......region template 4509129492699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4509129492699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-id="#REGION_STATIC_ID#" data-role="header" data-theme="b" data-position="fixed" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  #PREVIOUS#'||unistr('\000a')||
'  <h1>#PAGE_TITLE#</h1>'||unistr('\000a')||
'  #NEXT#'||unistr('\000a')||
'  #BODY#'||unistr('\000a')||
'</div> <!-- /header -->'
 ,p_page_plug_template_name => 'Header Toolbar (Fixed)'
 ,p_theme_id => 50
 ,p_theme_class_id => 21
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/header_toolbar_fullscreen
prompt  ......region template 4509226290699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4509226290699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" data-id="#REGION_STATIC_ID#" data-role="header" data-theme="b" data-position="fixed" data-fullscreen="true" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  #PREVIOUS#'||unistr('\000a')||
'  <h1>#TITLE#</h1>'||unistr('\000a')||
'  #NEXT#'||unistr('\000a')||
'  #BODY#'||unistr('\000a')||
'</div> <!-- /header -->'
 ,p_page_plug_template_name => 'Header Toolbar (Fullscreen)'
 ,p_theme_id => 50
 ,p_theme_class_id => 21
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/plain_no_title
prompt  ......region template 4509323607699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4509323607699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#">'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'#SUB_REGIONS#'||unistr('\000a')||
'#CLOSE#'||unistr('\000a')||
'#DELETE#'||unistr('\000a')||
'#CREATE#'||unistr('\000a')||
'#EDIT#'||unistr('\000a')||
'#CHANGE#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Plain (No Title)'
 ,p_theme_id => 50
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_with_title_bar
prompt  ......region template 4509421346699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4509421346699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" class="ui-collapsible #REGION_CSS_CLASSES#" data-theme="b" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <h3 class="ui-collapsible-heading ui-btn ui-corner-top ui-btn-up-a">'||unistr('\000a')||
'    <span class="ui-btn-inner ui-corner-top ui-corner-bottom">'||unistr('\000a')||
'      <span lass="ui-btn-text">#TITLE#</span>'||unistr('\000a')||
'    </span>'||unistr('\000a')||
'  </h3>'||unistr('\000a')||
'  <div class="ui-collapsible-content ui-body-c ui-corner-bottom">'||unistr('\000a')||
'    #BODY#'||unistr('\000a')||
'    #SUB_REGIO'||
'NS#'||unistr('\000a')||
'    #EDIT#'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Region (With Title Bar)'
 ,p_theme_id => 50
 ,p_theme_class_id => 8
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_with_title
prompt  ......region template 4509527573699773
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 4509527573699773 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_layout => 'TABLE'
 ,p_template => 
'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" data-theme="b" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<h3>#TITLE#</h3>'||unistr('\000a')||
'#BODY#'||unistr('\000a')||
'#SUB_REGIONS#'||unistr('\000a')||
'#EDIT#'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Region (With Title)'
 ,p_theme_id => 50
 ,p_theme_class_id => 7
 ,p_default_label_alignment => 'RIGHT'
 ,p_default_field_alignment => 'LEFT'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/button_control_group
prompt  ......list template 4509720661699774
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" rel="external" data-role="button" data-icon="#A01#">#TEXT_ESC_SC#</a>';

t2:=t2||'<a href="#LINK#" rel="external" data-role="button" data-icon="#A01#">#TEXT_ESC_SC#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>4509720661699774 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button Control Group',
  p_theme_id  => 50,
  p_theme_class_id => 9,
  p_list_template_before_rows=>'<div id="navgroup">'||unistr('\000a')||
'   <div data-role="controlgroup" data-type="horizontal">',
  p_list_template_after_rows=>'</div></div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/list_view
prompt  ......list template 4509823630699774
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t3:=t3||'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t5:=t5||'<li data-theme="b">'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

t6:=t6||'<li>'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

t7:=t7||'<li data-theme="b">'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

t8:=t8||'<li>'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

wwv_flow_api.create_list_template (
  p_id=>4509823630699774 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'List View',
  p_theme_id  => 50,
  p_theme_class_id => 9,
  p_list_template_before_rows=>'<ul data-role="listview">',
  p_list_template_after_rows=>'</ul>',
  p_before_sub_list=>'<ul>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/list_view_inset
prompt  ......list template 4509902381699774
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t3:=t3||'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t5:=t5||'<li data-theme="b">'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

t6:=t6||'<li>'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

t7:=t7||'<li data-theme="b">'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

t8:=t8||'<li>'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

wwv_flow_api.create_list_template (
  p_id=>4509902381699774 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'List View (Inset)',
  p_theme_id  => 50,
  p_theme_class_id => 10,
  p_list_template_before_rows=>'<ul data-role="listview" data-inset="true">',
  p_list_template_after_rows=>'</ul>',
  p_before_sub_list=>'<ul data-inset="true">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/navigation_bar
prompt  ......list template 4510028136699774
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#" class="ui-btn-active" data-transition="flow" data-icon="#IMAGE#">#TEXT_ESC_SC#</a></li>';

t2:=t2||'<li><a href="#LINK#" data-transition="flow" data-icon="#IMAGE#">#TEXT_ESC_SC#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>4510028136699774 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Navigation Bar',
  p_theme_id  => 50,
  p_theme_class_id => 11,
  p_list_template_before_rows=>'<div data-role="navbar">'||unistr('\000a')||
'  <ul>'||unistr('\000a')||
'',
  p_list_template_after_rows=>'  </ul>'||unistr('\000a')||
'</div><!-- /navbar -->',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/list_view_inset_custom
prompt  ......list template 4675111157302337
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t2:=t2||'  <li>'||unistr('\000a')||
'    <a href="#LINK#">'||unistr('\000a')||
'      '||unistr('\000a')||
'      <h3>#TEXT#</h3>'||unistr('\000a')||
'      <h4>#A01#</h4>'||unistr('\000a')||
'      <h4>#A02#</h4>'||unistr('\000a')||
'    </a>'||unistr('\000a')||
'  </li>';

t3:=t3||'<li data-theme="b"><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT_ESC_SC#</a></li>';

t5:=t5||'<li data-theme="b">'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

t6:=t6||'<li>'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

t7:=t7||'<li data-theme="b">'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

t8:=t8||'<li>'||unistr('\000a')||
'<a href="#LINK#">#TEXT_ESC_SC#</a>'||unistr('\000a')||
'#SUB_LISTS#'||unistr('\000a')||
'</li>';

wwv_flow_api.create_list_template (
  p_id=>4675111157302337 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'List View (Inset) Custom',
  p_theme_id  => 50,
  p_theme_class_id => 10,
  p_list_template_before_rows=>'<ul data-role="listview" data-inset="true">',
  p_list_template_after_rows=>'</ul>',
  p_before_sub_list=>'<ul data-inset="true">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/standard_report
prompt  ......report template 4509617422699773
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<div class="list-view-cell" style="width:#COLUMN_WIDTH_VAL#%">#COLUMN_VALUE#</div>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 4509617422699773 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard Report',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||unistr('\000a')||
'<ul data-role="listview">',
  p_row_template_after_rows =>'</ul>'||unistr('\000a')||
'</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_before_column_heading=>'<li data-role="list-divider">',
  p_column_heading_template=>'<div class="list-view-cell" id="#COLUMN_HEADER_NAME#" style="width:#COLUMN_WIDTH_VAL#%">#COLUMN_HEADER#</div>',
  p_after_column_heading=>'</li>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-r" data-iconpos="right" data-transition="slide">#PAGINATION_NEXT#</a>',
  p_previous_page_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-l" data-iconpos="left" data-transition="slide" data-direction="reverse">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-r" data-iconpos="right" data-transition="slide">#PAGINATION_NEXT_SET#</a>',
  p_previous_set_template=>'<a href="#LINK#" data-role="button" data-icon="arrow-l" data-iconpos="left" data-transition="slide" data-direction="reverse">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ccc',
  p_theme_id  => 50,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 4509617422699773 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<li>',
  p_row_template_after_last =>'</li>');
exception when others then null;
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/no_label_for_screenreaders
prompt  ......label template 4510128070699774
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 4510128070699774 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label (For Screenreaders)',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#">',
  p_template_body2=>'</label>',
  p_before_item=>'<div data-role="fieldcontain" class="ui-hide-label" id="#CURRENT_ITEM_CONTAINER_ID#">',
  p_after_item=>'</div>',
  p_on_error_before_label=>' ',
  p_on_error_after_label=>' ',
  p_theme_id  => 50,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional
prompt  ......label template 4510227482699774
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 4510227482699774 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#">',
  p_template_body2=>'</label>',
  p_before_item=>'<div data-role="fieldcontain" id="#CURRENT_ITEM_CONTAINER_ID#">',
  p_after_item=>'</div>',
  p_on_error_before_label=>' ',
  p_on_error_after_label=>' ',
  p_theme_id  => 50,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required
prompt  ......label template 4510323189699774
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 4510323189699774 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><img src="#IMAGE_PREFIX#themes/theme_21/images/required.png" alt="#VALUE_REQUIRED#">',
  p_template_body2=>'</label>',
  p_before_item=>'<div data-role="fieldcontain" id="#CURRENT_ITEM_CONTAINER_ID#">',
  p_after_item=>'</div>',
  p_on_error_before_label=>' ',
  p_on_error_after_label=>' ',
  p_theme_id  => 50,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/breadcrumb/breadcrumb
prompt  ......template 4510707521699775
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 4510707521699775 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb',
  p_before_first=>'',
  p_current_page_option=>'#NAME#',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'&nbsp;&gt;&nbsp;',
  p_after_last=>'',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 50,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 4510901857699776
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 4510901857699776 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list.gif',
  p_popup_icon_attr=>'width=13 height=13 alt="#LIST_OF_VALUES#" title="#LIST_OF_VALUES#"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel=stylesheet href=#IMAGE_PREFIX#platform2.css type=text/css>'||unistr('\000a')||
'#THEME_CSS#',
  p_page_body_attr=>'bgcolor=white OnLoad=first_field()',
  p_before_field_text=>' ',
  p_page_heading_text=>'<link rel=stylesheet href=#IMAGE_PREFIX#platform2.css type=text/css><style>a:link { color:#336699; text-decoration:none; padding:2px;} a:visited { color:#336699; text-decoration:none;} a:hover { color:red; text-decoration:underline;} body { font-family:arial; background-color:#ffffff;} </style>',
  p_page_footer_text =>'</center></td></tr></table>',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div><br />',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'Row(s) #FIRST_ROW# - #LAST_ROW#',
  p_result_rows_per_pg=>10,
  p_before_result_set=>'',
  p_theme_id  => 50,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'');
end;
null;
 
end;
/

prompt  ...calendar templates
--
--application/shared_components/user_interface/templates/calendar/basic_calendar
prompt  ......template 4510830562699775
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 4510830562699775 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Basic Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th scope="col" class="m-DayOfWeek">#IDY#</th>',
  p_month_title_format=> '<table summary="#CALENDAR_TITLE# #IMONTH# #YYYY#" class="m-Calendar" id="calendar_month_#REGION_STATIC_ID#" data-enhance=false>'||unistr('\000a')||
'<tr><th scope="colgroup" class="m-MonthTitle" colspan="7" >#IMONTH# #YYYY#</th></tr>'||unistr('\000a')||
'',
  p_month_open_format=> '',
  p_month_close_format=> '<tr><td colspan="7">'||unistr('\000a')||
'<div id="calendar_day_details_#REGION_STATIC_ID#"></div>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<script>'||unistr('\000a')||
'apex.jQuery( "##PAGE_STATIC_ID#" ).on( "pageinit", function() {'||unistr('\000a')||
''||unistr('\000a')||
'    // Initialize calendar data as list view as soon as that section has been refreshed'||unistr('\000a')||
'    // Use Swipe Left and Right to go to the next or previous month'||unistr('\000a')||
'    apex.jQuery( "##REGION_STATIC_ID#", apex.gPageContext$ )'||unistr('\000a')||
'        .on( "apexafterrefresh", function() {'||unistr('\000a')||
'            apex.jQuery( "#calendar_month_#REGION_STATIC_ID#", apex.gPageContext$ )'||unistr('\000a')||
'                .find( "[data-role=''listview'']")'||unistr('\000a')||
'                .listview(); })'||unistr('\000a')||
'        .on( "swipeleft", function() {'||unistr('\000a')||
'            apex.widget.calendar.ajax_calendar(''S'', ''next''); } )'||unistr('\000a')||
'        .on( "swiperight", function() {'||unistr('\000a')||
'            apex.widget.calendar.ajax_calendar(''S'', ''previous''); } );'||unistr('\000a')||
''||unistr('\000a')||
'    // Load calendar data of date if it''s tapped'||unistr('\000a')||
'    apex.jQuery( "##REGION_STATIC_ID#", apex.gPageContext$ ).on( "tap", "#calendar_month_#REGION_STATIC_ID# td[class*=m-]", function () {'||unistr('\000a')||
'        var lDate     = apex.jQuery( this ).data( "date" ),'||unistr('\000a')||
'            lDetails$ = apex.jQuery( "#calendar_day_details_#REGION_STATIC_ID#", apex.gPageContext$ );'||unistr('\000a')||
'        apex.jQuery(".apex-calendar-today-has-data")'||unistr('\000a')||
'            .addClass(''apex-calendar-has-data'')'||unistr('\000a')||
'            .removeClass("apex-calendar-today-has-data");'||unistr('\000a')||
'        apex.jQuery( ".m-Today" )'||unistr('\000a')||
'            .addClass("m-Day")'||unistr('\000a')||
'            .removeClass( "m-Today" );'||unistr('\000a')||
'        apex.jQuery( this ).addClass( "m-Today" );'||unistr('\000a')||
''||unistr('\000a')||
'        apex.widget.calendar.getDayData( "#REGION_STATIC_ID#", lDate, {'||unistr('\000a')||
'            clear: function() {'||unistr('\000a')||
'                lDetails$.empty();'||unistr('\000a')||
'            },'||unistr('\000a')||
'            success: function( pData ) {'||unistr('\000a')||
'                lDetails$.html( pData );'||unistr('\000a')||
'            }'||unistr('\000a')||
'        });'||unistr('\000a')||
'    });'||unistr('\000a')||
''||unistr('\000a')||
'    // New calendar entries can be added with tab and hold'||unistr('\000a')||
'    apex.jQuery( "##REGION_STATIC_ID#", apex.gPageContext$ ).on( "taphold", "#calendar_month_#REGION_STATIC_ID# td[class*=m-]", function (e) {'||unistr('\000a')||
'       apex.widget.calendar.ajaxAddData(e);'||unistr('\000a')||
'    });'||unistr('\000a')||
''||unistr('\000a')||
'    // Get the data of the current day as soon as the page gets displayed'||unistr('\000a')||
'    apex.jQuery( "##PAGE_STATIC_ID#" ).on( "pageshow", function() {'||unistr('\000a')||
'        var lDetails$ = apex.jQuery( "#calendar_day_details_#REGION_STATIC_ID#", apex.gPageContext$ );'||unistr('\000a')||
'        apex.jQuery( ".m-Today", apex.gPageContext$ )'||unistr('\000a')||
'            .addClass( "m-Day" )'||unistr('\000a')||
'            .removeClass( "m-Today" );'||unistr('\000a')||
'        apex.jQuery( "#calendar_month_#REGION_STATIC_ID#", apex.gPageContext$ )'||unistr('\000a')||
'            .find( "td[data-date=#CURRENT_DATE#]" )'||unistr('\000a')||
'            .addClass( "m-Today" );'||unistr('\000a')||
'        apex.widget.calendar.getDayData( "#REGION_STATIC_ID#", "#CURRENT_DATE#", {'||unistr('\000a')||
'            clear: function() {'||unistr('\000a')||
'                lDetails$.empty();'||unistr('\000a')||
'            },'||unistr('\000a')||
'            success: function( pData ) {'||unistr('\000a')||
'                lDetails$.html( pData );'||unistr('\000a')||
'            }'||unistr('\000a')||
'        });'||unistr('\000a')||
'    });'||unistr('\000a')||
''||unistr('\000a')||
'});'||unistr('\000a')||
'</script>',
  p_day_title_format=> '<div class="content-primary" class="m-DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="m-Day #HAS_DATA#" data-date="#CANONICAL_DATE#">#TITLE_FORMAT#',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td class="m-Today #HAS_DATA#" data-date="#CANONICAL_DATE#">#TITLE_FORMAT#',
  p_weekend_title_format=> '<div class="content-primary" class="m-WeekendDayTitle">#DD#</div>'||unistr('\000a')||
'',
  p_weekend_open_format => '<td class="m-WeekendDay #HAS_DATA#"  data-date="#CANONICAL_DATE#">#TITLE_FORMAT#',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="content-primary" class="m-NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="m-NonDay"  data-date="#CANONICAL_DATE#">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '',
  p_daily_open_format => '',
  p_daily_close_format => '',
  p_weekly_title_format => '<table summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="m-WeekCalendar">'||unistr('\000a')||
'	<tr>'||unistr('\000a')||
'        <th scope="colgroup" class="m-monthTitle" colspan="7" >#WTITLE#</th>'||unistr('\000a')||
'	</tr>',
  p_weekly_day_of_week_format => '<th scope="col" class="m-DayOfWeek" >#IDY# #MM#/#DD#</th>'||unistr('\000a')||
'',
  p_weekly_month_open_format => '',
  p_weekly_month_close_format => '</table>'||unistr('\000a')||
'<script>'||unistr('\000a')||
'    // register a delegated event on the table listening for all taphold in TD''s'||unistr('\000a')||
'    apex.jQuery( "##REGION_STATIC_ID#" ).on( "taphold", "td[class^=m-]", function (e) {'||unistr('\000a')||
'        apex.widget.calendar.ajaxAddData(e);'||unistr('\000a')||
'    });'||unistr('\000a')||
'</script>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="m-Day">',
  p_weekly_day_close_format => '</td>',
  p_weekly_today_open_format => '<td class="m-Today">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td class="m-NonDay">',
  p_weekly_weekend_close_format => '</td>',
  p_weekly_time_open_format => '<th scope="row" class="m-hour">',
  p_weekly_time_close_format => '</th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr rowspan="2">',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th scope="col" class="m-DayOfWeek">#IDAY# #DD# #IMONTH# #YYYY#</th>',
  p_daily_month_title_format => '<table summary="#CALENDAR_TITLE# #START_DL#" class="m-DayCalendar"><tr>'||unistr('\000a')||
'',
  p_daily_month_open_format => '',
  p_daily_month_close_format => '</table>'||unistr('\000a')||
'<script>'||unistr('\000a')||
'    // register a delegated event on the table listening for all taphold in TD''s'||unistr('\000a')||
'    apex.jQuery( "##REGION_STATIC_ID#" ).on( "taphold", "td[class^=m-]", function (e) {'||unistr('\000a')||
'        apex.widget.calendar.ajaxAddData(e);'||unistr('\000a')||
'    });'||unistr('\000a')||
'</script>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td class="m-Day">',
  p_daily_day_close_format => '</td>',
  p_daily_today_open_format => '<td class="m-ToDay">',
  p_daily_time_open_format => '<th scope="row" class="m-hour">',
  p_daily_time_close_format => '</th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr rowspan="2" >',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_agenda_format => '<ul data-role="listview">'||unistr('\000a')||
'#DAYS#'||unistr('\000a')||
'</ul>'||unistr('\000a')||
'',
  p_agenda_past_day_format => '<li data-role="list-divider" data-theme="d">#IDAY# #IMONTH# #DD# #YYYY#</li>',
  p_agenda_today_day_format => '<li data-role="list-divider" data-theme="b">#IDAY# #IMONTH# #DD# #YYYY#</li>',
  p_agenda_future_day_format => '<li  data-role="list-divider" >#IDAY# #IMONTH# #DD# #YYYY#</li>',
  p_agenda_past_entry_format => '<li >#DATA#<p class="ui-li-aside">#TIME#</p></li>',
  p_agenda_today_entry_format => '<li >#DATA#<p class="ui-li-aside">#TIME#</p></li>',
  p_agenda_future_entry_format => '<li >#DATA#<p class="ui-li-aside">#TIME#</p></li>',
  p_month_data_format => '<ul id="listview_#REGION_STATIC_ID#" data-role="listview" data-inset="true" data-theme="c">#DAYS#</ul>'||unistr('\000a')||
'',
  p_month_data_entry_format => '<li align="left" >#LINK##DATA#<p class="ui-li-aside">#TIME#</p></li>'||unistr('\000a')||
' ',
  p_theme_id  => 50,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ...application themes
--
--application/shared_components/user_interface/themes/jquery_mobile_smartphone
prompt  ......theme 4511004544699778
begin
wwv_flow_api.create_theme (
  p_id =>4511004544699778 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 50,
  p_theme_name=>'jQuery Mobile Smartphone',
  p_ui_type_name=>'JQM_SMARTPHONE',
  p_is_locked=>false,
  p_default_page_template=>4507813583699769 + wwv_flow_api.g_id_offset,
  p_error_template=>4507813583699769 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>4507813583699769 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'',
  p_sidebar_display_point=>'',
  p_login_template=>null + wwv_flow_api.g_id_offset,
  p_default_button_template=>4510605552699775 + wwv_flow_api.g_id_offset,
  p_default_region_template=>4509323607699773 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>4509323607699773 + wwv_flow_api.g_id_offset,
  p_default_form_template  =>4509323607699773 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>4509527573699773 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>4509323607699773 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>4509323607699773 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>null + wwv_flow_api.g_id_offset,
  p_default_listr_template=>null + wwv_flow_api.g_id_offset,
  p_default_irr_template=>4509323607699773 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>4509617422699773 + wwv_flow_api.g_id_offset,
  p_default_label_template=>4510227482699774 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>null + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>4510830562699775 + wwv_flow_api.g_id_offset,
  p_default_list_template=>4509902381699774 + wwv_flow_api.g_id_offset,
  p_default_option_label=>4510227482699774 + wwv_flow_api.g_id_offset,
  p_default_header_template=>4509129492699773 + wwv_flow_api.g_id_offset,
  p_default_footer_template=>4508911828699773 + wwv_flow_api.g_id_offset,
  p_default_page_transition=>'SLIDE',
  p_default_popup_transition=>'POP',
  p_default_required_label=>4510323189699774 + wwv_flow_api.g_id_offset);
end;
/
 
prompt  ...theme styles
--
 
begin
 
null;
 
end;
/

prompt  ...theme display points
--
 
begin
 
null;
 
end;
/

prompt  ...build options
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/language
prompt  ...Language Maps for Application 104
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...text messages
--
--application/shared_components/globalization/dyntranslations
prompt  ...dynamic translations
--
prompt  ...Shortcuts
--
prompt  ...web services (9iR2 or better)
--
prompt  ...shared queries
--
prompt  ...report layouts
--
prompt  ...authentication schemes
--
--application/shared_components/security/authentication/application_express_authentication
prompt  ......authentication 4511315083699779
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 4511315083699779 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'Application Express Authentication'
 ,p_scheme_type => 'NATIVE_APEX_ACCOUNTS'
 ,p_invalid_session_type => 'LOGIN'
 ,p_use_secure_cookie_yn => 'N'
  );
null;
 
end;
/

prompt  ...ui types
--
 
begin
 
null;
 
end;
/

prompt  ...plugins
--
prompt  ...data loading
--
--application/deployment/definition
prompt  ...application deployment
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
begin
s := null;
wwv_flow_api.create_install (
  p_id => 4758614292538006 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_include_in_export_yn => 'Y',
  p_deinstall_message=> '');
end;
 
 
end;
/

--application/deployment/install
prompt  ...application install scripts
--
--application/deployment/checks
prompt  ...application deployment checks
--
 
begin
 
null;
 
end;
/

--application/deployment/buildoptions
prompt  ...application deployment build options
--
 
begin
 
null;
 
end;
/

prompt  ...post import process
 
begin
 
wwv_flow_api.post_import_process(p_flow_id => wwv_flow.g_flow_id);
null;
 
end;
/

--application/end_environment
commit;
commit;
begin
execute immediate 'begin sys.dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
