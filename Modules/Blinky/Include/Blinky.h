#ifndef BLINKY_H
#define BLINKY_H

#ifdef __cplusplus
extern "C" {
#endif

typedef struct sBlinky {
} Blinky_t;

void Blinky_New(Blinky_t *self);
void Blinky_Process(Blinky_t *self);

#ifdef __cplusplus
}
#endif

#endif
