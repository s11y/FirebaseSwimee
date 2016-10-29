//
//  OptionalUtility.swift
//  FirebaseSwimee
//
//  Created by 藤井陽介 on 2016/10/28.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import Foundation

extension Optional {
    public func reduce<U>(_ initial: U, combine: (U, Wrapped) -> U) -> U {
        switch self {
        case .none:
            return initial
        case .some(let value):
            return combine(initial, value)
        }
    }
    
    public func filter(_ includeElement: @escaping (Wrapped) -> Bool) -> Wrapped? {
        return flatMap { includeElement($0) ? $0 : nil }
    }
    
    public func forEach(_ action: (Wrapped) -> ()) {
        reduce(()) { action($1) }
    }
}
