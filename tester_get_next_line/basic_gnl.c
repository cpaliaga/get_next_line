#include "../get_next_line.h"
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
        while(++i < 25)
        {
            line = get_next_line(fd);
            printf("%s", line);
        }
    }
    close (fd);
    return (0);
}

/* char *tests[18] = {"9", "9\n", "10", "10\n", "11", "11\n", "19", "19\n", "20", "20\n", "21", "21\n",
 * 		"9\n9\n", "9\n10", "9\n10\n",
 * 				"10\n8\n", "10\n9", "10\n9\n"
 * 					};
 * 					*/
