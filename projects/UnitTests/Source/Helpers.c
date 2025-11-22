#include "Helpers.h"
#include <stdio.h>
#include <string.h>

char *JsonFileRead(const char *filepath, size_t *size)
{
    char *fcontent = NULL;
    *size = 0;
    FILE *fptr = fopen(filepath, "r");

    if (fptr) {
        fseek(fptr, 0, SEEK_END);
        size_t cnt = (size_t)ftell(fptr);
        fseek(fptr, 0, SEEK_SET);
        fcontent = (char *)malloc(cnt + 1);
        memset(fcontent, 0, cnt + 1);
        fread(fcontent, 1, cnt, fptr);
        fclose(fptr);
        *size = (size_t)cnt;
    }

    return fcontent;
}

void JsonFileReadFree(void *ptr)
{
    if (ptr) {
        free(ptr);
    }
}
