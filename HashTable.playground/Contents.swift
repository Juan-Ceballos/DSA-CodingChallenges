import UIKit

var buckets = Array(repeating: 0, count: 4)

// hashValue is a built-in hash function
// returns a hash value for a key
// it's possible to get a negative number
// fix this using absolute value

// * Hash table making dictionary from scratch
// * merely increasing size of array which is space for dictionary reduces peroformance, in the background our built in dictionary for one would
// * would use a load factor, the closer LF to 1 via chaining determines increasing the size of the array, want balanced, not too long a chaing and not too big an array
// * Not chaining causes collision, where multiple keys goes in same index

let index = "Alex".hashValue % buckets.count

print("goes in \(index) index")

var dict = [String: Int]()
dict["Sweeden"] = 1

// e.g HashTable <String, Int>(capacity: 4)
struct HashTable <Key: Hashable, Value> {
    // (key, value)
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    private (set) var count = 0 // getter is public, setter is private
    
    init(capacity: Int) {
        buckets = Array<Bucket>(repeating: [], count: capacity)
        // e.g buckets = [], [], [(key: "Tiffany", value: 21), ...], []
    }
    
    // method to return index where key will be stored
    func index(forKey key: Key) -> Int  {
        return abs(key.hashValue % buckets.count)
    }
    
    //
    func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
    
    // method to update a value for a given key
    mutating func update(value: Value, forKey key: Key) -> Value?  {
        let index = self.index(forKey: key)
        for(i, element) in buckets[index].enumerated()  {
            if element.key == key   {
                let oldValue = element.value
                // update the current value
                buckets[index][i].value = value
                return oldValue
            }
        }
        // we get here if we have no value
        buckets[index].append((key: key, value: value))
        count += 1
        return nil // to signify there wasn't an existing value
    }
    
    // method to remove an element at a given key
    mutating func removeValue(forKey key: Key) -> Value?    {
        let index = self.index(forKey: key)
        for (i, element) in buckets[index].enumerated()  {
            if element.key == key   {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        return nil
    }
    
    // we can have multiple subscript methods taking in varied arguments
    subscript(key: Key) -> Value?   {
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                update(value: value, forKey: key)
            }
            else    {
               removeValue(forKey: key)
            }
        }
    }
    
}



// test the hash value
// key is String and the value is an Int and capacity is 4

var hashTable = HashTable<String, Int>(capacity: 4)

hashTable["Tiff"] = 21

//hashTable.update(value: 21, forKey: "Tiff")
hashTable.update(value: 25, forKey: "Eric")

//
hashTable["Tiff"] = nil

if let age = hashTable["Alex"] {
    print("\(age)age exist")
}
else    {
    print("age does not exist")
}

//
let age = hashTable["Cameron"] ?? 100

hashTable.count

print(hashTable)
