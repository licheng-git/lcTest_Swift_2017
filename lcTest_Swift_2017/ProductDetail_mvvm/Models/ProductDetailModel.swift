//
//  ProductDetailModel.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/12.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

// 管理团队
struct ManageTeamModel {
    // 简介
    var intro: String?
    // 姓名
    var name: String?
    // 图片
    var picUrl: String?
    //init(json: JSON) {
    //}
}

class ProductDetailModel: NSObject {
    // 产品编号
    var id: String?
    // 基金标题
    var title: String?
    // 状态
    var status: ProductState?
    // 管理团队
    var manageTeamList: Array<ManageTeamModel>?
    //init(json: JSON) {
    //}
}
