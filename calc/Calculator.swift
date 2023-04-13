//
//  Calculator.swift
//  calc
//
//  Created by Jeffery Kwok Tong Kwan Howon 18/3/23
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    func divide(no1: Int, no2: Int) -> Int {
        if (no2 == 0){
            exit(1);
        }
        return no1/no2;
    }
    func mod(no1: Int, no2: Int) -> Int {
        return no1%no2;
    }
    
    func calculateResult(no1: String, no2: String, o: String ) -> String{
        guard let no1AsInt:Int = Int(no1) else{
            exit(1);
        }
        guard let no2AsInt:Int = Int(no2) else{
            exit(1);
        }
        switch (o) {
        case "+":
            return String(self.add(no1: no1AsInt, no2: no2AsInt))
        case "-":
            return String(self.subtract(no1: no1AsInt, no2: no2AsInt))
        case "x":
            return String(self.multiply(no1: no1AsInt, no2: no2AsInt))
        case "/":
            if (no2AsInt == 0){
                exit(1);
            }
            return String(self.divide(no1: no1AsInt, no2: no2AsInt))
        case "%":
            if (no2AsInt == 0){
                exit(1);
            }
            return String(self.mod(no1: no1AsInt, no2: no2AsInt))
        default:
            exit(1);
        }
    }
    
    
}
