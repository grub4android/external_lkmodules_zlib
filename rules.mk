LOCAL_DIR := $(GET_LOCAL_DIR)
MODULE := $(LOCAL_DIR)

GLOBAL_INCLUDES += $(LOCAL_DIR)

# measurements show that the ARM version of ZLib is about x1.17 faster
# than the thumb one...
MODULE_CFLAGS := -marm

zlib_files := \
	src/adler32.c \
	src/compress.c \
	src/crc32.c \
	src/deflate.c \
	src/infback.c \
	src/inflate.c \
	src/inftrees.c \
	src/inffast.c \
	src/trees.c \
	src/uncompr.c \
	src/zutil.c

zlib_file_disabled := \
	src/gzclose.c \
	src/gzlib.c \
	src/gzread.c \
	src/gzwrite.c

MODULE_CFLAGS += -O3 -Wno-error
MODULE_SRCS := $(addprefix $(LOCAL_DIR)/, $(zlib_files))


include make/module.mk
