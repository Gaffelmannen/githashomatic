#include <stdio.h>
#include "thehash.h"

int main(int argc, char** args)
{
	printf("Git abbrev hash: %s\n", THE_HASH);
	printf("Git status: %s\n", GITSTATUS);
	printf("Built on: %s\n", HOST);
}
