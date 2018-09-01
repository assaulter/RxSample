//
//  NSObject+className.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/01.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import Foundation

/// クラス名取得
/// MyClass.className => "MyClass"
/// MyClass().className => "MyClass"
extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
