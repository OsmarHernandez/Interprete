 //
 //  Tokens.swift
 //  Interpreter
 //
 //  Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 10/8/16.
 //  Copyright © 2016 Osmar Hernández. All rights reserved.
 //
 
 import Foundation
 
 // Constantes a mostrar al inicio del programa
 let bienvenida: String = "**** Bienvenido a la primera parte del Interprete: Calculadora ****"
 let instrucciones: String = "\t Solo se permiten numeros enteros como entrada.\n\t No puede haber espacio entre los numeros.\n\t Solo puede hacer la operacion de suma."
 let consola: String = "Calculadora: "
 
 // Entrada del usuario como opcional
 var input: String?
 
 // Imprimiendo constantes
 print(bienvenida)
 print(instrucciones)
 print(consola)
 
 // Asignando la entrada del usuario como string
 input = readLine()!
 
 // Ejecutando la funcion de Lexer(_:)
 let lexer = Lexer(inputString: input!)
 
 for element in lexer {
    print(element)
 }
