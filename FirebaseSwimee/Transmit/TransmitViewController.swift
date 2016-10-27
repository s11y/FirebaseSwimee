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
        configureTextField()
    }
    
    // MARK: Private
    
    @IBOutlet private weak var searchIDTextField: UITextField!
    @IBOutlet private weak var postTextField: UITextField!
    
    private let ref = FIRDatabase.database().reference().child("idList")
    
    @IBAction private func selectTransmit() {
        guard let id = searchIDTextField.text , let text = postTextField.text else { return }
        if id == "" || text == "" { return }
        
        ref.child(id).setValue(["id": id, "text": text, "timestamps": FIRServerValue.timestamp()])
    }
    
    private func configureNavBar() {
        self.title = "送信"
    }
    
    private func configureTextField() {
        
        searchIDTextField.delegate = self
        searchIDTextField.keyboardType = .asciiCapable
        
        postTextField.delegate = self
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
