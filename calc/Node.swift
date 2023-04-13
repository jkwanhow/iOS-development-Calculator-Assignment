//
//  Node.swift
//  calc
//
//  Created by Jeffery Kwan How on 18/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation

// A Node can either hold a String

class Node {
    private var value:String;
    private var next:Node?;
    private var prev:Node?;
    
    init (_ value: String) {
        self.value = value;
        self.next = nil;
        self.prev = nil;
    }
    
    func setNext(_ node:Node?) {
        next = node;
    }
    func getNext() -> Node? {
        if (next != nil){
            return next;
        }
        return nil;
    }
    
    func setPrev(_ node:Node?) {
        prev = node;
    }
    func getPrev() -> Node? {
        if (prev != nil){
            return prev;
        }
        return nil;
    }
    
    func getValue() -> String {
        return self.value;
    }
    
    func getAsInt() -> Int {
        if let asInt:Int = Int(self.value) {
            return asInt;
        }else{
            fatalError("Value cannot be converted into an Int")
        }
    }
    
}

