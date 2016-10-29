//
//  TransmitViewController.swift
//  FirebaseSwimee
//
//  Created by ShinokiRyosei on 2016/10/26.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit
import Firebase


// MARK: - TransmitViewController

class TransmitViewController: UIViewController {

    
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
    
    @IBOutlet private weak var postTextField: UITextField! {
        
        didSet {
            
            postTextField.delegate = self
        }
    }
    
    private let ref = FIRDatabase.database().reference().child("idList")
    
    @IBAction private func selectTransmit() {
        guard let id = searchIDTextField.text , let text = postTextField.text else { return }
        if id == "" || text == "" { return }
        
        Network.postRequest(id, text)
    }
    
    private func configureNavBar() {
        self.title = "送信"
    }
}

extension TransmitViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}


// MARK: - StoryboardInstantiable

extension TransmitViewController: StoryboardInstantiable {
    
    static var storyboardName: String {
        
        return String(describing: self)
    }
}
