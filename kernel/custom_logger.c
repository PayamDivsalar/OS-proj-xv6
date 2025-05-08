#include "custom_logger.h"
#include "types.h"
#include "riscv.h"
#include "defs.h"
#include "fcntl.h"

void log_message(log_level level, const char *message){
    if(level == LOG_LEVEL_INFO){

      printf("\"INFO-");
      printf("%s",message);
      printf("\"");
    }
    else if(level == LOG_LEVEL_WARN){

        printf("\"WARNING-");
        printf("%s",message);
        printf("\"");
    }
    else if(level == LOG_LEVEL_ERROR){

        printf("\"ERROR-");
        printf("%s",message);
        printf("\"");
    }
    
}