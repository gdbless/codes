import matplotlib.pyplot as plt


def read_stl_file(filename):
    with open(filename, 'r') as f:
        lines = f.readlines()
    return lines


def open_vertex_code(lines):
    vermats = []  # 建立所有点的数组
    for line in lines:
        if line.startswith('vertex'):
            temp = line.strip('vertex').strip()  # 保留删除 vertex 字样后的每一行数据（三个浮点数据字符串）
            temp = list(map(float, vermat))  # 转化为浮点数保存为数组
            vermats.append(temp)
    return vermats


def construct_topology(vermats):
    pgon = []
    for vermat in vermats[::3]:
        pgon.append(vermat)
    return pgon


def show_pgon(pgon):
    ax = plt.figure().add_subplot(projection='3d')
    ax.plot_trisurf(pgon[0], pgon[1], pgon[2], linewidth=0.2, antialiased=True)
    plt.show()


if __name__ == __main__:
    filename = 'model1or.stl'
    vermats = open_vertex_code(read_stl_file(filename))
    show_pgon(construct_topology(vermats))
