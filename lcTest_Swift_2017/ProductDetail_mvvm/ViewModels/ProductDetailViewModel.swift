//
//  ProductDetailViewModel.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/12.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit
import Moya

class ProductDetailViewModel {
    
    var model: ProductDetailModel?
    weak var delegate: ProductDetailProtocol?
    
    // 网络请求，获取产品详情
    func getProductDetailData(producntId: Int) {
        
//        let token = "";  // 登陆前token
//        TDApi.request(MultiTarget(ProductApi.detail(productId: producntId, token: token))) { (result) in
//            do {
//                let response = try result.dematerialize()
//                let utf8Text = String(data: response.data, encoding: .utf8)
//                print("utf8Text *_* \(utf8Text)")
//                self.delegate?.requestProdouctDetailSuccess(detailModel: self.model)
//            }
//            catch {
//                //print("catch error *_* \(error)")
//                self.delegate?.networkFail()
//            }
//        }
        
        
//        let strKey = "BmUi99LwWrGxuwWRjyYnBKzhopxRjZUbwK0l6H0SKama/kRRBtT2LYlaZ4TvmSXtWQKS3FsPeGy5lOrxFWw/EA==";
//        let strData = "KQtkp81p9L2mLdanh+TvVWQKm/ommgnvGONTwYc9sOwNy3BXwgbqaTsOc/8kprDXs/iC2fK++UlzX3lNfEAeIA==";
//        let strSign = "uc5atYqzBp9FRkX8GCwcmazEQnTjQrl0mh5zdUpZ7eiONypUYpLWatA1rrf1YK8XDTTi5IZuGwd8Of9icTP60A==";
//        TDApi.request(MultiTarget(ProductApi.lc_list(key: strKey, data: strData, sign: strSign))) { (result) in
//            do {
//                let response = try result.dematerialize()
//                let d = response.td_mapJson()  // 解密
//                print("response data *_* \(String(data: d, encoding: .utf8))")
//                //self.delegate?.requestProdouctDetailSuccess(detailModel: self.model)
//            }
//            catch {
//                //self.delegate?.networkFail()
//            }
//        }
        
        let strKey = "BmUi99LwWrGxuwWRjyYnBKzhopxRjZUbwK0l6H0SKama/kRRBtT2LYlaZ4TvmSXtWQKS3FsPeGy5lOrxFWw/EA==";
        let strData = "/S/dN5VrbZYcTjCFgDJC4Utr9OlHyu7p1BdD+1/OowQ+Ug4KMAjEGQ==";
        let strSign = "jUZ6uRNkJqzFQ01w0J1+Fu4tR0iTe9KIrgSDQUfgzZc45l9OmQ3a6hibQq43j5RuLogXsoBBSCpgxpHOi79e/Q==";
        //TDApi.request(MultiTarget(ProductApi.lc_detail(key: strKey, data: strData, sign: strSign))) { (result) in
        let api_ProductDetail = ProductApi.lc_detail(key: strKey, data: strData, sign: strSign)
        let target = MultiTarget(api_ProductDetail)
        TDApi.request(target) { (result) in
            do {
                let response = try result.dematerialize()
                let d = response.td_mapJson()
                print("response data *_* \(String(data: d, encoding: .utf8))")
                //self.delegate?.requestProdouctDetailSuccess(detailModel: self.model)
            }
            catch {
                //self.delegate?.networkFail()
            }
        }
        
    }
    
}








