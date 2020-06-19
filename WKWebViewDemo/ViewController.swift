//
//  ViewController.swift
//  WKWebViewDemo
//
//  Created by Kav Interactive on 19/06/20.
//  Copyright © 2020 kav interactive. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var webView:WKWebView!
    @IBOutlet var txxtForSearch: UITextField!
    @IBOutlet var btnForSearch: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func loadCoontent(search:String) {
        let str = "\(search)"
        let url = URL(string: str)
        webView.navigationDelegate = self
        webView.load(URLRequest(url: url!))
    }
    @IBAction func btnForSearch(_ sender: Any) {
        let search = txxtForSearch.text!
        if search == ""{
                    let alert = UIAlertController(title: "Alert", message: "Please Enter text", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
        }else{
        
    let charset = CharacterSet(charactersIn: "y")
    if search.rangeOfCharacter(from: charset) != nil {
        let alert = UIAlertController(title: "Alert", message: "This page is blocked", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }else{
        loadCoontent(search: search)
            }
        }

    }
}
extension ViewController: WKNavigationDelegate {
   
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {}
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {}
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {}
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {}
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url else {
            decisionHandler(.allow)
            print("fail")
            return
        }
        if url.absoluteString.contains("ios-development-course") {
            // this means login successful
            decisionHandler(.cancel)
            print("successfully completed")
        } else {
//            let alert = UIAlertController(title: "Alert", message: "Please search Correct URL", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
            decisionHandler(.allow)
            
        }
    }
    
}
