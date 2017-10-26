//
//  VC1.swift
//  lcTest_Swift
//
//  Created by licheng on 2017/9/5.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit


class VC1: UIViewController {
    
    
    // MARK: 属性
    internal var pStr: String = "pStr";
    public   var pInt: Int = 100
    private  var pInt1: Int?
    private  var pInt2: Int!  // ?和!表示可空nil（？表示为判断解析，！表示为强制解析）
    open var pStr_open = "pStr_open";
    fileprivate var pStr_fileprivate = "pStr_fileprivate"
    
    
    // MARK: 方法访问限制  public private internal  open fileprivate
    // open > public > interal > fileparivate > private
    // open无任何限制，public作用域为module（在module外不可被override和继承）
    // interal默认访问级别，可写可不写，作用域为project\framework
    // private作用域为类，fileprivate作用域为文件
    
    public func swift_method_public(param0: String, param1: NSString) -> String {  // public class ...
        print("swift_method_public(param0: \(param0), param1: \(param1))")
        return "swift_method_public return"
    }
    
    public func swift3_method_public(_ param0:String, param1: NSString) -> String {
        print("swift3_method_public(\(param0), param1: \(param1))")
        return "swift3_method_public return"
    }
    
    public func swift3_method_public(_ param0:String, _ param1: NSString) -> String {
        print("swift3_method_public(\(param0), \(param1))")
        return "swift3_method_public return"
    }
    
    private func swift_method_private() -> Void {
        print("swift_method_private")
    }
    
    internal func swift_method_internal() {
        print("swift_method_internal")
    }
    
    open func swift3_method_open() {
        print("swift3_method_open");
    }
    
    fileprivate func swift3_method_fileprivate() {
        print("swift3_method_fileprivate");
    }
    
    
    // MARK: lifecycle
    
    override func loadView() {
        super.loadView();
        self.title = "print";
        self.swift_method_public(param0: "s0", param1: "s1");
        self.swift3_method_public("s00", param1: "s11");
        self.swift3_method_public("s000", "s111");
        
        
        // var定义变量，let定义常量
        var str_var = "var";
        str_var = "variables";
        let str_let = "let";
        //str_let = "constants";  // err
        
        print("字符串长度 \(str_var.characters.count)");
        
        var strA = "A";
        strA += " sb";
        var strB = String("B");
        //strB += " sb";  // err
        
        var strA1 = "";  // strA1.isEmpty==ture
        //var strA1 = " ";  // strA1.isEmpty==false
        if (strA1.isEmpty) {
            print("strA1 is empty");
        }
        var strA11 : String?;
        //strA11 = "";
        //if (strA11 == nil) {
        //    print("strA11 is nil");
        //}
        print("strA11 is \(strA11 ?? "nil")");
        let strB1 = String();  // .isEmpty==true
        if strB1.isEmpty {
            print("strB1 is empty");
        }
        let strB11 = String("");  // (?.isEmpty)!==true
        if (strB11?.isEmpty)! {
            print("strB11 is empty");
        }
        
        if strA1 == strB1 || strA1 == strB11 {  // ""==String()==String("")
            print("\"\"==String()==String(\"\")");
        }
        
        let int0 = Int("23");  // string->int
        let str0 = String(int0! + 1);  // int->string
        let int1:Int? = Int("sb");  // nil
        //if (int1 == nil) {
        //    print("int1 is nil");
        //}
        //let intK = int1 ?? -1;
        //let K = int1 ?? "nil";  // err
        print("int1 is \(int1 ?? -1)");
        
        //var str1:String? = nil
        var str1:String? = "str1"
        if let myStr = str1 {
            print("myStr = \(myStr)")
        }
        else {
            print("myStr、str1 == nil")
        }
        
        let char0: Character = "C";
        //let char1: Character = "";  // err
        //let char2: Character = "AB";  // err
        for c in str_var.characters {
            print(c);
        }
        str_var.append(char0);
        
        self.pInt += 1;  // swift中 ++\-- 这种写法弃用了
        
        for i in 2...5 {  // 闭区间运算符 2、3、4、5
            print("\(i) \t");
        }
        for i in 2..<5 {  // 半开区间运算符 2、3、4
            print("\(i) \t");
        }
        for _ in 2...2 {
            print("*_*")
        }
        // for (var i=0; i<10; i++)  // 这种写法弃用了
        
        var arrInt = [Int]();  // 空数组  .isEmpty==true
        var arrInt1 = [Int](repeating: 10, count: 3);  // [10, 10, 10]
        var arrInt2 = [10, 20];
        arrInt2.append(30);
        arrInt2 += [40];
        arrInt2[0] = 15;
        print("arrInt2 = \(arrInt2), arrInt2.count = \(arrInt2.count)");
        for i in arrInt2 {
            print(i);
        }
        for (indexKK, itemKK) in arrInt2.enumerated() {
            print("arrInt2[\(indexKK)] = \(itemKK)")
        }
        var arrInt3 = arrInt1 + arrInt2;  // 合并数组
        
        var arrObj = [("咖"), (1), (6.7)] as Any
        print("arrObj : \(arrObj)")
        
        var dict = [Int:String]();  // 空字典，.isEmpty==true  key为int，value为string
        var dict1 = [1:"a", 23:"sb", 8:"", -1:"remove-1", -2:"remove-2", -3:"remove-3"];
        dict1.removeValue(forKey: -1);
        dict1[-2] = nil;
        //dict1.remove(at: dict1.index(forKey: -3)!);
        dict1.updateValue("sb++", forKey: 23);
        dict1[23] = "sb--";
        print("dict1 = \(dict1), dict1.count = \(dict1.count)")
        for (k, v) in dict1 {
            print("dict1[\(k)] = \(v)");
        }
        print("dict1[\(0)] = \(dict1[0])");
        for (i, kv) in dict1.enumerated() {
            print("dict1_indexAt\(i) = \(kv)");
        }
        let arrKeys = dict1.keys;
        let arrValues = [String](dict1.values);
        
        var dict2 = NSMutableDictionary()
        dict2.setObject(23, forKey: "aa" as NSCopying)
        dict2.setObject("哈", forKey: "bb" as NSCopying)
        dict2.setObject(123, forKey: "aa" as NSCopying)
        print("dict2 = \(dict2), dict2.count = \(dict2.count)")
        for (k, v) in dict2 {
            print("dict2[\(k)] = \(v)");
        }
        print("dict2[\(0)] = \(dict2[0])");
        for (i, kv) in dict2.enumerated() {
            print("dict2_indexAt\(i) = \(kv)");
        }
        
        typealias myTypeName = Int;
        var kk:myTypeName = 123;
        
        self.testDefaultParam()
        self.testDefaultParam(param1:"param1")
        self.testDefaultParam(param:"param0", param1:"param1", param2:3)
        
        let yz = testTuple(arr: [1, 39, -4, 8]);
        print("yz.min=\(yz.min), yz.max=\(yz.max)");
        
        testParams(params: 0, 4, 6, 29);
        testParams(params: 0.3, 5.3, 3.3);
        testParams(params: "kk", "zz");
        //testParams(params: 0, 2.5, "zz");  // err
        
        var x = "x";
        var y = "y";
        testInout(&x, &y)
        print("x=\(x), y=\(y)");
        
        // 函数嵌套
        func testFuncInFunc(_ s0:String, _ s1:String) -> String {
            print("func_viewDidLoad中嵌套此函数 \(x)");
            x += "k";
            return s0 + s1;
        }
        var str_FuncInFunc = testFuncInFunc("s0", "s1");
        print("str_FuncInFunc = \(str_FuncInFunc),  x=\(x)");
        // 函数类型  可作为参数类型、返回类型一样
        //var funcType: (String, String)->String = testFuncInFunc(_:_:);
        var funcType: (String, String)->String = testFuncInFunc;
        var str_FuncType = "kk" + funcType(" +s0", " +s1");
        print("str_FuncType = \(str_FuncType)");
        //var funcType: (String, String)->String = self.swift3_method_public;  // err ?
        
        print("属性观察器 \(self.pStr2)")
        print("属性观察器 \(self.pStr2)")
        self.pStr2 = "pStr2_new"
        self.pStr2 = "pStr2_new1"
        
//        var strExtension = "kk"
//        print(".p_ext_remark = \(strExtension.p_ext_remark)")
//        strExtension.p_ext_remark = 123
//        print(".p_ext_remark = \(strExtension.p_ext_remark)")
    }
    
    // 函数参数默认值
    func testDefaultParam(param:String="zz", param1:String="kk", param2:Int=(-1)) {
        print("testDefaultParam(\(param), \(param1), \(param2))")
    }
    
    // 返回元组类型 tuple
    func testTuple(arr: [Int]) -> (min: Int, max: Int) {
        var minK = arr[0];
        var maxK = arr[0];
        for i in arr[1..<arr.count] {
            if (i < minK) {
                minK = i;
            }
            else if (i > maxK) {
                maxK = i;
            }
        }
        return (minK, maxK);
    }
    
    // 可变参数 ...
    func testParams<N>(params: N...) {
        print(params.count)
        for value in params {
            print(value)
        }
    }
    
    // 变量参数 inout
    func testInout(_ a: inout String, _ b: inout String) {
        let temp = a;
        a = b;
        b = temp;
    }
    
    
    var pView = UIView()
    var pView1:UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.green
        return v
    } ()
    var pView2:UIView {
        let v = UIView()
        v.backgroundColor = UIColor.green
        return v
    }
    
    // lazy 属性延迟加载
    lazy var pLazy:UIView = UIView()
    lazy var pLazy1:UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.orange
        return v
    }()
    
    // getter setter
    private var pStr1_private = "默认值";
    var pStr1 : String {
        get {
            return self.pStr1_private
        }
        //set(newValue) {
        set {
            self.pStr1_private = newValue
        }
    }
    // 只读属性 getter
    var pStr1_readonly : String {
        get {
            return self.pStr1_private + "_readonly"
        }
    }
    var pStr1_readonly1 : String {
        return "pStr1_readonly1"
    }
    
    // 属性观察器  监控和响应属性值的变化
    var pStr2 : String = "pStr2" {
        willSet(newStr) {
            print("pStr2.willSet oldV=\(pStr2) newV=\(newStr)")
        }
        didSet {
            print("pStr2.didSet oldValue=\(oldValue) newV=\(self.pStr2)")
        }
    }
    
    // 静态属性  类属性，而非实例属性
    static var pInt_static : Int = 12
    
    // 类方法
    static func testFuncStatic() {
        print("VC1.类方法_static")
    }
    class func testFuncClass() {
        print("VC1.类方法_class")
    }
    
    // swift单例
    class KKManager {
        static let sharedInstance = KKManager()
        private init() {}
    }
    
    // final 修饰方法表示防止覆盖，即其继承子类不能override；修饰类表示防止继承
    // override重写：子类重新实现父类的方法，方法名称、参数、类型、顺序、返回值都一样
    // overload重载：一个类中多个名称相同的方法，方法名一样，参数类型或参数个数或返回值不一样
}

