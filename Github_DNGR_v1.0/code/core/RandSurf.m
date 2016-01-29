%% Randomly Surf %%
%for more details, pls see our paper

function M = RandSurf(A, max_step, alpha)
num_nodes = length(A);
A = ScaleSimMat(A);

P0 = eye(num_nodes, num_nodes);
P = P0;
M = zeros(num_nodes, num_nodes);

for i = 1: max_step
    P = alpha*P*A + (1-alpha)*P0;
    M = M + P;
end

end