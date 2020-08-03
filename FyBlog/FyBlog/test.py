def move(x,y):
    print(f"{x}-->{y}")


def hanio(n,fro,helper,to):
    if n == 1:
        move(fro,to)

    else:
        hanio(n-1,fro,to,helper)
        move(fro,to)
        hanio(n-1,helper,fro,to)


if __name__ == "__main__":
    a = input("请输入个数：")
    hanio(int(a), 'A', 'B', 'C')