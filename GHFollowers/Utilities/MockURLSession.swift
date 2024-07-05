//
//  MockURLSession.swift
//  GHFollowers
//
//  Created by Olha Pylypiv on 05.07.2024.
//

import Foundation

class MockURLSession: URLSessionProtocol {
    var nextData: Data?
    var nextResponse: URLResponse?
    var nextError: Error?
    
    func data(from url: URL) async throws -> (Data, URLResponse) {
        if let error = nextError {
            throw error
        }
        return (nextData ?? Data(), nextResponse ?? URLResponse())
    }
}

protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}
