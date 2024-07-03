//
//  Constants.swift
//  GHFollowers
//
//  Created by Olha Pylypiv on 14.06.2024.
//

import UIKit

enum SFSymbols {
    
    static let location = UIImage(systemName: "mappin.and.ellipse")
    static let repos = UIImage(systemName: "folder")
    static let gists = UIImage(systemName: "text.alignleft")
    static let followers = UIImage(systemName: "heart")
    static let following = UIImage(systemName: "person.2")
}

enum Images {
    
    static let ghLogo = UIImage(resource: .ghLogo)
    static let avatarPlaceholder = UIImage(resource: .avatarPlaceholder)
    static let emptyStateLogo = UIImage(resource: .emptyStateLogo)
}

enum ScreenSize {
    
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
}

enum DeviceTypes {
    
    static let ididom = UIDevice.current.userInterfaceIdiom
    static let nativeScale = UIScreen.main.nativeScale
    static let scale = UIScreen.main.scale
    
    static let isiPhoneSE = ididom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhone8Standard = ididom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    static let isiPhone8Zoomed = ididom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    static let isiPhone8PlusStandard = ididom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone8PlusZoomed = ididom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale
    static let isiPhoneX = ididom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhoneXsMaxAndXr = ididom == .phone && ScreenSize.maxLength == 896.0
    static let isiPad = ididom == .pad && ScreenSize.maxLength >= 1024
    
    static func isiPhoneXAspectRatio() -> Bool {
        return isiPhoneX || isiPhoneXsMaxAndXr
    }
}
