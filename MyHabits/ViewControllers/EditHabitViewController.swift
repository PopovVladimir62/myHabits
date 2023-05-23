//
//  EditHabitViewController.swift
//  MyHabits
//
//  Created by Владимир on 22.05.2023.
//

import UIKit

final class EditHabitViewController: HabitViewCreate {
    
    var numberOfHabit = 0
    //MARK: lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData(model: store.habits[numberOfHabit])
        setupConstrains()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    //MARK: - overriding
    override func customizeNavigationBar() {
        super.customizeNavigationBar()
        navigationItem.title = "Править"
    }
    
    @objc override func saveHabit() {
        if nameOfHabit.text == "" {
            nameOfHabit.shake()
            return
        }
        saveChanges(data: store.habits)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc override func deleteHabit() {
        let nameOfHabit = store.habits[numberOfHabit].name
        let alert = UIAlertController(title: "УДАЛИТЬ ПРИВЫЧКУ", message: "Вы точно хотите удалить \(nameOfHabit)?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Удалить", style: .default, handler: { action in
            store.habits.remove(at: self.numberOfHabit)
            self.navigationController?.popToRootViewController(animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .default))
        self.present(alert, animated: true)
    }
    //MARK: - private
    
    private func setupData(model: Habit) {
        nameOfHabit.text = model.name
        colorButton.tintColor = model.color
        dateOfHabit = model.date
        timeFormat()
        deleteButton.isHidden = false
    }
    
    private func saveChanges(data: [Habit]) {
        data[numberOfHabit].color = colorButton.tintColor
        data[numberOfHabit].name = nameOfHabit.text!
        data[numberOfHabit].date = dateOfHabit
    }
    
    
}
