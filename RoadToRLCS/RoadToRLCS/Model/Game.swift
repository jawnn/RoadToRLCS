//
//  Game.swift
//  RoadToRLCS
//
//  Created by Roberto Manese III on 2/5/20.
//  Copyright © 2020 jawnyawn. All rights reserved.
//

import Foundation

enum StatType: String {
    case shots = "Shots"
    case goals = "Goals"
    case assists = "Assists"
    case saves = "Saves"
}

enum Placing: String, CaseIterable {
    case first = "1st"
    case second = "2nd"
    case third = "3rd"
    case fourth = "4th"
    case none = "n/a"
}

enum League: String, CaseIterable {
    case brozne1 = "Bronze I"
    case brozne2 = "Bronze II"
    case brozne3 = "Bronze III"
    case silver1 = "Silver I"
    case silver2 = "Silver II"
    case silver3 = "Silver III"
    case gold1 = "Gold I"
    case gold2 = "Gold II"
    case gold3 = "Gold III"
//    case plat1 = "Plat I"
//    case plat2 = "Plat II"
//    case plat3 = "Plat III"
//    case diamond1 = "Diamond I"
//    case diamond2 = "Diamond II"
//    case diamond3 = "Diamond III"
    case none = "n/a"
}

struct Game {
    var points: Int = 0
    var shots: Int = 0
    var goals: Int = 0
    var assists: Int = 0
    var saves: Int = 0

    var league: League = League.none
    var place: Placing = Placing.none

    var isMVP = false
    var didWin = false
    let date = Date()
}
