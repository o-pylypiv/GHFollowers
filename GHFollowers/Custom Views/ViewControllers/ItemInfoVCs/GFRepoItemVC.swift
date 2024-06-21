//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Olha Pylypiv on 17.06.2024.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureItems()
    }
    
    private func cofigureItems() {
        itemInfoViewOne.set(itemInfiType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfiType: .gists, withCount: user.publicGists)
        
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
