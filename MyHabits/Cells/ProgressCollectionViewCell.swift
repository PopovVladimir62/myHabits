//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Владимир on 15.05.2023.
//

import UIKit

final class ProgressCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI elements
    
    lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .bar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.progress = 0.5
        progressBar.tintColor = .purple
        progressBar.trackTintColor = .systemGray6
        progressBar.transform = CGAffineTransformMakeScale(1, 3)
        progressBar.layer.cornerRadius = 5
        progressBar.clipsToBounds = true
        
        return progressBar
    }()
    
    private var encouragingLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Все получится!"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.text = "50%"
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizationViewCell()
        addSubviews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private functions
    
    private func customizationViewCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    //MARK: - Layout
    
    private func addSubviews() {
        addSubview(progressBar)
        addSubview(encouragingLabel)
        addSubview(progressLabel)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            encouragingLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metric.edgeInset),
            encouragingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.edgeInset),
            
            progressBar.topAnchor.constraint(equalTo: encouragingLabel.bottomAnchor, constant: Metric.insetBetweenElements),
            progressBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metric.edgeInset),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.edgeInset),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.edgeInset),
            
            progressLabel.bottomAnchor.constraint(equalTo: encouragingLabel.bottomAnchor),
            progressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.edgeInset)
        ])
    }
}
