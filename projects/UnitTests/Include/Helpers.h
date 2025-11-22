#ifndef HELPERS_H
#define HELPERS_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stddef.h>

char *JsonFileRead(const char *filepath, size_t *size);
void JsonFileReadFree(void *ptr);

#ifdef __cplusplus
}
#endif

#endif
