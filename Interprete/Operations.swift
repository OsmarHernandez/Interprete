//
//  Operations.swift
//  Interprete
//
// Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 11/10/16.
//  Copyright © 2016 Osmar Hernández. All rights reserved.
//

import Foundation

func precedence( oper: String )-> Int {             //para saber el orden en el cual va a acomodar los operadores
    switch oper {
    case "%":
        return 4
    case "^":
        return 3
    case "*":
        return 2
    case "/":
        return 2
    case "+":
        return 1
    case "-":
        return 1
    default:
        return 0
    }
}

func toPostfix( Tokens : [Token] ) -> Stack{
    let operatorStack = Stack()
    let postFix = Stack()
    let refix = Stack()
    
    for token in Tokens {//un for para recorrer los tokens
        switch token {//un switch para saber que token es que
            
        case let .Operator(token):// cuando es operador +-*/^%
            while !operatorStack.isEmpty() {//este while es para cuando el stack que contiene los operadores es diferente de verdadero, mientras que sea operador
                if precedence(token) <= precedence(operatorStack.top()!) {//mientras que el operador recibido sea menor o igual la precedencia a el operador del topstack
                    postFix.push(operatorStack.pop()!)// va a meter a el stack en el que ya han sido guardado algunos numeros el operador sacado del top de el stack de operadores
                }
                operatorStack.push(token)//despues de sacar el otro operador de el operatorstack mete el recibido y asi hasta que la pila este vacia o la precedencia sea mayor
            }
            operatorStack.push(token)//ccuando la pila esta vacia entra aqui y mete el primer operador o equivalente
            
        case let .Number(token):
            postFix.push(String(token)) // si detecta un numero simplemente los mete a el stack
            
        case let .ParenthOp(token):
            operatorStack.push(token)//cuando es ( lo mete a la pila de operadores
            
        case let .ParenthCl(token):
            while operatorStack.top() != "(" {//mientras que no encuentre al ( va a sacar los operadores y meterlos en la pila de postfix
                postFix.push(operatorStack.pop()!)
                if operatorStack.isEmpty() {//si no encuentra el ( es que hubo error al contarlos osea le faltaba un (
                    print("mismatched parentheses")
                }
            }
            operatorStack.pop()//saca el parentesis ( de el stack para poder continuar con los demas operadores
            
        }
    }
    
    while !operatorStack.isEmpty() {//para sacar los operadores restantes de el stack de operadores, si en dado caso se encuentra con un ( pues es que hubo ( de mas
        if operatorStack.top() ==  "("  {
            print("mismatched parentheses")
        }
        postFix.push(operatorStack.pop()!)
    }
    //lee el stack resultante y los cambia a otro stack para que al leer el otro stack como es LIFO leerlos en orden al empezar la otra funcion
    repeat {
        refix.push(postFix.pop()!)
    } while !postFix.isEmpty()
    return refix
}

func operation(post: Stack) {
    let operands = Stack()// stack de numeros
    
    repeat{
        if Int(post.top()!) != nil {//investiga si los ocupantes del stack recibido son numeros para meterlos al stack de operandos
            operands.push(post.pop()!)
        }
        if post.top() == "+" || post.top() == "-" || post.top() == "*" || post.top() == "/" || post.top() == "^" || post.top() == "%" {//si el ocupante del stack recibido es algun operador entra aqui
            let op2 = operands.pop()!//saca de el stack de operandos el de mas arriba para que sea eloperanndo de la derecha
            let op1 = operands.pop()!//este es el siguiente del stack y es tomado como el de la izquierda
            let opr = post.pop()!// el operador agarrado de este if
            print(evaluate(Int(op1)!, operand2: Int(op2)!, opera: opr))//imprime para checar el resultado
        }
    } while !post.isEmpty()// mientras que el stack recibido no este vacio
    
}

func evaluate( operand1: Int, operand2: Int, opera: String) -> Int{//aqui se evaluan las operaciones y envia el resultado como entero
    switch opera {
    case "+":
        return operand1+operand2
    case "-":
        return operand1-operand2
    case "*":
        return operand1*operand2
    case "/":
        return operand1/operand2
    case "^":
        return operand1^operand2
    case "%":
        return operand1%operand2
    default:
        return 0
    }
}
