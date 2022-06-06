function [content_text,refer,N_figures,N_Table,N_equation,N_refer]= Title3_1_Paragraph1(refer,N_figures,N_Table,N_equation,N_refer)

N_refer=N_refer+1;refer.original{N_refer,1}=N_refer;
refer.original{N_refer,2}=" R. Shuman, V.V. Rogers, R.A. Shaw, The Barrier Code for predicting long-term concrete performance, Waste Management 89, University of Arizona, 1989.";
eval(['N_reference_cross',num2str(N_refer),'=','N_refer',';']);

N_refer=N_refer+1;refer.original{N_refer,1}=N_refer;
refer.original{N_refer,2}=" K.E. Kurtis, P.J.M Monteiro, S. Madanat, Empirical models to predict concrete expansion caused by sulfate attack, J. ACI Materials, March–April 2000, V97: 156–161.";
eval(['N_reference_cross',num2str(N_refer),'=','N_refer',';']);




content_text=strcat('Based on a degradation data of concrete fully immersed in', ...
    ' a 0.19 M for five-year period obtained from Harrison and Teychenne [',num2str(N_refer-1) ,'] the', ...
    ' location (Xs) of the visible degradation zone within corrosive concrete is ',...
     ' proposed by Atkinson and Hearne, [',num2str(N_refer),']:');