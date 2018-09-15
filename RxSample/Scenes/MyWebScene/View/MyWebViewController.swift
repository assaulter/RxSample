//
//  MyWebViewController.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/15.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import UIKit
import Foundation
import RxSwift

class MyWebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("viewdidload")
    }
}

extension MyWebViewController: BaseViewType {
    func initializeBinding() {}
    func initializeView() {}
}
