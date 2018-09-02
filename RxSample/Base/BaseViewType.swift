//
//  BaseViewType.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/02.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

//View/ViewController prototype
public protocol BaseViewType {
    //Any binding related work please do here
    func initializeBinding()
    //Any Initialization please do here
    //Example button action with RxCocoa
    //tableview, collectionView cell registration
    func initializeView()
}
