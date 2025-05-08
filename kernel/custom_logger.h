#ifndef CUSTOM_LOGGER_H
#define CUSTOM_LOGGER_H

typedef enum {
    LOG_LEVEL_INFO,
    LOG_LEVEL_WARN,
    LOG_LEVEL_ERROR
} log_level;

void log_message(log_level level, const char *message);

#endif