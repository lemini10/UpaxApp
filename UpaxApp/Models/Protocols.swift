//
//  Utils.swift
//  UpaxApp
//
//  Created by Luis Roberto Blancas Lemini on 04/10/20.
//  Copyright © 2020 Luis Roberto Blancas Lemini. All rights reserved.
//

import UIKit


protocol CameraCellDelegate: AnyObject {
    
    func showImagePicker(vc: UIImagePickerController)
}

protocol TableCameraCellDelegate: AnyObject {
    func showImage(image: UIImage)
}

protocol NameCellDelegate: AnyObject{
    func nameCellDelegate(didChangeString text: String)
}

protocol PhotoCellDelegate: AnyObject{
    func photoCellDelegate(didDownloadImage image: UIImage)
}

protocol NumberCellDelegate: AnyObject{
    func numberCellDelegate(didChangeNumber number: String)
}

protocol BirthdayCellDelegate: AnyObject{
    func birthdayCellDelegate(didChangeBirthday birthday: Date)
}

protocol SexCellDelegate: AnyObject {
    func sexCellDelegate(didChangeSex sex: Sex)
}

protocol ColorCellDelegate: AnyObject {
    func colorCellDelegate(didChangeColor color: Color)
}

