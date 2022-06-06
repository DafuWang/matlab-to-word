%%利用MATLAB生成Word文档 function ceshi_Word
% clear
% I=1;
I=I+1;

filespec_user = (strcat('D:\大论文\大论文\第七章\matlab 程序\matlab 处理应力应变数据程序20220526\matlab_word\2\',num2str(I),'.doc'));% 设定测试Word文件名和路径

try% 判断Word是否已经打开，若已打开，就在打开的Word中进行操作，否则就打开Word
    Word = actxGetRunningServer('Word.Application');% 若Word服务器已经打开，返回其句柄Word
catch
    Word = actxserver('Word.Application');% 否则，创建一个Microsoft Word服务器，返回句柄Word
end
Word.Visible = 1; % 或set(Word, 'Visible', 1);

if exist(filespec_user,'file')% 若测试文件存在，打开该测试文件，否则，新建一个文件，并保存，文件名为测试.doc
    Document = Word.Documents.Open(filespec_user);% Document = invoke(Word.Documents,'Open',filespec_user);
else
    Document = Word.Documents.Add;% Document = invoke(Word.Documents, 'Add');
    Document.SaveAs2(filespec_user);
end
%% 页面设置
Document.PageSetup.TopMargin = 60; % 设定页面大小% 单位像素
Document.PageSetup.BottomMargin = 45;
Document.PageSetup.LeftMargin = 45;
Document.PageSetup.RightMargin = 45;

%% 
Selection = Word.Selection;
Content = Document.Content;% 设定光标位置从头开始% Content.InsertParagraphAfter;% 接着插入% Content.Collapse=0; % 0为不覆盖
Content.Start = 0;
Selection.Start=Content.Start;
%% %%%%%%%%%%%%%%%%%%%%%%%%标题%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
title = '试 卷 分 析';
Content.Text = title;
L=set_content_format(Content);

%% 正文字体段落设定
% [Selection,]=set_paragraphformat( Word);
Selection = Word.Selection;
Paragraphformat = Selection.ParagraphFormat;
Selection.Font.Size = 12;
Selection.Font.Bold = 0; 
Selection.Font.ColorIndex = 'wdBlack'; % 设置字体颜色
Selection.paragraphformat.Alignment = 'wdAlignParagraphJustify';
Selection.paragraphformat.LineSpacingRule = 'wdLineSpace1pt5'; % 设置行间距为1.5倍行距，第1段 
Selection.paragraphformat.FirstLineIndent = 28; % 首行缩进28磅，也就是当前14磅字符的2个字符，第二段

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%小标题%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Selection.Start = Content.end;% 定义开始的位置为上一段结束的位置
Selection.TypeParagraph;%换行插入内容并定义字体字号
xueqi = '（ 2009 — 2010 学年 第一学期）定义开始的位置为上一段结束的位置';
Selection.Text = xueqi;
Selection.Font.ColorIndex = 'wdBlack'; % 设置字体颜色
paragraphformat.Alignment = 'wdAlignParagraphCenter';

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%第二段%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Selection.Start = Content.end;% 定义开始的位置为上一段结束的位置
Selection.TypeParagraph;%换行插入内容并定义字体字号
xueqi = '试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容）试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容）试卷分析（含是否符合教学大纲、难度、知识覆盖';
Selection.Text = xueqi;
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%第三段%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Selection.Start = Content.end;% 定义开始的位置为上一段结束的位置
Selection.TypeParagraph;%换行插入内容并定义字体字号
xueqi = ['含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容）试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容）试卷分析（含是否符合教学大纲、难度、知识覆盖' ...
    '含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容）试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容）试卷分析（含是否符合教学大纲、难度、知识覆盖'];
Selection.Text = xueqi;




Selection.MoveDown; % 下移一行

Selection.TypeParagraph;%换行
Selection.TypeParagraph;%两个一起就孔一行
Selection.Font.Size = 10.5;
Tables = Document.Tables.Add(Selection.Range,12,9);%建立一个12*9的表格
DTI = Document.Tables.Item(1); % 或DTI = Tables;
DTI.Borders.OutsideLineStyle = 'wdLineStyleSingle';% 设置外边框的线型，Dash，DashDot,DashDotDot,DashSmallGap,DashLargeGap,Dot,Double,Triple等
DTI.Borders.OutsideLineWidth = 'wdLineWidth150pt';% 设置线宽，有025，050，075，100，150，225，300，450，600pt等
DTI.Borders.InsideLineStyle = 'wdLineStyleSingle';%设置内边框的线型
DTI.Borders.InsideLineWidth = 'wdLineWidth150pt';
DTI.Rows.Alignment = 'wdAlignRowCenter';%设置行对齐方式

DTI.Rows.Item(8).Borders.Item(1).LineStyle = 'wdLineStyleNone';% 设置第8行上边界线型，1，2，3，4分别对应单元格的上、左、下、右边界
DTI.Rows.Item(8).Borders.Item(3).LineStyle = 'wdLineStyleNone';% 设置第8行下边界线型
DTI.Rows.Item(11).Borders.Item(1).LineStyle = 'wdLineStyleNone';
DTI.Rows.Item(11).Borders.Item(3).LineStyle = 'wdLineStyleNone';


column_width = [53.7736,85.1434,53.7736,35.0094,35.0094,76.6981,55.1887,52.9245,54.9057];% 设置列宽，单位为磅
row_height = [28.5849,28.5849,28.5849,28.5849,25.4717,25.4717,32.8302,312.1698,17.8302,49.2453,14.1509,18.6792]; % 设置行高


for i = 1:9
DTI.Columns.Item(i).Width = column_width(i);%循环设置列宽
end

for i = 1:12
DTI.Rows.Item(i).Height = row_height(i);%循环设置列宽
end


for i = 1:12
for j = 1:9
DTI.Cell(i,j).VerticalAlignment = 'wdCellAlignVerticalCenter';% 设置单元格竖直对齐方式，有Bottome，Center，Top
end
end


% 合并单元格
DTI.Cell(1, 4).Merge(DTI.Cell(1, 5));
DTI.Cell(2, 4).Merge(DTI.Cell(2, 5));
DTI.Cell(3, 4).Merge(DTI.Cell(3, 5));
DTI.Cell(4, 4).Merge(DTI.Cell(4, 5));
DTI.Cell(5, 2).Merge(DTI.Cell(5, 5));
DTI.Cell(5, 3).Merge(DTI.Cell(5, 6));
DTI.Cell(6, 2).Merge(DTI.Cell(6, 5));
DTI.Cell(6, 3).Merge(DTI.Cell(6, 6));
DTI.Cell(5, 1).Merge(DTI.Cell(6, 1));
DTI.Cell(7, 1).Merge(DTI.Cell(7, 9));
DTI.Cell(8, 1).Merge(DTI.Cell(8, 9));
DTI.Cell(9, 1).Merge(DTI.Cell(9, 3));
DTI.Cell(9, 2).Merge(DTI.Cell(9, 3));
DTI.Cell(9, 3).Merge(DTI.Cell(9, 4));
DTI.Cell(9, 4).Merge(DTI.Cell(9, 5));
DTI.Cell(10, 1).Merge(DTI.Cell(10, 9));
DTI.Cell(11, 5).Merge(DTI.Cell(11, 9));
DTI.Cell(12, 5).Merge(DTI.Cell(12, 9));
DTI.Cell(11, 1).Merge(DTI.Cell(12, 4));


Selection.Start = Content.end; % 设定光标位置为最后
Selection.TypeParagraph;
Selection.Text = '主管院长签字： 年 月 日';
Paragraphformat.Alignment = 'wdAlignParagraphRight';
Selection.MoveDown; % 下移一行
% 指定各单元格内容
DTI.Cell(1,1).Range.Text = '课程名称';
DTI.Cell(1,3).Range.Text = '课程号';
DTI.Cell(1,5).Range.Text = '任课教师学院';
DTI.Cell(1,7).Range.Text = '任课教师';
DTI.Cell(2,1).Range.Text = '授课班级';
DTI.Cell(2,3).Range.Text = '考试日期';
DTI.Cell(2,5).Range.Text = '应考人数';
DTI.Cell(2,7).Range.Text = '实考人数';
DTI.Cell(3,1).Range.Text = '出卷方式';
DTI.Cell(3,3).Range.Text = '阅卷方式';
DTI.Cell(3,5).Range.Text = '选用试卷A/B';
DTI.Cell(3,7).Range.Text = '考试时间';
DTI.Cell(4,1).Range.Text = '考试方式';
DTI.Cell(4,3).Range.Text = '平均分';
DTI.Cell(4,5).Range.Text = '不及格人数';
DTI.Cell(4,7).Range.Text = '及格率';
DTI.Cell(5,1).Range.Text = '成绩分布';
DTI.Cell(5,2).Range.Text = '90分以上 人占 %';
DTI.Cell(5,3).Range.Text = '80---89分 人占 %';
DTI.Cell(6,2).Range.Text = '70--79分 人占 %';
DTI.Cell(6,3).Range.Text = '60---69分 人占 %';
DTI.Cell(7,1).Range.Text = ['试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容）'... 
    '试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容' ...
    '试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容）' ...
    '试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容'...
    '试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容' ...
    '试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容）' ...
    '试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容' ...
    '试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容' ...
    '试卷分析（含是否符合教学大纲、难度、知识覆盖面、班级分数分布分析、学生答题存在的共性问题与知识掌握情况、教学中存在的问题及改进措施等内容' ...
    ];
DTI.Cell(7,1).Range.ParagraphFormat.Alignment = 'wdAlignParagraphLeft';
DTI.Cell(9,2).Range.Text = '签字 :';
DTI.Cell(9,4).Range.Text = '年 月 日';
DTI.Cell(10,1).Range.Text = '教研室审阅意见：';
DTI.Cell(10,1).Range.ParagraphFormat.Alignment = 'wdAlignParagraphLeft';
DTI.Cell(10,1).VerticalAlignment = 'wdCellAlignVerticalTop';
DTI.Cell(11,2).Range.Text = '教研室主任（签字）: 年 月 日';
DTI.Cell(11,2).Range.ParagraphFormat.Alignment = 'wdAlignParagraphLeft';
DTI.Cell(8,1).Range.ParagraphFormat.Alignment = 'wdAlignParagraphLeft';
DTI.Cell(8,1).VerticalAlignment = 'wdCellAlignVerticalTop';% 设定单元格对齐方式
DTI.Cell(9,2).Borders.Item(2).LineStyle = 'wdLineStyleNone';% 隐藏单元格边界
DTI.Cell(9,2).Borders.Item(4).LineStyle = 'wdLineStyleNone';
DTI.Cell(9,3).Borders.Item(4).LineStyle = 'wdLineStyleNone';
DTI.Cell(11,1).Borders.Item(4).LineStyle = 'wdLineStyleNone';


Shape = Document.Shapes;% 增加一个对象
ShapeCount = Shape.Count;% 对象计数
if ShapeCount ~= 0% 删除所有的对象
for i = 1:ShapeCount
Shape.Item(1).Delete;
end
end
% 产生标准正态分布随机数，画直方图，并设置图形属性
zft = figure('units','normalized','position',[0.280469 0.553385 0.428906 0.251302],'visible','off'); % 新建图形窗口，设为不可见
set(gca,'position',[0.1 0.2 0.85 0.75]); % 设置坐标系的位置和大小
data = normrnd(0,1,1000,1); % 产生标准正态分布随机数
hist(data); % 绘制标准正态分布随机数的频数直方图
grid on; % 添加参考网格
xlabel('考试成绩'); % 为X轴加标签
ylabel('人数'); % 为Y轴加标签
hgexport(zft, '-clipboard');% 将图形复制到粘贴板
% Selection.Range.PasteSpecial;% 将图形粘贴到当前文档里（表格的第8行第1列的单元格里），并设置图形版式为浮于文字上方
DTI.Cell(8,1).Range.Paragraphs.Item(1).Range.Paste; % 设置图片为嵌入式，与图片为浮于文字上方相互转化为ConvertToInlineShape，ConvertToShape
delete(zft); % 删除图形句柄
Document.ActiveWindow.ActivePane.View.Type = 'wdPrintView'; % 设置视图方式为页面



 Document.Save; % 保存文档
 pause(5);
 Document.Close; % 关闭文档
 Word.Quit; % 退出word服务器