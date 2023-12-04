//
//  ViewController.swift
//  CW1
//
//  Created by Mac on 03.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "My first app"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .blue
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Next screen", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white  // Задаем цвет экрана
        setupViews()
    }
    
    private func setupViews(){
        view.addSubview(label)
        view.addSubview(button)
        setupConstraints()
        button.addTarget(self, action: #selector(tap), for: .touchUpInside) // вызов свойства кнопки - нажатие (кто нажимает, что при этом вызывается, для какого вида контакта с кнопкой)
    }
    
    private func setupConstraints(){
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20), // привязка положения лейбла к "челке" экрана по вертикали
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor), // привязка положения лейбла по горизонтали относительно центра экрана
            label.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5), // ширина лейбла зависит от ширины экрана (меньше в 1,5 раза)
            label.heightAnchor.constraint(equalToConstant: view.frame.width / 4), // высота лейбла зависит от ширины экрана (меньше в 4 раза)
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.widthAnchor.constraint(equalToConstant: view.frame.width),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    /**
        функция objc, описывающая как осуществляется переход при нажатии кнопки
     */
    @objc func tap() {
        navigationController?.pushViewController(NewViewController(), animated: true)
    }
}
