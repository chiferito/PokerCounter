//
//  ContentView.swift
//  Poker
//
//  Created by Eric Wong Liu on 2024-06-07.
//

import SwiftUI

var buyinValue = 5
var bountyValue = 2

struct ContentView: View {
    @State private var playerCount = 0
    @State private var players: [String] = ["Eric"]
    @State private var nameToAdd = ""
    @State private var newBuyin = 5
    @State private var newBounty = 2
    
    var body: some View {
        VStack {
            Text("Poker")
                .font(.largeTitle)
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 120, height: 80)
                        .foregroundStyle(.tint)
                    VStack{
                        Text("Buy-in Value:")
                            .foregroundStyle(Color.white)
                        TextField("Buy-in value", value: $newBuyin, format: .number)
                            .border(Color.white)
                            .foregroundStyle(Color.white)
                            .frame(width:60)
                            .multilineTextAlignment(.center)
                            .onSubmit {
                                if newBuyin>0 {
                                    buyinValue = newBuyin
                                }
                            }
                    }
                }.padding(.trailing,50)
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 120, height: 80)
                        .foregroundStyle(.tint)
                    VStack{
                        Text("Bounty Value:")
                            .foregroundStyle(Color.white)
                        TextField("Bounty Value", value: $newBounty, format: .number)
                            .border(Color.white)
                            .foregroundStyle(Color.white)
                            .frame(width:60)
                            .multilineTextAlignment(.center)
                            .onSubmit {
                                if newBounty>0 {
                                    bountyValue = newBounty
                                }
                            }
                    }
                }
            }
            Divider()
            
            HStack {
                Text("Name")
                    .bold()
                    .padding(.trailing,25)
                    .padding(.leading,5)
                Text("Buy-in Count")
                    .bold()
                    .padding(.trailing,20)
                Text("Chips")
                    .bold()
                    .padding(.trailing,30)
                Text("Total")
                    .bold()
                    .padding(.trailing)
                Spacer()
            }.padding(.trailing,15)
            
            ForEach(players, id: \.self) { player in
                HStack{
                    PlayerView(name: player)
                    Button(){
                        players.remove(at:players.firstIndex(of: player)!)
                    }label: {
                        Image(systemName: "person.fill.xmark")
                    }.foregroundColor(.red)
                }
            }
            Spacer()

            TextField("Add Player", text: $nameToAdd)
                    .autocorrectionDisabled()
                    .onSubmit {
                    if !nameToAdd.isEmpty {
                        players.append(nameToAdd)
                        }
                    }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
