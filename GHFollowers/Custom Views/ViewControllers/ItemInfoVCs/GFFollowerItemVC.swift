//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Olha Pylypiv on 17.06.2024.
//

import UIKit

protocol GFFollowerItemVCDelegate: AnyObject {
    func didTapGetFollowers(for user: User)
}

class GFFollowerItemVC: GFItemInfoVC {
    
    weak var delegate: GFFollowerItemVCDelegate!
    
    init(user: User, delegate: GFFollowerItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureItems()
    }
    
    private func cofigureItems() {
        itemInfoViewOne.set(itemInfiType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfiType: .following, withCount: user.following)
        
        actionButton.set(color: .systemGreen, title: "Get Followers", systemImageName: "person.3")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
