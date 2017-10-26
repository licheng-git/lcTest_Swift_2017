//
//  ProductDetailProtocols.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/12.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

protocol ProductDetailProtocol: class {
    
    // 网络请求成功
    func requestProdouctDetailSuccess(detailModel: ProductDetailModel?)
    
    // 提交预约申请成功
    func submitOnlineAppointmentSuccess(telNumber: String,id: Int)
    
    // 服务器错误
    func serviceFail(message: String)
    
    // 网络请求失败
    func networkFail()
    
}

