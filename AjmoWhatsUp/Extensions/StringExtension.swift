//
//  UIStringExtension.swift
//  AjmoWhatsUp
//
//  Created by Matej Terek on 11/04/2021.
//

import UIKit

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else {
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
