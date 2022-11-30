cs = crystalSymmetry('cubic');

[u, im, iu] = cs.basicHKL.unique;
Items = {};

for i = 1:length(millerIndices)
    temp = u(i).char;
    Items{i} = temp;
end