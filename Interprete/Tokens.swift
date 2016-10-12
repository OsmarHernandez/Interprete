//
//  Tokens.swift
//  Interpreter
//
//  Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 10/10/16.
//  Copyright © 2016 Osmar Hernández. All rights reserved.
//

import Foundation

let spaceRegex: String = "[ \t\n]"
let numberRegex: String = "[0-9]+"
let ptopenRegex: String = "[\\(]"
let ptcloseRegex: String = "[\\)]"
let operandRegex: String = "[\\+\\-\\*\\/]"

enum Token {
    case Number(Int)
    case Operand(String)
    case ParenthOp(String)
    case ParenthCl(String)
}

typealias TokenGenerator = (String) -> Token?

let tokenList: Array<(String, TokenGenerator)> = [
    (spaceRegex, {_ in nil}),
    (numberRegex, {(intValue: String) in .Number((intValue as NSString).integerValue)}),
    (operandRegex, {(stringValue: String) in .Operand(stringValue)}),
    (ptopenRegex, {(stringValue: String) in .Operand(stringValue)}),
    (ptcloseRegex, {(stringValue: String) in .Operand(stringValue)})
]

var expressions = [String: NSRegularExpression]()

// Modificar
public extension String {
    public func match(regex: String) -> String? {
        let expression: NSRegularExpression
        if let exists = expressions[regex] {
            expression = exists
        } else {
            expression = try! NSRegularExpression(pattern: "^\(regex)", options: [])
            expressions[regex] = expression
        }
        
        let range = expression.rangeOfFirstMatchInString(self, options: [], range: NSMakeRange(0, self.utf16.count))
        if range.location != NSNotFound {
            return (self as NSString).substringWithRange(range)
        }
        return nil
    }
}

func Lexer(inputString input: String) -> [Token] {
    var tokens: Array = Array<Token>()
    var input: String = input

    while (input.characters.count > 0) {
        
        for (pattern, generator) in tokenList {
            if let theValue = input.match(pattern) {
                if let aValue = generator(theValue) {
                    tokens.append(aValue)
                }
                
                input = input.substringFromIndex(input.startIndex.advancedBy(theValue.characters.count))
                break
            }
        }
    }
    
    return tokens
}
