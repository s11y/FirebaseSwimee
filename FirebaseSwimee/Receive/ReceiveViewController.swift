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
        self.configureTextField()
    }
    
    // MARK: Private
    
    @IBOutlet private weak var searchIDTextField: UITextField!
    @IBOutlet private weak var postTextView: UITextView!
    
    private let ref = FIRDatabase.database().reference().child("idList")
    
    @IBAction private func selectReceive() {
        
        guard let searchID = searchIDTextField.text else { return }
        if searchID == "" { return }
        
        ref.child(searchID).observe(.value, with: { snapshot in
            
            print(snapshot) // コンソールで確認
            
            guard let postValue = snapshot.value as? [String: AnyObject] else {
                
                print("no snapshot.value")
                self.postTextView.text = "idに該当する投稿はありませんでした。"
                return
            }
            
            print(postValue)
            
            var postText: String = ""
            
            let text = postValue["text"] as? String
            
            // タイムスタンプから時刻を取得
            let timestamps = postValue["timestamps"]! as? TimeInterval
            let date = Date(timeIntervalSince1970: timestamps!/1000)
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ja_JP")
            formatter.dateStyle = .medium // -> ex: 2016/10/29
            formatter.timeStyle = .medium // -> ex: 13:20:08
            
            postText += "id: " + searchID + "\n"
            postText += "text: " + text! + "\n"
            postText += "date: " + formatter.string(from: date) + "\n"
            
            self.postTextView.text = postText
        })
        
    }

    private func configureNavBar() {
        
        self.title = "受信"
    }
    
    private func configureTextField() {
        
        searchIDTextField.delegate = self
        searchIDTextField.keyboardType = .asciiCapable
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
