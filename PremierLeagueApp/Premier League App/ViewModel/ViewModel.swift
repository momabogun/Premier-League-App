//
//  ViewModel.swift
//  Premier League App
//
//  Created by Momcilo Bogunovic on 09.01.24.
//

import Foundation
class ViewModel: ObservableObject {
    
    init(){
        fetchData()
    }
    
    
    
    @Published var clubs = [Club]()
    
    
    
    
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
        
        
        guard let url = URL(string: "https://api-football-standings.azharimm.dev/leagues/eng.1/standings?season=2023&sort=asc") else {
            throw HTTPError.invalidURL
        }
        
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        
        
        let result = try JSONDecoder().decode(LeagueResponse.self, from: data)
        
        return result.data.standings
    }
    
    
    
    
    
    
    
}
