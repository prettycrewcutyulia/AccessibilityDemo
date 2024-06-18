//
//  ViewController.swift
//  AccessibilityDemo2
//
//  Created by Юлия Гудошникова on 18.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Создание и настройка UILabel
        let label = UILabel()
        label.text = "Добро пожаловать"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        // Добавление доступности к UILabel
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        label.accessibilityLabel = "Добро пожаловать"
        label.accessibilityHint = "Проект о доступности"
        
        // Создание и настройка UIButton
        let button = UIButton(type: .system)
        button.setTitle("Узнать больше", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        // Добавление доступности к UIButton
        button.isAccessibilityElement = true
        button.accessibilityLabel = "Узнать больше"
        button.accessibilityHint = "Нажмите, чтобы получить дополнительную информацию"
        
        // Настройка констрейнтов
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        ])
        
        // Добавление действия для кнопки
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction() {
        // Действие при нажатии на кнопку
        let alert = UIAlertController(
            title: "Узнать больше",
            message: "Здесь могут быть дополнительные материалы.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

