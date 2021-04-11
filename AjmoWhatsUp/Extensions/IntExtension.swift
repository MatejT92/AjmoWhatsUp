//
//  IntExtension.swift
//  AjmoWhatsUp
//
//  Created by Matej Terek on 11/04/2021.
//

import UIKit

extension Int{
    func formatDate() -> String? {
        let timeInterval = TimeInterval(self)
        let eventDate = Date(timeIntervalSince1970: timeInterval)
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ" // Original date format
        let stringDate = dateFormatterGet.string(from: eventDate)
        let yourDate = dateFormatterGet.date(from: stringDate)
        //Set date format output
        dateFormatterGet.dateFormat = "d.M.yyyy."
        //convert date to string
        return dateFormatterGet.string(from: yourDate!)
    }

}
