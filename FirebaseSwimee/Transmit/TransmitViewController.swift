//
//  TransmitViewController.swift
//  FirebaseSwimee
//
//  Created by ShinokiRyosei on 2016/10/26.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit


// MARK: - TransmitViewController

class TransmitViewController: UIViewController {

    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.configureNavBar()
    }
    
    
    // MARK: Private
    
    private func configureNavBar() {
        self.title = "送信"
    }
}


// MARK: - StoryboardInstantiable

extension TransmitViewController: StoryboardInstantiable {
    
    static var storyboardName: String {
        
        return String(describing: self)
    }
}
