%% Genereate Graph Representations %%

function rep = GenRep(R, sae, nnsize)

len = length(nnsize);

nnFF = nnsetup(nnsize);
nnFF.activation_function              = 'sigm';

num_layers = len - 1;
for i = 1:num_layers
    nnFF.W{i} = sae.ae{i}.W{1};
end

% do FFNN
nnFF.testing = 1;
nnFF = nnff(nnFF, R, zeros(size(R,1), nnFF.size(end)));
rep = nnFF.a{end};

end