//
//  main.swift
//  InterpreteSegunElChavo
//
//  Created by Kazuya Ruizu on 10/9/16.
//  Copyright © 2016 Kazuya Ruizu. All rights reserved.
//

import Foundation

public func multiline(x: String...) -> String {
    return x.joined(separator: "\n")
}
let source: String? = readLine()
let lexer = Lexer(input: source!)
let tokens = lexer.tokenize()




print(tokens)
