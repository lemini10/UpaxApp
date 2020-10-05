//
//  NameCell.swift
//  UpaxApp
//
//  Created by Luis Roberto Blancas Lemini on 04/10/20.
//  Copyright © 2020 Luis Roberto Blancas Lemini. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {

    @IBOutlet weak var nameTextField: UITextField!
    
    weak var delegate: NameCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        nameTextField.delegate = self
        nameTextField.placeholder = "Nombre"
        nameTextField.addTarget(self, action: #selector(textFieldHandler), for: .editingChanged)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonHandler))
        toolbar.setItems([doneButton], animated: true)
        nameTextField.inputAccessoryView = toolbar
    }
    @objc private func doneButtonHandler () {
        nameTextField.resignFirstResponder()
    }
    
    @objc private func textFieldHandler(_ textField: UITextField) {
        delegate?.nameCellDelegate(didChangeString: textField.text ?? "")
    }
    
    func configure(with vc: DetailViewController){
        delegate = vc
    }
    
}

extension NameCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 35
    }
}
