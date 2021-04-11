//
//  UIColorExtension.swift
//  AjmoWhatsUp
//
//  Created by Matej Terek on 11/04/2021.
//

import UIKit

extension UIColor{
    class func getUIColorObject(fromHexString hexStr: String?, alpha: CGFloat) -> UIColor? {
        // Convert hex string to an integer
        let hexint: UInt = intFromHexString(hexStr: hexStr)
        // Create color object, specifying alpha as well
        let color: UIColor? = UIColor(red: CGFloat((hexint & 0xff0000) >> 16) / 255, green: CGFloat((hexint & 0xff00) >> 8) / 255, blue: CGFloat(hexint & 0xff) / 255, alpha: alpha)
        return color
    }

    class func intFromHexString (hexStr: String?) -> UInt {
        var hexInt: UInt64 = 0
        // Create scanner
        let scanner = Scanner(string: hexStr ?? "")
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt64(&hexInt)
        scanner.scanHexInt64(&hexInt)
        return UInt(hexInt)
    }

}
