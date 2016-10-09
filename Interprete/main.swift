/**
 * Interprete
 *
 *
 */

import Foundation

/**
 * Primera Parte : Calculadora
 */

let welcome: String = "**** Welcome to the first part of the interpreter, the Calculator ****"
let example: String = "Introduce alguna operacion aritmetica. Ej. 3 + 5"
var input: String = ""

// Operacion generada por el usuario
func userString() {
    print(example)
    return input = readLine()!
}

// Prueba
func prueba() {
    print("Usuario tecleo: \(input), Tamaño: \(input.characters.count)")
}

/**
 * Separando String para dividirlo en Token (Lexer?)
 */
func Lexer(inputString input: String) {
    // Arreglo de caracteres
    var array = [Character]()
    
    // Descomponiendo el string para crear el arreglo que determinara los tokens
    for character in input.characters {
        array.append(character)
    }
}

userString()
prueba()
Lexer(inputString: input)

/**
 * Predefiniendo Token. <Tipo, Dato> Ej: <INTEGER, 3>
 */
class Token {
    
}
