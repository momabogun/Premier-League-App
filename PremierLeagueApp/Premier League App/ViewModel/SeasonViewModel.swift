//
//  SeasonViewModel.swift
//  Premier League App
//
//  Created by Momcilo Bogunovic on 10.01.24.
//

import Foundation
class SeasonViewModel: ObservableObject{
    
    init(league: AllLeague){
        self.league = league
        fetchData()
    }
    @Published var seasons = [Season]()
    
    
    let league : AllLeague
    
    func fetchData(){
        Task{
            do{
                self.seasons = try await fetchSeasons()
            } catch{
                print("Request failed with error: \(error)")
            }
        }
    }
    
    private func fetchSeasons() async throws -> [Season]{
        guard let url = URL(string: "https://api-football-standings.azharimm.dev/leagues/\(league.id)/seasons") else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        
        
        let result = try JSONDecoder().decode(SeasonResponse.self, from: data)
        
        return result.data.seasons
    }

}
