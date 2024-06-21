//
//  Follower.swift
//  GHFollowers
//
//  Created by Olha Pylypiv on 11.06.2024.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    //var avatar_url: String //can be converted to camelCase
    var avatarUrl: String
}
