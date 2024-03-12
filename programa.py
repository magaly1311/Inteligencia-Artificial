# Define una función llamada free que determina si una casilla está libre de ataques por otras reinas.
def free(row, col):
    """ Determina si la casilla rowxcol está libre de ataques.

    @param row: Fila
    @param col: Columna
    @return: True si la casilla está libre de ataques por otras reinas.
    """
    # Comprueba si hay alguna reina en la misma fila o columna
    for i in range(8):
        if tablero[row][i] == '♥' or tablero[i][col] == '♥':
            return False

    # Comprueba si hay alguna reina en las diagonales
    if row <= col:
        c = col - row
        r = 0
    else:
        r = row - col
        c = 0
    while c < 8 and r < 8:
        if tablero[r][c] == '♥':
            return False
        r += 1
        c += 1

    # Comprueba si hay alguna reina en las diagonales inversas
    if row <= col:
        r = 0
        c = col + row
        if c > 7:
            r = c - 7
            c = 7
    else:
        c = 7
        r = row - (7 - col)

    while c >= 0 and r < 8:
        if tablero[r][c] == '♥':
            return False
        r += 1
        c -= 1

    # Si no hay ataques, devuelve True
    return True

# Define una función llamada agregar_reina que agrega n reinas al tablero
def agregar_reina(n):
    """ Agrega n reinas al tablero.

    @param: n El número de reinas a agregar
    @return True si se pudo agregar las reinas requeridas
    """
    # Verifica si ya se han agregado todas las reinas
    if n < 1:
        return True

    # Itera sobre todas las posiciones del tablero
    for idx_row in range(8):
        for idx_col in range(8):
            # Verifica si la posición está libre de ataques
            if free(idx_row, idx_col):
                # Coloca una reina en la posición si es seguro hacerlo
                tablero[idx_row][idx_col] = '♥'
                # Llama recursivamente para agregar las reinas restantes
                if agregar_reina(n-1):
                    return True
                else:
                    # Si no se pueden agregar las reinas restantes, deshace el cambio
                    tablero[idx_row][idx_col] = '_'

    # Si no se pueden colocar todas las reinas, devuelve False
    return False

# Crea un tablero vacío de 8x8
tablero = []
for i in range(8):
    tablero.append(['_'] * 8)

# Llama a la función agregar_reina para colocar 8 reinas en el tablero
agregar_reina(8)

# Imprime el tablero resultante
for row in tablero:
    print(*row)
