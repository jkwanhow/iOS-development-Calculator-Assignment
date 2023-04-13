//
//  Parser.swift
//  calc
//
//  Created by Jeffery Kwan How on 18/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation


class Parser {
    let OPERATORS: Set = ["+", "-", "/", "%", "x"];
    let HIGH_PRIORITY_OPERATORS: Set = ["x", "/", "%"];
    let calculator = Calculator();
    
    /**
     * checks if input string/char is an operator
     */
    func isOperator (_ char: String) -> Bool {
        return OPERATORS.contains(char);
    }
    
    /**
     * Checks if operatis is (higher priority) "x, /, %"
     */
    func isHighPriority (_ char: String) -> Bool {
        return HIGH_PRIORITY_OPERATORS.contains(char);
    }
    
    /**
     * checks number is valid i.e: +45, 45, -45. No non numeric char. With exception of
     *  + and - in the first index.
     */
    func isValidNumber(_ stringToCheck: String) -> String{
        var number:String = "";
        var index:Int = 0;
        for char in stringToCheck{
            if (char == "+" || char == "-") && (index == 0){
                if (char == "-"){
                    number += [char];
                }
            }else if (char.isNumber){
                number += [char];
            }else{
                // Can't have non number string or + or - not in the 0th index
                exit(1);
            }
            
            index += 1;
        }
        
        return number;
    }
    
    // Calculation to calculate when number list size is 2
    // hence only one operator
    func basicCalculate(_ numbers:LinkedList, _ operations:LinkedList){
        let numberOne:String = numbers.removeFirst();
        let numberTwo:String = numbers.removeFirst();
        let operationToPerform:String = operations.removeFirst();
        let result = calculator.calculateResult(no1: numberOne, no2: numberTwo, o: operationToPerform)
        numbers.pushFromFront(result)
    }
    
    // When the size of the list is 3 need to check which side (the reer or
    // head needs to be used for calculation) then calculate result of operation
    func compareAndCalculate(_ numbers:LinkedList, _ operations:LinkedList){
        guard let tail = operations.tail else {
            exit(1);
        }
        guard let head = operations.head else {
            exit(1);
        }
        if (tail.getValue() == "+" || tail.getValue() == "-" || isHighPriority(head.getValue())){
            let numberOne:String = numbers.removeFirst();
            let numberTwo:String = numbers.removeFirst();
            let operationToPerform:String = operations.removeFirst();
            let result:String = calculator.calculateResult(no1: numberOne, no2: numberTwo, o: operationToPerform)
            numbers.pushFromFront(result)
        }
        else{
            let numberOne:String = numbers.removeLast();
            let numberTwo:String = numbers.removeLast();
            let operationToPerform:String = operations.removeLast();
            let result:String = calculator.calculateResult(no1: numberTwo, no2: numberOne, o: operationToPerform)
            numbers.pushFromBack(result);
        }
    }
    
    // Order of working on things should be
    // Number, opererator, number operator ....
    // Deque size of numbers will never exceed 3 as we can calculate it down back to
    // 2 whenever it reaches 3. Because there will always be a higher priority operation
    // amongst the two operators.
    func parseAndCalculate(_ args:[String], _ numbers:LinkedList, _ operations:LinkedList){
        // If not expecting number then we are expecting operator
        var expectingNumber:Bool = true;
        // Perform calculations while parsing arguments
        args.forEach{ argument in
            if (expectingNumber){
                // Numbers logic
                let number:String = isValidNumber(argument);
                if (number != ""){
                    numbers.pushFromBack(number);
                }else{
                    exit(1);
                }
                expectingNumber = false;
            }else{
                //Operators logic
                if (isOperator(argument)){
                    operations.pushFromBack(argument);
                }else{
                    exit(1);
                }
                expectingNumber = true;
            }
            
            
            if (numbers.size == 3){
                compareAndCalculate(numbers, operations);
            }
            if (numbers.size == 2){
                guard let head = operations.head else{
                    exit(1);
                }
                if (isHighPriority(head.getValue())){
                    basicCalculate(numbers, operations);
                }
            }
            
        }
        // Outisde paring every character
        
        if (numbers.size == 2){
            basicCalculate(numbers, operations);
        }
        if (operations.size != 0){
            // if we havent exhausted our operations deque
            // then something went wrong and exit 1
            exit(1);
        }
            
    }
    
    
}
