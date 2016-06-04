//: Playground - noun: a place where people can play

import UIKit

let intLinkedList = UnorderedLinkedList<Int>()
intLinkedList.text
intLinkedList.insert(5)
intLinkedList.text
intLinkedList.insert(7)
intLinkedList.text
intLinkedList.insert(2)
intLinkedList.text
intLinkedList.insert(369)
intLinkedList.text
intLinkedList.insert(3)
intLinkedList.text
intLinkedList.insert(3)
intLinkedList.text
intLinkedList.deleteFirstNodeWithData(3)
intLinkedList.text
intLinkedList.deleteFirstNodeWithData(5)
intLinkedList.text
intLinkedList.deleteFirstNodeWithData(2)
intLinkedList.text
intLinkedList.deleteFirstNodeWithData(9999)
intLinkedList.text

intLinkedList.findFirstNodeWithData(7)?.text
intLinkedList.findFirstNodeWithData(369)?.text
intLinkedList.findFirstNodeWithData(3)?.text
intLinkedList.findFirstNodeWithData(9999)?.text

//
// Sequence Type
//

var mapped = intLinkedList.map({$0*2}).filter({$0>10})
let reduced = mapped.reduce(0, combine: {$0 + $1})
mapped
reduced
intLinkedList.minElement()
intLinkedList.maxElement()
intLinkedList.sort()

var d = [Int]()
for data in intLinkedList {
    d.append(data)
}
d

let anotherIntLinkedList = UnorderedLinkedList<Int>()
d = []
for data in anotherIntLinkedList {
    d.append(data)
}
d
anotherIntLinkedList.insert(4)
d = []
for data in anotherIntLinkedList {
    d.append(data)
}
d
