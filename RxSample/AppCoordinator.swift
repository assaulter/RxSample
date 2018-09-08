//
//  AppCoordinator.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/01.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator {
    // MARK: - props
    var window: UIWindow?
    
    public init(_ window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
    }
    
    override func start() {
        initialNavigation()
    }
    
    // MARK: - private
    private func initialNavigation() {
        loadTopScene()
    }
    
    private func loadTopScene() {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        changeRootViewController(navigationController)
        
        let topCoordinator = TopCoordinator()
        topCoordinator.initialNavigationController = navigationController
        childCoordinators[.topScene] = topCoordinator
        topCoordinator.start()
    }
    
    private func changeRootViewController(_ nextRootViewController: UIViewController) {
        UIView.transition(with: window!, duration: 0.5, options: .transitionCrossDissolve, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.window!.rootViewController = nextRootViewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: nil)
    }
}

enum AppCoordinatorNavigation: Hashable {
    case topScene
    case tableScene
    case tableHeaderScene
}

