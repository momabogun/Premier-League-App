//
//  ClubView.swift
//  Premier League App
//
//  Created by Momcilo Bogunovic on 09.01.24.
//

import SwiftUI

struct ClubView: View {
    @EnvironmentObject var viewModel: ViewModel
    let club : Club
    var body: some View {
        HStack(alignment: .center){
            ZStack{
                
                if club.note?.description ?? "" == NoteColor.championsLeague.string{
                    Circle()
                        .frame(width: 25)
                        .foregroundStyle(NoteColor.championsLeague.color)
                } else if club.note?.description ?? "" == NoteColor.europaLeague.string {
                    Circle()
                    .frame(width: 25)
                    .foregroundStyle(NoteColor.europaLeague.color)
                } else if club.note?.description ?? "" == NoteColor.relegation.string{
                    Circle()
                    .frame(width: 25)
                    .foregroundStyle(NoteColor.relegation.color)
                }
                
                Text(club.stats[10].displayValue)
                    .frame(width: 30, height: 30)
                    .bold()
            }
            AsyncImage(url: club.team.logos.first?.href) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "person.crop.square.filled.and.at.rectangle.fill")
            }.frame(width: 30, height: 30)
            VStack(alignment: .leading){
                HStack{
                    Text(club.team.shortDisplayName)
                    Spacer()
                    Text(club.stats[0].displayValue)
                        .frame(width: 30, height: 30)
                    Text(club.stats[2].displayValue)
                        .frame(width: 50, height: 50)
                    Text(club.stats[3].displayValue)
                        .frame(width: 30, height: 30).padding(10)
                }
            }
            
        }.padding(2)
    }
}


