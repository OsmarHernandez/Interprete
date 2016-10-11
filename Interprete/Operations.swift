//
//  Operations.swift
//  Interprete
//
// Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 11/10/16.
//  Copyright © 2016 Osmar Hernández. All rights reserved.
//

import Foundation

func hierarchy(Tokens : [Token]) {
    let Tokens = Tokens

    for element in Tokens {
        switch element {
        case .Operand("+"):
            // Checar prioridad
            print("A huevo puto! Soy un mas")
        case .Operand("-"):
            // Checar prioridad
            print("A huevo puto! Soy un menos")
        case .Operand("*"):
            // Checar prioridad
            print("A huevo puto! Soy un asterisco")
        case .Operand("/"):
            // Checar prioridad
            print("A huevo puto! Soy un diagonal")
        case .Number(0...999999):
            // Guardar numero... ¿Metodo recursivo?
            print("Encontre un numero!")
        default:
            print("Sigue participando")
        }
        print(element)
    }
}
