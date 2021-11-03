//
//  main.swift
//  Kurs_1
//
//  Created by Ivan Bezgin on 19.10.2021.
//

import Foundation

final class Queue<T: AnyObject> {
    private var elements: [T] = Array()
    
    init(element: T){ self.elements.append(element) }
    
    func Set(element: T) {
        elements.append(element)
    }
    
    func Get() -> T? {
        if !elements.isEmpty {
        let element = elements[0]
        elements.removeFirst()
        return element
        } else {
            return nil
        }
    }
    func getIndex(elementOfQueue: T) -> Int? {
        var count = 0
        for element in elements {
            if element === elementOfQueue {
                return count
            } else { count += 1 }
        }
        return nil
    }
    
    
    func PrintAllQueue () {
        elements.forEach { print($0) }
    }
    
    func filterQueue(condition: (T) -> Bool) -> [T] {
        var array = [T]()
        elements.forEach {
            if condition($0) { array.append($0) }
        }
        return array
    }
    
    func removeAll() {
        elements.removeAll()
    }
    
    subscript(index: Int) -> T? {
        if index > elements.count, index >= 0 {
            return elements[index]
        } else { return nil }
        
    }
   
    
}

