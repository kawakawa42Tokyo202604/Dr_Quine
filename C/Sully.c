#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

int main(void)
{
    int i = 5;
    const char *s = "#include <stdio.h>%2$c#include <stdlib.h>%2$c#include <fcntl.h>%2$c#include <unistd.h>%2$c#include <string.h>%2$c%2$cint main(void)%2$c{%2$c    int i = %1$d;%2$c    const char *s = %3$c%4$s%3$c;%2$c    char filename[64];%2$c    char command[256];%2$c    const char *base;%2$c    int fd;%2$c    int n;%2$c%2$c    base = strrchr(__FILE__, '/');%2$c    base = base ? base + 1 : __FILE__;%2$c    if (strncmp(base, %3$cSully_%3$c, 6) == 0)%2$c        --i;%2$c    if (i < 0)%2$c        return (0);%2$c    n = snprintf(filename, sizeof(filename), %3$cSully_%%d.c%3$c, i);%2$c    if (n < 0 || (size_t)n >= sizeof(filename))%2$c        return (1);%2$c    fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);%2$c    if (fd < 0)%2$c        return (1);%2$c    if (dprintf(fd, s, i, 10, 34, s) < 0)%2$c    {%2$c        close(fd);%2$c        return (1);%2$c    }%2$c    if (close(fd) < 0)%2$c        return (1);%2$c    n = snprintf(command, sizeof(command),%2$c                 %3$ccc -Wall -Wextra -Werror %%s -o Sully_%%d && ./Sully_%%d%3$c,%2$c                 filename, i, i);%2$c    if (n < 0 || (size_t)n >= sizeof(command))%2$c        return (1);%2$c    if (system(command) != 0)%2$c        return (1);%2$c    return (0);%2$c}%2$c";
    char filename[64];
    char command[256];
    const char *base;
    int fd;
    int n;

    base = strrchr(__FILE__, '/');
    base = base ? base + 1 : __FILE__;
    if (strncmp(base, "Sully_", 6) == 0)
        --i;
    if (i < 0)
        return (0);
    n = snprintf(filename, sizeof(filename), "Sully_%d.c", i);
    if (n < 0 || (size_t)n >= sizeof(filename))
        return (1);
    fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd < 0)
        return (1);
    if (dprintf(fd, s, i, 10, 34, s) < 0)
    {
        close(fd);
        return (1);
    }
    if (close(fd) < 0)
        return (1);
    n = snprintf(command, sizeof(command),
                 "cc -Wall -Wextra -Werror %s -o Sully_%d && ./Sully_%d",
                 filename, i, i);
    if (n < 0 || (size_t)n >= sizeof(command))
        return (1);
    if (system(command) != 0)
        return (1);
    return (0);
}
