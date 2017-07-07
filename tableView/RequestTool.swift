//
//  RequestTool.swift
//  tableView
//
//  Created by 范云飞 on 2017/7/6.
//  Copyright © 2017年 范云飞. All rights reserved.
//

import UIKit
import Alamofire

enum RequestType {
    case get
    case post
}

class RequestTool: NSObject {
    //可根据需要传参数
    class func requestData(_ type : RequestType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error ?? -1)
                return
            }
            finishedCallback(result)
        }
    }
}
