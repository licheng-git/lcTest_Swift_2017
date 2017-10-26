//
//  ProductListViewController.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/12.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit
import Moya

class ProductListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ProductListVC"
        self.view.backgroundColor = UIColor.yellow
        
        let btn:UIButton = UIButton(type: .custom)
        btn.frame = CGRect(x: 20, y: 80, width: 100, height: 30)
        btn.setTitle("mvvmDemo", for: .normal)
        btn.addTarget(self, action: #selector(self.btnClick), for: .touchUpInside)
        btn.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(btn)
        
    }

    func btnClick() {
        let detailVC = ProductDetailViewController()
        detailVC.productId = 1
        //self.tabBarController?.navigationController?.pushViewController(detailVC, animated: true)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
