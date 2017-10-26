//
//  CommonApi.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/15.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit
import Alamofire
import Moya
import Result


// MARK: MoyaProvider
let TDApi = MoyaProvider<MultiTarget>(endpointClosure: TDEndpointClosure, requestClosure: TDRequestClosure, plugins: [TDPlugin0, TDPlugin1])

private let TDEndpointClosure = { (target: MultiTarget) -> Endpoint<MultiTarget> in
    let url = target.baseURL.appendingPathComponent(target.path).absoluteString
    let endpoint = Endpoint<MultiTarget>(url: url,
                                         sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                                         method: target.method,
                                         task: target.task,
                                         httpHeaderFields: target.headers)
    return endpoint
}

private let TDRequestClosure = { (endpoint: Endpoint<MultiTarget>, done: @escaping MoyaProvider<MultiTarget>.RequestResultClosure) in
    guard var request = endpoint.urlRequest else {
        return
    }
    request.timeoutInterval = 10
    done(.success(request))
}

private let TDPlugin0 = NetworkLoggerPlugin(verbose: true, responseDataFormatter: TDJsonResponseDataFormater)
private let TDPlugin1 = TDFilterStatusCodePlugin()

private func TDJsonResponseDataFormater(_ data: Data) -> Data {
//    do {
//        let dataAsJson =
//    }
//    catch {
//        return data
//    }
    return data
}

private class TDFilterStatusCodePlugin: PluginType {
}


// MARK: TDTargetType
protocol TDTargetType : TargetType {
    var params: [String: Any]? { get }
    var isNeedEncryptParams: Bool { get }
}

extension TDTargetType {
    var baseURL: URL {
        //return URL(string: "http://10.100.11.196:9102/peService/")!
        return URL(string: "https://api.paisheng.com/peService/")!
    }
    var method: Moya.Method {
        return .post
    }
    var task: Task {
        if self.isNeedEncryptParams {
            return .requestParameters(parameters: encryptParams(self.params), encoding: JSONEncoding.default)
        }
        return (self.params == nil ? .requestPlain : .requestParameters(parameters: self.params!, encoding: JSONEncoding.default))
    }
    var headers: [String: String]? {
        return ["User-Agent": "iOS"]
    }
    var sampleData: Data {
        return "*_* what to use of samplerData ?".data(using: .utf8)!
    }
    var isNeedEncryptParams: Bool {
        return true
    }
}

private func encryptParams(_ originalParams: [String: Any]?) -> [String: Any] {
    var encryptedParams: [String: Any]
    if originalParams != nil {
        encryptedParams = originalParams!
    }
    else {
        encryptedParams = ["":""]
    }
    return encryptedParams
//    return ["key": "RSA.encrypt(*_*tdStr, publicKey)",  // RSA公钥加密
//            "data": "DES.encrypt(paramsAsJsonStr, *_*tdStr)",  // DES对参数json字符串加密
//            "sign": "RSA.encrypt(strKey + & + strData, privateKey).base64Str"]  // RSA私钥加密组合字符串
}


extension Moya.Response {
    // 解密返回结果
    //func td_mapJson() -> JSON {
    //    let responseAsJsonStr = JSON(self.data)["data"]
    //    return DES.dencrypt(responseAsJsonStr, *_*tdStr)  // DES对返回json字符串解密
    func td_mapJson() -> Data {
        return self.data
    }
}



