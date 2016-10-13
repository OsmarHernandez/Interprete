//
//  Operations.swift
//  Interprete
//
// Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 11/10/16.
//  Copyright © 2016 Osmar Hernández. All rights reserved.
//

import Foundation

indirect enum BinaryTree<Token> {
    case Node(BinaryTree<Token>, String, BinaryTree<Token>)
    case Leaf
}

func generateValues(Tokens : [Token]) -> [BinaryTree<Token>] {
    var values: Array = Array<BinaryTree<Token>>()
    
    for tokens in Tokens {
        switch tokens {
        case let .Number(tokens):
            values.append(BinaryTree.Node(.Leaf, String(tokens), .Leaf))
        case let .Operand(tokens):
                                        // token[-1], token, token[+1]
            values.append(BinaryTree.Node(.Leaf, tokens, .Leaf))
        default:
            print("No implementado")
        }
    }
    
    for i in 0...5 {
        print(i + 1)
    }
    
    /*
    for element in array:
        print(elemtn)
    
    for i in range(0, len(array))
        print(array[i])
    */
    return values
}

/*
func test(Tokens : [Token]) -> [Token] {
    for token in Tokens {
        switch token {
        case let .Operand(token):
            print(token)
        case let .Number(token):
            print(token)
        case let .ParenthOp(token):
            print(token)
        case let .ParenthCl(token):
            print(token)
        }
    }
    
    return Tokens
}
*/
