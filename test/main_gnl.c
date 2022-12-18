#include "get_next_line.h"

int main()
{
    int     fd;
    char    *line;
    int     i;

    fd = open("quijote.txt", O_RDWR, 0700);
    if (fd == -1)
        return (0);
    else
    {
        i = 0;
        while(i < 20)
        {
            line = get_next_line(fd);
            printf("%s - \n", line);
        }
    }
    close (fd);
    return (0);
}