//: Playground - noun: a place where people can play

import UIKit

var mh = BinaryHeap<Int>(comparsonOperator: <)
isValidMinHeap(mh.heap)

mh.insert(8)
mh.heap
assert(isValidMinHeap(mh.heap))

mh.insert(5)
mh.heap
assert(isValidMinHeap(mh.heap))

mh.insert(10)
mh.heap
assert(isValidMinHeap(mh.heap))

mh.insert(12)
mh.heap
assert(isValidMinHeap(mh.heap))

mh.insert(3)
mh.heap
assert(isValidMinHeap(mh.heap))

mh.insert(60)
mh.heap
assert(isValidMinHeap(mh.heap))

mh.insert(68)
mh.heap
assert(isValidMinHeap(mh.heap))

mh.insert(1)
mh.heap
assert(isValidMinHeap(mh.heap))

mh.insert(13)
mh.heap
assert(isValidMinHeap(mh.heap))

mh.insert(0)
mh.heap
assert(isValidMinHeap(mh.heap))

mh.extract()
mh.heap
assert(isValidMinHeap(mh.heap))

mh.extract()
mh.heap
assert(isValidMinHeap(mh.heap))

mh.extract()
mh.heap
assert(isValidMinHeap(mh.heap))

mh.extract()
mh.heap
assert(isValidMinHeap(mh.heap))

mh.extract()
mh.heap
assert(isValidMinHeap(mh.heap))

mh.extract()
mh.heap
assert(isValidMinHeap(mh.heap))

mh.extract()
mh.heap
assert(isValidMinHeap(mh.heap))

mh.extract()
mh.heap
assert(isValidMinHeap(mh.heap))

mh.extract()
mh.heap
assert(isValidMinHeap(mh.heap))

mh.extract()
mh.heap
assert(isValidMinHeap(mh.heap))

mh.extract()
mh.heap
assert(isValidMinHeap(mh.heap))

var min = MinHeap<Int>()
for i in (1...30).reverse() {
    min.insert(i)
    assert(isValidMinHeap(min.heap))
    min.heap
}

for _ in 0..<10 {
    let first = min.heap[0]
    let extract = min.extract()
    assert(first == extract)
    assert(isValidMinHeap(min.heap))
}

var max = MaxHeap<Int>()
for i in (1...30).reverse() {
    max.insert(i)
    assert(isValidMaxHeap(max.heap))
    max.heap
}

for _ in 0..<10 {
    let first = max.heap[0]
    let extract = max.extract()
    assert(first == extract)
    assert(isValidMaxHeap(max.heap))
}

while max.extract() != nil {
    assert(isValidMaxHeap(max.heap))
}

max.heap

for _ in 0..<100 {
    let rand = Int(arc4random_uniform(20))
    max.insert(rand)
    assert(isValidMaxHeap(max.heap))
}

