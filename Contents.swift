import Foundation

public class LinkedList<T: Comparable> {
    
    private var head: Node<T>?
    private var tail: Node<T>?
    private var count = 0
    
    private var isEmpty: Bool {
        head == nil
    }
    
    init() {}
    
    /// This methode will add value to end of the linked list
    /// - Parameter value: new value to be added in linked list
    public func addLast(value: T) {
        let node = Node(value: value)
        if isEmpty {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
        count += 1
    }
    
    /// This function will add value to the start of the linked list
    /// - Parameter value: new value to be added in linked list
    public func addFirst(value: T) {
        let node = Node(value: value)
        if isEmpty {
            head = node
            tail = node
        } else {
            node.next = head
            head = node
        }
        count += 1
    }
    
    /// This func will add node after a specific node
    /// - Parameters:
    ///   - node: enter the node you want add value after
    ///   - value: value you want to enter
    public func insertAfter(node: T, value: T) {
        let newNode = Node(value: value)
        var current = head
        while current != nil {
            if current!.value == node {
                newNode.next = current?.next
                current?.next = newNode
                count += 1
                return
            }
            current = current?.next
        }
    }
    
    
    /// This function will insert new node on specific index
    /// - Parameters:
    ///   - index: Int value indicating index where you wan to insert value
    ///   - value: value to be inserted
    public func insertAt(_ index: Int, value: T) {
        
        if head == nil && index != 0 { return }
        
        if head != nil && index == 0 {
            addFirst(value: value)
            return
        }
    
        var newNode = Node(value: value)
        var current = head
        var previous = head
        for _ in 0..<index {
            previous = current
            current = current?.next
            if current == nil { break }
        }
        if let previous = previous {
            newNode.next = previous.next
            previous.next = newNode
            count += 1
        }
    }
    
    /// This finction will print all values of linked list
    public func printLinkedList() {
        var current = head
        while current != nil {
            print(current?.value ?? "")
            current = current?.next
        }
    }
    
    /// This methode will find index of the given value in the linked list
    /// - Parameter value: value to be search in linked list
    /// - Returns: index of the specific value. -1 if value not found
    public func indexOf(value: T) -> Int {
        var index = 0
        var current = head
        
        while current != nil {
            if current!.value == value {
                return index
            }
            current = current?.next
            index += 1
        }
        return -1
    }
    
    /// This message will search for specific item in the list
    /// - Parameter value: value to be search in the linked list
    /// - Returns: A boolean value indicating weather value is in linked list or not
    public func contains(value: T) -> Bool {
        var current = head
        while current != nil {
            if current!.value == value {
                return true
            }
            current = current?.next
        }
        return false
    }
    
    /// This functio will remove first element in the list
    public func removeFirst() {
        //list is empty
        if isEmpty { return }
        
        if head == tail {
            //list has only one Node
            head = nil
            tail = nil
            count -= 1
            return
        }
        let nextNode = head?.next
        head?.next = nil
        head = nextNode
        count -= 1
    }
    
    /// This function will remove last element is the list
    public func removeLast() {
        //list is empty
        if isEmpty { return }
        
        if head == tail {
            //list has only one Node
            head = nil
            tail = nil
            count -= 1
            return
        }
        
        var current =  head
        
        while current != nil {
            if current!.next == tail {
                tail = current
                tail?.next = nil
                count -= 1
                return
            }
            current = current?.next
        }
    }
    
    
    /// This function will remove vode from a specific index
    /// - Parameter index: A numaric value indicating index to be deleted
    public func removeAt(_ index: Int) {
        if isEmpty || index < 0 { return }
        if index == 0 {
            removeFirst()
            return
        }
        var current = head
        var previous = head
        for _ in 0..<index {
            previous = current
            current = current?.next
            if current == nil { break }
        }
        if let previous = previous {
            previous.next = current?.next
            current?.next = nil
            count -= 1
        }
    }
    
    public func size() -> Int {
        return count
    }
    
    public func reverse() {
        
        if isEmpty { return }
        
        var previous = head
        var current = head?.next
        
        tail = head
        tail?.next = nil
        
        while current != nil {
            var next = current?.next
            current?.next = previous
            
            previous = current
            current = next
        }
        head = previous
    }
    
    public func kthNodeFromEnd(position: Int) {
       
        if isEmpty || position < 0 || position > list.count { return }
            
        var previous = head
        var current = head
       
        for _ in 0..<position - 1 {
            current = current?.next
        }
        
        while let next = current?.next {
            previous = previous?.next
            current = next
        }
        print(previous?.value ?? Optional.none)
    }
}

extension LinkedList {
    private class Node<T: Comparable>: Equatable {
        var value: T
        var next: Node?
        
        init(value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
        
        static func == (lhs: Node, rhs: Node) -> Bool {
            return lhs.next == rhs.next
        }
    }
}


let list = LinkedList<Int>()
list.addLast(value: 10)
list.addLast(value: 12)
list.addLast(value: 15)
list.addLast(value: 20)
list.printLinkedList()
print("---------------")
list.kthNodeFromEnd(position: 2)
print("done")
