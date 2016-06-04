//: Playground - noun: a place where people can play

import UIKit

let bst = BinarySearchTree<Int>()
bst.find(5)
bst.inOrderTraversal
bst.preOrderTraversal
bst.postOrderTraversal
bst.text

// Did insert work?
bst.insert(5)
bst.insert(7)
bst.insert(3)
bst.root?.data
bst.root?.left?.data
bst.root?.right?.data
bst.text

// Is find working?
bst.find(5)
bst.find(7)
bst.find(3)

// Do the traversals work?
bst.inOrderTraversal
bst.preOrderTraversal
bst.postOrderTraversal

bst.insert(4)
bst.insert(6)
bst.insert(8)
bst.insert(2)
bst.text

// Do the traversals still work?
bst.inOrderTraversal
bst.preOrderTraversal
bst.postOrderTraversal

// Does find still work for the Values, the old and the new?
bst.find(5)
bst.find(7)
bst.find(3)
bst.find(4)
bst.find(6)
bst.find(8)
bst.find(2)
bst.find(1) // False
bst.find(9) // False

bst.insert(30)
bst.insert(25)
bst.insert(23)
bst.insert(21)
bst.insert(19)
bst.insert(22)
bst.insert(22)
bst.insert(22)
print(bst.text)
bst.inOrderTraversal
