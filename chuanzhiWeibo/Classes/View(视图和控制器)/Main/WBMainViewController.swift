//
//  WBMainViewController.swift
//  chuanzhiWeibo
//
//  Created by 袁泉亮 on 2017/11/04.
//  Copyright © 2017年 袁泉亮. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildControllers()
    }
}

//MARK:-设置界面
extension WBMainViewController {
    // 设置所有子控制器
    private func setupChildControllers() {
        let array = [
            ["clsName":"WBHomeViewController","title":"首页","imageName":""],
        ]
        
        var arrayM = [UIViewController]()
        
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
    }
    
    /// 使用字典创建一个子控制器
    ///
    /// - Parameter dict: 信息字典 [clsName,title,imageName]
    /// - Returns: 子控制器
    func controller(dict:[String: String]) -> UIViewController {
       // 1. 取得字典内容
     guard  let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"],
                let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
        else {
            return UIViewController()
        }
        
        //2. 创建视图控制器
        let vc = cls.init()
        vc.title = title
        
        let nav = WBNavigationController(rootViewController: vc)
        
        return nav
    }
}











