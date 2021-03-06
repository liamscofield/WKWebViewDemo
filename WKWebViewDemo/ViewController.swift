//
//  ViewController.swift
//  WKWebViewDemo
//
//  Created by AlienLi on 15/1/14.
//  Copyright (c) 2015年 ALN. All rights reserved.
//

import UIKit
import WebKit


class ViewController: UIViewController,WKScriptMessageHandler {

    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        
        var contentController = WKUserContentController()
        
        var userScript = WKUserScript(
            source: "redHeader()", injectionTime: WKUserScriptInjectionTime.AtDocumentEnd, forMainFrameOnly: true)
        
        contentController.addScriptMessageHandler(self, name: "callbackHandler")
        //        contentController.addUserScript(userScript2)
        contentController.addUserScript(userScript)
        
        var config = WKWebViewConfiguration()
        
        config.userContentController = contentController
        
        self.webView = WKWebView(frame: self.view.bounds, configuration: config)
        
        self.view = self.webView

      
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        

        
        
        var sss = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        println(sss!)
        var url = NSURL(fileURLWithPath: sss!)
        
        var req = NSURLRequest(URL: url!)
        
        self.webView!.loadRequest(req)
        
        
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage){
        
        if(message.name == "callbackHandler") {
            
            println("JavaScript is sending a message \(message.body)")
        }
        

    }




}

