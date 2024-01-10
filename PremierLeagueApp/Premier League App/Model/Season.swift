//
//  Season.swift
//  Premier League App
//
//  Created by Momcilo Bogunovic on 10.01.24.
//

import Foundation


struct SeasonResponse: Codable, Hashable{
    let data: SeasonData
}

struct SeasonData: Codable, Hashable{
    let seasons: [Season]
}



struct Season: Codable, Hashable{
    let year: Int
    let displayName: String
}
