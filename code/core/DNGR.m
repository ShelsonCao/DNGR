%%--------------------------------DNGR Algorithm-------------------------%%

function rep = DNGR(adjMat, saeInit, opts, nnsize, Kstep, alpha)

%Step 1. Randomly Surf to Generate K steps Transition Matrix
Mk = RandSurf(adjMat, Kstep, alpha);

%Step 2. Get PPMI Matrix
PPMI = GetPPMIMatrix(Mk);

%Step 3. Compress the Dimension using SDAE
sae = saetrain(saeInit, PPMI, opts);        %%train stacked denoising autoencoder
rep = GenRep(PPMI, sae, nnsize);            %%genereate vertex representations

end