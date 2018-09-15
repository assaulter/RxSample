//
//  TableHeaderCoordinator.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/08.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import Foundation
import RxSwift

protocol TableHeaderCoordinatorRouterType: class {
    func dismissTableHeaderView()
}

class TableHeaderCoordinator: BaseCoordinator, TableHeaderCoordinatorRouterType {
    
    override func start() {
        let tableHeaderViewController = TableHeaderViewController.instantiate()
        tableHeaderViewController.viewModel = TableHeaderViewModel(self)
        let navigationController = UINavigationController(rootViewController: tableHeaderViewController)
        
        if let presented = initialNavigationController?.presentedViewController {
            presented.present(navigationController, animated: true) {
                print("TableHeaderCoordinator#start")
            }
        }
    }
    
    func dismissTableHeaderView() {
        if let presented = initialNavigationController?.presentedViewController {
            presented.dismiss(animated: true, completion: nil)
            finishSubject.onNext(true)
        }
    }
}
