//
//  StackProtocol.swift
//  
//
//  Created by adam on 5/9/16.
//
//

import Swift

// http://krakendev.io/blog/generic-protocols-and-their-shortcomings

public protocol StackNodeType: AnyObject {
    associatedtype DataType
    
    var data: DataType { get set }
    var next: Self? { get set }
    
    init(data: DataType)
}

public extension StackNodeType {
    public func text() -> String {
        var str = String(data)
        if next == nil {
            str += ""
        } else {
            str += " -> "
        }
        return str
    }
}

final class IntStackNode: StackNodeType {
    var data: Int
    var next: IntStackNode?
    
    init(data: Int) {
        self.data = data
    }
}

//// MARK: Type Erased Property Getters/Setters
//private extension StackNodeType {
//    func setData(data: DataType) {
//        self.data = data
//    }
//
//    func getData() -> DataType {
//        return data
//    }
//}




////By making this class a generic class, we can define a type T that we forward to our dependency injected StackNode.
////Since this class conforms to our StackNode protocol, we can call StackNode's functions regularly.
//public final class AnyStackNode<T>: StackNodeType {
//    public var data: T {
//        get { return _getData() }
//        set { _setData(newValue) }
//    }
//
//    public var next: AnyStackNode?
//
//    //These variables are private, preventing others from assigning to them or calling them directly.
//    //Since each type is the exact same type as the functions in our StackNode, we can assign a StackNode instance's function signatures to these variables.
//    //By assigning a StackNode instance's function signatures to these variables, we can effectively forward any calls made to AnyStackNode's functions to the original instance.
//    private let _getData: (Void -> T)
//    private let _setData: (T -> Void)
//
//    //By creating only one required init, we ensure that we can only initialize this class one way.
//    required public init<U: StackNodeType where U.DataType == T>(_ stackNode: U) {
//        _getData = stackNode.getData
//        _setData = stackNode.setData
//    }
//}

public class Stack<Node: StackNodeType> {
    
    private var top: Node?
    
    func pop() -> Node.DataType? {
        guard let top = top else { return nil }
        self.top = top.next
        return top.data
    }
    
    func push(data: Node.DataType) {
        let newTop = Node(data: data)
        newTop.next = top
        top = newTop
    }
    
    func peek() -> Node.DataType? {
        return top?.data
    }
    
    func isEmpty() -> Bool {
        return top == nil
    }
    
    func text() -> String {
        guard let top = top else {
            return "Empty"
        }
        
        var str = "TOP: "
        
        var node: Node? = top
        while (node != nil) {
            str += node!.text()
            node = node?.next
        }
        
        return str
    }
}

//public class Stack2<T> {
//
//    private var top: AnyStackNode<T>?
//
//    func pop() -> T? {
//        guard let top = top else { return nil }
//        self.top = top.next
//        return top.data
//    }
//
//    func push(data: T) {
//        let newTop = Node(data: data)
//        newTop.next = top
//        top = newTop
//    }
//
////    func peek() -> Node.DataType? {
////        return top?.data
////    }
////
////    func isEmpty() -> Bool {
////        return top == nil
////    }
////
////    func text() -> String {
////        guard let top = top else {
////            return "Empty"
////        }
////
////        var str = ""
////
////        var node: Node? = top
////        while (node != nil) {
////            str += node!.text()
////            node = node?.next
////        }
////
////        return str
////    }
//}





//
//
//
//public protocol SSStackNodeType: AnyObject {
//    associatedtype DataType
//
//    //var data: DataType { get set }
//    //var next: Self? { get set }
//    func next() -> Self?
//    func data() -> DataType
//}
//
//
//
//class _AnyStackNodeBoxBase<DataType>: SSStackNodeType {
//    func next() -> Self? {
//        fatalError()
//    }
//    func data() -> DataType {
//        fatalError()
//    }
//}
//
//class _AnyStackNodeBox<StackNode: SSStackNodeType>: _AnyStackNodeBoxBase<StackNode.DataType> {
//    typealias DataType = StackNode.DataType
//
//    let base: StackNode
//
//    init(_ base: StackNode) {
//        self.base = base
//    }
//
//    override func next() -> Self? {
//        return base.next() as? _AnyStackNodeBox
//    }
//
////    override func next() -> SSStackNodeType? {
////        return base.next()
////    }
//    override func data() -> DataType {
//        return base.data()
//    }
//}
//
//
//
//
//



//
//private class _AnySequenceBoxBase<Element>: SequenceType {
//    func generate() -> AnyGenerator<Element> {
//        fatalError()
//    }
//    func underestimateCount() -> Int {
//        fatalError()
//    }
//}
//
//private class _AnySequenceBox<Sequence: SequenceType>: _AnySequenceBoxBase<Sequence.Generator.Element> {
//    typealias Element = Sequence.Generator.Element
//
//    let base: Sequence
//
//    init(_ base: Sequence) {
//        self.base = base
//    }
//
//    override func generate() -> AnyGenerator<Element> {
//        return anyGenerator(base.generate())
//    }
//
//    override func underestimateCount() -> Int {
//        return base.underestimateCount()
//    }
//}
//
//public final class AnySequence<Element>: SequenceType {
//    private let box: _AnySequenceBoxBase<Element>
//
//    public func generate() -> AnyGenerator<Element> {
//        return box.generate()
//    }
//
//    public func underestimateCount() -> Int {
//        return box.underestimateCount()
//    }
//
//    public init<S: SequenceType where S.Generator.Element == Element>(_ base: S) {
//        self.box = _AnySequenceBox(base)
//    }
//}
