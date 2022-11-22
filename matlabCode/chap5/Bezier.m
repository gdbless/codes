function Bezier()
    % 交互式在屏幕上选取点
    % 以这些点为控制顶点构造 Bernstein 曲线
    figure  % 开辟一个图形窗口以便绘图
    axis([0 9.8 0 9.8])  % 在图形窗口中创建二维轴
    % 形成输入向量的 4 个数分别是 x 的取值范围和 y 的取值范围
    but = 1;
    n = 0;
    hold on
    while but == 1  % 按鼠标的中键和右键结束点的拾取
        n = n + 1;
        [xi, yi, but] = ginput(1);  % 交互在屏幕上的坐标范围内拾取点，每次拾取一个点
        % 该函数输出拾取点的坐标和使用的坐标键
        % 在这里 but 就是 button 的缩写， 1，2 ，3 分别表示鼠标的左中右键
        x(n) = xi;
        y(n) = yi;
        plot(xi, yi, 'k.', 'Markersize', 20)  % 画出所捕捉的点
        plot(x, y, 'r:', 'linewidth', 2)  % 画出控制多边形，用红色虚线表示
    end
    % 拾取到的店用于构造控制多边形
    n = n - 1;
    for i = 1:100  % 采集 100 个密化点
        u = (i - 1) / 99;  % 第 i 个点对应的计算参数
        BB = Bernstein(n, u);  % 计算参数 u 的下一组 Bernstein 基函数的值
        xx(i) = x * BB';  % 控制顶点的 x 坐标和基函数进行线性组合得到参数 u 对应的点的横坐标
        % 这是第 i 个密化点的横坐标，保存在数组的第 i 个位置
        yy(i) = y * BB';  % 控制顶点的 y 坐标和基函数进行线性组合
    end
    % xx, yy 分别表示密化点的横坐标和纵坐标形成的数组
    % Bezier 曲线上的密化点逐点连接，在视觉上形成 Bezier 曲线
    plot(xx, yy, 'b', 'linewidth', 2)
    hold off
