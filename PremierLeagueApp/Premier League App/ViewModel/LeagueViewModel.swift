//
//  ViewModel.swift
//  Premier League App
//
//  Created by Momcilo Bogunovic on 09.01.24.
//

import Foundation
class LeagueViewModel: ObservableObject {
    
    init(){
        fetchData()
    }
    
    
    
    
    @Published var leagues = [AllLeague]()
    
    
    
    
    
    func fetchData(){
        Task{
            do{
                self.leagues = try await fetchLeagues()
            } catch{
                print("Request failed with error: \(error)")
            }
        }
    }
    
    
    private func fetchSeasons(){
        
    }
    
    private func fetchLeagues()async throws -> [AllLeague]{
        
        guard let url = URL(string: "https://api-football-standings.azharimm.dev/leagues") else {
            throw HTTPError.invalidURL
        }
        
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        
        
        let result = try JSONDecoder().decode(AllLeagueResponse.self, from: data)
        
        return result.data
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
