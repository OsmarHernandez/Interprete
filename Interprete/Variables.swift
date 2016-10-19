//
//  Variables.swift
//  Interprete
//
//  Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 18/10/16.
//  Copyright © 2016 Osmar Hernández. All rights reserved.
//

import Foundation


// Diccionario para las constantes
let inmutableDictionary: [String : Float] = ["pi" : 3.141592653589793,
                                             "e" : 2.718281828459045]

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
    var mutableDictionary: [String : Int] = [:]
    
    var valVariable: Int?
    var keyVariable: String?
    
    repeat {
        if Int(stack.top()!) != nil {
            valVariable = Int(stack.pop()!)
            
            if stack.top() == "=" {
                stack.pop()
                
                if !stack.isEmpty() {   // Modificar para que acepte la variable [aA-zZ][aA-zZ | 0-9]*
                    keyVariable = stack.pop()!
                    
                    if stack.top() == "var" {
                        stack.pop()
                        mutableDictionary = [keyVariable! : valVariable!]
                    } else {
                        print("Erro de sintaxis")
                        break
                    }
                } else {
                    print("Erro de sintaxis")
                    break
                }
            } else {
                print("Erro de sintaxis")
                break
            }
        } else {
            print("Erro de sintaxis")
            break
        }
    } while !stack.isEmpty()
    
    for (key, value) in mutableDictionary {
        print("Contenido '\(key)' is '\(value)'.")
    }
    
    return mutableDictionary
}

/*
    Falta : 
        Diccionario variable mantenga los valores
        Retirar el contenido de un diccionario dependiendo de la llave (String)
        Modificar lo que dice modificar
        Si el nombre de una variable se encuentra asignada, esta no se debe poder utilizar
 */
