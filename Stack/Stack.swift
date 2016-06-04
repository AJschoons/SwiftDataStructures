//
//  Stack.swift
//
//
//  Created by adam on 5/9/16.
//
//


import Foundation

private class StackNode<T> {
    private(set) var data: T
    
    var next: StackNode<T>?
    
    init(data: T) {
        self.data = data
    }
    
    var text: String {
        var str = String(data)
        if next == nil {
            str += ""
        } else {
            str += " -> "
        }
        return str
    }
}


public class Stack<T> {
    
    private var top: StackNode<T>?
    
    public init() {}
    
    public func pop() -> T? {
        guard let top = top else { return nil }
        self.top = top.next
        return top.data
    }
    
    public func push(data: T) {
        let newTop = StackNode<T>(data: data)
        newTop.next = top
        top = newTop
    }
    
    public func peek() -> T? {
        return top?.data
    }
    
    public func isEmpty() -> Bool {
        return top == nil
    }
    
    public var text: String {
        guard let top = top else {
            return "Empty"
        }
        
        var str = "TOP: "
        
        var node: StackNode<T>? = top
        while (node != nil) {
            str += node!.text
            node = node?.next
        }
        
        return str
    }
}