//
//  File.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/01.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import UIKit

public protocol StoryboardInstantiable {}
extension UIViewController: StoryboardInstantiable {}

public extension StoryboardInstantiable where Self: UIViewController {
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        return (storyboard.instantiateViewController(withIdentifier: self.className) as? Self)!
    }
}
