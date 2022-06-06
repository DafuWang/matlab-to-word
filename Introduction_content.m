function [paragraph,refer,N_figures,N_Table,N_equation,N_refer,ref_cross,n_table] =Introduction_content(N_figures,N_Table,N_equation,N_refer,ref_cross,n_table)

paragraph{1,1}=strcat('The most important aspect during design of concrete structures ', ...
    ' is their durability and maintenance. The durability of concrete structures ', ...
    ' is usually threatened from sulfate attack in their service progress. ', ...
    ' The sulfate attack on concrete structures, consisting of a complex set', ...
    ' of reactions between sulfate ions from the external corrosive environment ', ...
    ' and the mineral phases in the cement paste, might lead to cracking, progressive ', ...
    ' reduction in strength, overall expansion, and mechanical failure. The complexity ', ...
    ' of the corrosion process has fuelled a large amount of research and publications in experiment and model.');

n11=N_refer+1;
N_refer=N_refer+1;RF_name(N_refer)=" A. Atkinson, D.J. Goult, J.A. Hearne, The influence of wasteform permeability on the release of radionuclides from a repository, Nucl. Chem. Waste Manag. 5 (1985) 203–214.";
N_refer=N_refer+1;RF_name(N_refer)=" R. Shuman, V.V. Rogers, R.A. Shaw, The Barrier Code for predicting long-term concrete performance, Waste Management 89, University of Arizona, 1989.";
N_refer=N_refer+1;RF_name(N_refer)=" K.E. Kurtis, P.J.M Monteiro, S. Madanat, Empirical models to predict concrete expansion caused by sulfate attack, J. ACI Materials, March–April 2000, V97: 156–161.";
N_refer=N_refer+1;RF_name(N_refer)=" P.J. M. Monteiro, K.E. Kurtis, Experimental asymptotic analysis of expansion of concrete exposed to sulfate attack, ACI Mater. J. 105 (2008) 62-71.";

N_refer=N_refer+1;RF_name(N_refer)="Jambor, J. (1998) “Sulfate Corrosion of Concrete”, an unpublished manuscript summarizing Dr Jambor’s work on the Sulfate durability of concrete. (The author passed away in May 1998.)";
N_add=N_refer;

N_refer=N_refer+1;RF_name(N_refer)=" A. Atkinson, J.A. Hearne, Mechanistic model for the durability of concrete barriers exposed to sulphate-bearing groundwaters, MRS Proc. 176 (1989) 149-156.";
N_refer=N_refer+1;RF_name(N_refer)=" Standard for durability assessment of existing concrete structures: calculation of sulfate corrosion rate and sulfate ion concentration, p.55, GB/T 51355-2019, China.";
N_refer=N_refer+1;RF_name(N_refer)=" J.R. Clifton, J.M. Pommersheim, Sulfate attack of cementitious materials: Volumetric relations and expansions, NISTIR 5390, National Institute of Standards and Technology, 20 pp, 1994.";
N_refer=N_refer+1;RF_name(N_refer)=" Service-life prediction-state-of-the-art report: Methods for predicting the service life of concrete, p. 365.1R-21, ACI Committee 365, American, 2000.";
N_refer=N_refer+1;RF_name(N_refer)=" T. Ikumi, S.H.P. Cavalaro, I. Segura, A. Aguado, Alternative methodology to consider damage and expansions in external sulphate attack modeling, Cem. Concr. Res. 63 (2014) 105-116.";
N_refer=N_refer+1;RF_name(N_refer)=" T. Ikumi, S.H.P. Cavalaro, I. Segura, A. De la Fuente, A. Aguado, Simplified methodology to evaluate the external sulphate attack in concrete structures, Mat. Des. 89 (2016) 1147-1160.";
N_refer=N_refer+1;RF_name(N_refer)=" T. Ikumi, S. Cavalaro, I. Segura, C. Goodier, S. Austin, Simplified analytical assessment of damage induced by the external sulphate attack in concrete piles, High Tech Concr. Where Technol. Eng. Meet - Proc. 2017 Fib Symp, 2017.";
N_refer=N_refer+1;RF_name(N_refer)=" T. Ikumi, S.H.P. Cavalaro, I. Segura, C. Goodier, S. Austin, Simplified analytical assessment of damaged induced by the external sulphate attack in concrete piles, D.A. Hordijk and M. Luković (eds.), High Tech Concrete: Where Technology and Engineering Meet, 2018.";
n12=N_refer;


for i=n11:n12
refer.original{i,1}=i;
refer.original{i,2}=RF_name(i);
eval(['N_refer_cross',num2str(N_refer),'=','N_refer',';']);
end


% refer.add=[refer.add];
% refer.cross=[ref_cross,n11+6,n11+4];

% N_refer_cross(i,1)=N_refer;




paragraph{2,1}=strcat('During the 1980s and 1990s, several simplified empirical and mechanistic models ', ...
    ' were proposed without considering the evolution of microstructure arising from sulfate ', ...
    ' attack. The empirical models based on direct macroscopic observations, and the mechanistic ', ...
    ' models based on a simplified understanding of the attack mechanisms adopt form of analytical', ...
    ' solution. The early models were developed to predict degradation depth [',num2str(n11),',', num2str(n11+1),'] and later evolved', ...
    ' towards the estimation of expansions [',num2str(n11+2),',',num2str(n11+3),',', num2str(n11+4),']. Being aware of the intrinsic limitations of their', ...
    ' empirical model, Atkinson and Hearne [',num2str(n11+5),',', num2str(n11+6),'] are probably the first authors developing a mechanistic', ...
    ' model for predicting the effect of sulfate attack on service life of concrete. The mechanistic ', ...
    ' model is employed by code for durability design [',num2str(n11+7),'] and service-life prediction of concrete [',num2str(n11+8),']. ', ...
    ' A simplified analytical assessment of damaged induced by the external sulfate attack in concrete ', ...
    ' piles is proposed by Ikumi in 2014 [',num2str(n11+9),'] and later developed [',num2str(n11+10),',',num2str(n11+11),',', num2str(n11+12),'].');


n21=N_refer+1;
N_refer=N_refer+1;RF_name(N_refer)=" T. Ikumia, I. Seguraa, Numerical assessment of external sulfate attack in concrete structures. A review, Cem. Concr. Res. 121 (2019) 91-105.";
N_refer=N_refer+1;RF_name(N_refer)=" P.N. Gospodinov, R.F. Kazandjiev, T.a. Partalin, M.K. Mironova, Diffusion of sulfate ions into cement stone regarding simultaneous chemical reactions and resulting effects, Cem. Concr. Res. 29 (1999) 1591–1596.";
N_refer=N_refer+1;RF_name(N_refer)=" R. Tixier, B. Mobasher, Modeling of damage in cement-based materials subjected to external sulfate attack. I: formulation, J. Mater. Civ. Eng. 15 (2003) 305–313.";
N_refer=N_refer+1;RF_name(N_refer)=" E. Rigo, F. Schmidt-Döhl, M. Krauß, H. Budelmann, Transreac: a model for the calculation of combined chemical reactions and transport processes and its extension to a probabilistic model, Cem. Concr. Res. 35 (2005) 1734–1740.";
N_refer=N_refer+1;RF_name(N_refer)=" X.B. Zuo, W. Sun, C. Yu, Numerical investigation on expansive volume strain in concrete subjected to sulfate attack, Constr. Build. Mater. 36 (2012) 404–410.";
n22=N_refer;


for i=n21:n22
refer.original{i,1}=i;
refer.original{i,2}=RF_name(i);
eval(['N_refer_cross',num2str(N_refer),'=','N_refer',';']);
end


% refer.cross=[ref_cross,n11+6,n11+4];
% ref_cross=[ref_cross,n11+6,n11+4];
% 
% if N_add<n11+6
% 
% else
% 
% end




paragraph{3,1}=['Since the early 2000s, strenuous efforts on numerical modeling reviewed by Ikumi [',num2str(n21),'] have', ...
    ' been performing by means of computer to simulate the comprehensive attack processes [',num2str(n21+1),',',num2str(n21+2),',', num2str(n21+3),',', num2str(n21+4),']. The', ...
    ' detailed description of the numerical model is beyond the scope of this study. Some or all these', ...
    ' progresses: transport, chemical reactions, expansive forces, and mechanical response are considered', ...
    ' in the numerical models through advanced iterative calculations. The use of complex algorithms improves', ...
    ' the capacity of the models to reproduce the specific field conditions found in practice, which allows more', ...
    ' realistic predictions. However, the complexity inherent to the set of principles adopted by each numerical', ...
    ' model and the common practice of neglecting a full disclosure of the associated assumptions and limitations', ...
    ' often confuse practitioners and prevent them from being used in durability design and service-life prediction', ...
    ' of concrete [',num2str(n11+7),']. Thus, it is necessary to develop the analytical and mechanistic models for concrete subjected to', ...
    ' sulfate attack due to its convenient and applicable in durability design of concrete structures [',num2str(n11+5),'].'];

paragraph{4,1}=['Most relevant empirical models to evaluate degradation of concrete subjected to external sulfate attack' ...
    ' are first reviewed and the capabilities and limitations of the models are emphasized in this study. A new' ...
    ' mechanistic model of degradation is developed based on Atkinson model and the detailed derivation process is' ...
    ' presented. The evidence of the new mechanistic model is reported from macro- and micromorphology of degraded' ...
    ' mortar. The results of degradation are evaluated by the new mechanistic model and Atkinson model.'];



