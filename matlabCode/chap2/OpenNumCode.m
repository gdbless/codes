function ab = OpenNumCode(NumCode, N)
% 将字符转换为浮点型数据
is = 1;
if(NumCode(1) == 45)  % 发现 - 号
    is = 2;
end
for i = 1 : N
    if(NumCode(i) == 46)  % 发现小数点
        ip = i;
        break;
    end
end
isf = ip - 1;
ise = ip + 1;

af = 0;
posnum = 1 / 10;
for i = isf : -1 : is  % 负号与小数点之间的整数
    posnum = posnum * 10;
    af = af + (NumCode(i) - 48) * posnum;
end

bf = 0;
posnum = 1.0;
for i = ise : N  % 小数点后的小数部分
    posnum = posnum / 10
    bf = bf + (NumCode(i) - 48) * posnum;
end

ab = af + bf
if(is == 2)
    ab = -ab;
end