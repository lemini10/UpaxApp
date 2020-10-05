//
//  ViewController.swift
//  UpaxApp
//
//  Created by Luis Roberto Blancas Lemini on 04/10/20.
//  Copyright © 2020 Luis Roberto Blancas Lemini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.tableFooterView = UIView()
        mainTableView.allowsMultipleSelection = true
        let mainCellNib = UINib(nibName: MainTableViewCell.reuseIdentifier, bundle: nil)
        mainTableView.register(mainCellNib, forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
        nextButton.layer.cornerRadius = 10
        nextButton.backgroundColor = .systemBlue
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Siguiente pantalla", for: .normal)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        var selectionedCategorie: Bool = false
        let detailVC = DetailViewController()
        model.forEach {
            if $0.isSelected {
                detailVC.selectedItems.append($0)
                selectionedCategorie = true
            }
        }
        if selectionedCategorie {
            navigationController?.pushViewController(detailVC, animated: true)
        } else {
            presentAlert()
        }
    }
    
}

//MARK: - TableView Data Source

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        guard let mainCell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell else {return cell}
        mainCell.configure(with: model[indexPath.row])
        cell = mainCell
        return cell
    }
}

//MARK: - TableView Delegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model[indexPath.row].isSelected = !model[indexPath.row].isSelected
        tableView.reloadData()
    }
}

//MARK: - No Selection Alert

extension ViewController{
    func presentAlert(){
        let noItemsAlert = UIAlertController(title: "No has seleccionado ninguna categoría", message: "Selecciona algunos elementos", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        noItemsAlert.addAction(action)
        present(noItemsAlert,animated: true, completion: nil)
    }

}
