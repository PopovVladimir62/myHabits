//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Владимир on 22.05.2023.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    //MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewController()
    }
    
    //MARK: - private
    
    private func prepareViewController() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Править", style: .plain, target: self, action: #selector(editHabit))
        navigationItem.rightBarButtonItem?.tintColor = .purple
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "Привычка"
    }
    
    @objc private func editHabit() {
        print("editting habit")
    }
}
