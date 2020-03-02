//
//  MatchHistoryModel.swift
//  RoadToRLCS
//
//  Created by Roberto Manese III on 2/16/20.
//  Copyright © 2020 jawnyawn. All rights reserved.
//

import Foundation

protocol MatchHistoryModelType {
    var player: Player { get set }
}

class MatchHistoryModel: MatchHistoryModelType {
    var player: Player

    init(player: Player) {
        self.player = player
    }
}
