//
//  DetailViewController.swift
//  UpaxApp
//
//  Created by Luis Roberto Blancas Lemini on 04/10/20.
//  Copyright © 2020 Luis Roberto Blancas Lemini. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{

    var selectedItems:[PrincipalTableModel] = []
    weak var delegateCameraCell: TableCameraCellDelegate?
    
    var information = Information()
    
    @IBOutlet weak var showInformationButton: UIButton!
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.dataSource = self
        detailTableView.delegate = self
        nibsRegistration()
        showInformationButton.layer.cornerRadius = 10
        showInformationButton.backgroundColor = .systemBlue
        showInformationButton.setTitleColor(.white, for: .normal)
        showInformationButton.setTitle("Guardar información", for: .normal)
    }
    @IBAction func didSelectShowInfo(_ sender: Any) {
        //to present the info in a new screen code should be here
        print(information)
    }
}

//MARK: - TableView Data Source

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let type: CellType? = selectedItems[indexPath.row].type
        guard let cellType = type else {return cell}
        switch cellType {
        case .camera:
            guard let cameraCell = detailTableView.dequeueReusableCell(withIdentifier: CameraCell.reuseIdentifier,for: indexPath) as? CameraCell else {return cell}
                cameraCell.configure(with: self)
                cameraCell.delegate = self
                cell = cameraCell
        case .photo:
            guard let photoCell = detailTableView.dequeueReusableCell(withIdentifier: PhotoCell.reuseIdentifier, for: indexPath) as? PhotoCell else {return cell}
            photoCell.configure(vc: self,with: selectedItems[indexPath.row].data as? String ?? "")
            cell = photoCell
        case .name:
            guard let nameCell = detailTableView.dequeueReusableCell(withIdentifier: NameCell.reuseIdentifier, for: indexPath) as? NameCell else {return cell}
            nameCell.configure(with: self)
            cell = nameCell
        case .number:
            guard let numberCell = detailTableView.dequeueReusableCell(withIdentifier: NumberCell.reuseIdentifier, for: indexPath) as? NumberCell else {return cell}
            numberCell.configure(vc: self)
            cell = numberCell
        case .birthday:
            guard let birthdayCell = detailTableView.dequeueReusableCell(withIdentifier: BirthdayCell.reuseIdentifier, for: indexPath) as? BirthdayCell else {return cell}
            birthdayCell.configure(vc: self)
            cell = birthdayCell
        case .sex:
            guard let sexCell = detailTableView.dequeueReusableCell(withIdentifier: SexCell.reuseIdentifier, for: indexPath) as? SexCell else {return cell}
            sexCell.configure(vc: self)
            cell = sexCell
        case .color:
            guard let colorCell = detailTableView.dequeueReusableCell(withIdentifier: ColorCell.reuseIdentifier, for: indexPath) as? ColorCell else {return cell}
            colorCell.configure(vc: self)
            cell = colorCell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = selectedItems[indexPath.row].type
        switch type {
        case .camera:
            return 146
        case .photo:
            return 146
        default:
            return 44
        }
    }
}

//MARK: - Number

extension DetailViewController: NumberCellDelegate{
    func numberCellDelegate(didChangeNumber number: String) {
        information.number = number
    }
}

//MARK: - Birthday

extension DetailViewController: BirthdayCellDelegate{
    func birthdayCellDelegate(didChangeBirthday birthday: Date) {
        information.birthday = birthday
    }
}

//MARK: - Genre

extension DetailViewController: SexCellDelegate{
    func sexCellDelegate(didChangeSex sex: Sex) {
        information.sex = sex
    }
}

//MARK: - Color

extension DetailViewController: ColorCellDelegate{
    func colorCellDelegate(didChangeColor color: Color) {
        information.color = color
    }
    
    
}

//MARK: - Name

extension DetailViewController: NameCellDelegate {
    func nameCellDelegate(didChangeString text: String) {
        information.name = text
    }
}


//MARK: - Photo

extension DetailViewController: PhotoCellDelegate{
    func photoCellDelegate(didDownloadImage image: UIImage) {
        information.photo = image
    }

}

//MARK: - Camera

extension DetailViewController:  UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] as? UIImage else {return}
        delegateCameraCell?.showImage(image: image)
        information.camera = image
    }
}

extension DetailViewController: CameraCellDelegate{
    func showImagePicker(vc: UIImagePickerController) {
        present(vc, animated: true)
    }
}

//MARK: - NIB´s Registration

extension DetailViewController {
    func nibsRegistration(){
        detailTableView.allowsSelection = false
        detailTableView.tableFooterView = UIView()
        detailTableView.register(UINib(nibName: PhotoCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PhotoCell.reuseIdentifier)
        detailTableView.register(UINib(nibName: CameraCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CameraCell.reuseIdentifier)
        detailTableView.register(UINib(nibName: NameCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: NameCell.reuseIdentifier)
        detailTableView.register(UINib(nibName: NumberCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: NumberCell.reuseIdentifier)
        detailTableView.register(UINib(nibName: BirthdayCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: BirthdayCell.reuseIdentifier)
        detailTableView.register(UINib(nibName: SexCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: SexCell.reuseIdentifier)
        detailTableView.register(UINib(nibName: ColorCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ColorCell.reuseIdentifier)
    }
}
