//
//  NewHabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Владимир on 15.05.2023.
//

import UIKit

class NewHabitCollectionViewCell: UICollectionViewCell {
    //MARK: - UI elements
    
    lazy var nameOfHabitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Название привычки"
        label.textColor = .blue
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
    
}
