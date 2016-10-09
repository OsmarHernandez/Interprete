/**
 * Interprete
 *
 *
 */

import Foundation

/**
 * Primera Parte : Calculadora
 */

let bienvenida: String = "**** Beinvenid a la primera parte del interprete: Calculadora ****"
let example: String = "Introduce alguna operacion aritmetica. Ej. 3 + 5"
var entrada: String = ""

// Operacion generada por el usuario
func userString() {
    print(example)
    return entrada = readLine()!
}

// Prueba
func prueba() {
    print("Usuario tecleo: \(entrada), Tamaño: \(entrada.characters.count)")
}

/**
 * Separando String para dividirlo en Token (separandoString?)
 */
func separandoString(entradaString entrada: String) {
    // Arreglo de caracteres
    var array = [Character]()
    
    // Descomponiendo el string para crear el arreglo que determinara los tokens
    for character in entrada.characters {
        array.append(character)
    }
}

userString()
prueba()
separandoString(entradaString: entrada)

/**
 * Predefiniendo Token. <Tipo, Dato> Ej: <INTEGER, 3>
 */
class Token {
    
}
