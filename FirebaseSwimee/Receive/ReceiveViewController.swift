//
//  ReceiveViewController.swift
//  FirebaseSwimee
//
//  Created by ShinokiRyosei on 2016/10/26.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit


// MARK: - ReceiveViewController

class ReceiveViewController: UIViewController {

    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.configureNavBar()
    }
    
    
    // MARK: Private
    
    private func configureNavBar() {
        self.title = "受信"
    }
    
    @IBOutlet private weak var searchIDTextField: UITextField!
    @IBOutlet private weak var postTextView: UITextView!
    
    @IBAction private func selectReceive() {
        
    }
}


// MARK: - StoryboardInstantiable

extension ReceiveViewController: StoryboardInstantiable {
    
    static var storyboardName: String {
        
        return String(describing: self)
    }
}
