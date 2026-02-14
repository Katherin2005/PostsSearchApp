//
//  APIServiceProtocol.swift
//  
//
//  Created by user287784 on 13/02/26.
//

protocol APIServiceProtocol {
    func fetchPosts() async throws -> [Post]
}
