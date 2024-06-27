//
//  GFItemInfoVC.swift
//  GHFollowers
//
//  Created by Olha Pylypiv on 17.06.2024.
//

import UIKit

class GFItemInfoVC: UIViewController {
    
    let stackView = UIStackView()
    let itemInfoViewOne = GFItemInfoView()
    let itemInfoViewTwo = GFItemInfoView()
    let actionButton = GFButton()
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureBackgroundView()
        configureActionButton()
        configureStackView()
        layoutUI()
    }
    
    private func cofigureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
    }
    
    private func configureActionButton() {
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc func actionButtonTapped() {}
    
    private func layoutUI() {
        view.addSubviews(stackView, actionButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let paddind: CGFloat = 20
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: paddind),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: paddind),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -paddind),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -paddind),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: paddind),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -paddind),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
