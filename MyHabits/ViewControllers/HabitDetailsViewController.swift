//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Владимир on 22.05.2023.
//

import UIKit

final class HabitDetailsViewController: UIViewController {
    
    var numberOfHabit = 0
    var nameOfHabit = "Привычка"
    
    //MARK: - UI elements
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: DetailsTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    //MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewController()
        setupConstrains()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.title = nameOfHabit
        tabBarController?.tabBar.isHidden = false
    }
    //MARK: - private
    
    private func prepareViewController() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Править", style: .plain, target: self, action: #selector(editHabit))
        navigationItem.rightBarButtonItem?.tintColor = .purple
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = nameOfHabit
        view.addSubview(tableView)
    }
    
    @objc private func editHabit() {
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Отменить", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .purple
        let editVC = HabitViewCreate()
        editVC.condition = .edit
        editVC.numberOfHabit = numberOfHabit
        navigationController?.pushViewController(editVC, animated: true)
    }
    //MARK: Layout
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
    //MARK: - tableView extension

extension HabitDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        store.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.identifier, for: indexPath) as! DetailsTableViewCell
        cell.indexPathCell = numberOfHabit
        cell.appDates = indexPath
        cell.setupCell(model: store.dates)
        if indexPath.row == 0 {
            cell.dateLabel.text = "Сегодня"
        } else if indexPath.row == 1 {
            cell.dateLabel.text = "Вчера"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "АКТИВНОСТЬ"
    }
}
