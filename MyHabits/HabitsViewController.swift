//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Владимир on 15.05.2023.
//

import UIKit

final class HabitsViewController: UIViewController {
    
    private lazy var HabitsCollectionView: UICollectionView = {
        let layOut = UICollectionViewFlowLayout()
        layOut.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layOut)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray3
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension HabitsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return HabitsStore.shared.habits.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
