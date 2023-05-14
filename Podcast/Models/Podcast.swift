//
//  Podcast.swift
//  Podcast
//
//  Created by Le Tong Minh Hieu on 08/04/2023.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl60: String?
    var trackCount: Int?
    var feedUrl: String?
}
