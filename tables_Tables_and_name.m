function [n_table,N_Tables]=tables_Tables_and_name(Document,Selection,n_rows,n_columns,N_Tables,n_table)


Tables = Document.Tables.Add(Selection.Range,n_rows,n_columns);%建立一个2*2的表格
DTI = Document.Tables.Item(n_table); % 或DTI = Tables;

for j=2:n_columns
DTI.Cell(1, 1).Merge(DTI.Cell(1, 2));
end

DTI.Rows.Item(1).Borders.Item(1).LineStyle = 'wdLineStyleNone';% 设置第8行上边界线型，1，2，3，4分别对应单元格的上、左、下、右边界
DTI.Rows.Item(1).Borders.Item(3).LineStyle = 'wdLineStyleSingle';% 设置第8行上边界线型，1，2，3，4分别对应单元格的上、左、下、右边界
DTI.Rows.Item(1).Borders.Item(3).LineWidth = 'wdLineWidth150pt';% 设置线宽，有025，050，075，100，150，225，300，450，600pt等
DTI.Rows.Item(2).Borders.Item(3).LineStyle = 'wdLineStyleSingle';% 设置第8行上边界线型，1，2，3，4分别对应单元格的上、左、下、右边界
DTI.Rows.Item(n_rows).Borders.Item(3).LineStyle = 'wdLineStyleSingle';% 设置第8行上边界线型，1，2，3，4分别对应单元格的上、左、下、右边界
DTI.Rows.Item(n_rows).Borders.Item(3).LineWidth = 'wdLineWidth150pt';% 设置线宽，有025，050，075，100，150，225，300，450，600pt等

L=set_format_for_text_figure(DTI,1,1);DTI.Cell(1,1).Range.Font.Bold=4;
Table_name=[strcat("Table ",num2str(N_Tables))];% Figure_name=[strcat("Fig. ",num2str(n_figures)),strcat("Fig. ",num2str(n_figures+1))];
DTI.Cell(1,1).Range.Text = Table_name;%粘贴文字


for i=2:n_rows
    for j=1:n_columns
        L=set_format_for_text_figure(DTI,i,j);
    end
end

n_table=n_table+1;
N_Tables=N_Tables+1;