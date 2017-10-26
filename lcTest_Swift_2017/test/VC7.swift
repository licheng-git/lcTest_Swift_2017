//
//  VC7.swift
//  lcTest_Swift
//
//  Created by licheng on 2017/9/11.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

class VC7: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "protocol"
        
        let person = PersonClass(param: "sb")
        print("height = \(person.height), weight = \(person.weight)")
        person.height = 183
        person.weight = 130  // ok
        print("height = \(person.height), weight = \(person.weight)")
        //(person as PersonProtocol).weight = 140  // err
        person.readName()
        person.readAge(age: 28)
    }

}


fileprivate protocol PersonProtocol {
    var height: Int { get set }
    var weight: Int { get }  // 只读
    func readName()
    func readAge(age:Int)
    init(param: String)
}

@objc
fileprivate protocol EngineerProtocol {
    func readProfessional()
    @objc optional func readHobby()
}

fileprivate class CreatureClass {
}
fileprivate class PersonClass : CreatureClass, PersonProtocol, EngineerProtocol {
    var height = 178
    var weight = 120
    func readName() {
        print("name")
    }
    func readAge(age: Int) {
        print("age \(age)")
    }
    required init(param: String) {
        print("required init(\(param))")
    }
    func readProfessional() {
        print("professional is engineer")
    }
}

