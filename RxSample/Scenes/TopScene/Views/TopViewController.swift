//
//  ViewController.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/08/31.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TopViewController: UIViewController {
    var viewModel: TopViewModelType!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableHeaderButton: UIButton!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initializeBinding()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - bindings
extension TopViewController: BaseViewType {
    func initializeBinding() {
        button.rx.tap.asDriver().drive(onNext: { () in
            self.viewModel.input.transitionToTableScene()
        }, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        tableHeaderButton.rx.tap.asDriver().drive(onNext: { () in
            self.viewModel.input.transitionToTableHeaderScene()
        })
        .disposed(by: disposeBag)
    }
    
    func initializeView() {
    }
}
