//
//  Utils.swift
//  UpaxApp
//
//  Created by Luis Roberto Blancas Lemini on 05/10/20.
//  Copyright © 2020 Luis Roberto Blancas Lemini. All rights reserved.
//

import UIKit.UIImage

extension UIImageView {
    func load(form url: String?, completionResult: @escaping (Result<UIImage, Error>) -> Void) {
        guard let urlString = url, let urlImage = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: urlImage, completionHandler: { (data, _, error) in
            guard let data = data, let image = UIImage(data: data) else { return completionResult(.failure(error!)) }
            completionResult(.success(image))
        }).resume()
    }
}
