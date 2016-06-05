//
//  Graph.swift
//  
//
//  Created by adam on 5/10/16.
//
//

import Swift

public class Vertex<T>: CustomStringConvertible {
    public var data: T
    public var neighbors = [Edge<T>]()
    public var visited = false
    
    public init(data: T) {
        self.data = data
    }
    
    public var description: String {
        return String(data)
    }
}

public class Edge<T> {
    public var destination: Vertex<T>
    public var weight: Int = 0
    
    public init(destination: Vertex<T>, weight: Int = 0) {
        self.destination = destination
        self.weight = weight
    }
}

public class Graph<T> {
    public private(set) var vertices = [Vertex<T>]()
    public let isDirected: Bool
    
    public init(isDirected: Bool = true) {
        self.isDirected = isDirected
    }
    
    public func addVertex(data: T) -> Vertex<T> {
        let vertex = Vertex<T>(data: data)
        vertices.append(vertex)
        return vertex
    }
    
    public func addEdge(source: Vertex<T>, destination: Vertex<T>, weight: Int = 0) {
        assert(source !== destination)
        let edge = Edge<T>(destination: destination, weight: weight)
        source.neighbors.append(edge)
        
        // Create the reverse edge for undirected graphs
        if !isDirected {
            let reverseEdge = Edge<T>(destination: source, weight: weight)
            destination.neighbors.append(reverseEdge)
        }
    }
    
    public func resetVisits() {
        for vertex in vertices {
            vertex.visited = false
        }
    }
}

public func createExampleUnweightedUndirectedGraph() -> Graph<Int> {
    let graph = Graph<Int>()
    
    let zero = graph.addVertex(0)
    let one = graph.addVertex(1)
    let two = graph.addVertex(2)
    let three = graph.addVertex(3)
    let four = graph.addVertex(4)
    let five = graph.addVertex(5)
    
    graph.addEdge(zero, destination: one)
    graph.addEdge(zero, destination: four)
    graph.addEdge(zero, destination: five)
    
    graph.addEdge(one, destination: three)
    graph.addEdge(one, destination: four)
    
    graph.addEdge(two, destination: one)
    
    graph.addEdge(three, destination: two)
    graph.addEdge(three, destination: four)
    
    return graph
}