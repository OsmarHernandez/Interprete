 //
 //  Tokens.swift
 //  Interpreter
 //
 //  Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 10/8/16.
 //  Copyright © 2016 Osmar Hernández. All rights reserved.
 //
 
 import Darwin
 import Foundation
 
 // Constantes a mostrar al inicio del programa
 let bienvenida: String = "**** Bienvenido a alguna parte del Interprete: Creacion de Variables ****"
 let instrucciones: String = "\t Inicia la oracion con el prefijo 'var'.\n\t Seguido crea el nombre de la variable.\n\t El simbolo '=' servira para asignar un valor a tu variable.\n\t Ingresa un numero con valor de entero."
 var count: Int = 0
 var consola: String = "itic(main): "
 
 // Menu del programa
 func menu() {
    print(bienvenida)
    sleep(2)
    print(instrucciones)
    sleep(4)
 }

 // Ejecucion del programa
 while true {
    print("\(consola) \(String(format: "0%02d:>", count))")  // Mensaje de consola
    var input: String? = readLine()!    // Entrada del usuario
    
    if input! == "exit" {
        exit(0)
    }
    
    var tokens = Lexer(inputString: input!) // Se generan los tokens
    
    operation(toPostfix(tokens))
    count += 1
 }
