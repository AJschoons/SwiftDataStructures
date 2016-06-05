//
//  HashTable.swift
//
//
//  Created by adam on 4/30/16.
//
//

import Swift

public class HashTable<Key: Hashable, Value>: CustomStringConvertible {
    public private(set) var numberOfSlots: Int
    public private(set) var count = 0
    public private(set) var slotsUsed = 0
    public private(set) var slots: [HashTableSlot<Key, Value>?]
    
    public init(capacity: Int = 100) {
        self.numberOfSlots = capacity
        self.slots = [HashTableSlot<Key, Value>?](count: capacity, repeatedValue: nil)
    }
    
    /// Inserts the key value pair if the key doesn't exist, else updates the key's value
    public func setKey(key: Key, withValue value: Value) {
        let newNode = HashTableNode(key: key, value: value)
        let slotNumber = slotForHash(newNode.key.hashValue)
        
        var slot: HashTableSlot<Key, Value>
        var shouldIncrementCountOfSlotsUsed = false
        if slots[slotNumber] == nil {
            shouldIncrementCountOfSlotsUsed = true
            slot = HashTableSlot<Key, Value>()
            slots[slotNumber] = slot
        } else {
            slot = self.slots[slotNumber]!
        }
        
        if slot.addNode(newNode) {
            // A node was inserted instead of updated, so increment the counts
            count += 1
            if shouldIncrementCountOfSlotsUsed {
                slotsUsed += 1
            }
        }
    }
    
    public func valueForKey(key: Key) -> Value? {
        let slotNumber = slotForHash(key.hashValue)
        guard let slot = slots[slotNumber] else {
            return nil
        }
        return slot.getNodeWithKey(key)?.value
    }
    
    private func slotForHash(hash: Int) -> Int {
        return hash % self.numberOfSlots
    }
    
    public var description: String {
        var str = "*HashTable*\nitems:\(count) slotsUsed:\(slotsUsed) totalSlots:\(numberOfSlots)\n"
        for (index, slot) in slots.enumerate() {
            str += "\(index): "
            str += (slot != nil) ? slot!.description : "Empty"
            str += "\n"
        }
        return str
    }
}

public class HashTableSlot<Key: Hashable, Value>: CustomStringConvertible {
    private var head: HashTableNode<Key, Value>? = nil
    
    // TODO: keep nodes in slot ordered?
    /// Updates a node's value if a duplicate key is getting entered
    func addNode(node: HashTableNode<Key, Value>) -> Bool {
        guard let head = head else {
            self.head = node
            return true
        }
        
        var lastNode: HashTableNode<Key, Value>? = head
        while true {
            if lastNode!.key == node.key {
                lastNode!.value = node.value
                return false
            }
            
            if lastNode!.next == nil {
                break
            } else {
                lastNode = lastNode!.next
            }
        }
        
        lastNode!.next = node
        return true
    }
    
    func getNodeWithKey(key: Key) -> HashTableNode<Key, Value>? {
        var node: HashTableNode<Key, Value>? = head
        while node != nil {
            if node!.key == key {
                return node
            } else {
                node = node!.next
            }
        }
        
        return nil
    }
    
    public var description: String {
        var str = ""
        
        if let head = head {
            var node: HashTableNode<Key, Value>? = head
            while node != nil {
                str += node!.description
                str += " -> "
                node = node!.next
            }
            str += "nil"
        } else {
            str = "Empty"
        }
        
        return str
    }
}

public class HashTableNode<Key: Hashable, Value>: CustomStringConvertible {
    init(key: Key, value: Value) {
        self.key = key
        self.value = value
    }
    
    private(set) var key: Key
    private(set) var value: Value
    var next: HashTableNode?
    
    public var description: String {
        return "(\(key) : \(value))"
    }
}