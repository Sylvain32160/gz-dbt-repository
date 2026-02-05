{% macro margin_percent(column_name1, column_name2,macro_var) %}
     ROUND(SAFE_DIVIDE(({{column_name1}}-{{column_name2}}),{{column_name1}})*100,{{macro_var}})
 {% endmacro %}