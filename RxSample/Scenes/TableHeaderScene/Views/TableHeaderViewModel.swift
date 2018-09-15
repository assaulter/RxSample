//
//  TableHeaderViewModel.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/15.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import Foundation
import RxSwift

protocol TableHeaderViewModelInputType: BaseViewModelInputType {
    func dismissTableHeaderView()
}

protocol TableHeaderViewModelOutputType: BaseViewModelOuputType {
}

protocol TableHeaderViewModelType {
    var input: TableHeaderViewModelInputType {  get }
    var output: TableHeaderViewModelOutputType { get }
}

class TableHeaderViewModel: TableHeaderViewModelType, TableHeaderViewModelOutputType, TableHeaderViewModelInputType {
    var input: TableHeaderViewModelInputType { return self }
    var output: TableHeaderViewModelOutputType { return self }
    weak var router: TableHeaderCoordinatorRouterType?

    init(_ router: TableHeaderCoordinatorRouterType) {
        self.router = router
    }

    func viewDidLoad() {
    }

    func dismissTableHeaderView() {
        router?.dismissTableHeaderView()
    }
}

