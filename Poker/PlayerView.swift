//
//  PlayerView.swift
//  Poker
//
//  Created by Eric Wong Liu on 2024-06-08.
//

import SwiftUI

struct PlayerView: View {
    @State private var name: String
    @State private var buyinCount: Int = 0
    @State private var chipCount: Int = 0
    
    private var totalCount: Int {
        return self.chipCount - (buyinValue * self.buyinCount + bountyValue)
    }
    
    private var totalColor: Color {
        if totalCount > 0 {
            return Color.green
        } else if totalCount < 0 {
            return Color.red
        } else {
            return Color.black
        }
    }
    
    var body: some View {
        HStack {
            Text(self.name)
                .frame(width:70)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            HStack{
                Text("\(self.buyinCount)")
                Button() {
                    self.buyinCount += 1
                } label: {
                    Image(systemName: "plus")
                }
                Button() {
                    if self.buyinCount > 0 {
                        self.buyinCount -= 1
                    }
                }label: {
                    Image(systemName: "minus")
                }
            }.frame(width:100)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .padding()
           
            TextField("", value: $chipCount, format: .number)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .frame(width:60)
                .multilineTextAlignment(.center)
            
            if self.buyinCount > 0 {
                Text("\(totalCount)")
                    .foregroundStyle(totalColor)
                    .frame(width:60)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .padding()
            } else {
                Text("\(0)")
                    .frame(width:60)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .padding()
                    
            }
                
        }
        
    }
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, bcount: Int, ccount: Int) {
        self.name = name
        self.buyinCount = bcount
        self.chipCount = ccount
    }
}

#Preview {
    PlayerView(name:"Eric")

}
