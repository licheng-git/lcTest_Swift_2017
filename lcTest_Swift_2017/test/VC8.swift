//
//  VC8.swift
//  lcTest_Swift
//
//  Created by licheng on 2017/9/11.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

class VC8: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Generic T"
        
        
        func swapTwoInts(_ a: inout Int, _ b: inout Int) {
            let temp = a
            a = b
            b = temp
        }
        func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
            let temp = a
            a = b
            b = temp
        }
        var a = 1.5
        var b = 2.3
        swapTwoValues(&a, &b)
        print("a=\(a), b=\(b)")
        var x = "x"
        var y = "y"
        swapTwoValues(&x, &y)
        print("x=\(x), y=\(y)")
        
        
        // 类型约束
        //func kkFunction<T:SomeClass, E:SomeProtocol>(parm0: T, parm1: E) {
        //    。。。
        //}
        func findStrInArray(array:[String], strToFind:String) -> Int? {
            for (index, str) in array.enumerated() {
                if strToFind == str {
                    return index
                }
            }
            return nil
        }
        func findIndex<S:Equatable>(array:[S], valueToFind:S) -> Int? {
            for (index, value) in array.enumerated() {
                if valueToFind == value {
                    return index
                }
            }
            return nil
        }
        
        
        /*
        struct StackInt : ContainerPortocol {
            // 原实现部分
            var arrInt = [Int]()
            mutating func push(item:Int) {
                arrInt.append(item)
            }
            mutating func pop() -> Int {
                return arrInt.removeLast()
            }
            // ContainerProtocol 协议的实现部分
            typealias itemType = Int
            mutating func append(item: Int) {
                self.push(item: item)
            }
            var count: Int {
                return arrInt.count
            }
            subscript(i:Int) -> Int {
                return arrInt[i]
            }
        }
        var sInt = StackInt()
        sInt.push(item: 6)
        sInt.append(item: 10)
        print(sInt[1])
        
        struct StackGeneric<T> : ContainerPortocol {
            var arrItem = [T]()
            mutating func push(_ item:T) {
                arrItem.append(item)
            }
            mutating func pop() -> T {
                return arrItem.removeLast()
            }
            typealias itemType = T
            mutating func append(item: T) {
                self.push(item)
            }
            var count: Int {
                return arrItem.count
            }
            subscript(i:Int) -> T {
                return arrItem[i]
            }
        }
        var sT = StackGeneric<String>()
        sT.push("abc")
        sT.append(item: "kkk")
        print(sT[1])
    
        // where子句约束
        //func allItemsMatch<T0:ContainerPortocol, T1:ContainerPortocol where T0.itemType==T1.itemType, T0.itemType:Equatable>(_ a:T0, _ b:T1) -> Bool {
        func allItemsMatch<T0:ContainerPortocol, T1:ContainerPortocol>(_ a:T0, _ b:T1) -> Bool
            where T0.itemType==T1.itemType, T0.itemType:Equatable {
            if a.count != b.count {
                return false
            }
            for i in 0..<a.count {
                if a[i] != b[i] {
                    return false
                }
            }
            return true
        }
        var sT1 = StackGeneric<String>()
        sT1.push("abc")
        sT1.append(item: "kkk")
        if allItemsMatch(sT, sT1) {
            print("all items match")
        }
        */
        
    }

}


fileprivate protocol ContainerPortocol {
    //typealias itemType  // err
    associatedtype itemType
    mutating func append(item:itemType)  // 修改self或其属性的方法需mutating修饰
    var count:Int { get }
    subscript(i:Int) -> itemType { get }  // 扩展下标
}

