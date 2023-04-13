//
//  main.swift
//  calc
//
//  Created by Jeffery Kwok Tong Kwan How
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

// Set up Objects
let calculator = Calculator();
let parser = Parser();

// Set create numbers and operations deque data structure
let numbersList = LinkedList();
let operationsList = LinkedList();

// Parse the input and run calculations
parser.parseAndCalculate(args, numbersList, operationsList);
// The remaining numbersList will be left with the solution as the
// only element
var currentNode:Node? = numbersList.head;
guard let solution:Int = Int(currentNode?.getValue() ?? "Fail") else{
    // if string can't be unwrapped or is converted to "Fail"
    // program exits
    exit(1);
}
print(solution);
exit(0);
