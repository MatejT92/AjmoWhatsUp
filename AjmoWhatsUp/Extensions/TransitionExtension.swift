//
//  CATransitionExtension.swift
//  AjmoWhatsUp
//
//  Created by Matej Terek on 11/04/2021.
//

import UIKit

extension CATransition{
    func customTransition(fromLeft: Bool = true) -> CATransition {
        self.duration = 0.5
        self.type = CATransitionType.push
        self.subtype = fromLeft ? CATransitionSubtype.fromLeft: CATransitionSubtype.fromRight
        self.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        return self
    }
}
