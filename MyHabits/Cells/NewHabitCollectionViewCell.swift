//
//  NewHabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Владимир on 15.05.2023.
//

import UIKit

protocol addingTodaysDay: AnyObject {
    func takingToday(indexPath: IndexPath, cell: NewHabitCollectionViewCell)
}

class NewHabitCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: addingTodaysDay?
    var indexPathCell = IndexPath()
    
    //MARK: - UI elements
    
    lazy var nameOfHabitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Название привычки"
        label.textColor = .blue
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 17)
        
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
    
    lazy var isAlreadyTakenTodayButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .blue
        button.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        button.addTarget(self, action: #selector(takenTodayAction), for: .touchUpInside)
        
        return button
    }()
    //MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizationViewCell()
        setupSubviews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        counterOfHabits.text = nil
        dateOfHabit.text = nil
        nameOfHabitLabel.text = nil
        isAlreadyTakenTodayButton.tintColor = nil
        nameOfHabitLabel.textColor = nil
    }
    //MARK: - public
    
    func setupCell(model: Habit) {
        counterOfHabits.text = "\(model.trackDates.count)"
        dateOfHabit.text = model.dateString
        nameOfHabitLabel.text = model.name
        isAlreadyTakenTodayButton.tintColor = model.color
        nameOfHabitLabel.textColor = model.color
        if model.isAlreadyTakenToday == true {
            isAlreadyTakenTodayButton.setBackgroundImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        } else {
            isAlreadyTakenTodayButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        }
    }
    
    
    //MARK: - private
    
    private func customizationViewCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    private func setupSubviews() {
        addSubview(nameOfHabitLabel)
        addSubview(dateOfHabit)
        addSubview(counterOfHabits)
        addSubview(isAlreadyTakenTodayButton)
    }
    
    @objc func takenTodayAction() {
        delegate?.takingToday(indexPath: indexPathCell, cell: self)
        isAlreadyTakenTodayButton.setBackgroundImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
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
            
            isAlreadyTakenTodayButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            isAlreadyTakenTodayButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.edgeInsetTwenty),
            isAlreadyTakenTodayButton.widthAnchor.constraint(equalToConstant: 36),
            isAlreadyTakenTodayButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}
