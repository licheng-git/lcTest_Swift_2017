//
//  ProductDetailBottomView.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/12.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

enum ProductState: Int {
    // 已下架
    case defaultState = 0
    // 进行中
    case selling = 1
    // 结束募集
    case soldOut = 2
}

//protocol ProductDetailBottomViewDelegate {
protocol ProductDetailBottomViewDelegate : class {
    // 在线咨询
    func onlineOrder()
    // 电话咨询
    func phoneOrder()
    // 在线预约
    func onlineAppointment()
}

class ProductDetailBottomView: UIView {
    
    //var delegate: ProductDetailBottomViewDelegate?
    weak var delegate: ProductDetailBottomViewDelegate?
    
    lazy var btnOnlineOrder: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("在线咨询", for: .normal)
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        btn.tag = 10
        btn.frame = CGRect(x: 10, y: 0, width: 100, height: self.bounds.height)
        return btn
    }()
    
    lazy var btnPhoneOrder: UIButton = {
        let btn = UIButton()
        btn.setTitle("电话咨询", for: .normal)
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        btn.frame = CGRect(x: 120, y: 0, width: 100, height: self.bounds.height)
        btn.tag = 11
        return btn
    }()
    
    lazy var btnOnlineAppointment: UIButton = {
        var btn = UIButton()
        btn.setTitle("在线预约", for: .normal)
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        btn.frame = CGRect(x: 230, y: 0, width: 100, height: self.bounds.height)
        btn.tag = 12
        return btn
    }()
    
    lazy var btnUnable: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = UIColor.lightGray
        btn.frame = self.bounds
        return btn
    }()
    
    var productState: ProductState? {
        didSet {
            if self.productState == .soldOut {
                self.addSubview(self.btnUnable)
                self.btnUnable.setTitle("结束募集", for: .normal)
            }
            else if productState == .defaultState {
                self.addSubview(self.btnUnable)
                self.btnUnable.setTitle("已下架", for: .normal)
            }
            else {
                self.addSubview(self.btnOnlineOrder)
                self.addSubview(self.btnPhoneOrder)
                self.addSubview(self.btnOnlineAppointment)
            }
        }
    }
    
    func btnAction(_ sender:UIButton) {
        //if self.delegate == nil {
        //    return
        //}
        guard self.delegate != nil else {
            return
        }
        if sender.tag == 10 {
            self.delegate?.onlineOrder()
        }
        else if sender.tag == 11 {
            self.delegate?.phoneOrder()
        }
        else if sender.tag == 12 {
            self.delegate?.onlineAppointment()
        }
    }

}
