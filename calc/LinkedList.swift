//
//  LinkedList.swift
//  calc
//
//  Created by Jeffery Kwan How on 18/3/2023.
//  Copyright © 2023 UTS. All rights reserved.
//

import Foundation


// LinkedList is built in a Deque data structure

class LinkedList {
    var size: Int;
    var head: Node?;
    var tail: Node?;
    
    init() {
        size = 0;
        head = nil;
        tail = nil;
    }
    
    init(_ node:Node) {
        size = 1;
        head = node;
        tail = node;
    }
    
    // Add item to the back of the list
    func pushFromBack(_ value:String) {
        let newTail:Node = Node(value);
        if(size == 0){
            self.head = newTail;
        }
        newTail.setPrev(self.tail);
        self.tail?.setNext(newTail);
        self.size += 1;
        self.tail = newTail;
    }
    
    // Remove node at the end of the list and retnring its value
    func removeLast() -> String {
        if let valueToDequeue = self.tail?.getValue() {
            self.tail = self.tail?.getPrev();
            self.tail?.setNext(nil);
            self.size -= 1;
            return valueToDequeue;
        }else{
            fatalError("Trying to deqeue nil value");
        }
        
    }
    
    // Remove node at start of the list and return value
    func removeFirst() -> String {
        if let valueToPop = self.head?.getValue() {
            self.head = self.head?.getNext();
            self.head?.setPrev(nil);
            self.size -= 1;
            return valueToPop;
        }else {
            fatalError("trying to pop nil value");
        }
        
    }
    
    // Push item to the front of the list
    func pushFromFront(_ value:String) {
        let newHead:Node = Node(value);
        if (size == 0){
            self.tail = newHead;
        }
        newHead.setNext(self.head);
        self.head?.setPrev(newHead);
        self.size += 1;
        self.head = newHead;
    }

    // Remove item fron list in place
    func removeNode(_ node:Node) {
        let next:Node? = node.getNext();
        let prev:Node? = node.getPrev();
        prev?.setNext(next);
        next?.setPrev(prev);
        if(prev == nil){
            self.head = next;
        }
        if(next == nil){
            self.tail = prev;
        }
        size -= 1;
    }
    
    // Dont need this, but since I already wrote it I'll leave this method
    func mergeWithNext(_ node:Node, _ value:String) {
        let next:Node? = node.getNext();
        let prev:Node? = node.getPrev();
        let replacementNode:Node = Node(value);
        replacementNode.setPrev(prev);
        if (prev != nil){
            prev?.setNext(replacementNode);
        }
        replacementNode.setNext(next?.getNext());
        if (next?.getNext() != nil){
            next?.getNext()?.setPrev(replacementNode);
            
        }
        if(replacementNode.getPrev() == nil){
            self.head = next;
        }
        if(replacementNode.getNext() == nil){
            self.tail = prev;
        }
        
        size -= 1;
    }
}


