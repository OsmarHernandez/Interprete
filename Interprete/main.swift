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
 
 func menu() {
    print(bienvenida)
    sleep(2)
    print(instrucciones)
    sleep(5)
 }
 
 menu()

 func entrada() -> String {
    var input: String?
    print(consola)
    input = readLine()!
    
    return input!
 }
 
 func tokens() -> [Token] {
    let Tokens = Lexer(inputString: entrada())
    
    return Tokens
 }
 
 func stack() -> Stack {
    let Stack = toStack(tokens())
    
    return Stack
 }
 
 func variables() -> [String : Int] {
    let variableDictionary = creatingVariables(stack())
    
    for (key, value) in variableDictionary {
        print("\(key) : \(value)")
    }
    
    return variableDictionary
 }
 
variables()
