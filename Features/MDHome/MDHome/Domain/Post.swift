//
//  Post.swift
//  MDHome
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//

import Foundation

struct Post: Codable, Identifiable, Equatable {
    var id: Int
    var title: String
    var body: String?
    var userId: Int?

    init(id: Int, title: String, body: String? = nil, userId: Int? = nil) {
        self.id = id
        self.title = title
        self.body = body
        self.userId = userId
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case body
        case userId
    }
}
