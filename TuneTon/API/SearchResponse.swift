//
//  SearchResponse.swift
//  TuneTon
//
//  Created by Artem Rodionov on 14.06.2024.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String?
    var collectionName: String?
    var artistName: String
    var artworkUrl100: URL?
}


