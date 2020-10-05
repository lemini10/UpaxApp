//
//  SexCell.swift
//  UpaxApp
//
//  Created by Luis Roberto Blancas Lemini on 04/10/20.
//  Copyright © 2020 Luis Roberto Blancas Lemini. All rights reserved.
//

import UIKit

class SexCell: UITableViewCell {

    @IBOutlet weak var sexTextField: UITextField!
    weak var delegate: SexCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure(){
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonHandler))
        toolbar.setItems([doneButton], animated: true)
        sexTextField.inputView = picker
        sexTextField.inputAccessoryView = toolbar
        sexTextField.placeholder = "Género"
    }
    
    @objc private func doneButtonHandler () {
        sexTextField.resignFirstResponder()
    }
    
    func configure(vc: DetailViewController) {
        delegate = vc
    }
}

extension SexCell: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Sex.allGenres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Sex.allGenres[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sexTextField.text = Sex.allGenres[row].rawValue
        delegate?.sexCellDelegate(didChangeSex: Sex.allGenres[row])
    }

}
