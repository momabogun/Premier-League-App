//
//  TableView.swift
//  Premier League App
//
//  Created by Momcilo Bogunovic on 09.01.24.
//

import SwiftUI

struct TableView: View {
    @StateObject var viewModel = ViewModel()
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
                ForEach(viewModel.clubs, id: \.self){ club in
                    
                    ClubView(club: club)
                        .environmentObject(viewModel)
                    
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
                        Text("\nEverton - 10 points deducated due to decision of Federation")
                        Text("\nIn that evemt that two (or more) teams have an equal number of points, the following rulesbreak the tie:\n1.Goal difference\n2.Goal scored")
                    }.padding()
                        .font(.subheadline)
                    
                    }
                
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .principal) {
                            HStack{
                                Image("logo")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                Text("Premier League 23/24")
                                    .bold()
                            }
                        }
                        }
                
                
            }
        }
        }
    }


#Preview {
    TableView()
}
