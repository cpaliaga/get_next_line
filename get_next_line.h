#ifndef GET_NEXT_LINE_H
# define GET_NEXT_LINE_H

# include <stdlib.h>
# include <unistd.h>

size_t	ft_strlen(char *str);
char	*ft_strchr(char *s, int c);

char			*ft_strjoin(char *s1, char *s2);

/**
 *  * @brief Reads a file from a file descriptor
 *   *
 *    * @param fd file descriptor to read from
 *     * @return char* a line read from a file descriptor, if NULL: nothing else to
 *      * read or error
 *       */
char			*get_next_line(int fd);

char			*ft_get_line(char *save);
char			*ft_save(char *save);
char			*ft_read_and_save(int fd, char *save);

#endif
