//
//  Variables.swift
//  Interprete
//
//  Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 18/10/16.
//  Copyright © 2016 Osmar Hernández. All rights reserved.
//

import Foundation

/*
    Para ejecutar todo esto, el primer token tiene que ser un .Reserver var
 */

// Diccionario para las constantes, estas son de tipo flotante
let inmutableDictionary: [String : Float] = ["pi" : 3.141592653589793,
                                             "e" : 2.718281828459045]

// Diccionario para las variables, estas son de tipo entero
var mutableDictionary: [String : Int] = [:]

/*
    Creando el stack para tener una sintaxis antes de crear una variables
    Sintaxis : <var><nombre_Variable><=><numero>
    En caso de que la posicion del numero sea una variable se tendra que retirar su valor
        con la funcion retrieveVariable(_:)
 */
func toStack(Tokens : [Token]) -> Stack {
    let theStack = Stack()
    
    for token in Tokens {
        switch token {
        case let .Reserved(token):
            theStack.push(token)
        case let .Variable(token):
            theStack.push(token)
        case let .Operand(token):
            theStack.push(token)
        case let .Number(token):
            theStack.push(String(token))
        default:
            print("")
        }
    }
    
    return theStack
}

// Creando las variables, estas se añadiran al diccionario mutableDitionary
func creatingVariables(stack : Stack) -> [String : Int] {
    var valVariable: Int?   // Numero para la variable (Value)
    var keyVariable: String?    // Nombre para la variable (Key)
    var strInts: String = ""
    var stackRefix = Stack()
    

    while stack.top()! != "=" {
        stackRefix.push(stack.pop()!)
    }
    repeat{
        strInts += stackRefix.pop()!
    } while !stackRefix.isEmpty()
    
    repeat {
        /*
        Gramatica por la Izquierda
         */
        // Verificamos que el primer operando del stack sea un entero
            // En caso de que sea una letra retirar el valor con la funcion retrieveVariable(_:)
        if Int(strInts) != nil {
            valVariable = Int(strInts)
            // El siguiente valor para poder crear la variable debe de ser el simbolo '=', el cual es nuestro
            //  simbolo de asignacion
            if stack.top() == "=" {
                stack.pop()
                // Busca el siguiente valor en el stack, el cual sera el nombre de la variable
                if !stack.isEmpty() {
                    keyVariable = stack.pop()!
                    // Finalmente se encuentra la palabra reservada 'var' para poder crear el valor
                    if stack.top() == "var" {
                        stack.pop()
                        mutableDictionary[keyVariable!] = valVariable!
                    } else {
                        print("Error de sintaxis 4")
                        break
                    }
                } else {
                    print("Error de sintaxis 3")
                    break
                }
            } else {
                print("Error de sintaxis 2")
                break
            }
        } else {
            // Se agrega la variable al Diccionario mutableDictionary[String : Int]
            //valVariable = retrieveVariable(stack.top()!)
            valVariable = operation(toPostfix(Lexer(inputString: strInts)))
            break
        }
    } while !stack.isEmpty()
 
    return mutableDictionary
}

// Regresa el valor de la variable
func retrieveConstant(input : String) -> Float {
    var varValue: Float?
    
    // Busca que la llave se encuentre en el diccionario
    if let value = inmutableDictionary[input] {
        // Si la llave existe regresa el valor
        varValue = value
    }
    
    print(varValue!)
    
    return varValue!
}

// Regresa el valor de la constante
func retrieveVariable(input : String) -> Int {
    var varValue: Int?
    
    // Busca que la llave se encuentre en el diccionario
    if let value = mutableDictionary[input] {
        // Si la llave existe regresa el valor
        varValue = value
        print(varValue!)
    } else{
        print(input)
        return 0
    }
    
    return varValue!
}
