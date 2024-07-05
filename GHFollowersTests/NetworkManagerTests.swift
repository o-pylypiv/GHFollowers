//
//  NetworkManagerTests.swift
//  GHFollowersTests
//
//  Created by Olha Pylypiv on 04.07.2024.
//

import XCTest
@testable import GHFollowers

final class NetworkManagerTests: XCTestCase {
    var networkManager: NetworkManager!
    var mockURLSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
        networkManager = NetworkManager.createNetworkManager(session: mockURLSession)
    }
    
    override func tearDown() {
        networkManager = nil
        mockURLSession = nil
        super.tearDown()
    }
    
    func testDecodeJSON() throws {
        // Arrange
        let jsonString = """
                {
                    "login": "johndoe",
                    "avatar_url": "https://example.com/avatar.png",
                    "name": "John Doe",
                    "location": "New York",
                    "bio": "No bio",
                    "public_repos": 1,
                    "public_gists": 0,
                    "html_url": "https://example.com/html.url",
                    "following": 6,
                    "followers": 8,
                    "created_at": "2018-04-01T15:20:15-07:00"
                }
                """
        let data = jsonString.data(using: .utf8)!
        
        // Act
        let user = try networkManager.decoder.decode(User.self, from: data)
        
        // Assert
        XCTAssertEqual(user.login, "johndoe")
        XCTAssertEqual(user.avatarUrl, "https://example.com/avatar.png")
        XCTAssertEqual(user.name, "John Doe")
        XCTAssertEqual(user.location, "New York")
        XCTAssertEqual(user.bio, "No bio")
        XCTAssertEqual(user.publicRepos, 1)
        XCTAssertEqual(user.publicGists, 0)
        XCTAssertEqual(user.htmlUrl, "https://example.com/html.url")
        XCTAssertEqual(user.following, 6)
        XCTAssertEqual(user.followers, 8)
    }
    
    func testGetFollowers_Success() async throws {
        // Arrange
        let jsonString = """
            [
                {
                    "login": "johndoe",
                    "avatar_url": "https://example.com/avatar.png"
                }
            ]
            """
        let data = jsonString.data(using: .utf8)!
        
        mockURLSession.nextData = data
        mockURLSession.nextResponse = HTTPURLResponse(url: URL(string: "https://api.github.com/users/johndoe/followers?per_page=100&page=1")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        // Act
        let followers = try await networkManager.getFollowers(for: "johndoe", page: 1)
        
        // Assert
        XCTAssertEqual(followers.count, 1)
        XCTAssertEqual(followers.first?.login, "johndoe")
        XCTAssertEqual(followers.first?.avatarUrl, "https://example.com/avatar.png")
    }
    
    func testGetUserInfo_Success() async throws {
        // Arrange
        let jsonString = """
                {
                    "login": "johndoe",
                    "avatar_url": "https://example.com/avatar.png",
                    "name": "John Doe",
                    "location": "New York",
                    "bio": "No bio",
                    "public_repos": 1,
                    "public_gists": 0,
                    "html_url": "https://example.com/html.url",
                    "following": 6,
                    "followers": 8,
                    "created_at": "2018-04-01T15:20:15-07:00"
                }
                """
        let data = jsonString.data(using: .utf8)!
        mockURLSession.nextData = data
        mockURLSession.nextResponse = HTTPURLResponse(url: URL(string: "https://api.github.com/users/johndoe")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        // Act
        let user = try await networkManager.getUserInfo(for: "johndoe")
        
        // Assert
        XCTAssertEqual(user.login, "johndoe")
        XCTAssertEqual(user.avatarUrl, "https://example.com/avatar.png")
        XCTAssertEqual(user.name, "John Doe")
        XCTAssertEqual(user.location, "New York")
        XCTAssertEqual(user.bio, "No bio")
        XCTAssertEqual(user.publicRepos, 1)
        XCTAssertEqual(user.publicGists, 0)
        XCTAssertEqual(user.htmlUrl, "https://example.com/html.url")
        XCTAssertEqual(user.following, 6)
        XCTAssertEqual(user.followers, 8)
    }
    
    func testDownloadImage_Success() async {
        // Arrange
        let imageUrlString = "https://via.placeholder.com/100x100"
        let image = UIImage(resource: .ghLogo)
        let imageData = image.jpegData(compressionQuality: 1.0)!
        
        mockURLSession.nextData = imageData
        mockURLSession.nextResponse = HTTPURLResponse(url: URL(string: imageUrlString)!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        // Act
        let downloadedImage = await networkManager.downloadImage(from: imageUrlString)
        
        // Assert
        XCTAssertNotNil(downloadedImage)
        XCTAssertEqual(networkManager.cache.object(forKey: NSString(string: imageUrlString)), downloadedImage)
    }
}
