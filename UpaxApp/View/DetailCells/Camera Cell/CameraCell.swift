//
//  CameraCell.swift
//  UpaxApp
//
//  Created by Luis Roberto Blancas Lemini on 04/10/20.
//  Copyright © 2020 Luis Roberto Blancas Lemini. All rights reserved.
//

import UIKit

class CameraCell: UITableViewCell {

    @IBOutlet weak var cameraImage: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    
    weak var parentVC: DetailViewController?
    weak var delegate: CameraCellDelegate?
    private let vc = UIImagePickerController()
    
    func configure(with vc: DetailViewController){
        parentVC=vc
        parentVC?.delegateCameraCell = self
        configureImagePicker()
    }
    
    private func configureImagePicker() {
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = parentVC
        cameraButton.addTarget(self, action: #selector(handlePicker), for: .touchUpInside)
    }
    
    @objc private func handlePicker(){
        delegate?.showImagePicker(vc: vc)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureImagePicker()
        cameraButton.titleLabel?.numberOfLines = 2
        cameraButton.titleLabel?.textAlignment = .center
        cameraButton.setTitle("Agregar\nFoto", for: .normal)
    }
}

extension CameraCell: TableCameraCellDelegate {
    func showImage(image: UIImage) {
        self.cameraImage.image = image
    }
}
