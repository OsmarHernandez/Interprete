 //
 //  Tokens.swift
 //  Interpreter
 //
 //  Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 10/8/16.
 //  Copyright © 2016 Osmar Hernández. All rights reserved.
 //
 
 import Foundation
 
 let welcome: String = "**** Welcome to the first part of the Interpreter: Calculator ****"
 let example: String = "Write an arithmetic expression: \n Ex. 10 + 2 + 4"
 var inputString: String?

 func main() {
    print(welcome)
    print(example)
    inputString = readLine()!
    /*while inputString != "" {
        
    }*/
    let tokens = Lexer(inputString: inputString!)
    operation(toPostfix(tokens)) //operacion que recibe un stack convertido a postfix con el input requerido
 }
 
main()
