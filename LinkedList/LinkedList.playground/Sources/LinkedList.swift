//
//  LinkedList.swift
//
//
//  Created by adam on 5/7/16.
//
//

import Swift

public class LinkedListNode<T: Equatable>: CustomStringConvertible {
    public var data: T
    public var next: LinkedListNode<T>?
    
    public init(data: T) {
        self.data = data
    }
    
    public var description: String {
        var str = String(data)
        if next == nil {
            str += " -> nil"
        } else {
            str += " -> "
        }
        return str
    }
}

public func ==<T>(lhs: LinkedListNode<T>, rhs: LinkedListNode<T>) -> Bool {
    return lhs.data == rhs.data
}



public class LinkedList<T: Equatable>: CustomStringConvertible {
    
    init() {}
    
    var head: LinkedListNode<T>?
    
    func insert(data: T) {}
    func deleteFirstNodeWithData(data: T) {}
    func findFirstNodeWithData(data: T) -> LinkedListNode<T>? { return nil }
    
    
    public var description: String {
        guard let head = head else {
            return "Empty"
        }
        
        var str = ""
        
        var node: LinkedListNode<T>? = head
        while (node != nil) {
            str += node!.description
            node = node?.next
        }
        
        return str
    }
}

public struct LinkedListGenerator<T: Equatable>: GeneratorType {
    private var current: LinkedListNode<T>?
    
    init(head: LinkedListNode<T>?) {
        current = head
    }
    
    mutating public func next() -> T? {
        if let current = current {
            self.current = current.next
            return current.data
        } else {
            return nil
        }
    }
}

extension LinkedList: SequenceType {
    public func generate() -> LinkedListGenerator<T> {
        return LinkedListGenerator(head: head)
    }
}



public class UnorderedLinkedList<T: Equatable>: LinkedList<T> {
    
    override public init() {
        
    }
    
    public override func insert(data: T) {
        let newNode = LinkedListNode<T>(data: data)
        guard let head = head else {
            self.head = newNode
            return
        }
        
        var lastNode = head
        while lastNode.next != nil {
            lastNode = lastNode.next!
        }
        
        lastNode.next = newNode
    }
    
    public override func deleteFirstNodeWithData(data: T) {
        guard let head = head else {
            return
        }
        
        // Check if deleting head
        guard !(data == head.data) else {
            self.head = head.next
            return
        }
        
        // Make sure there's more than one node when not deleting the head node
        guard let headNext = head.next else {
            return
        }
        
        var nodeBefore = head
        var nodeToDelete = headNext
        
        while !(nodeToDelete.data == data) {
            if !(nodeToDelete.next == nil) {
                nodeBefore = nodeToDelete
                nodeToDelete = nodeToDelete.next!
            } else {
                break
            }
        }
        
        // Found the node to delete!
        if nodeToDelete.data == data {
            nodeBefore.next = nodeToDelete.next
        }
    }
    
    public override func findFirstNodeWithData(data: T) -> LinkedListNode<T>? {
        guard let head = head else {
            return nil
        }
        
        var node: LinkedListNode<T>? = head
        while node != nil {
            if node!.data == data {
                return node
            }
            node = node!.next
        }
        
        return nil
    }
    
}