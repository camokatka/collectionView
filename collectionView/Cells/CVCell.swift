//
//  CVCell.swift
//  collectionView
//
//  Created by Elizabeth Serykh on 18.09.2023.
//

import UIKit

class CVCell: UICollectionViewCell {
    
    let cellLabel = MakerView.shared.makeLabel(textColor: .darkGray,
                                               font: .systemFont(ofSize: 14))
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        initCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initCell() {
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowRadius = 3
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        contentView.addSubview(cellLabel)
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cellLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setData(text: String) {
        cellLabel.text = text
    }
    
    func changeColorsIn() {
        contentView.backgroundColor = .darkGray
        cellLabel.textColor = .white
    }
    
    func changeColorsOut() {
        contentView.backgroundColor = .white
        cellLabel.textColor = .darkGray
    }
}
