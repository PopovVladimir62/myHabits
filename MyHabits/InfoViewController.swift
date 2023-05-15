//
//  SecondViewController.swift
//  Habits
//
//  Created by Владимир on 11.05.2023.
//

import UIKit

final class InfoView: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " Привычка за 21 день"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = .black
        label.textAlignment = .left
        
        return label
    }()
    
    private let textInfo: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .black
        textView.textAlignment = .left
        textView.isUserInteractionEnabled = true
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        textView.font = UIFont.boldSystemFont(ofSize: 17.0)
        textView.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:\n\n 1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага.\n\n2. Выдержать 2 дня в прежнем состоянии самоконтроля.\n\n3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться.\n\n 4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств.\n\n 5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой.\n\n\n\n"
        
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        prepareView()
        setupConstrains()
    }
    
    private func prepareView() {
        view.backgroundColor = .white
        self.navigationItem.title = "Информация"
    }
    
    //MARK: - Layout
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(textInfo)
    }
    
    private func setupConstrains() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 22),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            textInfo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            textInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textInfo.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
