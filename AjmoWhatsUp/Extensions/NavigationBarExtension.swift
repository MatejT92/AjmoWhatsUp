//
//  UINavigationBarExtension.swift
//  AjmoWhatsUp
//
//  Created by Matej Terek on 11/04/2021.
//

import  UIKit

extension UINavigationBar {
    //set gradient color
    func setGradientBackground(colors: [Any]) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.locations = [0.0 , 0.5, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        var updatedFrame = self.bounds
        updatedFrame.size.height += self.frame.origin.y
        gradient.frame = updatedFrame
        gradient.colors = colors;
        self.setBackgroundImage(self.image(fromLayer: gradient), for: .default)
    }

    //create image from calayer
    func image(fromLayer layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }

    //setup custom default gradient navigation color
    func getNavigationGradientColors() -> Array<Any> {
        return [
            UIColor.getUIColorObject(fromHexString: "58A4B2", alpha: 1.0)?.cgColor ?? UIColor.white.cgColor ,
            UIColor.getUIColorObject(fromHexString: "2E7499", alpha: 1.0)?.cgColor ?? UIColor.white.cgColor,
            UIColor.getUIColorObject(fromHexString: "014482", alpha: 1.0)?.cgColor ?? UIColor.white.cgColor]
    }

}
