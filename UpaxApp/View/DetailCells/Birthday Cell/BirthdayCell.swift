//
//  BirthdayCell.swift
//  UpaxApp
//
//  Created by Luis Roberto Blancas Lemini on 04/10/20.
//  Copyright © 2020 Luis Roberto Blancas Lemini. All rights reserved.
//

import UIKit

class BirthdayCell: UITableViewCell {

    @IBOutlet weak var birthdayTextField: UITextField!
    weak var delegate: BirthdayCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        createPicker()
    }

    func createPicker(){
        let toolbar = UIToolbar()
        let picker = UIDatePicker()
        picker.locale = Locale.current
        picker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            picker.preferredDatePickerStyle = .wheels
        }
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonHandler))
        toolbar.setItems([doneButton], animated: true)
        birthdayTextField.inputAccessoryView = toolbar
        birthdayTextField.inputView = picker
        birthdayTextField.placeholder = "Fecha de nacimiento"
        picker.addTarget(self, action: #selector(datePickerHandler), for: .valueChanged)
    }
    
    @objc private func datePickerHandler(_ picker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        birthdayTextField.text = formatter.string(from: picker.date)
        delegate?.birthdayCellDelegate(didChangeBirthday: picker.date)
    }
    
    @objc private func doneButtonHandler () {
        birthdayTextField.resignFirstResponder()
    }
    
    func configure(vc: DetailViewController) {
        delegate = vc
    }  
}
