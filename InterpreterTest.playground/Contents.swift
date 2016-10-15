//
//  Tokens.swift
//  Interpreter
//
//  Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 10/10/16.
//  Copyright © 2016 Osmar Hernández. All rights reserved.
//

import Foundation

/*
 In the lexical analysis phase, we simply try to break up the input (source code) into the small units called "lexemes". These units carry specific meaning which we can categorize into groups of tokens.
 */

let spaceRegex: String = "[ \t\n]"
let numberRegex: String = "[0-9]+"
let operandRegex: String = "[\\+\\-\\*\\/]"

// Tokens needed to describe the language
enum Token {
    case Number(Int)    // Float ?
    case Operand(String)
}

/*
 Each token can be recognized by the characters it is made out of. For each token we'll write a regular expression capable of matching its corresponding lexeme. Next, we need to generate the enum that matches the token.
 */

// Array of tuples.
// First parameter: Regex
// Second parameter: Closure that will generate the relevant token enumeration
typealias TokenGenerator = (String) -> Token?   // Closure
let tokenList: [(String, TokenGenerator)] = [
    (spaceRegex, {_ in nil}),    // whitespace, tab, break line
    (numberRegex, {(intValue: String) in .Number((intValue as NSString).integerValue)}), // numbers
    (operandRegex, {(stringValue: String) in .Operand(stringValue as String)})  // operands
]

// ??????????
var expressions = [String: NSRegularExpression]()
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

// Lexer
// Try to match against any of the rules in tokenList (Closure)
// No failing error solution
func tokenize(input: String) -> [Token] {
    var tokens = [Token]()  // Array of Token type
    var content = input
    
    // Iterate through the input string
    while (content.characters.count > 0) {
        
        for (pattern, generator) in tokenList {
            if let theValue = content.match(pattern) {
                if let aValue = generator(theValue) {
                    tokens.append(aValue)   // add element (token) to the Token Array
                }
                
                content = content.substringFromIndex(content.startIndex.advancedBy(theValue.characters.count))
                break
            }
        }
    }
    
    return tokens
}


/*
 //
 //  Tokens.swift
 //  Interpreter
 //
 //  Created by Osmar Hernández, Jesus Ruiz and Armando Minjares on 10/8/16.
 //  Copyright © 2016 Osmar Hernández. All rights reserved.
 //
 
 import Foundation
 
 let welcome: String = "**** Welcome to the first part of the Interpreter: Calculator ****"
 
 func main() {
 print(welcome)
 }
 
 main()
 */
