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
import WebKit

class MyWebViewController: UIViewController {
    var viewModel: MyWebViewModelType!
    var cancelButton: UIBarButtonItem?
    var webView: WKWebView!
    var progressBar: UIProgressView?
    private let disposeBag = DisposeBag()

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("viewdidload")
        initializeView()
        initializeBinding()
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let path = keyPath {
            switch path {
            case "estimatedProgress":
                print(Float(webView.estimatedProgress))
                progressBar?.setProgress(Float(webView.estimatedProgress), animated: true)
            case "loading":
                UIApplication.shared.isNetworkActivityIndicatorVisible = webView.isLoading
                if webView.isLoading {
                    progressBar?.setProgress(0.1, animated: true)
                } else {
                    progressBar?.setProgress(0, animated: false)
                }
            default:
                return
            }
        }
    }

    deinit {
        webView.removeObserver(self, forKeyPath: "loading")
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
}

extension MyWebViewController: BaseViewType {
    func initializeBinding() {
        cancelButton?.rx.tap.asDriver().drive(onNext: { [weak self] (_) in
            self?.viewModel.input.dismissMyWebView()
        }).disposed(by: disposeBag)

        // binding...?
        webView.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    
    func initializeView() {
        navigationItem.title = "MyWeb"
        cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        navigationItem.rightBarButtonItem = cancelButton
        if let _navigationController = navigationController {
            progressBar = UIProgressView(frame: CGRect(x: 0, y: (_navigationController.navigationBar.frame.height) - 2, width: _navigationController.navigationBar.frame.width, height: 10))
            progressBar?.progressViewStyle = .bar
            navigationController?.navigationBar.addSubview(progressBar!)
        }
        // load
        load()
    }

    private func load() {
        let urlStr = "https://www.renosy.com/webview/term"
        let url = URL(string: urlStr)
        if let _url = url {
            webView.load(URLRequest(url: _url))
        }
    }
}

extension MyWebViewController: WKUIDelegate {
}
