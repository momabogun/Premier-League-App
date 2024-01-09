//
//  League.swift
//  Premier League App
//
//  Created by Momcilo Bogunovic on 09.01.24.
//

import Foundation


struct LeagueResponse: Codable{
    let data: League
}

struct League: Codable {
    let name, seasonDisplay: String
    let standings: [Club]
}
