//
//  NumberCell.swift
//  UpaxApp
//
//  Created by Luis Roberto Blancas Lemini on 04/10/20.
//  Copyright © 2020 Luis Roberto Blancas Lemini. All rights reserved.
//

import UIKit

class NumberCell: UITableViewCell {

    @IBOutlet weak var numberTextField: UITextField!
    weak var delegate: NumberCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        numberTextField.delegate = self
        numberTextField.placeholder = "Número telefónico"
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonHandler))
        toolbar.setItems([doneButton], animated: true)
        numberTextField.inputAccessoryView = toolbar
        numberTextField.addTarget(self, action: #selector(textFieldHandler), for: .editingChanged)
    }
    
    @objc private func doneButtonHandler () {
        numberTextField.resignFirstResponder()
    }
    
    @objc private func textFieldHandler(_ textField: UITextField) {
        delegate?.numberCellDelegate(didChangeNumber: textField.text ?? "")
    }
    
    func configure(vc: DetailViewController) {
        delegate = vc
    }
}

extension NumberCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 10
    }
}
