//
//  TopViewModel.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/02.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import RxSwift
import Moya

protocol TableViewModelInputType: BaseViewModelInputType {
    func dismissTableView()
}
protocol TableViewModelOutputType: BaseViewModelOuputType { }
protocol TableViewModelType {
    var input: TableViewModelInputType { get }
    var output: TableViewModelOutputType { get }
}

class TableViewModel: TableViewModelType, TableViewModelInputType, TableViewModelOutputType {
    var input: TableViewModelInputType { return self }
    var output: TableViewModelOutputType { return self }
    let disposeBag = DisposeBag()
    
    let router: TableCoordinatorRouterType
    init(_ routerType: TableCoordinatorRouterType) {
        self.router = routerType
    }
    
    func viewDidLoad() {
        QiitaApi.shared.request(Qiita.GetUserItems(name: "kz_kazuki"))
            .subscribe(onSuccess: { (profile) in
                print(profile)
            }) { (error) in
                print(error)
        }
        .disposed(by: disposeBag)
    }
    
    func dismissTableView() {
        router.dismissTableView()
    }
}
