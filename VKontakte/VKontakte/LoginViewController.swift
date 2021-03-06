//
//  LoginViewController.swift
//  VKontakte
//
//  Created by Анна Ковтун on 02.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var pswdInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var authButton: UIButton!

    @IBOutlet weak var loadTextView: UIView!
    @IBOutlet weak var firstLoadText: UILabel!
    @IBOutlet weak var secondLoadText: UILabel!
    @IBOutlet weak var lastLoadText: UILabel!
    
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
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Проверяем данные
        let checkResult = checkUserData()
        
        // Если данные не верны, покажем ошибку
        if !checkResult {
            showLoginError()
        }
        
        // Вернем результат
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let login = loginInput.text,
            let password = pswdInput.text else { return false }
        
        if login == "admin" && password == "123456" {
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        // Создаем контроллер
        let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alter.addAction(action)
        // Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView.addGestureRecognizer(hideKeyboardGesture)
        
        authButton.backgroundColor = .blue
        
        loadAnimation()
       
        
        
    }
    
    func loadAnimation() {
        UIView.animate(withDuration: 2, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.firstLoadText.alpha = 0.1
        })
        UIView.animate(withDuration: 2, delay: 1, options: [.autoreverse, .repeat], animations: {
            self.secondLoadText.alpha = 0.1
        })
        UIView.animate(withDuration: 2, delay: 2, options: [.autoreverse, .repeat], animations: {
            self.lastLoadText.alpha = 0.1
        })
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
    

    
}

