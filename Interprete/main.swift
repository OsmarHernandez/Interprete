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
 var count: Int = 10
 var consola: String = "itic(main):\(count):> "
 
 // Menu del programa
 func menu() {
    print(bienvenida)
    sleep(2)
    print(instrucciones)
    sleep(4)
 }

 // Ejecucion del programa
 while true {
    count += 1
    print(consola)  // Mensaje de consola
    var input: String? = readLine()!    // Entrada del usuario
    
    var tokens = Lexer(inputString: input!) // Se generan los tokens
    
    operation(toPostfix(tokens))
 }
