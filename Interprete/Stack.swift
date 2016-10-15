//
//  Stack.swift
//  Interprete
//
//  Created by Jesus Ruiz on 10/14/16.
//  Copyright © 2016 Osmar Hernández. All rights reserved.
//

import Foundation

class Stack {
    var stackArray = [String]()
    
    func push(stringToPush: String){
        self.stackArray.append(stringToPush)
    }
    
    func pop() -> String? {
        if self.stackArray.last != nil {
            let stringToReturn = self.stackArray.last
            self.stackArray.removeLast()
            return stringToReturn!
        } else {
            return nil
        }
    }
    
    func isEmpty() -> Bool {
        if let value = pop() {
            push(value)
            return false
        } else {
            return true
        }
    }
    
    func top() -> String? {
        let top = pop()
        if let value = top {
            push(value)
        }
        return top
    }
}

class Node<T:NSObject> {
    var value: T? = nil
    var next: Node<T>? = nil
    var prev: Node<T>? = nil
    
    init() {
        
    }
    init(value:T) {
        self.value = value
    }
}

class Queue<T:NSObject> {
    var count: Int = 0
    var head: Node<T> = Node<T>()
    var tail: Node<T> = Node<T>()
    
    init() {
    }
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    func enQueue( value: T ) {
        var node = Node<T>(value: value)
        if self.isEmpty() {
            self.head = node
            self.tail = node
        } else {
            node.next = self.head
            self.head = node
        }
        self.count += 1
    }
    
    func deQueue() -> T? {
        if self.isEmpty() {
            return nil
        } else if self.count == 1 {
            var temp: Node<T> = self.tail
            self.count -= 1
            return temp.value
        } else {
            var temp: Node<T> = self.tail
            self.tail = self.tail.prev!
            self.count -= 1
            return temp.value
        }
    }
}