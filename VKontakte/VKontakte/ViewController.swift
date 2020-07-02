//
//  ViewController.swift
//  VKontakte
//
//  Created by Анна Ковтун on 02.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var pswdInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var authButton: UIButton!
    

    // Когда клавиатура появляется
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
        self.scrollView.endEditing(true)
    }
    
    @IBAction func auth(_ sender: Any) {
        // Получаем текст логина
        let login = loginInput.text!
        // Получаем текст-пароль
        let password = pswdInput.text!
        
        // Проверяем, верны ли они
        if login == "admin" && password == "123456" {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView.addGestureRecognizer(hideKeyboardGesture)
        
        authButton.backgroundColor = .blue
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func pswdInputEditingDidBegin(_ sender: Any) {
        if pswdInput.text == "Пароль" {
            pswdInput.text = ""
        }
    }
    
    @IBAction func pswdInputEditingDidEnd(_ sender: Any) {
        if pswdInput.text == "" {
                   pswdInput.text = "Пароль"
               }
    }
    
    @IBAction func loginInputEditingDidBegin(_ sender: Any) {
        if loginInput.text == "Логин" {
            loginInput.text = ""
        }
    }
    
    @IBAction func loginInputEditingDidEnd(_ sender: Any) {
        if loginInput.text == "" {
            loginInput.text = "Логин"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

    
}

