function [Content,N_figures,N_Table,N_equation,N_refer,n_table]= Title2_2_content(Document,Content,Selection,N_figures,N_Table,N_equation,N_refer,n_table)

% Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
[content_text,N_figures,N_Table,N_equation,N_refer]= Title2_2_Paragraph1(N_figures,N_Table,N_equation,N_refer);
Selection.Text = content_text;L=set_format_for_text(Selection);


Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
str1='\frac{\sigma_{c}}{\sigma_c^\prime}=\frac{\beta(\varepsilon_c/\varepsilon_{c0})}{\beta-1+(\varepsilon_c/\varepsilon_{c0})^{\beta b}}';%公式latex格式
[n_table,N_equation]=tables_equation_and_number(Document,Selection,str1,n_table,N_equation);%公式输入
