//
//  Operations.swift
//  Interprete
//
// Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 11/10/16.
//  Copyright © 2016 Osmar Hernández. All rights reserved.
//

import Foundation

func hierarchy(Tokens : [Token]) {
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
}
