#include "./get_next_line.h"
#include <fcntl.h>
//<sys/type.h>
#include <stdio.h>
#include <unistd.h>

int main()
{
    int     fd;
    char    *line;
    int     i;

    fd = open("./quijote.txt", O_RDWR, 0700);
    if (fd == -1)
        return (0);
    else
    {
        i = -1;
        while(++i < 2500)
        {
            line = get_next_line(fd);
            printf("%s - \n", line);
        }
    }
    close (fd);
    return (0);
}