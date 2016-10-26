//
//  TabBarViewController.swift
//  FirebaseSwimee
//
//  Created by ShinokiRyosei on 2016/10/26.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit


// MARK: - TabBarController

class TabBarViewController: UITabBarController {
    
    
    // MARK: UITabBarController

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.configureTab()
    }
    
    
    // MARK: Private
    
    private func configureTab() {
        let transmitViewController = UINavigationController(rootViewController: TransmitViewController.instantiateFromStoryboard())
        transmitViewController.tabBarItem = UITabBarItem(title: "送信", image: #imageLiteral(resourceName: "tabBar_tab_transmit"), selectedImage: #imageLiteral(resourceName: "tabBar_tab_transmit"))
        
        let receiveViewController = UINavigationController(rootViewController: ReceiveViewController.instantiateFromStoryboard())
        receiveViewController.tabBarItem = UITabBarItem(title: "受信", image: #imageLiteral(resourceName: "tabBar_tab_receive"), selectedImage: #imageLiteral(resourceName: "tabBar_tab_receive"))
        
        self.viewControllers = [transmitViewController, receiveViewController]
    }
}
