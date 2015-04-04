# Makefile for 1wire-led project
#
# Kevin Cuzner

# Compilation parameters
PROJECT=1wire-led
HEXFORMAT=ihex

BINDIR=bin
SRCDIR=src
OBJDIR=obj

LIBS=

MCU=attiny13a
INCLUDES=-Iinclude
F_CPU=9600000

# Programmer parameters
PMCU=t13

# Programs
CC=avr-gcc
OBJCOPY=avr-objcopy
MKDIR=mkdir
RM=rm

# Compilation setup
SRC=$(wildcard $(SRCDIR)/*.c)
ASM=$(wildcard $(SRCDIR)/*.S)
OBJ:=$(addprefix $(OBJDIR)/,$(notdir $(SRC:.c=.o)))
OBJ+=$(addprefix $(OBJDIR)/,$(notdir $(ASM:.S=.o)))

GCFLAGS=$(INCLUDES) -DF_CPU=$(F_CPU) -g -mmcu=$(MCU) -Os -fpack-struct -fshort-enums\
		-funsigned-bitfields -funsigned-char -Wall -Wstrict-prototypes -Wa,-ahlms=$(addprefix $(OBJDIR)/,$(notdir $(<:.c=.lst)))
ASFLAGS=$(INCLUDES) -DF_CPU=$(F_CPU) -mmcu=$(MCU) -x assembler-with-cpp \
		-Wa,-gstabs,-ahlms=$(addprefix $(OBJDIR)/,$(notdir $(<:.s=.lst)))
LDFLAGS=-mmcu=$(MCU) -lm $(LIBS)

all: $(BINDIR)/$(PROJECT).hex

clean:
	$(RM) -rf $(BINDIR)
	$(RM) -rf $(OBJDIR)

$(BINDIR)/$(PROJECT).hex: $(BINDIR)/$(PROJECT).elf
	$(OBJCOPY) -j .text -j .data -O $(HEXFORMAT) $< $@

$(BINDIR)/$(PROJECT).elf: $(OBJ)
	@$(MKDIR) -p $(dir $@)
	$(CC) $(OBJ) $(LDFLAGS) -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@$(MKDIR) -p $(dir $@)
	$(CC) $(GCFLAGS) -c $< -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.S
	@$(MKDIR) -p $(dir $@)
	$(AS) $(ASFLAGS) -o $@ $<
