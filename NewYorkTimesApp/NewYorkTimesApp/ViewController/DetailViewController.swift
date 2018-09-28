//
//  DetailViewController.swift
//  NewYorkTimesApp
//
//  Created by CKM1 on 9/27/18.
//  Copyright © 2018 FSD. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIWebViewDelegate {

    // MARK: -  IBOutlets and Variables
    @IBOutlet weak var webView:UIWebView!
    @IBOutlet weak var loadingActivityIndicator:UIActivityIndicatorView!
    var articleDetail:Article?
    
    
    // MARK: - 🌻 Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.delegate = self

    }

    override func viewWillAppear(_ animated: Bool) {
        
        // Setting Data 
        if let header = articleDetail?.section{
            self.title = header
            
        }
        if let urlPath = articleDetail?.url {
            let url:URL = URL(string: urlPath)!
            webView.loadRequest(URLRequest(url: url))
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 🏁 Protocols Conformance

    //MARK:- UIWebView Delegate
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.loadingActivityIndicator.startAnimating()
        
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.loadingActivityIndicator.stopAnimating()
        self.loadingActivityIndicator.isHidden = true

    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.loadingActivityIndicator.stopAnimating()
        self.loadingActivityIndicator.isHidden = true

    }

}
