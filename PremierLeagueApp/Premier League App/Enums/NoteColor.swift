//
//  Note.swift
//  Premier League App
//
//  Created by Momcilo Bogunovic on 09.01.24.
//

import Foundation
import UIKit
import SwiftUI
enum NoteColor : String{
    case championsLeague, europaLeague, relegation
    
    var id:  String{rawValue}
    
    var string: String{
        switch self{
            
        case .championsLeague:
            "Champions League"
        case .europaLeague:
            "Europa League"
        case .relegation:
            "Relegation"
        }
    }
    
    
    var color: Color{
        switch self{
            
        case .championsLeague:
                .green
        case .europaLeague:
                .blue
        case .relegation:
                .red
        }
    }
}
