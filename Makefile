# Nome do compilador
FC = gfortran

# Flags de compilação
FFLAGS = -O2 -Wall

# Diretórios
SRC_DIR = src
BUILD_DIR = build
INCLUDE_DIR = include

# Arquivo principal
MAIN = main

# Lista de arquivos fonte
SRCS = $(wildcard $(SRC_DIR)/*.f90)

# Lista de arquivos objeto
OBJS = $(patsubst $(SRC_DIR)/%.f90, $(BUILD_DIR)/%.o, $(SRCS))

# Alvo padrão
all: $(BUILD_DIR)/$(MAIN)

# Regra de linkagem
$(BUILD_DIR)/$(MAIN): $(OBJS)
	$(FC) $(FFLAGS) -o $@ $^

# Regra de compilação
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90
	@mkdir -p $(BUILD_DIR)
	$(FC) $(FFLAGS) -I $(INCLUDE_DIR) -c -o $@ $<

# Limpar arquivos compilados
clean:
	rm -rf $(BUILD_DIR)/*.o $(BUILD_DIR)/$(MAIN)

# Rodar o programa
run: $(BUILD_DIR)/$(MAIN)
	./$(BUILD_DIR)/$(MAIN)