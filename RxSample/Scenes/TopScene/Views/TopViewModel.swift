//
//  TopViewModel.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/02.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import RxSwift

protocol TopViewModelInputType: BaseViewModelInputType {
    func transitionToTableScene()
    func transitionToTableHeaderScene()
}

protocol TopViewModelOutoutType: BaseViewModelOuputType {
    
}

protocol TopViewModelType {
    var input: TopViewModelInputType { get }
    var output: TopViewModelOutoutType { get }
}

class TopViewmodel: TopViewModelType, TopViewModelInputType, TopViewModelOutoutType {
    let router: TopCoordinatorRouterType
    var input: TopViewModelInputType { return self }
    var output: TopViewModelOutoutType { return self }
    
    init(_ routerType: TopCoordinatorRouterType) {
        self.router = routerType
    }
    
    func viewDidLoad() {}
    
    func transitionToTableScene() {
        router.startTableCoordinator()
    }
    
    func transitionToTableHeaderScene() {
        router.startTableHeaderCoordinator()
    }
}
