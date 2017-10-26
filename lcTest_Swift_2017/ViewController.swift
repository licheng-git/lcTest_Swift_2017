//
//  ViewController.swift
//  lcTest_Swift
//
//  Created by licheng on 2017/9/5.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        self.view.backgroundColor = UIColor.orange;
//
//        let btn:UIButton = UIButton(type: .custom);
//        btn.frame = CGRect(x: 20, y: 80, width: 100, height: 30);
//        btn.setTitle("按钮", for: .normal);
//        //btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside);
//        ////btn.addTarget(self, action: "btnClick", for: .touchUpInside);
//        //btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside);
//        btn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside);
//        self.view.addSubview(btn);
//    }
//
//
//    //func btnClick() {
//    //    print(" #selector(method) || \"method\" ");
//    //}
//
//    //func btnClick(_ sender:UIButton) {
//    //}
//
//    func btnClick(sender:UIButton) {
//        let vc = VC1.init();
//        self.navigationController?.pushViewController(vc, animated: true);
//    }
    
    
    override func viewDidLoad() {
        self.title = "swift"
        let btn0 = self.createButton(CGRect(x: 20, y: 80, width: 120, height: 30), title: "测试", tag: 10);
        self.view.addSubview(btn0);
        let btn1 = self.createButton(CGRect(x: 20, y: 110, width: 120, height: 30), title: "生命周期", tag: 11);
        self.view.addSubview(btn1);
        let btn2 = self.createButton(CGRect(x: 20, y: 140, width: 120, height: 30), title: "闭包", tag: 12);
        self.view.addSubview(btn2);
        let btn3 = self.createButton(CGRect(x: 20, y: 170, width: 120, height: 30), title: "枚举+结构体", tag: 13);
        self.view.addSubview(btn3);
        let btn4 = self.createButton(CGRect(x: 20, y: 200, width: 120, height: 30), title: "循环引用", tag: 14);
        self.view.addSubview(btn4);
        let btn5 = self.createButton(CGRect(x: 20, y: 230, width: 120, height: 30), title: "扩展", tag: 15);
        self.view.addSubview(btn5);
        let btn6 = self.createButton(CGRect(x: 20, y: 260, width: 120, height: 30), title: "协议", tag: 16);
        self.view.addSubview(btn6);
        let btn7 = self.createButton(CGRect(x: 20, y: 290, width: 120, height: 30), title: "范型", tag: 17);
        self.view.addSubview(btn7);
        let btn8 = self.createButton(CGRect(x: 20, y: 320, width: 120, height: 30), title: "多线程", tag: 18);
        self.view.addSubview(btn8);
    }
    
    func createButton(_ frame :CGRect, title :String?, tag :Int) -> UIButton {
        let btn:UIButton = UIButton.init(type: .custom);
        btn.frame = frame;
        btn.setTitle(title, for: UIControlState.normal);
        btn.addTarget(self, action: #selector(btnClick(_:)), for: UIControlEvents.touchUpInside);
        btn.setTitleColor(UIColor.orange, for: .normal);
        btn.tag = tag;
        return btn;
    }
    
    func btnClick(_ sender:UIButton) {
        var vc : UIViewController? = nil
        if (sender.tag == 10) {
            vc = VC1();
            VC1.pInt_static += 100
        }
        else if (sender.tag == 11) {
            //vc = VC2()  // ==VC2.init()
            vc = VC2(param: 1)  // ==VC2.init(param: 1)
        }
        else if (sender.tag == 12) {
            vc = VC3()
        }
        else if (sender.tag == 13) {
            vc = VC4()
        }
        else if (sender.tag == 14) {
            vc = VC5()
        }
        else if (sender.tag == 15) {
            vc = VC6()
        }
        else if (sender.tag == 16) {
            vc = VC7()
        }
        else if (sender.tag == 17) {
            vc = VC8()
        }
        else if (sender.tag == 18) {
            vc = VC9()
        }
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

