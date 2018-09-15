//
//  MyWebViewController.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/15.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import UIKit
import Foundation
import RxSwift

class MyWebViewController: UIViewController {
    var viewModel: MyWebViewModelType!
    var cancelButton: UIBarButtonItem?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("viewdidload")
        initializeView()
        initializeBinding()
    }
}

extension MyWebViewController: BaseViewType {
    func initializeBinding() {
        cancelButton?.rx.tap.asDriver().drive(onNext: { [weak self] (_) in
            self?.viewModel.input.dismissMyWebView()
        }).disposed(by: disposeBag)
    }
    
    func initializeView() {
        navigationItem.title = "MyWeb"
        cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        navigationItem.rightBarButtonItem = cancelButton
    }
}
