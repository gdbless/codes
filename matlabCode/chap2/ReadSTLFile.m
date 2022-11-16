function VerMat = ReadSTLFile()
% 读取 STL 文件代码
filename = 'model1or.stl';  % 指定要打开的文件名
fid = fopen(filename, 'r');  % 打开文件得到操作句柄
VerMat(1, :) = [0 0 0];  % 初始化保存顶点的数组
k = 0;
while(feof(fid) == 0)
    line = fgetl(fid);  % 读取文件的一行
    matchev = findstr(line, 'vertex');  % 检查该行中的数据是否包括顶点数据
    if(matchev)
        k = k + 1;
        VerMat(k, :) = OpenVertexCode(line);  % 提取顶点坐标
    end
end
fclose(fid);


