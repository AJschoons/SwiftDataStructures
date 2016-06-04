//
//  BinaryTree.swift
//  
//
//  Created by adam on 5/10/16.
//
//

import Foundation

public class BinaryTreeNode<T>: CustomStringConvertible {
    public var data: T
    public var left: BinaryTreeNode<T>?
    public var right: BinaryTreeNode<T>?
    
    public init(data: T) {
        self.data = data
    }
    
    public var description: String {
        return String(data)
    }
}

public class BinaryTree<T>: CustomStringConvertible {
    public var root: BinaryTreeNode<T>?
    
    public init() { }
    
    public var inOrderTraversal: [T] {
        var result = [T]()
        _inOrderTraversal(self.root, result: &result)
        return result
    }
    
    public var preOrderTraversal: [T] {
        var result = [T]()
        _preOrderTraversal(self.root, result: &result)
        return result
    }
    
    public var postOrderTraversal: [T] {
        var result = [T]()
        _postOrderTraversal(self.root, result: &result)
        return result
    }
    
    public var description: String {
        guard let root = root else {
            return "Empty"
        }
        
        return _description(root)
    }
}

private func _inOrderTraversal<T>(node: BinaryTreeNode<T>?, inout result: [T]) {
    guard let node = node else {
        return
    }
    
    _inOrderTraversal(node.left, result: &result)
    result.append(node.data)
    _inOrderTraversal(node.right, result: &result)
}

private func _preOrderTraversal<T>(node: BinaryTreeNode<T>?, inout result: [T]) {
    guard let node = node else {
        return
    }
    
    result.append(node.data)
    _preOrderTraversal(node.left, result: &result)
    _preOrderTraversal(node.right, result: &result)
}

private func _postOrderTraversal<T>(node: BinaryTreeNode<T>?, inout result: [T]) {
    guard let node = node else {
        return
    }
    
    _postOrderTraversal(node.left, result: &result)
    _postOrderTraversal(node.right, result: &result)
    result.append(node.data)
}

/// Uses reverse in-order-traversal
private func _description<T>(node: BinaryTreeNode<T>, depth: Int = 0) -> String {
    var str = ""
    
    if let right = node.right {
        str += _description(right, depth: depth + 1)
    }
    
    str += "\n" + String(count: depth*4, repeatedValue: Character(" ")) + node.description
    
    if let left = node.left {
        str += _description(left, depth: depth + 1)
    }
    
    return str
}


public class BinarySearchTree<T: Comparable>: BinaryTree<T> {
    
    public override init() { }
    
    /// Average: O(log(n)), worst: O(n)
    public func insert(data: T) {
        let newNode = BinaryTreeNode<T>(data: data)
        guard let root = root else {
            self.root = newNode
            return
        }
        
        var nodeToInsertAt: BinaryTreeNode<T> = root
        while true {
            if newNode.data <= nodeToInsertAt.data {
                if let leftChild = nodeToInsertAt.left {
                    nodeToInsertAt = leftChild
                } else {
                    nodeToInsertAt.left = newNode
                    break
                }
            } else {
                if let rightChild = nodeToInsertAt.right {
                    nodeToInsertAt = rightChild
                } else {
                    nodeToInsertAt.right = newNode
                    break
                }
            }
        }
    }
    
    public func find(data: T) -> Bool {
        guard let root = root else {
            return false
        }
        
        var currentNode: BinaryTreeNode<T> = root
        while true {
            if currentNode.data == data {
                return true
            } else if data <= currentNode.data {
                if let leftChild = currentNode.left {
                    currentNode = leftChild
                } else {
                    return false
                }
            } else {
                if let rightChild = currentNode.right {
                    currentNode = rightChild
                } else {
                    return false
                }
            }
        }
    }
}
