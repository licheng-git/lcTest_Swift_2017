//
//  ProductDetailHeaderView.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/12.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

protocol ProductDetailHeaderViewDelegate : class {
    // 续存
    func adaptationPeriod()
}

class ProductDetailHeaderView: UIView {
    
    weak var delegate: ProductDetailHeaderViewDelegate?
    
    var bgView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.blue
        //view.frame = CGRect(x: 10, y: 10, width: self.bounds.size.width-20, height: self.bounds.size.height-20)
        view.frame = CGRect(x: 10, y: 10, width: 100, height: 50)
        return view
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        self.addSubview(bgView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
