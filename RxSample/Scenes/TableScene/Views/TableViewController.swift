//
//  TableViewController.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/02.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import UIKit
import RxSwift

class TableViewController: UIViewController {
    let disposeBag = DisposeBag()
    var viewModel: TableViewModelType!
    var rightCancelButton: UIBarButtonItem?
    @IBOutlet weak var tableView: UITableView!
    
    private let cellIdentifier = "QiitaItemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initializeView()
        initializeBinding()
        viewModel.input.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TableViewController: BaseViewType {
    func initializeBinding() {
        rightCancelButton?.rx.tap.asDriver().drive(onNext: { _ in
            self.viewModel.input.dismissTableView()
        }, onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)
        
        viewModel.output.itemsObservable
            .bind(to: tableView.rx.items(cellIdentifier: cellIdentifier)) { row, element, cell in
                
                if let cell = cell as? QiitaItemCell {
                    cell.label.text = element.title
                }
        }
        .disposed(by: disposeBag)
    }
    
    func initializeView() {
        // add cancel button at navigation bar
        rightCancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        let navigationBar = navigationController?.navigationBar
        navigationBar?.prefersLargeTitles = true
        navigationItem.title = "TableView"
        navigationItem.setRightBarButton(rightCancelButton, animated: false)
        
        // setup tableview cell
        tableView.register(UINib(nibName: "QiitaItemCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}
