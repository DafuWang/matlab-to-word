function [n]= Reference_content_number(Content,Selection,refer)


for i=1:size(refer.original,1)
content_text=strcat('[',num2str(refer.original{i,1}),']',' ',refer.original{i,2});
Selection.Text = content_text;
L=set_format_for_reference(Selection);
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
end
n=size(refer.original,1);