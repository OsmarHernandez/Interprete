//
//  Operations.swift
//  Interprete
//
// Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 11/10/16.
//  Copyright © 2016 Osmar Hernández. All rights reserved.
//

import Foundation

func precedence( oper: String )-> Int {
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
        return 1
    }
}

func toPostfix( Tokens : [Token] ) -> Stack{
    let operatorStack = Stack()
    let postFix = Stack()
    let refix = Stack()
    
    for token in Tokens {
        switch token {
            
        case let .Operand(token):
            while !operatorStack.isEmpty() && precedence(operatorStack.top()!) < precedence(token) {
                if precedence(token) <= precedence(operatorStack.top()!) {
                    postFix.push(operatorStack.pop()!)
                }
                operatorStack.push(token)
            }
            if operatorStack.isEmpty() || operatorStack.top() == "("{
                operatorStack.push(token)
            }else{
                operatorStack.push(token)
            }
        case .Variable("e"):
            var varValue = retrieveConstant("e")
            operatorStack.push(String(varValue))
        case .Variable("pi"):
            var varValue = retrieveConstant("pi")
            operatorStack.push(String(varValue))
        case let .Variable(token):
            var varValue = retrieveVariable(token)
            operatorStack.push(String(varValue))
        case let .Number(token):
            postFix.push(String(token))
        case let .ParenthOp(token):
            operatorStack.push(token)
            
        case let .ParenthCl(token):
            while operatorStack.top() != "(" {
                postFix.push(operatorStack.pop()!)
                if operatorStack.isEmpty() {
                    print("mismatched parentheses")
                }
            }
            operatorStack.pop()
        default:
            print("")
        }
    }
    
    while !operatorStack.isEmpty() {
        if operatorStack.top() ==  "("  {
            print("mismatched parentheses")
        }
        postFix.push(operatorStack.pop()!)
    }
    
    repeat {
        //print(postFix.pop()!)
        refix.push(postFix.pop()!)
    } while !postFix.isEmpty()
    
    /*          Descomentar para probar el postfix
     repeat{
     print(refix.pop()!)
     }while !refix.isEmpty()
     */
    
    return refix
}

func operation(post: Stack) {
    let operands = Stack()
    
    repeat{
        if Int(post.top()!) != nil {
            operands.push(post.pop()!)
        }
        if post.top() == "+" || post.top() == "-" || post.top() == "*" || post.top() == "/" || post.top() == "^" || post.top() == "%" {
            let op2 = operands.pop()!
            let op1 = operands.pop()!
            let opr = post.pop()!
            
            if operands.isEmpty() && post.isEmpty() {
                print(evaluate(Int(op1)!, operand2: Int(op2)!, opera: opr))
            }else{
                operands.push(String(evaluate(Int(op1)!, operand2: Int(op2)!, opera: opr)))
                
            }
        }
    } while !post.isEmpty()
    
}

func evaluate( operand1: Int, operand2: Int, opera: String) -> Int{
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
        return Int(pow(Double(operand1), Double(operand2)))
    case "%":
        return operand1%operand2
    default:
        return 0
    }
}
