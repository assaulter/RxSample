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

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initBindings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - bindings
extension ViewController {
    func initBindings() {
        button.rx.tap.asDriver().drive(onNext: { () in
            print("hoge")
        }, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
}
