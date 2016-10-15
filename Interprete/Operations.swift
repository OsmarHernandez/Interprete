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
        return 0
    }
}

func toPostfix( Tokens : [Token] ) -> Stack{
    let operatorStack = Stack()
    let postFix = Stack()
    let refix = Stack()
    
    for token in Tokens {
        switch token {
            
        case let .Operator(token):
            while !operatorStack.isEmpty() {
                if precedence(token) <= precedence(operatorStack.top()!) {
                    postFix.push(operatorStack.pop()!)
                }
                operatorStack.push(token)
            }
            operatorStack.push(token)
            
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
            
        }
    }
    
    while !operatorStack.isEmpty() {
        if operatorStack.top() ==  "("  {
            print("mismatched parentheses")
        }
        postFix.push(operatorStack.pop()!)
    }
    //lee, cambia
    repeat {
        refix.push(postFix.pop()!)
    } while !postFix.isEmpty()
    return refix
}

func operation(post: Stack) {
    let operands = Stack()
    
    repeat{
        if Int(post.top()!) != nil {
            operands.push(post.pop()!)
        }
        if post.top() == "+" || post.top() == "-" || post.top() == "*" || post.top() == "/" || post.top() == "^" || post.top() == "%" {
            let op2 = operands.pop()!//2
            let op1 = operands.pop()!//1
            let opr = post.pop()!
            print(op1,opr,op2)
        }
    } while !post.isEmpty()
    
}

func evaluate(operand1: Int,operand2: Int, opera: String) -> Int{
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
