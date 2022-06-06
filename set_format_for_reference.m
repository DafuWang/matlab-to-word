function L=set_format_for_reference(Selection)
Selection.Font.Size = 12;
Selection.Font.Bold = 0; 
Selection.Font.ColorIndex = 'wdBlack'; % 设置字体颜色
Selection.paragraphformat.Alignment = 'wdAlignParagraphJustify';
Selection.paragraphformat.LineSpacingRule = 'wdLineSpaceSingle'; % 设置行间距为1.5倍行距，第1段 
Selection.paragraphformat.FirstLineIndent = 0; % 首行缩进28磅，也就是当前14磅字符的2个字符，第二段
L=1;