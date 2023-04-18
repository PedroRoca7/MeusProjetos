//
//  RepositoryViewController.swift
//  APIGitHub
//
//  Created by Pedro Henrique on 18/04/23.
//

import UIKit
import WebKit

class RepositoryViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var repository: Repository!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: repository.htmlUrl) else { return }
        let request = URLRequest(url: url)
        title = repository.name
        
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        webView.load(request)
    }
}

extension RepositoryViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
}
