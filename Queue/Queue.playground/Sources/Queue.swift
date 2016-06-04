//
//  Queue.swift
//  
//
//  Created by adam on 5/9/16.
//
//

import Foundation

private class QueueNode<T> {
    var data: T
    var next: QueueNode<T>?
    
    init(data: T) {
        self.data = data
    }
    
    func text() -> String {
        var str = String(data)
        if next == nil {
            str += "   :OUT"
        } else {
            str += " -> "
        }
        return str
    }
}

public class Queue<T> {
    
    private var first: QueueNode<T>?
    private var last: QueueNode<T>?
    
    public init() {
        
    }
    
    public func add(data: T) {
        let newNode = QueueNode<T>(data: data)
        guard let last = last, _ = first else {
            self.last = newNode
            self.first = newNode
            return
        }
        
        newNode.next = last
        self.last = newNode
    }
    
    public func remove() -> T? {
        guard let last = last, first = first else {
            return nil
        }
        
        if first === last {
            // Only one node in the queue
            self.first = nil
            self.last = nil
        } else {
            // 2+ nodes in queue
            var node = last
            while node.next !== first {
                node = node.next!
            }
            
            node.next = nil
            self.first = node
        }
        
        
        return first.data
    }
    
    public func text() -> String {
        guard let last = last else {
            return "Empty"
        }
        
        var str = "IN:   "
        
        var node: QueueNode? = last
        while (node != nil) {
            str += node!.text()
            node = node?.next
        }
        
        return str
    }
    
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    public func peek() -> T? {
        guard let first = first else {
            return nil
        }
        
        return first.data
    }
}