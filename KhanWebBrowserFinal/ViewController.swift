//
//  ViewController.swift
//  KhanWebBrowserFinal
//
//  Created by Omer Khan on 11/1/16.
//  Copyright © 2016 Omer Khan. All rights reserved.
//

import UIKit
import Foundation
import WebKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var yahoo: UIButton!
    
    @IBOutlet var urlEnter: UITextField!
    
    @IBOutlet var act: UIActivityIndicatorView!
   
    @IBOutlet var webView: UIWebView!
   // @IBOutlet var act: UIActivityIndicatorView!

    @IBOutlet var searchEnter: UITextField!
    
    @IBOutlet var image: UIButton!

    @IBOutlet var google: UIButton!
 
    @IBAction func go(_ sender: AnyObject)
    {
        
        
        
        
        
       
      
     
        
        
    }
    
    
    @IBAction func googleclick(_ sender: AnyObject) {
        
        image.isHidden = false //bing shows up
        google.isHidden = true //google goes away
        
    }
    
    
    
    
    @IBAction func bingclick(_ sender: AnyObject) {
        
        yahoo.isHidden = false //yahoo shows up
        image.isHidden = true //bing goes away
      
        
    }
    
    
    @IBAction func yahooclick(_ sender: AnyObject)
    
    {
        google.isHidden = false
        yahoo.isHidden = true
        
    }
        
    
    
    // Start Editing The Text Field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if(textField==searchEnter)
        {
        
        moveTextField(textField: textField, moveDistance: -275, up: true)
        }
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if(textField==searchEnter)
        {
        
        
        moveTextField(textField: textField, moveDistance: -275, up: false)
            
        }
    }
    

    
    // Move the text field in a pretty animation!
    func moveTextField(textField: UITextField, moveDistance: Int, up: Bool) {
       
        
        
        let moveDuration = 0.3
        
        
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
   
    
    
    @IBAction func searchGo(_ sender: AnyObject)
    
    {
         searchEnter.endEditing(true)
        let searchString = String(searchEnter.text!)
        let newString = searchString.replacingOccurrences(of: " ", with: "+")
    
        
        //var searchString = String(searchEnter.text!)!
       // var s = searchString as NSString
        
        var url = URL(string: "https://www.google.com/search?q=\(newString)")!
        
        if(google.isHidden==false)
        {
            url = URL(string: "https://www.google.com/search?q=\(newString)")!
        }
        
        else if(image.isHidden==false)
        {
            url = URL(string: "https://www.bing.com/search?q=\(newString)")!

        }
        
        else if(yahoo.isHidden==false)
        {
            url = URL(string: "https://search.yahoo.com/search;_ylc=X3oDMTFiN25laTRvBF9TAzIwMjM1MzgwNzUEaXRjAzEEc2VjA3NyY2hfcWEEc2xrA3NyY2h3ZWI-?p=\(newString)")!
            
        }

        
        webView.loadRequest(URLRequest(url: url))
        
        
    }
    
    @IBOutlet var forwa: UIBarButtonItem!
   
    @IBAction func Forward(_ sender: AnyObject)
    {
        
        webView.goForward()
    }
    
    
    
    @IBOutlet var back: UIBarButtonItem!
    
    
    
    
    
    @IBAction func goBack(_ sender: AnyObject)
    {
     
       webView.goBack()
        
    }
    
    
    @IBAction func Refresh(_ sender: AnyObject)
    {
       
        
        searchEnter.endEditing(true)
        
        webView.reload()
        
    }
    
    @IBAction func Sto(_ sender: AnyObject)
    {
        
        webView.stopLoading()
        
        
    }
   
   
    
    
    func webViewDidStartLoad(_ : UIWebView)
    {
        act.startAnimating()
        
    }
    
    
    func webViewDidFinishLoad(_ : UIWebView)
    {
        act.stopAnimating()
        
        if(webView.canGoBack==false)
        {
            back.tintColor = UIColor.gray
        }
        
        
        if(webView.canGoBack==true)
        {
            back.tintColor = UIColor.red
        }
        
        if(webView.canGoForward==false)
        {
            forwa.tintColor = UIColor.gray
        }
        
        
        if(webView.canGoForward==true)
        {
            forwa.tintColor = UIColor.red
        }
        
        
        
        
        
        
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
       
        self.urlEnter.resignFirstResponder()
        
        
        
        
        
        urlEnter.endEditing(true)
        
        let urlString = String(urlEnter.text!)
        
        if urlString.contains("https://") && urlString.contains(".com")
        {
            
            let url = URL(string: "\(urlEnter.text!)")!
            webView.loadRequest(URLRequest(url: url))
            
            
            
            
        }
        
        
        if (urlString.contains("https://") && urlString.contains(".com")) == false
        {
            
            let url = URL(string: "https://" + "\(urlEnter.text!)" + ".com")!
            webView.loadRequest(URLRequest(url: url))
        }
        
        
        
        if urlString.contains("https://") == false && urlString.contains(".com") == true
        {
            let url = URL(string: "https://" + "\(urlEnter.text!)")!
            webView.loadRequest(URLRequest(url: url))
        }
        
        

        
        
        self.searchEnter.resignFirstResponder()
        
        
        return true
    }
    
    let url2 = URL(string: "https://google.com")
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchEnter.delegate=self
        let url = URL(string: "https://google.com")
        self.urlEnter.returnKeyType = UIReturnKeyType.go
        
        webView.loadRequest(URLRequest(url: url!))
        
        image.isHidden = true
        yahoo.isHidden = true
        
        
        

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

