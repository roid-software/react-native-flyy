//
//  WebViewController.swift
//  react-native-flyy
//
//  Created by Pooja Deshpande on 06/01/21.
//

import Foundation
import UIKit
import WebKit
import FlyyFramework

internal class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    
    var webView:WKWebView!
    var label:UILabel!
    
    public static var PAGE_TO_OPEN = URL(string: "")
    public static var LABEL_TEXT = "Loading Offers..."
    
    override func loadView() {
        webView = WKWebView()
               webView.uiDelegate = self
               webView.navigationDelegate = self
               view = webView
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        label.numberOfLines = 0
        label.text = WebViewController.LABEL_TEXT
        
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 18.0)
        label.backgroundColor = UIColor.clear
        
        self.view.addSubview(label)
    }
    
    public override func viewDidLayoutSubviews() {
            label.center = self.view.center
        }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(url: WebViewController.PAGE_TO_OPEN!)
        
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
        webView.configuration.userContentController.addUserScript(self.getZoomDisableScript())
        webView.configuration.userContentController.add(self, name: "handleMessage")
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        label.text = ""
        label.isHidden = true
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        sendDataToJS()
        label.text = ""
        label.isHidden = true
    }
    
    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        if(error._code == NSURLErrorNotConnectedToInternet){
            showNoInternetConnection()
        }
    }
    
    func showNoInternetConnection() {
        // create the alert
        let alert = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in
            //            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if (message.name == "handleMessage") {
            guard let body = message.body as? [String: AnyObject],
                  let param = body["action"] as? String else {
                return
            }
            
            if(param == "go-back") {
                if(webView.canGoBack) {
                    //Go back in webview history
                    webView.goBack()
                } else {
                    //Pop view controller to preview view controller
                    //                    self.navigationController?.popViewController(animated: true)
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
    
    private func getZoomDisableScript() -> WKUserScript {
        let source: String = "var meta = document.createElement('meta');" +
            "meta.name = 'viewport';" +
            "meta.content = 'width=device-width, initial-scale=1.0, maximum- scale=1.0, user-scalable=no';" +
            "var head = document.getElementsByTagName('head')[0];" + "head.appendChild(meta);"
        return WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
    }
    
    func sendDataToJS() {
        // Send the header data to the page
        let javascript = "handleSDKMessage('\(Flyy.sharedInstance.getHeadersDataForWebView())')"
        
        webView.evaluateJavaScript(javascript) { (result, error) in
            guard result == nil else {
                if let unwrapped = result {
                    debugPrint(unwrapped)
                }
                return
            }
            
            guard error == nil else {
                debugPrint("Inside Flyy SDK JS error \(error!)")
                return
            }
        }
    }
    
}
