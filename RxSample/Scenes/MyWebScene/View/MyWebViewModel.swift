//
//  MyWebViewModel.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/15.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import Foundation
import RxSwift

protocol MyWebViewModelInputType: BaseViewModelInputType {
}

protocol MyWebViewModelOutputType: BaseViewModelOuputType {
}

protocol MyWebViewModelType {
    var input: MyWebViewModelInputType {  get }
    var output: MyWebViewModelOutputType { get }
}

class MyWebViewModel: MyWebViewModelType, MyWebViewModelOutputType, MyWebViewModelInputType {
    var input: MyWebViewModelInputType { return self }
    var output: MyWebViewModelOutputType { return self }
    
    func viewDidLoad() {
    }
}
