//
//  main.swift
//  Kurs_1
//
//  Created by Ivan Bezgin on 19.10.2021.
//

import Foundation

// задание 1

func isEven(_ number: Int) -> Bool {
  if number % 2 == 0 {return true} else {return false}
}

// Задание 2

func isModTree(_ number: Int) -> Bool {
    if number % 3 == 0 {return true} else {return false}
}

// Задание 3

var numbers = Array(repeating: 0, count:100)

for element in (0...99) {
    numbers[element] += element
}


// Задание 4

var element = 0
while element < numbers.count {
    if isEven(numbers[element]) {numbers.remove(at:element); element -= 1} else {}
    element += 1;
    if !isModTree(numbers[element]) {numbers.remove(at:element); element -= 1} else {}
    element += 1;
}

// Задание 5


numbers.removeAll()
numbers.append(0)
numbers.append(1)
fibonachi(&numbers,numbers.count)

func fibonachi(_ numbers: inout [Int],_ counter: Int) {
    if counter < 50 {
        numbers.append(numbers[counter-1] + numbers[counter-2])
        fibonachi(&numbers, counter+1)
    } else {}
}

// Задание 6

numbers.removeAll()
for element in (0...99) {
    numbers.append(2 + element)
}


prostueChisla(&numbers, 100, 2)

func prostueChisla(_ numbers: inout [Int],_ n: Int, _ pIn: Int) {
    if pIn < n {
        var pOut = pIn
        for element in numbers {
            if element/pIn > 1 && element % pIn == 0 {
                if let index = numbers.firstIndex(of: element) {
                    numbers.remove(at: index)}
                    pOut += pIn
            }
        }
        
       prostueChisla(&numbers, n, pIn+1)
    }
}




