function showpgon(pt, pgon)
% 显示三角网格
view(3);  % 设置默认的三维视角， AZ = -37.5, EL = 30
pat = zeros(1, length(pgon));
hold on
for i = 1 : length(pgon)
    ptpgoni = pt(pgon{i}, :);
    pat(i) = patch(ptpgoni(: , 1), ptpgoni(: , 2), ptpgoni(: , 3), [1.000 0.7000 0.3000], ...
    'facelighting', 'flat', 'edgecolor', ...  % 省略号表示续下行
    [0 1.00 1.00], 'edgelighting', 'flat');
end
hold off
axis equal