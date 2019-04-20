SOURCES_S = startup.s
LD_FILE=test.ld
ELF=test.elf

OBJECTS_S := $(SOURCES_S:.s=.o)
IMG := $(ELF:.elf=.img)

COMPILER_PREFIX=arm-linux-gnueabihf
AS=$(COMPILER_PREFIX)-as
CC=$(COMPILER_PREFIX)-gcc
LD=$(COMPILER_PREFIX)-ld
OBJCOPY=$(COMPILER_PREFIX)-objcopy

# RPi 3
CFLAGS = -mcpu=cortex-a53  -mfpu=neon-fp-armv8 -Wall -O2\
         -ffreestanding -nostdinc -nostdlib -nostartfiles
# RPi2
CFLAGS = -O2 -mfpu=vfp -mfloat-abi=hard -march=armv7-a -mtune=cortex-a7
LDFLAGS = -nostdlib -nostartfiles

all: $(ELF)

%.o: %.s
	@echo compiling $<...
	@$(CC) $(CFLAGS) -c -o $@ $<

$(ELF): $(OBJECTS_S)
	@echo linking
	@$(LD) $(LDFLAGS) -T $(LD_FILE) $^ -o $@
	@$(OBJCOPY) -O binary $(ELF) $(IMG)

clean:
	rm -f $(OBJECTS_S) $(ELF) $(IMG)

rebuild: clean all

rpi2_32:
	qemu-system-arm -M raspi2 -kernel $(IMG) -d in_asm -nographic