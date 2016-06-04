//
//  LinkedList.swift
//
//
//  Created by adam on 5/7/16.
//
//

import UIKit

import Foundation

public protocol LinkedListNode: AnyObject {
    associatedtype Data
    var data: Data { get set }
    var next: Self? { get set }
    
    func ==(lhs: Self, rhs: Self) -> Bool
    init(data: Data)
}

public extension LinkedListNode {
    public func text() -> String {
        var str = String(data)
        if next == nil {
            str += " -> nil"
        } else {
            str += " -> "
        }
        return str
    }
}

public func ==<Node: LinkedListNode where Node.Data: Equatable>(lhs: Node, rhs: Node) -> Bool {
    return lhs.data == rhs.data
}

public class LinkedList<Node: LinkedListNode where Node.Data:Equatable> {
    
    init() {
        
    }
    
    public var head: Node?
    
    public func insertNode(node: Node) {}
    public func insertNodeWithData(data: Node.Data) {}
    public func deleteFirstNodeWithData(data: Node.Data) {}
    public func findFirstNodeWithData(data: Node.Data) -> Node? { return nil }
    
    
    public func text() -> String {
        guard let head = head else {
            return "Empty"
        }
        
        var str = ""
        
        var node: Node? = head
        while (node != nil) {
            str += node!.text()
            node = node?.next
        }
        
        return str
    }
}


public class UnorderedLinkedList<Node: LinkedListNode where Node.Data:Equatable>: LinkedList<Node> {
    
    override public init() {
        
    }
    
    public override func insertNode(node: Node) {
        guard let head = head else {
            self.head = node
            return
        }
        
        var lastNode = head
        while lastNode.next != nil {
            lastNode = lastNode.next!
        }
        
        lastNode.next = node
    }
    
    public override func insertNodeWithData(data: Node.Data) {
        insertNode(Node(data: data))
    }
    
    public override func deleteFirstNodeWithData(data: Node.Data) {
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
    
    public override func findFirstNodeWithData(data: Node.Data) -> Node? {
        guard let head = head else {
            return nil
        }
        
        var node: Node? = head
        while node != nil {
            if node!.data == data {
                return node
            }
            node = node!.next
        }
        
        return nil
    }
    
}
