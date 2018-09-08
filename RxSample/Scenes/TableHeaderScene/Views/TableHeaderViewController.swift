//
//  TableHeaderViewController.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/08.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import UIKit

class TableHeaderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
        initializeBinding()
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

extension TableHeaderViewController: BaseViewType {
    func initializeBinding() {
    }
    
    func initializeView() {
        navigationItem.title = "Table Header"
    }
    
    
}
