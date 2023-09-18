//
//  MakerView.swift
//  collectionView
//
//  Created by Elizabeth Serykh on 18.09.2023.
//

import Foundation
import UIKit

class MakerView {

    
    static let shared = MakerView()
    
    func makeCollectionView (itemSize: CGSize = CGSize(width: 75, height: 30),
                             minLineSpacing: CGFloat = 50,
                             minItemSpacing: CGFloat = 20,
                             scrollDirection: UICollectionView.ScrollDirection = .horizontal,
                             sectionInset: UIEdgeInsets = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30),
                             showIndicator: Bool = false
                             
    ) -> UICollectionView
    {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = itemSize
        layout.minimumLineSpacing = minLineSpacing
        layout.minimumInteritemSpacing = minItemSpacing
        layout.scrollDirection = scrollDirection
        layout.sectionInset = sectionInset
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = showIndicator
        return cv
    }
    
    func makeLabel (text: String = "",
                    textColor: UIColor = .black,
                    font: UIFont = .boldSystemFont(ofSize: 22),
                    textAlignment: NSTextAlignment = .center,
                    numberOfLines: Int = 0,
                    lineBreakMode: NSLineBreakMode = .byWordWrapping
                    ) -> UILabel
    {
        let lb = UILabel()
        lb.text = text
        lb.textColor = textColor
        lb.font = font
        lb.textAlignment = textAlignment
        lb.numberOfLines = numberOfLines
        lb.lineBreakMode = lineBreakMode
        return lb
    }
    
    func makeVIew (backgroundColor: UIColor = .clear,
                   corners: CGFloat = 12
                        ) -> UIView
    {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = corners
        return view
    }
    
    func makeImage (shadowOpacity: Float = 0.5,
                    shadowRadius: CGFloat = 3
                    ) -> UIImageView
    {
        let image = UIImageView()
        image.layer.shadowOpacity = shadowOpacity
        image.layer.shadowRadius = shadowRadius
        return image
    }
    
    func makeButton (title: String = "",
                     titleColor: UIColor = .black,
                     
                     backgroundColor: UIColor = .white,
                     shadowColor: CGColor = UIColor.gray.cgColor,
                     shadowOffset: CGSize = CGSize(width: 0, height: 0),
                     shadowRadius: CGFloat = 4,
                     shadowOpacity: Float = 0.5,
                     borderColor: CGColor = UIColor.black.cgColor,
                     borderWidth: CGFloat = 0,
                     cornerRadius: CGFloat = 6
                    ) -> UIButton
    {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.backgroundColor = backgroundColor
        btn.layer.shadowColor = shadowColor
        btn.layer.shadowOffset = shadowOffset
        btn.layer.shadowRadius = shadowRadius
        btn.layer.shadowOpacity = shadowOpacity
        btn.layer.borderColor = borderColor
        btn.layer.borderWidth = borderWidth
        btn.layer.cornerRadius = cornerRadius
        return btn
    }
    
}

