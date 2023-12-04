//
//  ViewController.swift
//  HW1
//
//  Created by Mac on 03.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // создание экземпляра картинки
    private let image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "GB"))
        return image
    }()
    
    // создание экземпляра лейбла
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .gray
        return label
    }()
    
    // создание экземпляра текстового поля для логина
    private let textFieldLogin: UITextField = {
        let textFieldLogin = UITextField()
        textFieldLogin.placeholder = "Введите логин"
        textFieldLogin.textColor = .black
        textFieldLogin.borderStyle = .roundedRect
        textFieldLogin.textAlignment = .center
        return textFieldLogin
    }()
    
    // создание экземпляра текстового поля для пароля
    private let textFieldPassword: UITextField = {
        let textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Введите пароль"
        textFieldPassword.textColor = .black
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.textAlignment = .center
        return textFieldPassword
    }()
    
    // создание экземпляра кнопки
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray // цвет view
        setupViews()
    }
    
    private func setupViews(){
        // добавляем элементы на view
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(textFieldLogin)
        view.addSubview(textFieldPassword)
        view.addSubview(button)
        setupConstraints()
    }

    private func setupConstraints(){
        // отключаем встроенное поведение
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        textFieldLogin.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // активируем и настраиваем constraint для всех элементов на view
        NSLayoutConstraint.activate([
            
            // параметры constraint для картинки (10 под челкой, по центру оси Х, 20% от ширины view, квадратная)
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            
            // параметры constraint для лейбла (60 под картинкой, по центру оси Х, вся ширина view)
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 60),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // параметры constraint для текстового поля для логина (20 под лейблом, по центру оси Х, ширина 50% view)
            textFieldLogin.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textFieldLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldLogin.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            // параметры constraint для текстового поля для пароля (10 под полем для логина, по центру оси Х, ширина 50% view)
            textFieldPassword.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor, constant: 10),
            textFieldPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldPassword.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            // параметры constraint для кнопки (нижний край = нижнему краю view, по центру оси Х, ширина 50% view)
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

