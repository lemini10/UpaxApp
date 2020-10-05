//
//  ColorCell.swift
//  UpaxApp
//
//  Created by Luis Roberto Blancas Lemini on 04/10/20.
//  Copyright © 2020 Luis Roberto Blancas Lemini. All rights reserved.
//

import UIKit

class ColorCell: UITableViewCell {

    
    @IBOutlet weak var colorTextField: UITextField!
    weak var delegate: ColorCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure(){
        let picker = UIPickerView()
        let toolbar = UIToolbar()
        picker.dataSource = self
        picker.delegate  = self
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonHandler))
        toolbar.setItems([doneButton], animated: true)
        colorTextField.inputView = picker
        colorTextField.inputAccessoryView = toolbar
        colorTextField.placeholder = "Color favorito"
    }
    @objc private func doneButtonHandler () {
        colorTextField.resignFirstResponder()
    }
    func configure(vc: DetailViewController) {
        delegate = vc
    }
}

extension ColorCell: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Color.allColor.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView()
        let label = UILabel()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        label.textColor = .black
        label.textAlignment = .center
        label.text = Color.allColor[row].rawValue
        view.backgroundColor = Color.allColor[row].color()
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        colorTextField.text = Color.allColor[row].rawValue
        delegate?.colorCellDelegate(didChangeColor: Color.allColor[row])
    }
    
    
}
