//
//  TableView.swift
//  Premier League App
//
//  Created by Momcilo Bogunovic on 09.01.24.
//

import SwiftUI

struct TableView: View {
    init(league: AllLeague){
        self._clubViewModel = StateObject(wrappedValue: ClubViewModel(league: league))
        self._seasonViewModel = StateObject(wrappedValue: SeasonViewModel(league: league))
        
    }
    @StateObject var seasonViewModel: SeasonViewModel
    @StateObject var clubViewModel : ClubViewModel
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{
                        Text("#")
                            .frame(width: 30, height: 30)
                        Text("Team")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("P").frame(width: 50, height: 30)
                        Text("DIFF").frame(width: 50, height: 30)
                        Text("PTS").frame(width: 50, height: 30)
                    }.foregroundStyle(.gray)
                    ForEach(clubViewModel.clubs, id: \.self){ club in
                        
                        ClubView(club: club)
                            .environmentObject(clubViewModel)
                        
                    }.listStyle(.plain)
                    
                    VStack(alignment: .leading){
                        Divider()
                        HStack{
                            Circle().frame(width: 10)
                                .foregroundStyle(.green)
                            Text("Champions League")
                        }
                        HStack{
                            Circle().frame(width: 10)
                                .foregroundStyle(.blue)
                            Text("UEFA Europa League")
                        }
                        HStack{
                            Circle().frame(width: 10)
                                .foregroundStyle(.red)
                            Text("Relegation")
                        }
                        
                    }.padding()
                        .font(.subheadline)
                    
                }
                
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        HStack{
                            AsyncImage(url: clubViewModel.league.logos.light) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Image(systemName: "person.crop.square.filled.and.at.rectangle.fill")
                            }.frame(width: 30, height: 30)
                            
                            Text(clubViewModel.league.name)
                                .bold()
                            Spacer()
                            Menu("Filter Menu", systemImage: "line.3.horizontal.decrease.circle.fill") {
                                    ForEach(seasonViewModel.seasons, id: \.self ){ season in
                                        Button(season.displayName){
                                            clubViewModel.year = season.year
                                        }
                                            
                                        
                                    }
                                
                                
                            }

                        }
                        
                    }
                    
                    
                    
                }
            }
        }
    }
    
    
}
