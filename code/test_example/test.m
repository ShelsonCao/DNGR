%% An Example Case %%

addpath(genpath('../../code'));


Kstep = 3;
alpha = 0.98;

%%------------------------------An Example Case--------------------------%%

dim = 1000;
data = rand(1000, 1000);            %Randomly Generate An Example Case
BuildNets;                          %Build Nerual Networks

rep = DNGR(data, sae, opts, nnsize, Kstep, alpha);  %Run DNGR Algorithm