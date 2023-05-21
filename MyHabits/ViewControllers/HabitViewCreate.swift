//
//  HabitViewCreate.swift
//  MyHabits
//
//  Created by Владимир on 20.05.2023.
//

import UIKit

class HabitViewCreate: UIViewController {
    //MARK: - UI elements
    
    private let nameOfHabitStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 7
        stackView.backgroundColor = .red
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Название"
        
        return label
    }()
    
    private let nameOfHabit: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "введите название привычки"
        textField.font = UIFont.systemFont(ofSize: 17)
        
        return textField
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewController()
        addSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeNavigationBar()
        navigationController?.navigationBar.setNeedsLayout()
    }

    deinit {
        print("Killed HabitViewCreate scene")
    }
    //MARK: - Private
    private func prepareViewController() {
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addSubviews() {
        view.addSubview(nameOfHabitStackView)
        nameOfHabitStackView.addArrangedSubview(titleLabel)
        nameOfHabitStackView.addArrangedSubview(nameOfHabit)
    }
    //navigationbar + button methods
    private func customizeNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Сохранить", style: .plain, target: self, action: #selector(saveHabit))
        navigationItem.rightBarButtonItem?.tintColor = .purple
        navigationItem.title = "Создать"
    }
    @objc private func saveHabit() {
        print("save new habit")
        //        let newHabit = Habit(name: "Выпить стакан воды перед завтраком",
        //                             date: Date(),
        //                             color: .systemRed)
        //        HabitsStore.shared.habits.append(newHabit)
    }
    
    //MARK: - layout
    
    private func setupConstrains() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            nameOfHabitStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 21),
            nameOfHabitStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: Metric.edgeInset),
            nameOfHabitStackView.heightAnchor.constraint(equalToConstant: 40),
            nameOfHabitStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -Metric.edgeInset)
        ])
    }
    
}
