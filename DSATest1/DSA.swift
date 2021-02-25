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
        //some type of guard to make sure we have ints
        //if either integer is zero the total will be zero
        //negative numbers?
        // x * y
        
        var total = 0
        
        if x != 0 && y != 0 {
            total = x * y
            return total 
        }
        
        
        return 0
    }

    
    // Question 2
    // Given an array of integers, return a new array of the same length that contains the original values squared.
    // ex: arraySquare(arr: [1,3,5,8]) should return [1,9,25,64]

    func arraySquare(arr:[Int]) -> [Int] {
        // input: [1,3,5,7] - array of ints, we are going to make sure we have integers in this array first
        // output/squared array: [1,9,25,47] - the output will start off as an empty array of ints, same length - arr.count
        
        // we can iterate through inputArr and take all values & square them - map?
        
        
        let results = arr.map { $0 * $0 }

        
        
        return results
        
        
        
    }

    // Question 3
    // Given two integers (low and high), return how many numbers are in that range that
    // DO NOT contain the number 5. This includes any number that has a 5, like 15, 352, etc.
    // ex: integerRange(1, 10) should return 9
    // ex: integerRange(4, 25) should return 19
    
    // two numbers, range in between those numbers
    // look for numbers in that range that do not contain 5
    // returning a count of numbers not containing 5
    // filter

    func integerRange( _ low: Int, _ high: Int) -> Int {
        
        var count = 0
        
        for num in low...high {
            let numString = num.description
            if numString.contains("5") {
                print("Found \(numString)")
            } else {
                count += 1
            }
        }
        
        return count
    }
    
    
    
    // Question 4
    // Write a function that takes an integer and an unsorted array of Ints
    // and returns true if there's any pair of numbers in that array that can be
    // summed up to the input integer.
    // ex: inputSum([1,3,5,4,2], 7) should return true
    // ex: inputSum([1,3,5,4,2], 2) should return false

    var arr = [1, 3, 5, 4, 2]
    var targetInt = 7
    // unsorted array
    // pair-- for (one thing,two thing of numbers that sum to targetInt return true
    // if a + b in arr = targetInt return true
    // we want to iterate through arr, taking note of two values in that arr that we will be adding together to see if the total value is equal to our target integer
    
    func inputSum( _ arr: [Int], _ targetInt: Int) -> Bool {
        
        for (index, x) in arr.enumerated() {
            for y in arr[ index + 1 ..< arr.count] {
                if x + y == targetInt {
                    return true
                }
            }
        }
      
        
        return false
    }
    
    
    // Question 5
    // Implement a function that accepts an array of integers as an argument.
    // This function should return the sum of all integers in the array.
    // Your solution should be **recursive**.
    // ex: recursiveSum([1,2,3,4,5]) should return 15

    
    //takes in an array of ints - var arrayOfInts: [1,7,2,5]
    // return sum of all integers in the array
    // sum variable starting at 0
    func recursiveSum( _ input: [Int]) -> Int {
        
        guard !input.isEmpty else {
            // base case
            return 0
        }
        // recursive call
        return input.first! + recursiveSum(Array(input.dropFirst()))
      
        
    }

    // Question 6
    // Given a linked list/node, write a function that takes it as input,
    // traverses it, and returns an array with all the values in the linked list.
    // Assume the linked list starts with 1 as the root node and looks like: 1->9->8->5
    // ex: traverseLinkedList(firstNode) should return [1,9,8,5]
    
    // linked lists - node class and linkedlist struct
    // taking in linked list of type node
    // returning values of linked list after being traversed/iterated through
    // linked list starts with 1 as the root and 1->9->8->5
    // root is 1
    // return array of ints
    //  var firstNode =
    
   
    
    
    func traverseLinkedList( _ inputList: Node?) -> [Int] {
       
        // create link nodes
        // call traverse function and pass in node 1
        // traverse the link list and add each node to an array
        //return the array
        // cannot iterate through a node the way we do through arrays - while let or if let
        var inputList = inputList
        var returnArr = [Int]() // returning an array of ints which will be the values of the nodes
        
        
        while let currentNode = inputList {
            returnArr.append(currentNode.value)
            inputList = currentNode.next
            
        }
      
        return returnArr
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
    
        guard let tree = tree else { return 0 }
        
        return 1 + max(maxDepth(tree: tree.left), maxDepth(tree: tree.right))
    }
    
}
