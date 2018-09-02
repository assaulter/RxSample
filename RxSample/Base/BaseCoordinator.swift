//
//  BaseCoordinator.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/01.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import RxSwift

//Base class for coordinator
//This class implements Coordinator prototype
//Please create Router prototype for each coordinator
//Router will responsible for internal view transition within the scene
class BaseCoordinator: CoordinatorType {
    var disposeBag = DisposeBag()
    var initialNavigationController: UINavigationController?
    var finishObserable: Observable<Bool>?
    var childCoordinators = [AppCoordinatorNavigation: CoordinatorType]()
    func start() {
    }
    func finish(_ index: AppCoordinatorNavigation) {
        // remove reference
        childCoordinators.removeValue(forKey: index)
    }
}
