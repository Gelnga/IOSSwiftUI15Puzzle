//
//  GameDataRepository.swift
//  app-15-puzzle-swiftUIApp
//
//  Created by Gleb Engalychev on 13.01.2022.
//

import Foundation
import CoreData

class GameDataRepository {
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
//
//    func getAllSavedGames() throws -> [SavedGame] {
//        let saves = try context.fetch(SavedGame.fetchRequestSaves())
//        return saves
//    }
//
//    func createSavedGame(save: SavedGame) throws {
//        context.insert(save)
//        try context.save()
//    }
//
//    func deleteSavedGame(save: SavedGame) throws {
//        context.delete(save)
//        try context.save()
//    }
    
    func getAllLeaderStatistics() throws -> [LeaderboardStatistic] {
        let stats = try context.fetch(NSFetchRequest<LeaderboardStatistic>(entityName: "LeaderboardStatistic"))
        return stats
    }
    
    func createLeaderboardStatistic(stat: LeaderboardStatistic) throws {
        context.insert(stat)
        try context.save()
    }
    
    func deleteLeaderboardStatistic(stat: LeaderboardStatistic) throws {
        context.delete(stat)
        try context.save()
    }
}
