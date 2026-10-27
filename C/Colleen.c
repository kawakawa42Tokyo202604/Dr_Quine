#include <stdio.h>
/*
	good morning
*/

int	func(void)
{
	return (0);
}

int	main(void)
{
	/*
		hello world
	*/
	func();
	char	*s = "#include <stdio.h>%c/*%c%cgood morning%c*/%c%cint%cfunc(void)%c{%c%creturn (0);%c}%c%cint%cmain(void)%c{%c%c/*%c%c%chello world%c%c*/%c%cfunc();%c%cchar%c*s = %c%s%c;%c%cprintf(s, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 9, 9, 10, 9, 10, 9, 10, 9, 9, 34, s, 34, 10, 9, 10, 9, 10, 10);%c%creturn (0);%c}%c";
	printf(s, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 9, 9, 10, 9, 10, 9, 10, 9, 9, 34, s, 34, 10, 9, 10, 9, 10, 10);
	return (0);
}
