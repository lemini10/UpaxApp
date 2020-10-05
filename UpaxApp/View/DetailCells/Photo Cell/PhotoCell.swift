//
//  PhotoCell.swift
//  UpaxApp
//
//  Created by Luis Roberto Blancas Lemini on 04/10/20.
//  Copyright © 2020 Luis Roberto Blancas Lemini. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    weak var delegate: PhotoCellDelegate?
    
    @IBOutlet weak var photoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(vc: DetailViewController ,with stringURL: String) {
        self.delegate = vc
        photoImage.load(form: stringURL) { (result) in
            switch result {
            case .success(let image):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.photoImage.image = image
                    self.delegate?.photoCellDelegate(didDownloadImage: image)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
