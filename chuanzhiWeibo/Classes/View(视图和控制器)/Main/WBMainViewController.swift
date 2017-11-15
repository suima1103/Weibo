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
        setupComposeButton()
    }
    
    // MARK: - 监听方法
    /// 撰写微博 FIXME: 没有实现
    // private 能够保证方法私有 仅在当前对象被访问
    // 允许这个函数通过在运行时通过 OC 的消息机制被调用
    @objc private func composeStaus() {
        print("撰写微博")
    }
    
    // MARK: - 私有控件
     private lazy var  composeButton:UIButton = UIButton(type: .custom)
    

}

//MARK:-设置界面
extension WBMainViewController {
    
    // 设置按钮的
    private func setupComposeButton() {
        
        tabBar.addSubview(composeButton)
        
        composeButton.setImage(UIImage(named:"tabbar_compose_icon_add"), for: .normal)
        composeButton.setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: .normal)
        
        //计算按钮的宽度
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        
        
        // 设置监听方法
        composeButton.addTarget(self, action: #selector(composeStaus), for: .touchUpInside)
    }
    // 设置所有子控制器
    private func setupChildControllers() {
        let array = [
            ["clsName":"WBHomeViewController","title":"首页","imageName":"home"],
            ["clsName":"WBMessageViewController","title":"消息","imageName":"message_center"],
            ["clsName":"UIViewController"],
            ["clsName":"WBDiscoverViewController","title":"发现","imageName":"discover"],
            ["clsName":"WBProfileViewController","title":"我","imageName":"profile"],
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
        
        //3. 设置视图控制器
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        let nav = WBNavigationController(rootViewController: vc)
        
        return nav
    }
}











