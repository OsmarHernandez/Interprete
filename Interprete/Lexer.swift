//
//  Lexer.swift
//  Interprete
//
//  Created by  Osmar Hernández, Jesus Ruiz and Armando Minjares on 14/10/16.
//  Copyright © 2016 Osmar Hernández. All rights reserved.
//

import Foundation

/*
 Primera parte de la calculadora.
 Reglas:
 1. Solo se permiten numeros enteros como entrada.
 2. No puede haber espacio entre los numeros.
 3. Solo puede hacer la operacion de suma
 */

// Expresiones Regulares
let spaceRegex: String = "[\\s]"
let numberRegex: String = "[0-9]+"
let operandRegex: String = "[\\+\\-\\*\\/\\^\\%\\=]"    // manejar = como operand o lo pongo aparte como igualdad?
let variableRegex: String = "[a-zA-Z][a-zA-Z0-9]*" // para identificar variables

/*
 Un token es un objeton que contiene su tipo y valor.
 */

// Tipos de Token
enum Token {
    case Number(Int)
    case Operand(String)
    case Variable(String)   // cualquier nombre para una variable
    case Reserved(String)   // var, const, for, else, if, while, function
}

// Creando Token mediante un Closure
typealias TokenGenerator = (String) -> Token?

// Poniendo los Token en un arreglo
let tokenList: Array<(String, TokenGenerator)> = [
    (spaceRegex, {_ in nil}),
    (numberRegex, {(intValue: String) in .Number((intValue as NSString).integerValue)}),
    (operandRegex, {(stringValue: String) in .Operand(stringValue)}),
    (variableRegex, { $0 == "var" || $0 == "const" ? .Reserved($0) : .Variable($0) })
]

// Generando los Token
func Lexer(inputString input: String) -> [Token] {
    var tokens: Array = Array<Token>()
    var input: String = input
    
    while input.characters.count > 0 {
        for (pattern, generator) in tokenList {
            if let theValue = input.match(pattern) {
                if let aValue = generator(theValue) {
                    tokens.append(aValue)
                }
                
                // Recorrer el input
                input = input.substringFromIndex(input.startIndex.advancedBy(theValue.characters.count))
                break
            }
        }
    }
    
    return tokens
}
