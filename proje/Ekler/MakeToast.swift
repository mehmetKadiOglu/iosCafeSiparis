//
//  MakeToast.swift
//  proje
//
//  Created by memo on 18.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import UIKit
class Toast: UIAlertController {
    
    public static var sayfa = UIViewController()
    static func make(mesaj:String){
        let alert = UIAlertController(title: "Mesaj", message: mesaj, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil))
        sayfa.present(alert, animated: true, completion: nil)
    }
}
