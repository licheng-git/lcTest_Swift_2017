//
//  HomeViewController.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/12.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit
import Alamofire
import Moya

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "HomeVC"
        self.view.backgroundColor = UIColor.green
        
        print("*_* alamofire begin")
        self.testNetwork_Alamofire()
        print("*_* alamofire over")
        
        print("*_* moya begin")
        self.testNetwork_Moya()
        print("*_* moya over")
        
        let btn:UIButton = UIButton(type: .custom)
        btn.frame = CGRect(x: 20, y: 80, width: 100, height: 30)
        btn.setTitle("click", for: .normal)
        btn.addTarget(self, action: #selector(self.btnClick), for: .touchUpInside)
        btn.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(btn)
    }
    
    func btnClick() {
        print("*_* clicked")
    }
    
    
    func testNetwork_Alamofire() {
        
//        let aiView = UIActivityIndicatorView(frame: CGRect(x: 50, y: 100, width: 50, height: 50))
//        aiView.color = UIColor.blue
//        self.view.addSubview(aiView)
//        aiView.startAnimating()
//        
//        let req =
//        Alamofire.request("https://httpbin.org/get").response { resp in
//            aiView.stopAnimating()
//            //print("Url *_* \(resp.request)")
//            //print("StatusCode *_* \(resp.response?.statusCode)")
//            //print("Error *_* \(resp.error)")
//            //print("ResponseHeaders[key] *_* \(resp.response?.allHeaderFields["Content-Type"])")
//            print("Response *_* \(resp.response)")
//            //print("All Response Info *_* \(resp)")
//            print("-_-")
//            
//            if let data = resp.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("data *_* \n \(utf8Text)")
//            }
//        }
//        print(req)
        
        
//        Alamofire.request("https://httpbin.org/get").responseData { resp in
//            //print("Url *_* \(resp.request)")
//            //print("StatusCode *_* \(resp.response?.statusCode)")
//            //print("Error *_* \(resp.error)")
//            //print("ResponseHeaders[key] *_* \(resp.response?.allHeaderFields["Content-Type"])")
//            print("Response *_* \(resp.response)")
//            //print("All Response Info *_* \(resp)")
//            print("-_-")
//
//            if let data = resp.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("data *_* \n \(utf8Text)")
//            }
//            
//            if let data = resp.result.value {
//                if let utf8Text = String(data: data, encoding: .utf8) {
//                    print("data1 *_* \n \(utf8Text)")
//                }
//            }
//        }
        
        
//        Alamofire.request("https://httpbin.org/get").responseJSON { resp in
//            //print("Url *_* \(resp.request)")
//            //print("StatusCode *_* \(resp.response?.statusCode)")
//            //print("Error *_* \(resp.error)")
//            //print("ResponseHeaders[key] *_* \(resp.response?.allHeaderFields["Content-Type"])")
//            print("Response *_* \(resp.response)")
//            //print("All Response Info *_* \(resp)")
//            print("-_-")
//            
//            if let data = resp.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("data *_* \n \(utf8Text)")
//            }
//            
//            if let json = resp.result.value {
//                print("json *_* \n \(json)")
//            }
//        }
        
        
//        Alamofire.request("https://httpbin.org/get").responseString { resp in
//            //print("Url *_* \(resp.request)")
//            //print("StatusCode *_* \(resp.response?.statusCode)")
//            //print("Error *_* \(resp.error)")
//            //print("ResponseHeaders[key] *_* \(resp.response?.allHeaderFields["Content-Type"])")
//            print("Response *_* \(resp.response)")
//            //print("All Response Info *_* \(resp)")
//            print("-_-")
//
//            if let data = resp.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("data *_* \n \(utf8Text)")
//            }
//
//            if let str = resp.result.value {
//                print("str *_* \n \(str)")
//            }
//        }
        
        
//        Alamofire.request("https://httpbin.org/post", method: .post).response { resp in
//            //print("Url *_* \(resp.request)")
//            //print("StatusCode *_* \(resp.response?.statusCode)")
//            //print("Error *_* \(resp.error)")
//            //print("ResponseHeaders[key] *_* \(resp.response?.allHeaderFields["Content-Type"])")
//            print("Response *_* \(resp.response)")
//            //print("All Response Info *_* \(resp)")
//            print("-_-")
//
//            if let data = resp.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("data *_* \n \(utf8Text)")
//            }
//        }
        
        
//        Alamofire.download("https://httpbin.org/image/png").downloadProgress { prog in
//                print("download progress *_* \(prog.fractionCompleted)")
//            }
//            .responseData { resp in
//                print(resp.result.value)
//                if let data = resp.result.value {
//                    let img = UIImage(data: data)
//                }
//        }
//        
//        Alamofire.upload(imgData, to: "https://httpbin.org/post").uploadProgress { prog in
//                print("upload progress *_* \(prog.fractionCompleted)")
//            }
//            .response { resp in
//                debugPrint(resp)
//        }
        
        
//        let headers: HTTPHeaders = [
//            "AhwApi-Access-Token": "fc85a7ce091aea86ef3463b9166e9b06",
//            "Version": "",
//            "Client": "",
//            "DeviceToken": ""
//        ]
//        let params:Parameters = [  // ?page=2&k=v&foo[]=a&foo[]=1&foo1[x]=1&foo1[y]=sb&foo1[z]=3
//            "page": -1,
//            "k": "v",
//            "foo": ["a", 1],  // 数组
//            "foo1": ["x":1, "y":"sb", "z":3]  // 键值对
//        ]
//        //Alamofire.request("http://119.147.82.70:7771/api/Invest/List?page=2", headers: headers).response { resp in
//        Alamofire.request("http://119.147.82.70:7771/api/Invest/List", parameters: params, headers: headers).response { resp in
//            print("Url *_* \(resp.request)")
//            print("StatusCode *_* \(resp.response?.statusCode)")
//            if let data = resp.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("data *_* \n \(utf8Text)")
//            }
//        }
        
    }
    
    
    func testNetwork_Moya() {
        
//        let provider = MoyaProvider<LcApi>()
//        //provider.request(.account_login(acc: "licheng0", pass: "e10adc3949ba59abbe56e057f20f883e")) { (result) in
//        //provider.request(.invest_detail(productId: "510CA043-D65D-4E24-A79F-E72D709E915E")) { (result) in
//        //provider.request(.invest_list(page: 2)) { (result) in
//        provider.request(.home) { (result) in
////            //print(result)  // err
////            switch result {
////            case let .success(response):
////                let utf8Text = String(data: response.data, encoding: .utf8)
////                print("utf8Text *_* \(utf8Text)")
////            case let .failure(err):
////                print("error *_* \(err)")
////            }
//            do {
//                let response = try result.dematerialize()
//                let utf8Text = String(data: response.data, encoding: .utf8)
//                print("utf8Text *_* \(utf8Text)")
//            }
//            catch {
//                //print("catch error *_* \(error)")
//            }
//        }
        
        
//        let lcEndpointClosure = { (target: LcApi) -> Endpoint<LcApi> in
//            let url = target.baseURL.appendingPathComponent(target.path).absoluteString
//            let endpoint = Endpoint<LcApi>(url: url,
//                                           sampleResponseClosure: { .networkResponse(200, target.sampleData) },
//                                           method: target.method,
//                                           task: target.task,
//                                           httpHeaderFields: target.headers)
//            return endpoint
//        }
//        
//        let lcRequestClosure = { (endpoint: Endpoint<LcApi>, done: @escaping MoyaProvider<LcApi>.RequestResultClosure) in
//            guard var request = endpoint.urlRequest else {
//                return
//            }
//            request.timeoutInterval = 10
//            done(.success(request))
//        }
//        
//        let lcPlugin0 = NetworkLoggerPlugin(verbose: true, responseDataFormatter: lc_JsonResponseDataFormater)
//        let lcPlugin1 = lc_FilterStatusCodePlugin()
//        
//        //let provider = MoyaProvider<LcApi>(endpointClosure: lcEndpointClosure, requestClosure: lcRequestClosure, plugins: [lcPlugin0, lcPlugin1])
//        
//        let provider = MoyaProvider<LcApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
//        
//        provider.request(.home) { (result) in
//            do {
//                let response = try result.dematerialize()
//                let utf8Text = String(data: response.data, encoding: .utf8)
//                print("utf8Text *_* \(utf8Text)")
//            }
//            catch {
//                //print("catch error *_* \(error)")
//            }
//        }

    }
    
}


enum LcApi {
    case home
    case invest_list(page:Int)
    case invest_detail(productId:String)
    case account_login(acc:String, pass:String)
}

extension LcApi: TargetType {
    var baseURL: URL {
        return URL(string: "http://119.147.82.70:7771/api")!
    }
    var path: String {
        switch self {
        case .home:
            return "/Home/Index"
        case .invest_list:
            return "/Invest/List"
        case .invest_detail(let productId):
            return "/Invest/Detail/\(productId)"
        case .account_login:
            return "/account/login"
        }
    }
    var method: Moya.Method {
        switch self {
        case .home, .invest_list, .invest_detail:
            return .get
        case .account_login:
            return .post
        }
    }
    var task: Task {
        switch self {
        case .home, .invest_detail:
            return .requestPlain
        case .invest_list(let page):
            return .requestParameters(parameters: ["page":page], encoding: URLEncoding.queryString)
        case .account_login(let acc, let pass):
            return .requestParameters(parameters: ["Acc":acc, "Pass":pass], encoding: JSONEncoding.default)
        }
    }
    var headers: [String: String]? {
        return ["AhwApi-Access-Token":"fc85a7ce091aea86ef3463b9166e9b06",
                "Version":"",
                "Client":"",
                "DeviceToken":""
        ]
    }
    var sampleData: Data {
            return "what is sampleData".data(using: .utf8)!
    }
}


fileprivate func lc_JsonResponseDataFormater(_ data: Data) -> Data {
    return data
}

fileprivate class lc_FilterStatusCodePlugin: PluginType {
}

