//
//  ReceiveViewController.swift
//  FirebaseSwimee
//
//  Created by ShinokiRyosei on 2016/10/26.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit
import Firebase


// MARK: - ReceiveViewController

class ReceiveViewController: UIViewController {
    
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.configureNavBar()
    }
    
    
    // MARK: Private
    
    @IBOutlet private weak var searchIDTextField: UITextField! {
        
        didSet {
            
            searchIDTextField.delegate = self
            searchIDTextField.keyboardType = .asciiCapable
        }
    }
    @IBOutlet private weak var postTextView: UITextView!
    
    private let ref = FIRDatabase.database().reference().child("idList")
    
    @IBAction private func selectReceive() {
        
        guard let searchID = searchIDTextField.text else { return }
        if searchID == "" { return }
        
        Network.getRequest(searchID) { (text) in
            self.postTextView.text = text
        }
    }
    
    
    
    private func configureNavBar() {
        
        self.title = "受信"
    }
}

extension ReceiveViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}


// MARK: - StoryboardInstantiable

extension ReceiveViewController: StoryboardInstantiable {
    
    static var storyboardName: String {
        
        return String(describing: self)
    }
}
