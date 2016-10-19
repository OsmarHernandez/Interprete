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
 
 // Menu
 func menu() {
    print(bienvenida)
    sleep(2)
    print(instrucciones)
    sleep(5)
 }

 // Entrada del usuario
 func entrada() -> String {
    var input: String?
    print(consola)
    input = readLine()!
    
    return input!
 }
 
 // Creacion de Tokens
 func tokens() -> [Token] {
    let Tokens = Lexer(inputString: entrada())
    
    return Tokens
 }
 
 // Creando el Stack
 func stack() -> Stack {
    let Stack = toStack(tokens())
    
    return Stack
 }
 
 // Creando Variables
 func variables() -> [String : Int] {
    let variableDictionary = creatingVariables(stack())
    
    return variableDictionary
 }
 
 // Regresa la constante MODIFICAR!
 func constant(input: String) -> Float {
    let constantVal = retrieveConstant(input)
    
    return constantVal
 }
 
 // Regresa la variable MODIFICAR!
 func variable(input: String) -> Int {
    let variableVal = retrieveVariable(input)
    
    return variableVal
 }
 
menu()
 
variables()

print(constant("pi"))
 
print(variable("myVar"))
