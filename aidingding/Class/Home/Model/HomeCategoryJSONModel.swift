//
//  HomeCategoryJSONModel.swift
//  aidingding
//
//  Created by mydaogj on 16/6/28.
//  Copyright © 2016年 ding. All rights reserved.
//

import Foundation

class HomeCategoryJSONModel: NSObject {
    var status = 0
    //因为通过 Runtime 设置的值只能是 NSObject 的子类，如果定义[Post]的话，取元素的时候会报错（因为 NSArray 的元素是 AnyObject 类型，不会自动转化成 Post
    var tngou = []
    var total = 0
}