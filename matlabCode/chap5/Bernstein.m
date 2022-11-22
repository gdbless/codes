function BB = Bernstein(n, u)
    % 考察式（5.4）~（5.5）
    % 一组 n 次的 Bernstein 基函数有 n + 1 个
    % 本程序对参数 u 计算这 n + 1 个 Berbstein 基函数的值
    % 保存在行向量数组 BB 中
    if (n == 0)
        error('n 必须大于0')  % Bernstein 基函数次数至少是 1
    else
        mnj = 1;
        for j = 1:n  % 计算 n 的阶乘
            mnj = mnj * j;
        end
    end

    for i = 0:n
        zij = 1;
        a = 1;
        if i >= 1
            for j = 1 : i
                zij = zij * j;  % 计算 i 的阶乘
                a = a * u;  % 计算 u 的 i 次幂
            end
        end

        znij = 1;
        b = 1;
        if n - i >= 1
            for j = 1:n-i
                znij = znij * j;  % 计算 n - i 的阶乘
                b = b * (1 - u);  % 计算 1-u 的 n - i 次幂
            end
        end

        Cin = mnj / (zij * znij);  % 计算组合数
        BB(i + 1) = Cin * a * b;  % 将第 i 个Bernstein基函数的值存入数组 BB
        % 在 matlab 中，数组的序号从 1 开始
    end  % for i = 0:n