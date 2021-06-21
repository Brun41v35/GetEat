//
//  WebViewController.swift
//  GetEat
//
//  Created by Bruno Silva on 06/06/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        setupWeb()
    }
    
    private func setupWeb() {
        webView.load(URLRequest(url: URL(string: "https://www.google.com/")!))
    }
}
