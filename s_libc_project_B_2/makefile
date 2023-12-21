# Makefile

# Dossiers
SRC_DIR = src
TEST_DIR = test
INCLUDE_DIR = include

# Liste des fichiers source en assembleur
ASM_SOURCE_FILES = $(SRC_DIR)/s_string.s

# Liste des fichiers source en C
C_SOURCE_FILES = $(TEST_DIR)/main.c

# Liste des fichiers objet générés
OBJ_FILES = $(ASM_SOURCE_FILES:.s=.o) $(C_SOURCE_FILES:.c=.o)

# Compilateur et options
CC = gcc
AS = as
CFLAGS = -Wall -g -I$(INCLUDE_DIR)
LDFLAGS =

# Nom de l'exécutable
EXECUTABLE = mon_programme

# Règle par défaut
all: $(EXECUTABLE)

# Règle de compilation pour les fichiers assembleur
%.o: %.s
    $(AS) -o $@ $<

# Règle de compilation pour les fichiers C
%.o: %.c
    $(CC) $(CFLAGS) -c -o $@ $<

# Règle pour l'édition de liens
$(EXECUTABLE): $(OBJ_FILES)
    $(CC) $(LDFLAGS) -o $@ $^

# Nettoyage des fichiers objets et de l'exécutable
clean:
    rm -f $(OBJ_FILES) $(EXECUTABLE)

