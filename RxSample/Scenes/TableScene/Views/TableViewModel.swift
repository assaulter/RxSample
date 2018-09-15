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
protocol TableViewModelOutputType: BaseViewModelOuputType {
    var itemsObservable: Observable<[QiitaUserItem]> { get }
}
protocol TableViewModelType {
    var input: TableViewModelInputType { get }
    var output: TableViewModelOutputType { get }
}

class TableViewModel: TableViewModelType, TableViewModelInputType, TableViewModelOutputType {
    var input: TableViewModelInputType { return self }
    var output: TableViewModelOutputType { return self }
    
    var itemsObservable: Observable<[QiitaUserItem]>
    
    private let disposeBag = DisposeBag()
    private let items: PublishSubject<[QiitaUserItem]> = PublishSubject<[QiitaUserItem]>()
    
    weak var router: TableCoordinatorRouterType?
    init(_ routerType: TableCoordinatorRouterType) {
        self.router = routerType
        itemsObservable = items.asObserver()
    }
    
    func viewDidLoad() {
        QiitaApi.shared.request(Qiita.GetUserItems(name: "kz_kazuki"))
            .subscribe(onSuccess: { (items) in
                self.items.onNext(items)
            }) { (error) in
                print(error)
        }
        .disposed(by: disposeBag)
    }
    
    func dismissTableView() {
        router?.dismissTableView()
    }
}
