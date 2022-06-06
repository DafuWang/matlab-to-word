%%利用MATLAB生成Word文档 function ceshi_Word
% clear
% I=1;
 I=I+1;

filespec_user = (strcat('D:\大论文\大论文\第七章\matlab 程序\matlab 处理应力应变数据程序20220526\matlab_word\2\',num2str(I),'.doc'));% 设定测试Word文件名和路径
[Word,Document,Content,Selection]=word_active_and_open(filespec_user);%word得激活和创建
L=word_PageSetup(Document);%% 页面设置
Content.Start = 0;%设定光标位置
Paragraphformat = Selection.ParagraphFormat;
%% %%%%%%%%%%%%%%%%%%%%%%%%标题%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
title = 'Modelling the degradation of mortar subjected to sulfate attack based on a modified Atkinson model';
Content.Text = title;
L=set_format_title1(Content);%字体和段落格式设定
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%前言部分%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_title2=1;i_title3=1;i_title4=1;
Selection.Start = Content.end;% 定义开始的位置为上一段结束的位置
Selection.TypeParagraph;%换行插入内容并定义字体字号
Title1 = strcat(num2str(i_title2),'. Introduction');i_title2=i_title2+1;
Selection.Text = Title1;
L=set_format_title2(Selection);
%%---------------------------------------------------------------------------
Selection.Start = Content.end;% 定义开始的位置为上一段结束的位置
Selection.TypeParagraph;%换行插入内容并定义字体字号
Title1_content =Introduction_content();
Selection.Text = Title1_content;
L=set_format_for_text(Selection);
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%第二部分%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Selection.Start = Content.end;% 定义开始的位置为上一段结束的位置
Selection.TypeParagraph;%换行插入内容并定义字体字号
Title2 = strcat(num2str(i_title2),'. Empirical models');i_title2=i_title2+1;
Selection.Text = Title2;
L=set_format_title2(Selection);
%-------------------------------------------------------------------------
Selection.Start = Content.end;% 定义开始的位置为上一段结束的位置
Selection.TypeParagraph;%换行插入内容并定义字体字号
Title2_1 = strcat(num2str(i_title2),'.',num2str(i_title3),'. Degree of corrosion');i_title3=i_title3+1;
Selection.Text = Title2_1;
L=set_format_title3(Selection);

Selection.Start = Content.end;% 定义开始的位置为上一段结束的位置
Selection.TypeParagraph;%换行插入内容并定义字体字号
Title2_2 = strcat(num2str(i_title2),'.',num2str(i_title3),'. Rate of corrosion');i_title3=i_title3+1;
Selection.Text = Title2_2;
L=set_format_title3(Selection);

Selection.Start = Content.end;% 定义开始的位置为上一段结束的位置
Selection.TypeParagraph;%换行插入内容并定义字体字号
Title2_2 = strcat(num2str(i_title2),'.',num2str(i_title3),'. Expansion evolution');i_title3=i_title3+1;
Selection.Text = Title2_2;
L=set_format_title3(Selection);
%%

Selection.Start = Content.end;% 定义开始的位置为上一段结束的位置
Selection.TypeParagraph;%换行插入内容并定义字体字号
Title3 = strcat(num2str(i_title2),'. Mechanistic models');i_title2=i_title2+1;
Selection.Text = Title3;
L=set_format_title2(Selection);

Selection.Start = Content.end;% 定义开始的位置为上一段结束的位置
Selection.TypeParagraph;%换行插入内容并定义字体字号

%插入新的页面
Selection.InsertNewPage;
% Selection.Font.Size = 10.5;
L=set_format_for_text_figure(Selection);


 Tables = Document.Tables.Add(Selection.Range,2,2);%建立一个12*9的表格
DTI = Document.Tables.Item(1); % 或DTI = Tables;
%  DTI.Borders.OutsideLineStyle = 'wdLineStyleSingle';% 设置外边框的线型，Dash，DashDot,DashDotDot,DashSmallGap,DashLargeGap,Dot,Double,Triple等
% DTI.Borders.OutsideLineWidth = 'wdLineWidth150pt';% 设置线宽，有025，050，075，100，150，225，300，450，600pt等
  DTI.Borders.InsideLineStyle = 'wdLineStyleSingle';%设置内边框的线型
% DTI.Borders.InsideLineWidth = 'wdLineWidth150pt';
%  DTI.Rows.Alignment = 'wdAlignRowCenter';%设置行对齐方式
% DTI.Columns.Item(i).Width = column_width(i);%设置列宽
 DTI.Rows.Item(2).Height = 10;%设置行高

x=0:0.1:2*pi;y(:,1)=sin(x);y(:,2)=cos(x);
Figure_name=["Fig.1 ","Fig.2 "];
for i=1:2
    gfc=figure(i);
    plot(x,y(:,i));
    set(0,'defaultfigurecolor','w');%设定背景颜色为白色
    set(gcf,'position',[360,200,560,400]);%设置图创大小
    set(gca,'looseInset',[0 0 0 0]);
    try    
       print(gcf,'-clipboard','-dbitmap');% hgexport(gfc, '-clipboard');%figure的句柄为"zft” % 将图形复制到粘贴板
       DTI.Cell(1,i).Range.Paragraphs.Item(1).Range.Paste;%Selection.Range.Paste;%在当前光标的位置插入图片
       DTI.Cell(2,i).Range.Text = Figure_name(i);
       DTI.Cell(2,i).Range.ParagraphFormat.Alignment = 'wdAlignParagraphCenter';
    catch
        disp('画图失败');
    end
    delete(gfc); % 删除图形句柄
end
Selection.Start = Content.end;%保证指针在图片之后

Document.ActiveWindow.ActivePane.View.Type = 'wdPrintView'; % 设置视图方式为页面

 Document.Save; % 保存文档
%  pause(5);
%  Document.Close; % 关闭文档
%  Word.Quit; % 退出word服务器