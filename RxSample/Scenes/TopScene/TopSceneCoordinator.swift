//
//  TopSceneCoordinator.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/01.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import Foundation
import RxSwift

protocol TopCoordinatorRouterType {
    
}

class TopCoordinator: BaseCoordinator {
    override func start() {
        // create views and DI
        let topViewController = TopViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: topViewController)
        initialNavigationController?.present(navigationController, animated: false, completion: nil)
    }
}
