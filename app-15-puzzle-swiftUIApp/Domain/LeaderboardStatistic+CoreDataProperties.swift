//
//  LeaderboardStatistic+CoreDataProperties.swift
//  app-15-puzzle-swiftUIApp
//
//  Created by Gleb Engalychev on 13.01.2022.
//
//

import Foundation
import CoreData


extension LeaderboardStatistic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LeaderboardStatistic> {
        return NSFetchRequest<LeaderboardStatistic>(entityName: "LeaderboardStatistic")
    }

    @NSManaged public var moveMade: Int32
    @NSManaged public var playerName: String?
    @NSManaged public var timeSpent: Int32

}

extension LeaderboardStatistic : Identifiable {

}
