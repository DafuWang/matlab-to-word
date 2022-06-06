function [Content,N_figures,N_Table,N_equation,N_refer,n_table]= Title2_1_content(Document,Content,Selection,N_figures,N_Table,N_equation,N_refer,n_table)

Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
[content_text,N_figures,N_Table,N_equation,N_refer]= Title2_1_Paragraph1(N_figures,N_Table,N_equation,N_refer);
Selection.Text = content_text;L=set_format_for_text(Selection);



Selection.Start = Content.end;Selection.TypeParagraph;
str1=strcat('\mathrm{DC}=\left[0.11 S^{0.45}\right]\left[0.143 t^{0.33}\right]\left[0.204 \mathrm{e}^{0.145 \mathrm{C}_{3} \mathrm{A}}\right]');
[n_table,N_equation]=tables_equation_and_number(Document,Selection,str1,n_table,N_equation);

Selection.Start = Content.end;%Selection.TypeParagraph;
[content_text,N_figures,N_Table,N_equation,N_refer]= Title2_1_Paragraph2(N_figures,N_Table,N_equation,N_refer);
Selection.Text = content_text;L=set_format_for_text(Selection);


Selection.Start = Content.end;Selection.TypeParagraph;
str1=strcat('\eta_{a}=e^{-0.016 A}');
[n_table,N_equation]=tables_equation_and_number(Document,Selection,str1,n_table,N_equation);

Selection.Start = Content.end;%Selection.TypeParagraph;
[content_text,N_figures,N_Table,N_equation,N_refer]= Title2_1_Paragraph3(N_figures,N_Table,N_equation,N_refer);
Selection.Text = content_text;L=set_format_for_text(Selection);

Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=3;n_columns=2;
[n_table,N_figures]=tables_figures_and_name(Document,Selection,n_rows,n_columns,N_figures,n_table);

