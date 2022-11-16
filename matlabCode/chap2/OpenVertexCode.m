function vec = OpenVertexCode(line)
% 输入变量 line 是一个字符串该字符串中包含一个坐标
% 本程序将这个用字符存储的坐标转换为浮点数据
% 输出变量是一个数组表示顶点
n = length(line);
k = 0;
BlSp(1) = 0;  % 初始化保存空格位置的数组
for i = 1:n
    if(line(i) == 32)
        k = k + 1;
        BlSp(k) = i;
    end
end

Pos1 = BlSp(1) + 1;
Pos2 = BlSp(2) - 1;
N = Pos2 - Pos1;
NumCode = line(Pos1 : Pos2);  % 提取表示 x 坐标的字符
vec(1) = OpenNumCode(NumCode, N);  % 将字符转换为浮点型数据

Pos1 = BlSp(2) + 1;
Pos2 = BlSp(3) - 1;
N = Pos2 - Pos1 + 1;
NumCode = line(Pos1: Pos2);  %提取 y 坐标的字符
vec(2) = OpenNumCode(NumCode, N);  % 将字符转换为浮点型数据

Pos1 = BlSp(3) + 1;
Pos2 = n;
N = Pos2 - Pos1 + 1;
NumCode = line(Pos1 : Pos2);  % 提取 z 坐标的字符
vec(3) = OpenNumCode(NumCode, N);  % 将字符转换为浮点型数据
