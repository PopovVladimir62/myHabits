//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Владимир on 15.05.2023.
//

import UIKit

final class HabitsViewController: UIViewController {
    
    //MARK: - Collection
    
    private lazy var habitsCollectionView: UICollectionView = {
        let layOut = UICollectionViewFlowLayout()
        layOut.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layOut)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray3
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.identifier)
        collectionView.register(NewHabitCollectionViewCell.self, forCellWithReuseIdentifier: NewHabitCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewController()
        addSubviews()
        setupConstrains()
    }

    //MARK: - private
    
    private func prepareViewController() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Сегодня"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = .purple
        self.navigationItem.largeTitleDisplayMode = .always

    }
    
    @objc private func addTapped() {
        print("New habit")
        let newHabit = HabitViewCreate()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .purple
        navigationController?.pushViewController(newHabit, animated: true)
    }
    
    //MARK: - Layout
    
    private func addSubviews() {
        view.addSubview(habitsCollectionView)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            habitsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            habitsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
//MARK: - Extension

extension HabitsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 1//HabitsStore.shared.habits.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCollectionViewCell.identifier, for: indexPath) as! ProgressCollectionViewCell
            cell.progressBar.progress = HabitsStore.shared.todayProgress
            cell.progressLabel.text = String(Int(HabitsStore.shared.todayProgress)) + "%"

            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewHabitCollectionViewCell.identifier, for: indexPath) as! NewHabitCollectionViewCell
            cell.counterOfHabits.text = "2"
            cell.dateOfHabit.text = "каждый день в 08:00"
            cell.nameOfHabitLabel.text = "Пробежка"
            cell.checkmarkView.checked = false
            
            return cell
        }
    }
    

    //MARK: - Configure collectionView
    
    private var edgeInset: CGFloat { return 16 }
    private var insetBetweenCells: CGFloat { return 12 }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    //size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - edgeInset * 2
        if indexPath.section == 0 {
            return CGSize(width: width, height: 60)
        }  else {
            return CGSize(width: width, height: 117)
        }
    }
    
    //size of edge insets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: insetBetweenCells, left: edgeInset, bottom: insetBetweenCells, right: edgeInset)
    }
    
    //size between sections
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
}
