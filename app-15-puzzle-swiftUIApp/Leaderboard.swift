//
//  Leaderboard.swift
//  app-15-puzzle-swiftUIApp
//
//  Created by Gleb Engalychev on 13.01.2022.
//

import SwiftUI
import CoreData

struct Leaderboard: View {
    
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    
    var body: some View {
        VStack {
            Text("Leaderboard")
                .bold()
                .font(.system(size: 30))
            Spacer()
            ForEach(getStats(), id: \.self) {stat in
                HStack {
                    Text(stat.playerName ?? "")
                        .bold()
                        .font(.system(size: 20))
                    Text("Moves made: " + String(stat.moveMade) )
                        .bold()
                        .font(.system(size: 20))
                    Button(action: {deleteStat(stat: stat)
                    }) {
                        Text("Delete")
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                    }
                    .padding(5)
                    .background(Color.red)
                    .cornerRadius(10)
                    .padding(.top, 5)
                }
            }
            Spacer()
        }
    }
    
    private func getStats() -> [LeaderboardStatistic] {
        let repo = GameDataRepository(context: context)
    
        return try! repo.getAllLeaderStatistics()
    }
    
    private func deleteStat(stat: LeaderboardStatistic) {
        let repo = GameDataRepository(context: context)
        try! repo.deleteLeaderboardStatistic(stat: stat)
    }
}

//struct Leaderboard_Previews: PreviewProvider {
//    static var previews: some View {
//        Leaderboard()
//    }
//}
