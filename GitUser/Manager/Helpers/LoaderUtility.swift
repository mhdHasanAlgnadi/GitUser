//
//  LoaderUtility.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import JGProgressHUD

class LoaderUtility{
    static let shared = LoaderUtility()
    var hud2 = JGProgressHUD.init(style: JGProgressHUDStyle.extraLight)
    
    init() {
        
    }
    
    func show(msg message:String = "", inView view:UIView)  {
        
        hud2.textLabel.textColor = .darkGray
        hud2.textLabel.text = message
        hud2.textLabel.font = ThemeApp.Fonts.medium17
        hud2.shadow = JGProgressHUDShadow(color: .darkGray, offset: .zero, radius: 5.0, opacity: 0.2)
        hud2.show(in: view, animated: true)

    }
    
    func hide() {
        self.hud2.dismiss(animated : false)
    }
}

