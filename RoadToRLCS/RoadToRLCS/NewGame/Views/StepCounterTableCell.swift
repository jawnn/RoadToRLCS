//
//  StepCounterTableCell.swift
//  RoadToRLCS
//
//  Created by Roberto Manese III on 2/16/20.
//  Copyright © 2020 jawnyawn. All rights reserved.
//

import UIKit

protocol StepperDelegate: class {
    func stepperValueChanged(value: Int, stat: String)
}

class StepCounterTableCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var statValue: UILabel!

    @IBOutlet var stepper: UIStepper!
    @IBOutlet var colorBackgroundView: UIView!

    weak var delegate: StepperDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        stepper.layer.cornerRadius = 8
        colorBackgroundView.layer.cornerRadius = 10
    }

    @IBAction func valueChanged(_ sender: UIStepper) {
        statValue.text = String(format: "%.0f", sender.value)
        delegate?.stepperValueChanged(value: Int(sender.value), stat: titleLabel.text ?? "")
    }

}
