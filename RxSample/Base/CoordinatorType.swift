//
//  CoordinatorType.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/01.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import RxSwift

protocol CoordinatorType {
    //Keep reference of child coordinators.
    var childCoordinators: [AppCoordinatorNavigation: CoordinatorType] { get }
    //NavigationController for present viewController or push viewController
    //Set navigationController when create coordinator
    var initialNavigationController: UINavigationController? { get set }
    //Obserbable for parent coordinator if any child coordinator finish
    //If any child coordinator has finished and notify parent
    //then coordinator remove from dictionary so reference will clear by os
    //This value is optional.May be some viewcontroller will never remove.
    //Example :  TabViewController as rootViewController
    var finishObserable: Observable<Bool>? { get set }
    //Dispose bag for clear obserable
    var disposeBag: DisposeBag {get set}
    //Entry point for any coordinator
    //Please call this method
    func start()
    //remove childcoordinator
    func finish(_ index: AppCoordinatorNavigation)
}
