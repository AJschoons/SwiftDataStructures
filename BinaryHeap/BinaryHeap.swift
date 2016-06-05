//
//  BinaryHeap.swift
//
//
//  Created by adam on 5/10/16.
//
//

import Foundation

public class BinaryHeap<T: Comparable> {
    public private(set) var heap = [T]()
    private let compare: (T, T) -> Bool
    
    public init(comparsonOperator: (T, T) -> Bool) {
        self.compare = comparsonOperator
    }
    
    /// O(log(n))
    public func extract() -> T? {
        guard heap.count > 0 else { return nil }
        guard heap.count > 1 else { return heap.popLast() }
        
        let extractedVal = heap[0]
        
        heap[0] = heap.popLast()!
        percolateDown(0)
        
        return extractedVal
    }
    
    /// O(log(n))
    public func insert(data: T) {
        heap.append(data)
        percolateUp(heap.endIndex - 1)
    }
    
    private func percolateUp(index: Int) {
        guard index > 0 else { return }
        let parentIndex = indexOfParent(index)
        
        if compare(heap[index], heap[parentIndex]) {
            swap(&heap[index], &heap[parentIndex])
            percolateUp(parentIndex)
        }
    }
    
    private func percolateDown(index: Int) {
        let leftChild = indexOfLeftChild(index)
        let rightChild = indexOfRightChild(index)
        
        var smallest = index
        
        if leftChild < heap.count && compare(heap[leftChild], heap[smallest]) {
            smallest = leftChild
        }
        
        if rightChild < heap.count && compare(heap[rightChild], heap[smallest]) {
            smallest = rightChild
        }
        
        if smallest != index {
            swap(&heap[index], &heap[smallest])
            percolateDown(smallest)
        }
    }
}

private func indexOfParent(childIndex: Int) -> Int {
    return Int(ceil(Double(childIndex) / 2.0)) - 1
}

private func indexOfLeftChild(parentIndex: Int) -> Int {
    return parentIndex * 2 + 1
}

private func indexOfRightChild(parentIndex: Int) -> Int {
    return indexOfLeftChild(parentIndex) + 1
}

public class MinHeap<T: Comparable>: BinaryHeap<T> {
    public init() {
        super.init(comparsonOperator: <)
    }
}

public class MaxHeap<T: Comparable>: BinaryHeap<T> {
    public init() {
        super.init(comparsonOperator: >)
    }
}

public func isValidMinHeap<T: Comparable>(heap: [T]) -> Bool {
    guard heap.count > 1 else { return true }
    let lastValidIndex = heap.endIndex - 1
    for parent in 0...lastValidIndex {
        let leftChild = indexOfLeftChild(parent)
        let rightChild = indexOfRightChild(parent)
        
        if leftChild <= lastValidIndex {
            if heap[leftChild] < heap[parent] {
                return false
            }
        }
        
        if rightChild <= lastValidIndex {
            if heap[rightChild] < heap[parent] {
                return false
            }
        }
    }
    
    return true
}

public func isValidMaxHeap<T: Comparable>(heap: [T]) -> Bool {
    guard heap.count > 1 else { return true }
    let lastValidIndex = heap.endIndex - 1
    for parent in 0...lastValidIndex {
        let leftChild = indexOfLeftChild(parent)
        let rightChild = indexOfRightChild(parent)
        
        if leftChild <= lastValidIndex {
            if heap[leftChild] > heap[parent] {
                return false
            }
        }
        
        if rightChild <= lastValidIndex {
            if heap[rightChild] > heap[parent] {
                return false
            }
        }
    }
    
    return true
}