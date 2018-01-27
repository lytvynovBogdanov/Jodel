//
//  UIViewController.swift
//  JodelChallenge
//
//  Created by Lesha on 27.01.2018.
//  Copyright © 2018 Jodel. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentErrorView(title: String, textMessage: String, style: UIAlertControllerStyle) {
        let alertViewController = UIAlertController(title: title, message: textMessage, preferredStyle: style)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertViewController.addAction(alertAction)
        self.present(alertViewController, animated: true, completion: nil)
    }
}
