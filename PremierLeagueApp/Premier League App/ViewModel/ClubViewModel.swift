//
//  ClubViewModel.swift
//  Premier League App
//
//  Created by Momcilo Bogunovic on 10.01.24.
//

import Foundation
class ClubViewModel: ObservableObject{
    
    init(league: AllLeague){
        self.league = league
        fetchData()
    }
    @Published var clubs = [Club]()
    
    @Published var year = 2023
    
    let league: AllLeague
    
    func fetchData(){
        Task{
            do{
                self.clubs = try await fetchClubs()
            } catch{
                print("Request failed with error: \(error)")
            }
        }
    }
    
    
        
    private func fetchClubs() async throws -> [Club] {
        
        
        guard let url = URL(string: "https://api-football-standings.azharimm.dev/leagues/\(league.id)/standings?season=\(year)&sort=asc") else {
            throw HTTPError.invalidURL
        }
        
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        
        
        let result = try JSONDecoder().decode(LeagueResponse.self, from: data)
        
        return result.data.standings
    }
}
