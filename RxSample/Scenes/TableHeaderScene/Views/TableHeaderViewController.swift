//
//  TableHeaderViewController.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/08.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import UIKit
import RxSwift

class TableHeaderViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var cancelButton: UIBarButtonItem?
    var viewModel: TableHeaderViewModelType!
    private let cellId = "header_sample"
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
        initializeBinding()
    }
}

// MARK: - BaseTypeView
extension TableHeaderViewController: BaseViewType {
    func initializeBinding() {
        cancelButton?.rx.tap.asDriver().drive(onNext: { [weak self] (_) in
            self?.viewModel.input.dismissTableHeaderView()
        })
        .disposed(by: disposeBag)
    }
    
    func initializeView() {
        // navigation
        navigationItem.title = "Table Header"
        cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        navigationItem.rightBarButtonItem = cancelButton
        // tableview
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.sectionHeaderHeight = 200
        tableView.delegate = self
    }
}
// MARK: - UITableViewDelegate
extension TableHeaderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.blue
        
        return headerView
    }
}
