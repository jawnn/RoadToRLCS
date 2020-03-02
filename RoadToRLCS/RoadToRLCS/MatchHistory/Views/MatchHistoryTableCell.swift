//
//  MatchHistoryTableCell.swift
//  RoadToRLCS
//
//  Created by Roberto Manese III on 2/16/20.
//  Copyright © 2020 jawnyawn. All rights reserved.
//

import UIKit

class MatchHistoryTableCell: UITableViewCell {

    @IBOutlet var rankImageIcon: UIImageView!

    @IBOutlet var totalPointsLabel: UILabel!
    @IBOutlet var totalShotsLabel: UILabel!
    @IBOutlet var totalGoalsLabel: UILabel!
    @IBOutlet var totalAssistLabel: UILabel!
    @IBOutlet var totalSavesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(league: League, points: Int, shots: Int, goals: Int, assist: Int, saves: Int) {
        rankImageIcon.image = UIImage(named: league.rawValue)
        totalPointsLabel.text = "\(points)"
        totalShotsLabel.text = "\(shots)"
        totalGoalsLabel.text = "\(goals)"
        totalAssistLabel.text = "\(assist)"
        totalSavesLabel.text = "\(saves)"
    }

}
