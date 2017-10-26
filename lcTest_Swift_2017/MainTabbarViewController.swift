//
//  MainTabbarViewController.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/12.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

class MainTabbarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbarItem0 = UITabBarItem(title: "首页", image: UIImage(named: "index_icon_home_off")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "index_icon_home_on")?.withRenderingMode(.alwaysOriginal))
        tabbarItem0.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -4)
        let tabbarItem1 = UITabBarItem(title: "产品", image: UIImage(named: "index_icon_invest_off")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "index_icon_invest_on")?.withRenderingMode(.alwaysOriginal))
        tabbarItem1.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -4)
        let tabbarItem2 = UITabBarItem(title: "我的", image: UIImage(named: "index_icon_my_off"), selectedImage: UIImage(named: "index_icon_my_on"))
        
        let homeVC = HomeViewController()
        let productVC = ProductListViewController()
        let mineVC = MineViewController()
        let homeNavC = UINavigationController(rootViewController: homeVC)
        let productNavC = UINavigationController(rootViewController: productVC)
        let mineNavC = UINavigationController(rootViewController: mineVC)
        
        homeNavC.tabBarItem = tabbarItem0
        productNavC.tabBarItem = tabbarItem1
        mineNavC.tabBarItem = tabbarItem2
        //self.viewControllers = [homeNavC, productNavC, mineNavC]
        let tabbarItem3 = UITabBarItem(title: "测试", image: nil, tag: 0)
        let testVC = ViewController()
        let testNavC = UINavigationController(rootViewController: testVC)
        testNavC.tabBarItem = tabbarItem3
        self.viewControllers = [homeNavC, productNavC, mineNavC, testNavC]
        
        self.delegate = self
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if tabBarController.selectedIndex == 2 {
            print("登陆状态检测")
        }
    }

}
