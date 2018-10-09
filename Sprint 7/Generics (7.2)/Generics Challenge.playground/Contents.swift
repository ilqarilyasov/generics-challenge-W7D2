import Cocoa

struct CountedSet <T: Hashable & Sequence> {
    
    private(set) var storage = [T:Int]()
    
    // INSERT
    mutating func insert(_ element: T) {
        var keys = storage.map({ $0.key })
        keys.append(element)
        
        var count = 0
        for _ in element {
            count += 1
        }
        storage[element] = count
    }
    
    // REMOVE
    mutating func remove(_ element: T) {
        storage[element] = nil
    }
    
    // SUBSCRIPT
    subscript(_ element: T) -> Int {
        let keys = storage.map({ $0.key })
        
        if keys.contains(element) {
            return storage[element]!
        } else {
            return 0
        }
    }
    
    // COUNT
    mutating func count() -> Int {
        return storage.isEmpty ? 0 : storage.count
    }
}


var set = CountedSet(storage: ["Texas":5])

set.insert("Colorado")
set.insert("Vermont")
set.insert("Utah")
set.insert("New York")
print(set)

set.remove("New York")
print(set)

let element = "Texas"
let value = set[element]
print("Value of \(element) is \(value)")

let count = set.count()
print("Count of Storage is \(count)")




