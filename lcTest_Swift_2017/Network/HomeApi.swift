//
//  HomeApi.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/15.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit
import Moya


enum HomeApi {
    case banner
    case info
}


extension HomeApi : TDTargetType {
    var path: String {
        switch self {
        case .banner:
            return "ad/home/banner"
        case .info:
            return "info/home"
        }
    }
    var params: [String: Any]? {
        return nil
    }
}



