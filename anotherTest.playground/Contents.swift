//: Playground - noun: a place where people can play

import Cocoa

/*
    Recursive enumeration
    Most hirerarchical data can naturally be represented as a tree. Think of a family tree: it contains people (the "nodes" of the tree ) and ancestral relationships (the "edges" of the tree). The familiy tree branching stops when you reach an ancestor yo don't know.
 */

// FamilyTree is "recursive" because its cases have an associates value that is also of type FamilyTree.
enum FamilyTree {
    case NoKnownParents
    indirect case OneKnownParent(name: String, ancestors: FamilyTree)
    indirect case TwoKnownParents(fatherName: String, fatherAncestor: FamilyTree, motherName: String, motherAncestor: FamilyTree)
}

let fredAncestos = FamilyTree.TwoKnownParents(fatherName: "Beth", fatherAncestor: .NoKnownParents, motherName: "Marsha", motherAncestor: .NoKnownParents)


/*
    Binary Tree
 */
indirect enum BinarryTree<T> {
    case Node(BinarryTree<T>, T, BinarryTree<T>)
    case Empty
}

// leaf nodes
let node5 = BinarryTree.Node(.Empty, 5, .Empty)

// intermediate nodes on the left

// intermediate nodes on the right