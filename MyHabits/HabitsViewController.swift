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
    
    private func prepareViewController() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Сегодня"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = .purple

    }
    
    @objc private func addTapped() {
        print("New habit")
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
            return HabitsStore.shared.habits.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCollectionViewCell.identifier, for: indexPath) as! ProgressCollectionViewCell
            cell.progressBar.progress = 0.5 //HabitsStore.shared.todayProgress
            cell.progressLabel.text = "50%"//"\(HabitsStore.shared.todayProgress)"
            
            return cell
        }
        return ProgressCollectionViewCell()
    }
    //MARK: - Configure collectionView
    
    private var edgeInset: CGFloat { return 16 }
    private var insetBetweenCells: CGFloat { return 12 }
    
    //size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width = collectionView.bounds.width - edgeInset * 2
            return CGSize(width: width, height: 60)
        }  else {
            return CGSize(width: 343, height: 130)
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
