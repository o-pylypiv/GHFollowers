//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Olha Pylypiv on 12.06.2024.
//

import UIKit

class GFAvatarImageView: UIImageView {
    let placeholderImage = Images.avatarPlaceholder
    let cache = NetworkManager.shared.cache

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
