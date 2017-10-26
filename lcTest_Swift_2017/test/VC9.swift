//
//  VC9.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/20.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

class VC9: UIViewController {
    
    let btn:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        btn.frame = CGRect(x: 20, y: 80, width: 100, height: 30)
        btn.setTitle("click", for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        btn.setTitleColor(UIColor.blue, for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "gcd"
        self.view.addSubview(self.btn)
        
        print("begin")
        DispatchQueue.global().async {
            print("global() begin")
            sleep(5)
            print("global() end")
            DispatchQueue.main.async {
                print("main")
            }
        }
        print("end")
        
        print("begin 1")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            print("main.asyncAfter 3 seconds")
        }
        print("end 1")
        
    }
    
    func btnClick() {
        print("*_* clicked")
    }

}
