//
//  ArtModel.swift
//  Assignment3
//
//  Created by Mark Gamble on 3/26/23.
//

import Foundation

struct ArtResponse: Codable {
    let pagination: Pagination
    let data: [ArtModel]
}

struct Pagination: Codable {
    let total: Int
    let limit: Int
    let offset: Int
}

struct ArtModel: Codable, Identifiable {
    let id: Int
    let title: String
    let image_id: String?
    let artist_display: String
    let date_display: String
    let medium_display: String
    let publication_history: String?   
}
