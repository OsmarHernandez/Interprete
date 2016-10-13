//
//  Operations.swift
//  Interprete
//
// Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 11/10/16.
//  Copyright © 2016 Osmar Hernández. All rights reserved.
//

import Foundation

indirect enum BinaryTree<Token> {
    case Node(BinaryTree<Token>, Token, BinaryTree<Token>)
    case Leaf
}

func generateValues(Tokens : [Token]) -> [BinaryTree<Token>] {
    var values: Array = Array<BinaryTree<Token>>()
 
    for i in Tokens.startIndex...Tokens.endIndex-1 {
        switch Tokens[i] {
        case .Number:
            values.append(BinaryTree.Node(.Leaf, Tokens[i], .Leaf))
        case .Operand:
            values.append(BinaryTree.Node(.Leaf, Tokens[i], .Leaf))
        default:
            print("No implementado")
        }
        print(Tokens[i])
    }

    return values
}
