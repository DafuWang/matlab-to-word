function [Content,reference,N_figures,N_Table,N_equation,N_reference,n_table]= Title3_1_content(Document,Content,Selection,reference,N_reference,N_figures,N_Table,N_equation,n_table)




% Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
[content_text,reference,N_figures,N_Table,N_equation,N_reference]= Title3_1_Paragraph1(reference,N_figures,N_Table,N_equation,N_reference);
Selection.Text = content_text;L=set_format_for_text(Selection);


