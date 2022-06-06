function [n_table,n_figures]=tables_figures_and_name(Document,Selection,n_rows,n_columns,n_figures,n_table)

Tables = Document.Tables.Add(Selection.Range,n_rows,n_columns);%建立一个2*2的表格
DTI = Document.Tables.Item(n_table); % 或DTI = Tables;


for j=2:n_columns
DTI.Cell(n_rows, 1).Merge(DTI.Cell(n_rows, 2));
end

Figure_name=[strcat("Fig. ",num2str(n_figures))];% Figure_name=[strcat("Fig. ",num2str(n_figures)),strcat("Fig. ",num2str(n_figures+1))];
n_columns_test=size(Figure_name,2);
L=set_format_for_text_figure(DTI,n_rows,1);DTI.Cell(n_rows,1).Range.Font.Bold=4;%加粗
DTI.Cell(n_rows,1).Range.Text = Figure_name(1);%粘贴文字


% DTI.Borders.OutsideLineStyle = 'wdLineStyleSingle';% 设置外边框的线型，Dash，DashDot,DashDotDot,DashSmallGap,DashLargeGap,Dot,Double,Triple等
% DTI.Borders.OutsideLineWidth = 'wdLineWidth150pt';% 设置线宽，有025，050，075，100，150，225，300，450，600pt等
% DTI.Borders.InsideLineStyle = 'wdLineStyleSingle';%设置内边框的线型
% DTI.Borders.InsideLineWidth = 'wdLineWidth150pt';
DTI.Rows.Alignment = 'wdAlignRowCenter';%设置行对齐方式
% DTI.Columns.Item(i).Width = column_width(i);%设置列宽
% DTI.Rows.Item(2).Height = 1;%设置行高
DTI.Cell(2,1).VerticalAlignment = 'wdCellAlignVerticalCenter';% 设定单元格对齐方式
% DTI.Cell(2,2).VerticalAlignment = 'wdCellAlignVerticalCenter';% 设定单元格对齐方式



x=0:0.1:2*pi;y(:,1)=sin(x);y(:,2)=cos(x);y(:,3)=cos(x)+sin(x);y(:,4)=cos(x).*sin(x);
n=0;
for i=1:2:n_rows-1
    for j=1:n_columns
        n=n+1;
        L=set_format_for_text_figure(DTI,i,j);
        gfc=figure(j);
        plot(x,y(:,n));
        set(0,'defaultfigurecolor','w');%设定背景颜色为白色
        set(gcf,'position',[360,200,560,400]);%设置图创大小
        set(gca,'looseInset',[0 0 0 0]);
        try
            print(gcf,'-clipboard','-dbitmap');% hgexport(gfc, '-clipboard');%figure的句柄为"zft” % 将图形复制到粘贴板
            DTI.Cell(i,j).Range.Paragraphs.Item(1).Range.Paste;%Selection.Range.Paste;%在当前光标的位置插入图片
            L=set_format_for_text_figure(DTI,i+1,j);
%             if n_rows>2
               DTI.Cell(i+1,j).Range.Text = strcat('(',char(96+n),')');%粘贴文
%             end
        catch
            disp('画图失败');
        end
        delete(gfc); % 删除图形句柄
    end
end
n_table=n_table+1;
n_figures=n_figures+1;