#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>

int main(int argc, char *argv[])
{

	if (fork())
	{
		sleep(9);
		
	}
	else
	{
		exit(0);
	}
	return 0;
}
