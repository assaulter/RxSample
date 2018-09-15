//
//  MyWebCoordinator.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/15.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import Foundation
import RxSwift

protocol MyWebCoordinatorRouterType: class {
    func dismiss()
}

class MyWebCoordinator: BaseCoordinator, MyWebCoordinatorRouterType {

    override func start() {
        let myWebViewController = MyWebViewController.instantiate()
        myWebViewController.viewModel = MyWebViewModel(self)
        let navigationController = UINavigationController(rootViewController: myWebViewController)
        
        if let presented = initialNavigationController?.presentedViewController {
            presented.present(navigationController, animated: true) {
                print("MyWebCoordinator#start")
            }
        }
    }
    
    func dismiss() {
        if let presented = initialNavigationController?.presentedViewController {
            presented.dismiss(animated: true, completion: nil)
            finishSubject.onNext(true)
        }
    }
}
