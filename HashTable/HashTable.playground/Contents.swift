
import Foundation

// Tests

let ht = HashTable<String, Int>(capacity: 3)
assert(ht.slots.count == 3)
ht.description
assert(ht.valueForKey("wow") == nil)
assert(ht.slotsUsed == 0)
assert(ht.count == 0)

ht.setKey("wow", withValue: 10)
ht.description
assert(ht.valueForKey("wow") == 10)
assert(ht.slotsUsed == 1)
assert(ht.count == 1)

ht.setKey("wow", withValue: 12)
ht.description
assert(ht.valueForKey("wow") == 12)
assert(ht.slotsUsed == 1)
assert(ht.count == 1)

ht.setKey("a", withValue: 12)
ht.description
assert(ht.valueForKey("a") == 12)
assert(ht.slotsUsed == 2)
assert(ht.count == 2)

ht.setKey("b", withValue: 13)
ht.description
assert(ht.valueForKey("b") == 13)
assert(ht.slotsUsed == 3)
assert(ht.count == 3)

ht.setKey("c", withValue: 14)
ht.description
assert(ht.valueForKey("c") == 14)
assert(ht.slotsUsed == 3)
assert(ht.count == 4)

ht.setKey("d", withValue: 15)
ht.description
assert(ht.valueForKey("d") == 15)
assert(ht.slotsUsed == 3)
assert(ht.count == 5)

ht.setKey("easdfasdfads", withValue: 16)
ht.description
assert(ht.valueForKey("easdfasdfads") == 16)
assert(ht.slotsUsed == 3)
assert(ht.count == 6)

ht.setKey("f", withValue: 3)
ht.description
assert(ht.valueForKey("f") == 3)
assert(ht.slotsUsed == 3)
assert(ht.count == 7)

ht.setKey("f", withValue: 5)
ht.description
assert(ht.valueForKey("f") == 5)
assert(ht.slotsUsed == 3)
assert(ht.count == 7)

ht.setKey("d", withValue: -4)
ht.description
assert(ht.valueForKey("d") == -4)
assert(ht.slotsUsed == 3)
assert(ht.count == 7)

ht.setKey("wow", withValue: -100000)
ht.description
assert(ht.valueForKey("wow") == -100000)
assert(ht.slotsUsed == 3)
assert(ht.count == 7)
