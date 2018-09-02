//
//  File.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/02.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import Foundation
import RxSwift

protocol TableCoordinatorRouterType {
    func dismissTableView()
}

class TableCoordinator: BaseCoordinator, TableCoordinatorRouterType {
    override func start() {
        let tableViewController = TableViewController.instantiate()
        tableViewController.viewModel = TableViewModel(self)
        let navigationController = UINavigationController(rootViewController: tableViewController)
        
        if let presented = initialNavigationController?.presentedViewController {
            presented.present(navigationController, animated: true) {
                print("complete")
            }
        }
    }

    func dismissTableView() {
        dismissPresentedView()
    }
    
    private func dismissPresentedView() {
        if let presented = initialNavigationController?.presentedViewController {
            presented.dismiss(animated: true, completion: nil)
        }
    }
}
