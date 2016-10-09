//
//  Tokens.swift
//  InterpreteSegunElChavo
//
//  Created by Kazuya Ruizu on 10/9/16.
//  Copyright © 2016 Kazuya Ruizu. All rights reserved.
//

import Foundation


public enum token {
    case define
    case identifier(String)
    case number(Float)
    case parensOpen
    case parensClose
    case comma
    case other(String)
}

typealias TokenGenerator = (String) -> token?
let tokenList: [(String, TokenGenerator)] = [
    ("[ \t\n]", { _ in nil }),
    ("[a-zA-Z][a-zA-Z0-9]*", { $0 == "def" ? .define : .identifier($0) }),
    ("[0-9.]+", { (r: String) in .number((r as NSString).floatValue) }),
    ("\\(", { _ in .parensOpen }),
    ("\\)", { _ in .parensClose }),
    (",", { _ in .comma }),
]


var expressions = [String: NSRegularExpression]()
public extension String {
    public func match(_ regex: String) -> String? {
        let expression: NSRegularExpression
        if let exists = expressions[regex] {
            expression = exists
        } else {
            expression = try! NSRegularExpression(pattern: "^\(regex)", options: [])
            expressions[regex] = expression
        }
        
        let range = expression.rangeOfFirstMatch(in: self, options: [], range: NSMakeRange(0, self.utf16.count))
        if range.location != NSNotFound {
            return (self as NSString).substring(with: range)
        }
        return nil
    }
}
public class Lexer {
    let input: String
    init(input: String) {
        self.input = input
    }
    public func tokenize() -> [token] {
        var tokens = [token]()
        var content = input
        
        while (content.characters.count > 0) {
            var matched = false
            
            for (pattern, generator) in tokenList {
                if let m = content.match(pattern) {
                    if let t = generator(m) {
                        tokens.append(t)
                    }
                    
                    content = content.substring(from: content.index(content.startIndex, offsetBy: m.characters.count))
                    matched = true
                    break
                }
            }
            
            if !matched {
                let index = content.characters.index(content.startIndex, offsetBy: 1)
                tokens.append(.other(content.substring(to: index)))
                content = content.substring(from: index)
            }
        }
        return tokens
    }
    
}
