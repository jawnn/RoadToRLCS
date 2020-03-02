//
//  TextFieldCell.swift
//  RoadToRLCS
//
//  Created by Roberto Manese III on 3/1/20.
//  Copyright © 2020 jawnyawn. All rights reserved.
//

import UIKit

protocol TextFieldDelegate: class {
    func pointsValueChanged(value: String)
}

class TextFieldCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet var colorBackground: UIView!
    @IBOutlet var textField: UITextField!

    weak var delegate: TextFieldDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        colorBackground.layer.cornerRadius = 8
        textField.delegate = self

        let tooBar: UIToolbar = UIToolbar()
        tooBar.barStyle = UIBarStyle.black
        tooBar.isTranslucent = true
        tooBar.items=[
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(donePressed))]
        tooBar.sizeToFit()
        textField.inputAccessoryView = tooBar
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        delegate?.pointsValueChanged(value: text)
    }

    @objc func donePressed() {
        textField.resignFirstResponder()
    }

}
