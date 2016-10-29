//
//  Network.swift
//  FirebaseSwimee
//
//  Created by ShinokiRyosei on 2016/10/29.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit
import Firebase


// MARK: - Network

class Network {
    
    static let getRequest: (String, @escaping (String) -> Void) -> Void = { (id: String , successHandler: @escaping (String) -> Void ) in
        
        let ref: FIRDatabaseReference = FIRDatabase.database().reference().child("idList")
        ref.observe(.value, with: { (snapshot) in
            
            guard let postValue = snapshot.value as? [String: AnyObject] else {
                
                successHandler("dに該当する投稿はありませんでした。")
                return
            }
            
            var postText: String = ""
            
            let text = postValue["text"] as? String
            
            // タイムスタンプから時刻を取得
            let timestamps = postValue["timestamps"]! as? TimeInterval
            let date = Date(timeIntervalSince1970: timestamps!/1000)
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ja_JP")
            formatter.dateStyle = .medium // -> ex: 2016/10/29
            formatter.timeStyle = .medium // -> ex: 13:20:08
            
            postText += "id: " + id + "\n"
            postText += "text: " + text! + "\n"
            postText += "date: " + formatter.string(from: date) + "\n"
            
            successHandler(postText)
            
        }) { (error) in
            print(error)
        }
    }
    
    static let postRequest: (String, String) -> Void = { (id: String, text: String) in
        let ref: FIRDatabaseReference = FIRDatabase.database().reference().child("idList")
        ref.setValue(["id": id, "text": text, "timestamps": FIRServerValue.timestamp()])
    }
}
