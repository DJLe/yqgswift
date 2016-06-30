//
//  Constant.swift
//  aidingding
//
//  Created by mydaogj on 16/4/19.
//  Copyright © 2016年 ding. All rights reserved.
//

import UIKit

let ScreenBounds = UIScreen.mainScreen().bounds
let ScreenWidth = ScreenBounds.width
let ScreenHeight = ScreenBounds.height

let BarHeight = UIApplication.sharedApplication().statusBarFrame.height


struct CellReuseIdentifier {
    static let Home = "HomeCell"

}

struct API {
    static let APIHost = "http://apis.baidu.com/tngou/info/"
    //分类
    static let HomeCategory = APIHost + "classify" + "?" + ""
    //列表
    static let HomeList = APIHost + "list" + "?" + "id="
}