//
//  NewHabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Владимир on 15.05.2023.
//

import UIKit

class NewHabitCollectionViewCell: UICollectionViewCell {
    
     var checkmarkView: SSCheckMark!
    
    //MARK: - UI elements
    
    lazy var nameOfHabitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Название привычки"
        label.textColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.setContentHuggingPriority(.defaultHigh - 1, for: .vertical)
        
        return label
    }()
    
    lazy var dateOfHabit: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "время добавления"
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    lazy var counterOfHabits: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "счетчик"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    private lazy var chosenImageView: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(checkmarkView)
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizationViewCell()
        setupSubviews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: private
    
    private func customizationViewCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    private func setupSubviews() {
        checkmarkView = SSCheckMark()
        checkmarkView.translatesAutoresizingMaskIntoConstraints = false
        checkmarkView.backgroundColor = UIColor.white
        addSubview(nameOfHabitLabel)
        addSubview(dateOfHabit)
        addSubview(counterOfHabits)
        addSubview(checkmarkView)
    }
    //MARK: layout
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            nameOfHabitLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metric.edgeInsetTwenty),
            nameOfHabitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.edgeInsetTwenty),
            
            dateOfHabit.topAnchor.constraint(equalTo: nameOfHabitLabel.bottomAnchor, constant: 4),
            dateOfHabit.leadingAnchor.constraint(equalTo: nameOfHabitLabel.leadingAnchor),
            
            counterOfHabits.topAnchor.constraint(equalTo: dateOfHabit.bottomAnchor, constant: 30),
            counterOfHabits.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.edgeInsetTwenty),
            counterOfHabits.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metric.edgeInsetTwenty),
            
            checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.edgeInsetTwenty),
            checkmarkView.widthAnchor.constraint(equalToConstant: 36),
            checkmarkView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}
