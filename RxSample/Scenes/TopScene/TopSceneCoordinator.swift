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
    func startTableCoordinator()
    func startTableHeaderCoordinator()
    func startMyWebCoordinator()
}

class TopCoordinator: BaseCoordinator, TopCoordinatorRouterType {
    override func start() {
        // create views and DI
        let topViewController = TopViewController.instantiate()
        topViewController.viewModel = TopViewmodel(self)
        let navigationController = UINavigationController(rootViewController: topViewController)
        initialNavigationController?.present(navigationController, animated: false, completion: nil)
    }
    
    func startTableCoordinator() {
        let tableCoordinator = TableCoordinator()
        tableCoordinator.initialNavigationController = initialNavigationController
        childCoordinators[.tableScene] = tableCoordinator
        tableCoordinator.finishObserable?.subscribe(onNext: { [weak self] (_) in
            self?.finish(.tableScene)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)
        tableCoordinator.start()
    }
    
    func startTableHeaderCoordinator() {
        let tableHeaderCoordinator = TableHeaderCoordinator()
        tableHeaderCoordinator.initialNavigationController = initialNavigationController
        childCoordinators[.tableHeaderScene] = tableHeaderCoordinator
        tableHeaderCoordinator.finishObserable?.subscribe(onNext: { [weak self] (_) in
            self?.finish(.tableHeaderScene)
        })
        .disposed(by: disposeBag)
        tableHeaderCoordinator.start()
    }
    
    func startMyWebCoordinator() {
        let myWebCoordinator = MyWebCoordinator()
        myWebCoordinator.initialNavigationController = initialNavigationController
        childCoordinators[.myWebScene] = myWebCoordinator
        myWebCoordinator.finishObserable?.subscribe(onNext: { [weak self] (_) in
            self?.finish(.myWebScene)
        }).disposed(by: disposeBag)
        myWebCoordinator.start()
    }
}
