function [pt, pgon] = ConstrucTopology(VerMat)
% 构建拓扑结构
N = length(VerMat(: , 1));
Num = N / 3;
for i = 1 : Num
    pgon{i} = [3 * (i - 1) + 1 3 * (i - 1) + 2 3 * (i - 1) + 3];
end
pt = VerMat;