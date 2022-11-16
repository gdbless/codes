function ReadSTLTest()
% 读取和显示 STL 文件
VerMat = ReadSTLFile();
[pt, pgon] = ConstructTopology(VerMat);
showpgon(pt, pgon);