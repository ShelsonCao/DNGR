%% this is the configuration file of stacked denoising autoencoder %%

num_nodes = dim;                    %number of vertex
nnsize = [num_nodes 512 256];        %layer-wised setting
len = length(nnsize);

rand('state',0)
sae = saesetup(nnsize);

for i = 1: len - 1
    sae.ae{i}.activation_function       = 'sigm';
    sae.ae{i}.dropoutFraction           = 0;          %  Dropout fraction, only used for fine tuning
    sae.ae{i}.momentum                  = 0;          %  Momentum
    sae.ae{1}.scaling_learningRate      = 0.95;          %  Scaling factor for the learning rate (each epoch)
    
    sae.ae{i}.nonSparsityPenalty        = 0;          %  0 indicates Non sparsity penalty
    sae.ae{i}.sparsityTarget            = 0.01;       %  Sparsity target
    sae.ae{i}.inputZeroMaskedFraction   = 0.2;        %  Used for Denoising AutoEncoders
end

sae.ae{1}.learningRate              = 0.25;
sae.ae{2}.learningRate              = 0.25;

opts.numepochs = 10;
opts.batchsize = 50;