//
//  HTTPManager.swift
//  aidingding
//
//  Created by mydaogj on 16/6/27.
//  Copyright © 2016年 ding. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

//typealias 类型名称重定义,类型的抽象表现
typealias CompletionHander = (data: NSData?) ->()

func getDataFromUrl(urlString: String, method: HTTPMethod, parameter: [String: AnyObject]?, completionHandler: CompletionHander) -> NSURLSessionDataTask? {
    
    //guard 类似if 但是只能单次判断  不能像if else那样多次
    guard let url = NSURL(string: urlString) else {
        return nil
    }
    
    let session = NSURLSession.sharedSession()
    let request = NSMutableURLRequest(URL: url)
    //rawValue 原始值
    request.HTTPMethod = method.rawValue;
    request.addValue("c9ef74c382d37b1c095d97f9fdae375f", forHTTPHeaderField: "apikey")
    
    switch method {
    case .POST, .PUT:
        
        if let param = parameter {
            request.HTTPBody = try?NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.init(rawValue: 0))
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
    default:
        break
    }
    
    let task = session.dataTaskWithRequest(request){data, response, error in
        //NSSession会默认开启一个后台队列，所以UI操作要调度回主队列进行。
        dispatch_async(dispatch_get_main_queue()){
            if let e = error {
                print(e)
                return
            }
            completionHandler(data: data)
        }
    }
    
    //启动
    task.resume()
    return task
}

