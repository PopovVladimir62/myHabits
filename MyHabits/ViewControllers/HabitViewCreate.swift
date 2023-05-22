//
//  HabitViewCreate.swift
//  MyHabits
//
//  Created by Владимир on 20.05.2023.
//

import UIKit

class HabitViewCreate: UIViewController {
    
    var dateOfHabit = Date()
    let dateFormatter = DateFormatter()

    //MARK: - UI elements
    //habit's name
    let nameOfHabitStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 7
        
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "НАЗВАНИЕ"
        
        return label
    }()
    
    lazy var nameOfHabit: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Введите название привычки"
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.addTarget(self, action: #selector(textFieldShouldReturn), for: .editingDidEndOnExit)
        
        return textField
    }()
    //habit's color
    
    let colorNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "ЦВЕТ"
        
        return label
    }()
    
    lazy var colorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.tintColor = .blue
        button.addTarget(self, action: #selector(selectColor), for: .touchUpInside)

        return button
    }()
    //habit's time
    
    let timeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "ВРЕМЯ"
        
        return label
    }()
    
    let timeNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Каждый день в "
        
        return label
    }()
    
    lazy var timeDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .purple
        label.text = "часы: минуты"

        return label
    }()
    
    lazy var timePicker: UIDatePicker = {
        let timePicker = UIDatePicker()
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        timePicker.datePickerMode = .time
        
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.addTarget(self, action: #selector(setCurrentTime), for: .valueChanged)
        
        return timePicker
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Удалить привычку", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.isHidden = true
        
        button.addTarget(self, action: #selector(deleteHabit), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewController()
        addSubviews()
        setupConstrains()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeNavigationBar()
    }

    //MARK: - public
    //navigationbar + button methods
    func customizeNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Сохранить", style: .plain, target: self, action: #selector(saveHabit))
        navigationItem.rightBarButtonItem?.tintColor = .purple
        navigationItem.title = "Создать"
    }
    
    //MARK: private
    private func prepareViewController() {
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func addSubviews() {
        view.addSubview(nameOfHabitStackView)
        nameOfHabitStackView.addArrangedSubview(titleLabel)
        nameOfHabitStackView.addArrangedSubview(nameOfHabit)
        view.addSubview(colorNameLabel)
        view.addSubview(colorButton)
        view.addSubview(timeTitleLabel)
        view.addSubview(timeNameLabel)
        view.addSubview(timeDateLabel)
        view.addSubview(timePicker)
        view.addSubview(deleteButton)
    }
    
    func timeFormat() {
        dateFormatter.dateFormat = "h:mm a"
        timeDateLabel.text = dateFormatter.string(from: dateOfHabit)
    }
    //MARK: - #selectors
    @objc func saveHabit() {
        if nameOfHabit.text == "" {
            nameOfHabit.shake()
            return
        }
        print("save new habit")
        let newHabit = Habit(name: nameOfHabit.text!, date: dateOfHabit, color: colorButton.tintColor)
        HabitsStore.shared.habits.append(newHabit)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func selectColor() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        colorButton.tintColor = colorPicker.selectedColor
        nameOfHabit.textColor = colorPicker.selectedColor
        present(colorPicker, animated: true)
    }
    
    @objc func textFieldShouldReturn() -> Bool {
        return view.endEditing(true)
    }
    
    @objc func setCurrentTime() {
        self.dateOfHabit = self.timePicker.date
        timeFormat()
    }
    
    @objc func deleteHabit() {
        
    }

    //MARK: - layout
    
    func setupConstrains() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            nameOfHabitStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 21),
            nameOfHabitStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: Metric.edgeInset),
     
            colorNameLabel.topAnchor.constraint(equalTo: nameOfHabitStackView.bottomAnchor, constant: Metric.insetBetweenUI),
            colorNameLabel.leadingAnchor.constraint(equalTo: nameOfHabitStackView.leadingAnchor),
            
            colorButton.leadingAnchor.constraint(equalTo: nameOfHabitStackView.leadingAnchor),
            colorButton.topAnchor.constraint(equalTo: colorNameLabel.bottomAnchor, constant: Metric.insetBetweenClosestUI),
            colorButton.widthAnchor.constraint(equalToConstant: 40),
            colorButton.heightAnchor.constraint(equalToConstant: 40),
            
            timeTitleLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: Metric.insetBetweenUI),
            timeTitleLabel.leadingAnchor.constraint(equalTo: nameOfHabitStackView.leadingAnchor),
            
            timeNameLabel.topAnchor.constraint(equalTo: timeTitleLabel.bottomAnchor, constant: Metric.insetBetweenClosestUI),
            timeNameLabel.leadingAnchor.constraint(equalTo: nameOfHabitStackView.leadingAnchor),
            
            timeDateLabel.topAnchor.constraint(equalTo: timeTitleLabel.bottomAnchor, constant: Metric.insetBetweenClosestUI),
            timeDateLabel.leadingAnchor.constraint(equalTo: timeNameLabel.trailingAnchor),
            
            timePicker.topAnchor.constraint(equalTo: timeNameLabel.bottomAnchor, constant: Metric.insetBetweenUI),
            timePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -18)
        ])
    }
    
}
//MARK: - extensions for colorPicker

extension HabitViewCreate: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorButton.tintColor = viewController.selectedColor
    }
}
