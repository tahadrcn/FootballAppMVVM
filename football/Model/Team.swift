//
//  Team.swift
//  football
//
//  Created by Taha Dirican on 12.06.2024.
//

import Foundation

struct Team: Identifiable, Decodable {
    let id: Int
    let name: String
    let founded: Int?
    let venue: String?
    let crestUrl: String?
    let website: String?
    let clubColors: String?
}


