#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <readline/readline.h>
#include <readline/history.h>

int main() {
  char *input = readline("$ ");
  free(input);
  return 0;
}
