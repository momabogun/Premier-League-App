//
//  AllLeagueView.swift
//  Premier League App
//
//  Created by Momcilo Bogunovic on 10.01.24.
//

import SwiftUI

struct AllLeagueView: View {
    @StateObject var leagueViewModel = LeagueViewModel()
    var body: some View {
        NavigationStack{
            List(leagueViewModel.leagues, id: \.id){ league in
                NavigationLink(destination:
                                TableView(league: league)){
                    HStack(spacing: 25){
                        AsyncImage(url: league.logos.light){ image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        } placeholder: {
                            Image(systemName: "person.crop.square.filled.and.at.rectangle.fill")
                        }.frame(width: 50)
                        Text(league.name)
                        
                        
                    }
                }.navigationTitle("Leagues")
                }
                
            }
        }
    }


#Preview {
    AllLeagueView()
}
