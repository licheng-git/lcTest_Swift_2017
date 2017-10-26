//
//  ProductDetailViewController.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/12.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController, ProductDetailBottomViewDelegate, ProductDetailProtocol {

    
    var productId: Int?
    
    var vm = ProductDetailViewModel()
    
    lazy var bottomView: ProductDetailBottomView = {  // *_* lazy
        let view = ProductDetailBottomView()
        view.delegate = self
        return view
    } ()
    
    var headerView: ProductDetailHeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ProductDetailVC"
        
        self.bottomView.frame = CGRect(x: 10, y: 500, width: UIScreen.main.bounds.size.width-20, height: 50)
        self.bottomView.productState = .selling
        self.bottomView.backgroundColor = UIColor.brown
        self.view.addSubview(self.bottomView)
        
        self.headerView = ProductDetailHeaderView()
        self.headerView?.delegate = self
        self.headerView?.frame = CGRect(x: 10, y: 100, width: UIScreen.main.bounds.size.width-20, height: 80)
        self.view.addSubview(self.headerView!)
        
        self.vm.delegate = self
        self.vm.getProductDetailData(producntId: self.productId ?? 0)
    }
    
    
    // MARK: ProductDetailBottomViewDelegate
    func onlineOrder() {
    }
    func phoneOrder() {
    }
    func onlineAppointment() {
    }
    
    // MARK: ProductDetailProtocol
    func requestProdouctDetailSuccess(detailModel: ProductDetailModel?) {
    }
    func submitOnlineAppointmentSuccess(telNumber: String,id: Int) {
    }
    func serviceFail(message: String) {
    }
    func networkFail() {
    }
    
}

// MARK: ProductDetailHeaderViewProtocol
extension ProductDetailViewController: ProductDetailHeaderViewDelegate {
    func adaptationPeriod() {
    }
}

