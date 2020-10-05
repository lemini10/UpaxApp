//
//  PrincipalTableModel.swift
//  UpaxApp
//
//  Created by Luis Roberto Blancas Lemini on 04/10/20.
//  Copyright © 2020 Luis Roberto Blancas Lemini. All rights reserved.
//

import UIKit

struct PrincipalTableModel {
    var name: String
    var type: CellType
    var isSelected: Bool
    var data: Any?
}

enum CellType : Int {
    case camera
    case photo
    case name
    case number
    case birthday
    case sex
    case color
}

var model: [PrincipalTableModel] = [
    PrincipalTableModel(name: "Cámara", type: .camera, isSelected: false),
    PrincipalTableModel(name: "Foto", type: .photo, isSelected: false, data: "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercraft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg"),
    PrincipalTableModel(name: "Nombre Completo", type: .name, isSelected: false),
    PrincipalTableModel(name: "Numero telefónico", type: .number, isSelected: false),
    PrincipalTableModel(name: "Fecha de Nacimiento", type: .birthday, isSelected: false),
    PrincipalTableModel(name: "Sexo", type: .sex, isSelected: false),
    PrincipalTableModel(name: "Color", type: .color, isSelected: false)
]

struct Information {
    var camera: UIImage?
    var photo: UIImage?
    var name: String?
    var number: String?
    var birthday: Date?
    var sex: Sex?
    var color: Color?
}

enum Sex: String {
    case female = "Mujer"
    case male = "Hombre"
    
    static var allGenres: [Sex] = [
        .female,
        .male
    ]
}

enum Color: String {
    case green = "Verde"
    case blue = "Azul"
    case pink = "Rosa"
    case red = "Rojo"
    case yellow = "Amarillo"
    
    static var allColor: [Color] = [
        .green,
        .blue,
        .pink,
        .red,
        .yellow
    ]
}

extension Color {
    func color() -> UIColor {
        switch self {
        case .green:
            return .green
        case .blue:
            return .blue
        case .pink:
            return .systemPink
        case .red:
            return .red
        case .yellow:
            return .yellow
        }
    }
}

