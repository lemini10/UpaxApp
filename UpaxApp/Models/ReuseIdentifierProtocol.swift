//
//  ReuseIdentifierProtocol.swift
//  UpaxApp
//
//  Created by Luis Roberto Blancas Lemini on 04/10/20.
//  Copyright © 2020 Luis Roberto Blancas Lemini. All rights reserved.
//

import Foundation

@objc protocol ReuseIdentifier {}

extension ReuseIdentifier {
    static var reuseIdentifier: String { String (describing: self)}
}

extension NSObject: ReuseIdentifier {}
