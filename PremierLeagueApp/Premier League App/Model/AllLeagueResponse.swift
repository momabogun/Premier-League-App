//
//  AllLeagueResponse.swift
//  Premier League App
//
//  Created by Momcilo Bogunovic on 10.01.24.
//

import Foundation
struct AllLeagueResponse: Codable, Hashable{
    let data : [AllLeague]
}
struct AllLeague: Codable, Hashable{
    let id: String
    let name: String
    let logos: LeagueLogo
}
struct LeagueLogo: Codable, Hashable{
    let light: URL
}
