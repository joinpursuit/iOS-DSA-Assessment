//
//  DSATest.swift
//  DSATest1Tests
//
//  Created by Lynk on 3/12/20.
//  Copyright © 2020 Lynk. All rights reserved.
//

import XCTest
@testable import DSATest1

class DSATest: XCTestCase {
    
    let dsaTest = DSA()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMultiply() {
        XCTAssert(dsaTest.multiply(x: 5, y: 10) == 50, "5 * 10 = 50")
        XCTAssert(dsaTest.multiply(x: 1, y: 235) == 235, "1 * 235 = 235")
        XCTAssert(dsaTest.multiply(x: -5, y: 18) == -90, "-5 * 18 = -90")
    }
    
    
    func testSquareArray() {
        let firstArray = [2,3,4,5]
        let secondArray = [3,567,675,4,3,56,8,3,8,2,3]
        XCTAssert(dsaTest.arraySquare(arr: firstArray).count == firstArray.count, "First Same length")
        XCTAssert(dsaTest.arraySquare(arr: secondArray).count == secondArray.count, "Second Same length")
        
        XCTAssert(dsaTest.arraySquare(arr: [1,3,5,8]) == [1,9,25,64], "[1,3,5,8] == [1,9,25,64]")
        XCTAssert(dsaTest.arraySquare(arr: [-3,5,11,244]) == [9,25,121,59536], "[-3,5,11,244] == [9,25,121,59536]")
    }
    
    func testRangeOfInts() {
        XCTAssert(dsaTest.integerRange(1, 10) == 9, "1 through 10 has 9 values")
        XCTAssert(dsaTest.integerRange(4, 25) == 19, "4 through 25 has 19 values")
        XCTAssert(dsaTest.integerRange(-10, 10) == 19, "-10 through 10 has 19 values")
    }
    
    func testInputSum() {
        XCTAssert(dsaTest.inputSum([1,3,5,4,2], 2) == false , "[1,3,5,4,2] cannot make 2 so its false")
        XCTAssert(dsaTest.inputSum([1,3,5,4,2], 7) == true , "[1,3,5,4,2] can make 7 so its true")
    }
    
    func testRecursiveSum() {
        XCTAssert(dsaTest.recursiveSum([1,2,3,4,5]) == 15, "[1,2,3,4,5] == 15")
        XCTAssert(dsaTest.recursiveSum([-5,-3,1,-243]) == -250, "[-5,-3,1,-243] == -250")
    }
    
    func testLinkedListTraversal() {
        class LinkedList {
            var head: Node?
            var tail: Node?
            
        

            
            func append(value: Int) {
                let newNode = Node(value: value)
                if let tailNode = tail {
                    newNode.previous = tailNode
                    tailNode.next = newNode
                }
                else {
                    head = newNode
                }
                tail = newNode
            }
        }
        
        let testOne = LinkedList()
        testOne.append(value: 1)
        testOne.append(value: 9)
        testOne.append(value: 8)
        testOne.append(value: 5)
        
        let testTwo = LinkedList()
        testTwo.append(value: 811)
        testTwo.append(value: 7822)
        testTwo.append(value: 9)
        testTwo.append(value: 113)
        testTwo.append(value: 718)
        testTwo.append(value: 456)
        testTwo.append(value: 99)
        testTwo.append(value: 10000)
        testTwo.append(value: 123456789)
        XCTAssert(dsaTest.traverseLinkedList(testOne.head!) == [1, 9, 8, 5], "Linked List equal to [1, 9, 8, 5]")
        XCTAssert(dsaTest.traverseLinkedList(testTwo.head!) == [811, 7822, 9, 113, 718, 456, 99, 10000, 123456789], "Linked List equal to [811, 7822, 9, 113, 718, 456, 99, 10000, 123456789]")
    }
    
    
    func testBinaryTree() {
        
        class BinaryTree {
            var rootNode: BinaryNode?
            
            func addNode(_ value: Int) {
                let node = BinaryNode(value: value)
                if let rootNode = self.rootNode {
                    self.insert(rootNode, node)
                } else {
                    self.rootNode = node
                }
            }
            
            
            private func insert(_ root: BinaryNode, _ node: BinaryNode) {
                if root.value > node.value {
                    if let leftNode = root.left {
                        self.insert(leftNode, node)
                    } else {
                        root.left = node
                    }
                } else {
                    if let rightNode = root.right {
                        self.insert(rightNode, node)
                    } else {
                        root.right = node
                    }
                }
            }
        }
        
        let tree1 = BinaryTree()
        tree1.addNode(3)
        tree1.addNode(2)
        tree1.addNode(20)
        tree1.addNode(25)
        tree1.addNode(7)
       
        let tree2 = BinaryTree()
        tree2.addNode(290)
        tree2.addNode(100)
        tree2.addNode(500)
        tree2.addNode(99)
        tree2.addNode(92)
        tree2.addNode(91)
        tree2.addNode(90)

        XCTAssert(dsaTest.maxDepth(tree: nil) == 0, "Testing nil")
        XCTAssert(dsaTest.maxDepth(tree: tree1.rootNode!) == 3, "Testing 3 - 2 - 20 - 25 - 7")
        XCTAssert(dsaTest.maxDepth(tree: tree2.rootNode!) == 6, "Testing 290 - 100 - 500 - 99 - 92 - 91 - 90")
        
    }
}
