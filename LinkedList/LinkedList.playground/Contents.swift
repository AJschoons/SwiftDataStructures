import Swift

let intLinkedList = UnorderedLinkedList<Int>()
intLinkedList.description
intLinkedList.insert(5)
intLinkedList.description
intLinkedList.insert(7)
intLinkedList.description
intLinkedList.insert(2)
intLinkedList.description
intLinkedList.insert(369)
intLinkedList.description
intLinkedList.insert(3)
intLinkedList.description
intLinkedList.insert(3)
intLinkedList.description
intLinkedList.deleteFirstNodeWithData(3)
intLinkedList.description
intLinkedList.deleteFirstNodeWithData(5)
intLinkedList.description
intLinkedList.deleteFirstNodeWithData(2)
intLinkedList.description
intLinkedList.deleteFirstNodeWithData(9999)
intLinkedList.description

intLinkedList.findFirstNodeWithData(7)?.description
intLinkedList.findFirstNodeWithData(369)?.description
intLinkedList.findFirstNodeWithData(3)?.description
intLinkedList.findFirstNodeWithData(9999)?.description

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
