//
//  ThemeApp.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import Foundation
import UIKit
import IQKeyboardManager
import SwiftyJSON

class ThemeApp {
    
    static func Refrash(){
        ThemeApp.shared = ThemeApp()
        ThemeApp.Colors = Color()
        ThemeApp.Fonts = Font()
    }
    
    static var shared = ThemeApp()
    
    static var Colors = Color()

    static var Fonts = Font()

    
    class Font{
        var regular8   = UIFont(name: Constants.PoppinsRegular, size: 8 )!
        var regular11  = UIFont(name: Constants.PoppinsRegular, size: 11)!
        var regular12  = UIFont(name: Constants.PoppinsRegular, size: 12)!
        var regular13  = UIFont(name: Constants.PoppinsRegular, size: 13)!
        var regular14  = UIFont(name: Constants.PoppinsRegular, size: 14)!
        var regular15  = UIFont(name: Constants.PoppinsRegular, size: 15)!
        
        var medium11   = UIFont(name: Constants.PoppinsMedium, size: 11)!
        var medium12   = UIFont(name: Constants.PoppinsMedium, size: 12)!
        var medium13   = UIFont(name: Constants.PoppinsMedium, size: 13)!
        var medium14   = UIFont(name: Constants.PoppinsMedium, size: 14)!
        var medium16   = UIFont(name: Constants.PoppinsMedium, size: 16)!
        var medium17   = UIFont(name: Constants.PoppinsMedium, size: 17)!
        var medium20   = UIFont(name: Constants.PoppinsMedium, size: 20)!
        
        
        var semiBold14 = UIFont(name: Constants.PoppinsSemiBold, size: 14)!
        var semiBold16 = UIFont(name: Constants.PoppinsSemiBold, size: 16)!
        var semiBold18 = UIFont(name: Constants.PoppinsSemiBold, size: 18)!
        var semiBold20 = UIFont(name: Constants.PoppinsSemiBold, size: 20)!
    }
    
    
    static func setupStyle(){
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = ThemeApp.Colors.background
        UINavigationBar.appearance().tintColor = ThemeApp.Colors.blue
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.font : ThemeApp.Fonts.semiBold20,
            NSAttributedString.Key.foregroundColor : ThemeApp.Colors.blue
        ]
        UINavigationBar.appearance().barStyle = UIBarStyle.default
        IQKeyboardManager.shared().keyboardAppearance =  UIKeyboardAppearance.light
        UINavigationBar.appearance().shadowImage = UIImage() //remove pesky 1 pixel line
    }
    
}



class Color{
    
    var primary       = UIColor.init("#4D777C")
    var dark          = UIColor.init("#1B2735")
    var secondary     = UIColor.init("#A0A0A0")
    var borders       = UIColor.init("#DCDCDC")
    var light         = UIColor.init("#F5F5F5")
    var white         = UIColor.init("#FFFFFF")
    var green         = UIColor.init("#00FF00")
    var radioBtnEmpty = UIColor.init("#C0C0C0")
    var title         = UIColor.init("#252B37")
    var b2b1bb        = UIColor.init("#B2B1BB")
    
    var navBar = UIColor.init("550096")
    var background =  UIColor.init("FFFFFF")
    var background_gray =  UIColor.init("808080")
    var font =  UIColor.init("808080")
    var font_blue =  UIColor.init("253B66")
    var gray =  UIColor.init("253B66")
    var red = UIColor.init("D73C2B")
    var blue = UIColor.init("00A0C6") // 00A0C6

    var card =  UIColor.init("D8D8D8").withAlphaComponent(0.37)

    var card2 =  UIColor.white
    var card3 = UIColor.white

    var tfBackground = UIColor.white

    var tabBarTint = UIColor.groupTableViewBackground
    var tabBarIcons =  UIColor.gray
    
}
