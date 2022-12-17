int main()
{
    int fd;

    fd = open("quijote.txt", O_RDWR, 0700);
    if (fd == -1)
    {
        return (0);
    }

    return (0);
}