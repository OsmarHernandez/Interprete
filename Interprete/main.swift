 //
 //  Tokens.swift
 //  Interpreter
 //
 //  Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 10/8/16.
 //  Copyright © 2016 Osmar Hernández. All rights reserved.
 //
 
 import Foundation
 
 // Constantes a mostrar al inicio del programa
 let bienvenida: String = "**** Bienvenido a alguna parte del Interprete: Creacion de Variables ****"
 let instrucciones: String = "\t Inicia la oracion con el prefijo 'var'.\n\t Seguido crea el nombre de la variable.\n\t El simbolo '=' servira para asignar un valor a tu variable.\n\t Ingresa un numero con valor de entero."
 let consola: String = "tryMe>: "
 
 // Menu del programa
 func menu() {
    print(bienvenida)
    sleep(2)
    print(instrucciones)
    sleep(4)
 }
 
 // Ejecucion del programa
 while true {
    print(consola)  // Mensaje de consola
    var input: String? = readLine()!    // Entrada del usuario
    
    var tokens = Lexer(inputString: input!) // Se generan los tokens
    
    // Iterando sobre cada token
    for token in tokens {
        switch token {
        case let .Number(token):
            operation(toPostfix(tokens))
            break
        case .Reserved("var"):
            var stack = toStack(tokens)
            var test = creatingVariables(stack)
            break
        case .Variable("e"):
            retrieveConstant("e")
            break
        case .Variable("pi"):
            retrieveConstant("pi")
            break
        case let .Variable(token):
            retrieveVariable(token)
            break
        default:
            print("")
            break
        }
        break
    }
 }
