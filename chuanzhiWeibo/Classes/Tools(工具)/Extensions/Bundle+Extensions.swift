//
//  Bundle+Extensions.swift
//  chuanzhiWeibo
//
//  Created by 袁泉亮 on 2017/11/05.
//  Copyright © 2017年 袁泉亮. All rights reserved.
//

import Foundation

extension Bundle {
    
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
