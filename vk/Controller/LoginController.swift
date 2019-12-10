//
//  LoginController.swift
//  vk
//
//  Created by Ksenia on 29.10.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import WebKit


class LoginController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passInput: UITextField!
    @IBOutlet weak var loginInput: UITextField!

    @IBOutlet var oneLoad: UIView!
    @IBOutlet var twoLoad: UIView!
    @IBOutlet var threeLoad: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7240220"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
    }

    func animate_rev(){
        UIView.animate(withDuration: 0.15, delay: 0, animations: {
            self.oneLoad.alpha = 1
        }, completion:
            { _ in
                UIView.animate(withDuration: 0.15, delay: 0, animations: {
                    self.twoLoad.alpha = 1
                }, completion:
                    {
                        _ in
                        UIView.animate(withDuration: 0.15, delay: 0, animations: {
                            self.threeLoad.alpha = 1
                        }, completion: { _ in
                            self.animate() })
                })
        })
    }
    
    func animate(){
        UIView.animate(withDuration: 0.15, delay: 0, animations: {
            self.oneLoad.alpha = 0
        }, completion:
            { _ in
                UIView.animate(withDuration: 0.15, delay: 0, animations: {
                    self.twoLoad.alpha = 0
                }, completion:
                    {
                        _ in
                        UIView.animate(withDuration: 0.15, delay: 0, animations: {
                            self.threeLoad.alpha = 0
                        }, completion: { _ in
                            
                            self.animate_rev()
                            
                        })
                })
        })
    }
    
    func downloadAnimate(){
        animate()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let login = loginInput.text!
        let password = passInput.text!
        if login == "" && password == "" {
            print("OK")
        } else {
            print("KO")
            return
        }
        performSegue(withIdentifier: "Login Segue", sender: nil)
    }
    
    @objc func keyboardWasShown(notification: Notification) {
           // Получаем размер клавиатуры
           let info = notification.userInfo! as NSDictionary
           let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
           let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
           // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
           self.scrollView?.contentInset = contentInsets
           scrollView?.scrollIndicatorInsets = contentInsets
       }
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        downloadAnimate()
    }
    
}
