//
//  WBHomeViewController.swift
//  chuanzhiWeibo
//
//  Created by 袁泉亮 on 2017/11/05.
//  Copyright © 2017年 袁泉亮. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    // 显示好友
    @objc private func showFriends() {
        print(#function)
        
        let vc = WBDemoViewController()
        
        vc.hidesBottomBarWhenPushed = true 
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - 设置界面
extension WBHomeViewController {
    
    override func setUI() {
        
        super.setUI()
        
        print("home")
        
        // 设置导航栏按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showFriends))
    }
}
