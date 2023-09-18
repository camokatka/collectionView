//
//  ViewController.swift
//  collectionView
//
//  Created by Elizabeth Serykh on 16.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var isSelected: [Bool] = []
    
    var counter = 1
    let price = 12
    let size = 8
    
    let backBtn = MakerView.shared.makeButton()
    let likeBtn = MakerView.shared.makeButton()
    
    let topLabel = MakerView.shared.makeLabel(text: "Detail")
    let pizzaImg = MakerView.shared.makeImage()
    let pizzaLabel = MakerView.shared.makeLabel(text: "Pizza with Mushrooms",
                                                font: .boldSystemFont(ofSize: 32))
    
    let CVLabel = MakerView.shared.makeLabel(text: "Choose the size")
    let collectionView = MakerView.shared.makeCollectionView()
    
    let countView = MakerView.shared.makeVIew(backgroundColor: .systemGray3)
    let plusBtn = MakerView.shared.makeButton(title: "+",
                                              backgroundColor: .clear)
    let countLabel = MakerView.shared.makeLabel(font: .boldSystemFont(ofSize: 30))
    let minusBtn = MakerView.shared.makeButton(title: "-",
                                               backgroundColor: .clear)
    
    let priceNameLabel = MakerView.shared.makeLabel(text: "Price",
                                                    textColor: .darkGray,
                                                    font: .systemFont(ofSize: 12))
    
    let priceLabel = MakerView.shared.makeLabel(textColor: .systemGreen,
                                                font: .boldSystemFont(ofSize: 24))
    
    let addBtn = MakerView.shared.makeButton(title: "Add to Card",
                                             titleColor: .white,
                                             backgroundColor: .orange)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTopButtons()
        initImgAndLabels()
        initCVAndLabel()
        initCountView()
        initPriceView()
        initAddBtn()
    }
    
    private func initTopButtons() {
        
        view.backgroundColor = .white
        view.addSubview(backBtn)
        backBtn.setImage(UIImage(systemName: "left"), for: .normal)
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            backBtn.widthAnchor.constraint(equalToConstant: 30),
            backBtn.heightAnchor.constraint(equalToConstant: 30),
            backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
        
        view.addSubview(likeBtn)
        likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        likeBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeBtn.widthAnchor.constraint(equalToConstant: 30),
            likeBtn.heightAnchor.constraint(equalToConstant: 30),
            likeBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            likeBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    private func initImgAndLabels() {
        
        view.addSubview(topLabel)
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(pizzaLabel)
        
        pizzaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pizzaLabel.widthAnchor.constraint(equalToConstant: 190),
            pizzaLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 50),
            pizzaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(pizzaImg)
        
        pizzaImg.image = UIImage(named: "pizza")
        
        pizzaImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pizzaImg.widthAnchor.constraint(equalToConstant: 190),
            pizzaImg.heightAnchor.constraint(equalToConstant: 160),
            pizzaImg.topAnchor.constraint(equalTo: pizzaLabel.topAnchor, constant: 100),
            pizzaImg.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
    }
    
    private func initCVAndLabel() {
        
        view.addSubview(CVLabel)
        
        CVLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            CVLabel.topAnchor.constraint(equalTo: pizzaImg.bottomAnchor, constant: 50),
            CVLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CVCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            collectionView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            collectionView.topAnchor.constraint(equalTo: CVLabel.bottomAnchor, constant: 20),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        for _ in 0...collectionView.numberOfItems(inSection: 0) - 1 {
            isSelected.append(false)
        }
    }
    
    private func initCountView() {
        
        view.addSubview(countView)
        
        countView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countView.widthAnchor.constraint(equalToConstant: 210),
            countView.heightAnchor.constraint(equalToConstant: 60),
            countView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            countView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        countView.addSubview(countLabel)
        countLabel.text = "\(counter)"
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countLabel.widthAnchor.constraint(equalToConstant: 70),
            countLabel.heightAnchor.constraint(equalToConstant: 60),
            countLabel.topAnchor.constraint(equalTo: countView.topAnchor),
            countLabel.centerXAnchor.constraint(equalTo: countView.centerXAnchor)
        ])
        
        countView.addSubview(minusBtn)
        
        minusBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            minusBtn.heightAnchor.constraint(equalToConstant: 60),
            minusBtn.widthAnchor.constraint(equalToConstant: 70),
            minusBtn.topAnchor.constraint(equalTo: countView.topAnchor),
            minusBtn.trailingAnchor.constraint(equalTo: countLabel.leadingAnchor)
        ])
        minusBtn.addTarget(self, action: #selector(counterMin), for: .touchUpInside)
        
        countView.addSubview(plusBtn)
        
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            plusBtn.heightAnchor.constraint(equalToConstant: 60),
            plusBtn.widthAnchor.constraint(equalToConstant: 90),
            plusBtn.topAnchor.constraint(equalTo: countView.topAnchor),
            plusBtn.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor)
        ])
        plusBtn.addTarget(self, action: #selector(counterPls), for: .touchUpInside)
        
    }
    
    private func initPriceView() {
        
        view.addSubview(priceNameLabel)
        
        priceNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceNameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            priceNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
        
        view.addSubview(priceLabel)
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: priceNameLabel.bottomAnchor, constant: 2),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
        priceLabel.text = "\(price).00 $"
    }
    
    private func initAddBtn() {
        
        view.addSubview(addBtn)
        
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addBtn.widthAnchor.constraint(equalToConstant: 150),
            addBtn.heightAnchor.constraint(equalToConstant: 50),
            addBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            addBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
    }
    
    @objc func counterMin() {
        
        if counter > 0 {
            counter -= 1
        }
        countLabel.text = "\(counter)"
        priceLabel.text = "\(Int(price) * counter).00 $"

    }
    
    @objc func counterPls() {
        
        counter += 1
        countLabel.text = "\(counter)"
        priceLabel.text = "\(Int(price) * counter).00 $"
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CVCell
        let inches = Int(size) * (indexPath.row + 1)
        cell.setData(text: "\(inches) inches")
        if isSelected[indexPath.row] {
            cell.changeColorsIn()
        } else {
            cell.changeColorsOut()
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        for i in 0...collectionView.numberOfItems(inSection: 0) - 1{
            if i == indexPath.row {
                isSelected[i] = true
            } else {
                isSelected[i] = false
            }
        }
        collectionView.reloadData()
    }
    
}
