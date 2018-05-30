//
//  BaseClass.swift
//  ios_project_final
//
//  Created by LS J on 2018/5/30.
//  Copyright © 2018年 LS J. All rights reserved.
//

import Foundation
// 工具类，处理页面间传值
class BaseClass{
    // 以键值对的方式设置传值
    func cacheSetString(key: String,value: String){
        let userInfo = UserDefaults()
        userInfo.setValue(value, forKey: key)
    }
    // 根据key接收到value
    func cacheGetString(key: String) -> String{
        let userInfo = UserDefaults()
        let tmpSign = userInfo.string(forKey: key)
        return tmpSign!
    }
}
