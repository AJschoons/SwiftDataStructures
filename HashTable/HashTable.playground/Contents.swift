//: Playground - noun: a place where people can play

var str = "Hello, playground"

//
//  HashTable.swift
//
//
//  Created by adam on 4/30/16.
//
//


import Foundation

public class HashTable<Key: Hashable> {
    private var numberOfSlots: Int
    private var count = 0
    private var slotsUsed = 0
    private var slots: [HashTableSlot<Key>?]
    
    public init(capacity: Int = 100) {
        self.numberOfSlots = capacity
        self.slots = [HashTableSlot<Key>?](count: capacity, repeatedValue: nil)
    }
    
    public func insertKey(key: Key, withValue value: Any) {
        let newNode = HashTableNode(key: key, value: value)
        let slotNumber = slotForHash(newNode.key.hashValue)
        
        var slot: HashTableSlot<Key>
        if slots[slotNumber] == nil {
            slotsUsed += 1
            slot = HashTableSlot<Key>()
            slots[slotNumber] = slot
        } else {
            slot = self.slots[slotNumber]!
        }
        
        if slot.addNode(newNode) {
            count += 1
        }
    }
    
    public func valueForKey(key: Key) -> Any? {
        let slotNumber = slotForHash(key.hashValue)
        guard let slot = slots[slotNumber] else {
            return nil
        }
        return slot.getNodeWithKey(key)?.value
    }
    
    private func slotForHash(hash: Int) -> Int {
        return hash % self.numberOfSlots
    }
}

private class HashTableSlot<Key: Hashable> {
    private var head: HashTableNode<Key>? = nil
    
    // TODO: keep nodes in slot ordered?
    func addNode(node: HashTableNode<Key>) -> Bool {
        guard let head = head else {
            self.head = node
            return true
        }
        
        var lastNode: HashTableNode<Key> = head
        while lastNode.next != nil {
            if (lastNode.key == node.key) {
                lastNode.value = node.value
                return false
            }
            
            lastNode = lastNode.next!
        }
        lastNode.next = node
        return true
    }
    
    func getNodeWithKey(key: Key) -> HashTableNode<Key>? {
        var node: HashTableNode<Key>? = head
        while node != nil {
            if node!.key == key {
                return node
            } else {
                node = node!.next
            }
        }
        
        return nil
    }
}

private class HashTableNode<Key: Hashable> {
    init(key: Key, value: Any) {
        self.key = key
        self.value = value
    }
    
    private(set) var key: Key
    private(set) var value: Any
    var next: HashTableNode?
}

// Tests

let ht = HashTable<String>(capacity: 3)
ht.valueForKey("wow")
ht.slots
ht.slotsUsed
ht.count

ht.insertKey("wow", withValue: 10)
ht.slots
ht.slotsUsed
ht.count
ht.valueForKey("wow")

ht.insertKey("wow", withValue: 12)
ht.slots
ht.slotsUsed
ht.count
ht.valueForKey("wow")

ht.insertKey("a", withValue: 12)
ht.valueForKey("a")
ht.slots
ht.slotsUsed
ht.count

ht.insertKey("b", withValue: 13)
ht.valueForKey("b")
ht.slots
ht.slotsUsed
ht.count

ht.insertKey("c", withValue: 14)
ht.valueForKey("c")
ht.slots
ht.slotsUsed
ht.count

ht.insertKey("d", withValue: 15)
ht.valueForKey("d")
ht.slots
ht.slotsUsed
ht.count

ht.insertKey("easdfasdfads", withValue: 16)
ht.valueForKey("easdfasdfads")
ht.slots
ht.slotsUsed
ht.count