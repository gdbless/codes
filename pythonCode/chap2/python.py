import matplotlib.pyplot as plt


def read_stl_file(filename):
    with open(filename, 'r') as f:
        lines = f.readlines()
    return lines


def open_vertex_code(lines):
    vermats = [[] for i in range(3)] # 建立所有点的数组
    for line in lines:
        if line.startswith('vertex'):
            temp = line.strip('vertex\n ').split(' ')  # 保留删除 vertex 字样后的每一行数据（三个浮点数据字符串）
            temp = list(map(float, temp))  # 转化为浮点数保存为数组
            vermats[0].append(temp[0])
            vermats[1].append(temp[2])
            vermats[2].append(temp[2])
    return vermats


def show_pgon(vermats):
    ax = plt.figure().add_subplot(projection='3d')
    ax.plot_trisurf(vermats[0], vermats[1], vermats[2], linewidth=0.2, antialiased=True)
    plt.savefig('tri_surf.png')
    plt.show()



if __name__ == '__main__':
    filename = 'model1or.stl'
    vermats = open_vertex_code(read_stl_file(filename))
    show_pgon(vermats)