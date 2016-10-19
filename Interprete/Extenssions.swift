//
//  Extenssions.swift
//  Interprete
//
//  Created by Osmar Hernández, Jesus Ruiz and Armando Minjareson 17/10/16.
//  Copyright © 2016 Osmar Hernández. All rights reserved.
//

import Foundation

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
