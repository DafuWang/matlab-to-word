%%利用MATLAB生成Word文档 function ceshi_Word
%  clear
% I=1;
I=I+1;

filespec_user = (strcat('D:\大论文\大论文\第七章\matlab 程序\matlab 处理应力应变数据程序20220526\matlab_word\2\',num2str(I),'.doc'));% 设定测试Word文件名和路径
[Word,Document,Content,Selection]=word_active_and_open(filespec_user);%word得激活和创建
L=word_PageSetup(Document);%% 页面设置
Content.Start = 0;%设定光标位置
Paragraphformat = Selection.ParagraphFormat;
N_figures=1;n_table=1;N_equation=1;N_Table=1;N_refer=0;%用于记录图片、表格、公式、参考文献得个数
%% %%%%%%%%%%%%%%%%%%%%%%%%标题%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
title = 'Modelling the degradation of mortar subjected to sulfate attack based on a modified Atkinson model';
Content.Text = title;L=set_format_title1(Content);%字体和段落格式设定 

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%第1部分%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_title2=1;n_title3=1;n_title4=1;%用于记录二级，三级，四级标题
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title1 = strcat(num2str(n_title2),'. Introduction');n_title2=n_title2+1;
Selection.Text = Title1;L=set_format_title2(Selection);%格式设定

%%---------------------------------------------------------------------------
ref_cross=[];
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
[Title1_content,refer,N_figures,N_Table,N_equation,N_refer,Ref_cross,n_table] =Introduction_content(N_figures,N_Table,N_equation,N_refer,ref_cross,n_table);

for i=1:size(Title1_content)%不同段落的写入
Selection.Text = Title1_content{i,1};L=set_format_for_text(Selection);
Selection.Start = Content.end;Selection.TypeParagraph;
end
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%第2部分%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title2 = strcat(num2str(n_title2),'. Empirical models');
Selection.Text = Title2;L=set_format_title2(Selection);

%--------------------------------2.1-----------------------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title2_1 = strcat(num2str(n_title2),'.',num2str(n_title3),'. Degree of corrosion');n_title3=n_title3+1;
Selection.Text = Title2_1;L=set_format_title3(Selection);

[Content,N_figures,N_Table,N_equation,N_refer,n_table]= Title2_1_content(Document,Content,Selection,N_figures,N_Table,N_equation,N_refer,n_table);
%--------------------------------2.2-----------------------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title2_2 = strcat(num2str(n_title2),'.',num2str(n_title3),'. Rate of corrosion');n_title3=n_title3+1;
Selection.Text = Title2_2;L=set_format_title3(Selection);
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
[Content,N_figures,N_Table,N_equation,N_refer,n_table]= Title2_2_content(Document,Content,Selection,N_figures,N_Table,N_equation,N_refer,n_table);
%--------------------------------2.3-----------------------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title2_2 = strcat(num2str(n_title2),'.',num2str(n_title3),'. Expansion evolution');n_title3=n_title3+1;
Selection.Text = Title2_2;L=set_format_title3(Selection);

Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_rows=4+1;n_columns=4;%此处加1为表头内容
[n_table,N_Table]=tables_Tables_and_name(Document,Selection,n_rows,n_columns,N_Table,n_table);%表格输入


%% --------------------------------3-----------------------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
n_title2=n_title2+1;Title3 = strcat(num2str(n_title2),'. Mechanistic models');n_title3=1;
Selection.Text = Title3;L=set_format_title2(Selection);
%--------------------------------3.1-----------------------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title2_2 = strcat(num2str(n_title2),'.',num2str(n_title3),'. Diffusion reaction');n_title3=n_title3+1;
Selection.Text = Title2_2;L=set_format_title3(Selection);


Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
[Content,refer,N_figures,N_Table,N_equation,N_refer,n_table]= Title3_1_content(Document,Content,Selection,refer,N_refer,N_figures,N_Table,N_equation,n_table);


Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
str1='\frac{\sigma_{c}}{\sigma_c^\prime}=\frac{\beta(\varepsilon_c/\varepsilon_{c0})}{\beta-1+(\varepsilon_c/\varepsilon_{c0})^{\beta b}}';%公式latex格式
[n_table,N_equation]=tables_equation_and_number(Document,Selection,str1,n_table,N_equation);%公式输入


%插入新的页面
% Selection.InsertNewPage;
 Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号

n_rows=5;n_columns=2;
[n_table,N_figures]=tables_figures_and_name(Document,Selection,n_rows,n_columns,N_figures,n_table);%插入图片


Selection.Start = Content.end;%保证指针在图片之后
Selection.TypeParagraph;%换行插入内容并定义字体字号
n_rows=5+1;n_columns=5;
[n_table,N_Table]=tables_Tables_and_name(Document,Selection,n_rows,n_columns,N_Table,n_table);


Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
str1=strcat('$\int_{-\frac{h}{2}}^{\frac{h}{2}} \sigma_{x x}^{s} d z \cdot b 1+2 \int_{\frac{h}{2}}^{\frac{h}{2}+X_{D}} \sigma_{x x}^{c} d z \cdot b 1=0$');
[n_table,N_equation]=tables_equation_and_number(Document,Selection,str1,n_table,N_equation);

%------------------------------参考文献-------------------------------------
Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
Title1 = 'Reference';
Selection.Text = Title1;L=set_format_title2(Selection);%格式设定


Selection.Start = Content.end;Selection.TypeParagraph;% 定义开始的位置为上一段结束的位置%换行插入内容并定义字体字号
N_refer= Reference_content_number(Content,Selection,refer);


Document.ActiveWindow.ActivePane.View.Type = 'wdPrintView'; % 设置视图方式为页面

Document.Save; % 保存文档
% pause(5);
% Document.Close; % 关闭文档
% Word.Quit; % 退出word服务器