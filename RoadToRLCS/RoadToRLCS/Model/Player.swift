//
//  Player.swift
//  RoadToRLCS
//
//  Created by Roberto Manese III on 2/7/20.
//  Copyright © 2020 jawnyawn. All rights reserved.
//

import Foundation

struct Player {
    var league: League = League.none

    var points: Int = 0
    var shots: Int = 0
    var goals: Int = 0
    var assist: Int = 0
    var saves: Int = 0

    var averagePointsPerGame: Double = 0.0
    var averageShotsPerGame: Double = 0.0
    var averageGoalsPerGame: Double = 0.0
    var averageAssistPerGame: Double = 0.0
    var averageSavesPerGame: Double = 0.0

    var games = [Game]()
    var numberOfGames: Int {
        return games.count
    }
    var wins: Int = 0
    var losses: Int = 0
    var mvpCount: Int = 0

    var winRatio: Double {
        return Double(self.wins) / Double(self.games.count)
    }
    var mvpRatio: Double {
        return Double(self.mvpCount) / Double(self.games.count)
    }
}
