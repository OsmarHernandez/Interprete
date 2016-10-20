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

// Diccionario para las constantes
let inmutableDictionary: [String : Float] = ["pi" : 3.141592653589793,
                                             "e" : 2.718281828459045]

var mutableDictionary: [String : Int] = [:]

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

func creatingVariables(stack : Stack) -> [String : Int] {
    var valVariable: Int?
    var keyVariable: String?
    
    repeat {
        if Int(stack.top()!) != nil {
            // else if stack.top()! es una letra, buscar el valor, si este no existe marcar error
            valVariable = Int(stack.pop()!)
            
            if stack.top() == "=" {
                stack.pop()
                
                if !stack.isEmpty() {   // Modificar para que acepte la variable [aA-zZ][aA-zZ | 0-9]*
                    keyVariable = stack.pop()!
                    
                    if stack.top() == "var" {
                        stack.pop()
                        mutableDictionary[keyVariable!] = valVariable!
                    } else {
                        print("Erro de sintaxis 4")
                        break
                    }
                } else {
                    print("Erro de sintaxis 3")
                    break
                }
            } else {
                print("Erro de sintaxis 2")
                break
            }
        } else {
            print("Erro de sintaxis 1")
            break
        }
    } while !stack.isEmpty()
 
    return mutableDictionary
}

func retrieveConstant(input : String) -> Float {
    var varValue: Float?
    
    if let value = inmutableDictionary[input] {
        varValue = value
    }
    
    return varValue!
}

func retrieveVariable(input : String) -> Int {
    var varValue: Int?
    
    if let value = mutableDictionary[input] {
        varValue = value
    }
    
    return varValue!
}

/*
    Falta :
        Modificar lo que dice modificar
        Si el nombre de una variable se encuentra asignada, esta no se debe poder utilizar
 */
