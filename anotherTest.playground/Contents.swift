//: Playground - noun: a place where people can play

import Cocoa

enum TextAlignment {
    case Left
    case Right
    case Center
}

var alignment = TextAlignment.Left

switch alignment {
case .Left:
    print("left alignment!")
default:
    print("center alignment")
}