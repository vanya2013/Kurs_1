//
//  main.swift
//  Kurs_1
//
//  Created by Ivan Bezgin on 19.10.2021.
//

import Foundation

final class Queue<T> {
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
   
    
}

