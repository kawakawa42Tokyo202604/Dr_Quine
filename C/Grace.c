#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#define FNAME "Grace_kid.c"
#define FLAG (O_WRONLY | O_CREAT | O_TRUNC)
#define FUNC() int main(void) { \
    const char *s = "#include <stdio.h>%c#include <fcntl.h>%c#include <unistd.h>%c#define FNAME %cGrace_kid.c%c%c#define FLAG (O_WRONLY | O_CREAT | O_TRUNC)%c#define FUNC() int main(void) { %c%c    const char *s = %c%s%c; %c%c    int fd = open(FNAME, FLAG, 0644); %c%c    if (fd < 0) return (1); %c%c    if (dprintf(fd, s, 10, 10, 10, 34, 34, 10, 10, 92, 10, 34, s, 34, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 10, 10, 10) < 0) { %c%c        close(fd); %c%c        return (1); %c%c    } %c%c    if (close(fd) < 0) return (1); %c%c    return (0); %c%c}%c/* Grace */%cFUNC()%c"; \
    int fd = open(FNAME, FLAG, 0644); \
    if (fd < 0) return (1); \
    if (dprintf(fd, s, 10, 10, 10, 34, 34, 10, 10, 92, 10, 34, s, 34, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 10, 10, 10) < 0) { \
        close(fd); \
        return (1); \
    } \
    if (close(fd) < 0) return (1); \
    return (0); \
}
/* Grace */
FUNC()
