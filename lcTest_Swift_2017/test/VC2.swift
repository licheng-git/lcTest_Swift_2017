//
//  VC2.swift
//  lcTest_Swift
//
//  Created by licheng on 2017/9/6.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

class VC2: UIViewController {
    
    
    // MARK: lifecycle
    
//    init() {
//        super.init(nibName: nil, bundle: nil);
//        print("init");
//    }
//
//    init(param: Int) {
//        super.init(nibName: nil, bundle: nil);
//        print("initWithParam(\(param))");
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    convenience init(param: Int) {
        self.init()
        print("initWithParam(\(param))");
    }
    
    
    override func loadView() {
        super.loadView();
        print("loadView");
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "lifecycle";
        print("viewDidLoad");
        self.test()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        print("viewWillAppear");
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        print("viewWillLayoutSubviews");
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        print("viewDidLayoutSubviews");
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        print("viewDidAppear");
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        print("viewWillDisappear");
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        print("viewDidDisappear");
    }
    
    deinit {
        print("deinit");
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func test() {
        print("*_*")
        var obj = LcClass()
        print("*_*")
        var obj1 = LcClass.init()
        print("*_*")
        var obj2 = LcClass.init("param")
        print("*_*")
        
        print("*_-")
        var objK = LcClassK()
        print("*_-")
        var obj1K = LcClassK.init()
        print("*_-")
        var obj2K = LcClassK.init("param")
        print("*_-")
        
        print("-_-")
        var objK_sub = LcClassK_Sub()
        print("-_-")
        objK_sub = LcClassK_Sub.init()
        print("-_-")
        objK_sub = LcClassK_Sub.init("param")
        print("-_-")
    }
    
}


private class LcClass : NSObject {  // 继承NSObject，init需override
    var pStr : String = "Class.pStr";
    override init() {
        print("Class() && Class.init()")
    }
    init(_ param:String) {
        print("Class.init(\(param))")
    }
    deinit {
        print("Class.deinit")
    }
}

private class LcClassK {
    var pStr : String = "ClassK.pStr";
    init() {
        print("ClassK() && ClassK.init()")
    }
    init(_ param:String) {
        print("ClassK.init(\(param))")
    }
    deinit {
        print("ClassK.deinit")
    }
}

fileprivate class LcClassK_Sub : LcClassK {
    override convenience init(_ param:String) {
        self.init()
        print("ClassK_Sub.override_convenience_init(\(param))")
    }
    deinit {
        print("ClassK_Sub.deinit")
    }
}

