//
//  DSA.swift
//  DSATest1
//
//  Created by Lynk on 3/12/20.
//  Copyright © 2020 Lynk. All rights reserved.
//

import Foundation


//Do not modify these two node classes!!
class Node {
    var value: Int
    var next: Node?
    var previous: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class BinaryNode {
    var value: Int
    var left: BinaryNode?
    var right: BinaryNode?
    
    init(value: Int) {
        self.value = value
    }
}

//*********************************


class DSA {
    
    // Do not change any of the function names or the function signatures (the number of arguments in a function)
    // or else the tests will not pass.
    // e.g. don't change multiply(x, y) to multiply(x,y,z)

    
    
    // Question 1
    // Write a function that returns two numbers multiplied
    // ex: multiply(x: 5, y: 10) should return 50

    func multiply(x: Int, y: Int) -> Int {
        let product = x * y
        return product
    }

    
    // Question 2
    // Given an array of integers, return a new array of the same length that contains the original values squared.
    // ex: arraySquare(arr: [1,3,5,8]) should return [1,9,25,64]

    func arraySquare(arr:[Int]) -> [Int] {
    
        let squareArr = arr.map{$0 * $0}
        return squareArr
    }

    // Question 3
    // Given two integers (low and high), return how many numbers are in that range that
    // DO NOT contain the number 5. This includes any number that has a 5, like 15, 352, etc.
    // ex: integerRange(1, 10) should return 9
    // ex: integerRange(4, 25) should return 19

    func integerRange( _ low: Int, _ high: Int) -> Int {
     var nonFiveContaining = 0
        for num in low ... high {
            // swift equates -5 % 10 to -5 not 5
            if abs(num) % 10 != 5 {
                nonFiveContaining += 1
            }
            print(nonFiveContaining)
        }
        return nonFiveContaining
    }
    
    
    // Question 4
    // Write a function that takes an integer and an unsorted array of Ints
    // and returns true if there's any pair of numbers in that array that can be
    // summed up to the input integer.
    // ex: inputSum([1,3,5,4,2], 7) should return true
    // ex: inputSum([1,3,5,4,2], 2) should return false

    func inputSum( _ arr: [Int], _ targetInt: Int) -> Bool {
        
        var pairExists = false
        var sumDict:[Int : Int] = [:]
        
        for num in 0 ..< arr.count {
            if sumDict[targetInt - arr[num]] != nil {
                pairExists = true
            } else {
                // setting num as value for key to have key value pair, not needed for requested soultion
                sumDict[arr[num]] = num
            }
        }
        
 
        return pairExists
    }
    
    // Question 5
    // Implement a function that accepts an array of integers as an argument.
    // This function should return the sum of all integers in the array.
    // Your solution should be **recursive**.
    // ex: recursiveSum([1,2,3,4,5]) should return 15

    func recursiveSum( _ input: [Int]) -> Int {
        // exit casses for recursion
        if input.count == 0 {
            return 0
        }
        
        return input.last! + recursiveSum(Array(input.dropLast()))
    }

    // Question 6
    // Given a linked list, write a function that takes it as input,
    // traverses it, and returns an array with all the values in the linked list.
    // Assume the linked list starts with 1 as the root node and looks like: 1->9->8->5
    // ex: traverseLinkedList(firstNode) should return [1,9,8,5]
   

    func traverseLinkedList( _ inputList: Node) -> [Int] {
        var linkedListValues = [Int]()
        var currentNode = inputList
        
        while currentNode.next != nil {
            linkedListValues.append(currentNode.value)
            currentNode = currentNode.next!
        }
        // appends the final element of the node
        linkedListValues.append(currentNode.value)
        
        return linkedListValues
        
    }

    // Question 7
    // Given a binary tree, find its maximum depth.
    // The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
    // Note: A leaf is a node with no children.
    //
    // Example tree, depth is 3. Your function should return an integer only.
    //     3
    //    / \
    //   2   20
    //      /  \
    //     7   25
    //

    func maxDepth(tree: BinaryNode?) -> Int {
        var depth : Int 
        if tree == nil{
          depth = 0
        } else {
              //sub tree
            let depthLeftSide = maxDepth(tree: tree?.left)
            let depthRightSide = maxDepth(tree: tree?.right)
            
            if depthRightSide > depthLeftSide {
                depth = depthRightSide + 1
            } else {
                depth = depthLeftSide + 1
            }
            
        }
        return depth
    }
}
