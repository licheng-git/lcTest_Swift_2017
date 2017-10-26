//
//  VC4.swift
//  lcTest_Swift
//
//  Created by licheng on 2017/9/8.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

class VC4: UIViewController {

    // MARK: 枚举
    enum DaysOfWeek {
        case Sunday
        case Monday
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        case Saturday
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "enum + Struct"
        
        
        var d = DaysOfWeek.Sunday
        d = .Monday
        //var d:DaysOfWeek = .Monday
        print(d)
        
        enum Student {
            case Name(String)
            case Score(Int, Int, Int)
        }
        var s = Student.Name("Inverson")
        //var s = Student.Score(98, 11, 23)
        switch s {
        case .Name(let strName):
            print("名字 \(strName)")
        case .Score(let i0, let i1, let i2):
            print("分数 \(i0), \(i1), \(i2)")
        default:
            print("default")
        }
        
        // 初始值
        enum Month: Int {
            case January = 101
            case Febrary
            case March
            case April
            case May
            case June
            case July
            case August
            case September
            case October
            case November
            case December
        }
        enum Month1 : Int {
            case January = 101, Febrary, March, April, May, June, July, August, September, October, November, December
        }
        print(Month.September)  // September
        print(Month.September.rawValue - 100)  // 9  enum->int
        let m:Month = Month(rawValue: 102) ?? .January  // int->enum
        print(m)
        
        enum Month2 : String {
            case January    = "strJanuary"
            case Febrary    = "strFebrary"
            case March      = "strMarch"
            case April      = "strApril"
            case May        = "strMay"
            case June       = "strJune"
            case July       = "strJuly"
            case August     = "strAugust"
            case September  = "strSeptember"
            case October    = "strOctober"
            case November   = "strNovember"
            case December   = "strDecember"
        }
        print("Month2.September = \( Month2.September)")  // September
        print("Month2.September.rawValue = \(Month2.September.rawValue)")  // strSeptember  enum->string
        let m2:Month2 = Month2(rawValue: "strSeptember") ?? .January  // string->enum
        print(m2)
        
        
        // Mark:结构体
        struct StructStudent {
            var Name : String
            var MathScore : Int
            var LiteratureScore : Int
        }
        var stu = StructStudent(Name: "iverson", MathScore: 99, LiteratureScore: 10)
        stu.Name = "Iverson"
        
        struct StructStudent1 {
            var Name = "iverson1"
            var MathScore = 98
            var LiteratrueScore = 15
        }
        var stu1 = StructStudent1()
        stu1.Name = "Iverson1"
        
        struct StructStudent2 {
            var Name : String
            var MathScore : Int
            var LiteratureScore : Int
            init(name:String, math:Int, literature:Int) {
                Name = name
                self.MathScore = math
                self.LiteratureScore = literature
            }
        }
        var stu2 = StructStudent2(name:"iverson2", math:97, literature:13)
        let stu2_1 = stu2  // 互不影响
        stu2.Name = "Iverson2"
        print("str2_1.Name = \(stu2_1.Name), str2.Name = \(stu2.Name)")
    }

}
