//
//  Club.swift
//  Premier League App
//
//  Created by Momcilo Bogunovic on 09.01.24.
//

import Foundation
struct Club: Codable, Hashable{
    let team: Team
    let stats: [Stat]
    let note: Note?
    
}

struct Note: Codable, Hashable{
    let description: String
}



struct Team: Codable, Hashable{
    let uid: String
    let shortDisplayName : String
    let logos: [Logo]
}

struct Logo: Codable, Hashable{
    let href: URL
}


struct Stat: Codable, Hashable{
    let shortDisplayName: String
    let displayValue: String
}

