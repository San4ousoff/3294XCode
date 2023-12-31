//
//  ViewController.swift
//  HW3
//
//  Created by Mac on 07.12.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        webView.frame = view.bounds
        
        // встраиваемое приложение
        if let url = URL(string: "https://oauth.vk.com/authorize?client_id=51810008&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&scope=friends,groups,photos&response_type=token&v=5.35&state=123456") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        // собираем словарь из полученной ссылки
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        // извлекаем токен и ID пользователя, если не получилось - сообщаем об ошибке
        if let token = params["access_token"], let userId = params["user_id"] {
            print("Token: \(token)")
            print("User ID: \(userId)")
            
        // создание tabBarController с полученным токеном
        let tabBarController = TabBarController(token: token)
        // установка FriendsViewController как активного (может лишнее)
        tabBarController.selectedViewController = tabBarController.viewControllers?[0]
            
        UIApplication.shared.windows.first?.rootViewController = tabBarController
        } else {
            print("Ошибка: Не удалось извлечь access_token и user_id из фрагмента URL")
        }
        
        decisionHandler(.cancel)
        webView.removeFromSuperview()
    }
}
    
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//        // Создаем кнопку "Enter"
//        let button = UIButton()
//        button.setTitle("Enter", for: .normal)
//        button.setTitleColor(.systemBlue, for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
//
//        view.addSubview(button)
//        setupConstraints()
//
//        func setupConstraints() {
//            view.addSubview(button)
//            NSLayoutConstraint.activate(ConstraintFactory.center(in: view, withSubview: button))
//            button.widthAnchor.constraint(equalToConstant: 200).isActive = true
//            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        }
//
//    }
//
//    @objc func enterButtonTapped() {
//        let tabBarController = TabBarController()
//        navigationController?.pushViewController(tabBarController, animated: true)
//    }
//}

