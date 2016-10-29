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
    
    static let getRequest: (String?, @escaping (String) -> Void) -> Void = { (id: String? , successHandler: @escaping (String) -> Void ) in
        let ref: FIRDatabaseReference = FIRDatabase.database().reference()
        id.forEach { searchID in
            if searchID.isEmpty { return }
            ref.child(searchID).observe(.value, with: { snapshot in
                
                print(snapshot) // コンソールで確認
                
                guard let postValue = snapshot.value as? [String: AnyObject] else {
                    
                    successHandler("idに該当する投稿はありませんでした。")
                    return
                }
                
                var postText: String = ""
                
                let text = postValue["text"] as? String
                
                // タイムスタンプから時刻を取得
                //                let timestamps = postValue["timestamps"]! as? TimeInterval
                let timeStamps = postValue["timestamps"].flatMap { $0 as? TimeInterval }
                //                let date = Date(timeIntervalSince1970: timestamps!/1000)
                let date = timeStamps.flatMap { Date(timeIntervalSince1970: $0 / 1000) }
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "ja_JP")
                formatter.dateStyle = .medium // -> ex: 2016/10/29
                formatter.timeStyle = .medium // -> ex: 13:20:08
                
                postText += "id: " + searchID + "\n"
                //                postText += "text: " + text! + "\n"
                text.forEach { postText += "text:" + $0 + "\n" }
                //                postText += "date: " + formatter.string(from: date) + "\n"
                date.forEach { postText += "date:" + formatter.string(from: $0) + "\n" }
                
                successHandler(postText)
                
            }) { (error) in
                print(error)
            }
        }
    }
    
    static let postRequest: (String?, String?) -> Void = { (id: String?, text: String?) in
        //        ref.child(id).setValue(["id": id, "text": text, "timestamps": FIRServerValue.timestamp()])
        let ref: FIRDatabaseReference = FIRDatabase.database().reference()
        id.forEach { _id in
            text.map { _text in
                ref.child(_id).setValue(["id": _id, "text": _text, "timestamps": FIRServerValue.timestamp()])
            }
        }
    }
}
