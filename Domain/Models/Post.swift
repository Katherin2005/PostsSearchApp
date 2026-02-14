//
//  Post.swift
//  
//
//  Created by user287784 on 13/02/26.
//


struct Post: Decodable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
