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

let source = multiline(
    x: "def foo(x, y)",
    "  x + y * 2 + (4 + 5) / 3",
    "",
    "foo(3, 4)"
)

let lexer = Lexer(input: source)
let tokens = lexer.tokenize()
print(tokens)


