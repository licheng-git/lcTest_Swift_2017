//
//  ProductApi.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/15.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit
import Moya


enum ProductApi {
    case home
    case list(pageIndex: Int, pageSize: Int, token: String)
    case detail(productId: Int, token: String)
    case booking(productId: String, telno: String, username: String, token: String)
    case lc_list(key: String, data: String, sign: String)
    case lc_detail(key: String, data: String, sign: String)
}


extension ProductApi : TDTargetType {
    var path: String {
        switch self {
        case .home:
            return "product/home"
        case .list(_):
            return "product/list"
        case .detail(_):
            return "product/detail"
        case .booking(_):
            return "product/booking"
        case .lc_list:
            return "product/list"
        case .lc_detail(_):
            return "product/detail"
        }
    }
    var params: [String: Any]? {
        switch self {
        case .home:
            return nil
        case .list(let pageIndex, let pageSize, let token):
            return ["pageIndex": pageIndex, "pageSize": pageSize, "token": token]
        case .detail(let productId, let token):
            return ["productId": productId, "token": token]
        case .booking(let productId, let telno, let username, let token):
            return ["productId": productId, "telno": telno, "username": username, "token": token]
        case .lc_list(let key, let data, let sign), .lc_detail(let key, let data, let sign):
            return ["key":key, "data":data, "sign":sign]
        }
    }
}



