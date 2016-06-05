import Swift

let graph = createExampleUnweightedUndirectedGraph()
graph.vertices
graph.vertices.count

let zero = graph.vertices[0]
zero.data
zero.neighbors[0].destination.data
zero.neighbors[1].destination.data
zero.neighbors[2].destination.data

func DFS<T>(vertex: Vertex<T>) {
    print(vertex.data)
    vertex.visited = true
    
    for neighbor in vertex.neighbors {
        if neighbor.destination.visited == false {
            DFS(neighbor.destination)
        }
    }
}

DFS(zero)
print()
graph.resetVisits()
DFS(zero)
print()
graph.resetVisits()

func BFS<T>(start: Vertex<T>) {
    let queue = Queue<Vertex<T>>()
    queue.add(start)
    
    while let curentVertex = queue.remove() {
        guard curentVertex.visited == false else { continue }
        
        print(curentVertex.data)
        curentVertex.visited = true
        
        for neighbor in curentVertex.neighbors {
            if neighbor.destination.visited == false {
                queue.add(neighbor.destination)
            }
        }
    }
}

BFS(zero)
