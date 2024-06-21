//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Olha Pylypiv on 17.06.2024.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureItems()
    }
    
    private func cofigureItems() {
        itemInfoViewOne.set(itemInfiType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfiType: .following, withCount: user.following)
        
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
