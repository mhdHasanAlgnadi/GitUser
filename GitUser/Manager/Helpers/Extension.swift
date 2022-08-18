//
//  Extension.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import Foundation
import UIKit
import Photos
import SwiftyJSON
import SwiftMessages

extension Dictionary {
    var toJSONString: String? {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self,
                                                            options: [.prettyPrinted]) else {
            return nil
        }

        return String(data: theJSONData, encoding: .ascii)
    }
    var toJSON: JSON {
        return JSON(parseJSON: self.toJSONString ?? "")
    }
    
}

extension Date {
    func toFormatte_YYYY_MM_DD2() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MMM/yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)!
        return dateFormatter.string(from: self)
    }
}

extension String {
    var notification : NSNotification.Name {
        return NSNotification.Name.init(rawValue: self)
    }
    
    
    func DatefromFormate_YYYY_MM_DD_HH_MM_SS_Z() -> Date{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        var date: Date? = dateFormatterGet.date(from: self)
        date = date == nil ? Date() : (date!)
        return date!
    }
}

extension UIView {
    func addShadow(offset: CGSize? = CGSize(width: 0, height: 3),
                   shadowColor: CGColor? = UIColor.black.withAlphaComponent(0.4).cgColor,
                   radius: CGFloat? = 4,
                   opacity: Float? = 0.6,
                   cornerRadius: CGFloat? = 8,
                   layerBackgroundColor: CGColor? = UIColor.white.cgColor){
        
        self.layer.masksToBounds = false
        self.layer.shadowOffset = offset ?? CGSize(width: 0, height: 3)
        self.layer.shadowColor = shadowColor
        self.layer.shadowRadius = radius ?? 4
        self.layer.shadowOpacity = opacity ?? 0.6
        self.layer.shouldRasterize = true
        self.layer.cornerRadius = cornerRadius ?? 8
        self.layer.rasterizationScale = UIScreen.main.scale
        self.layer.backgroundColor =  layerBackgroundColor
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
extension UIColor{
    
    public convenience init(_ hex : String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 255/255, green: 0, blue: 0, alpha: 1)// UIColor.gray
            return
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}


extension UIViewController{
    open func showMessage(title: String = "", message: String, duration: Double = 2.0, theme: Theme = .success, didShow: (() -> Void)? = nil, didHide: (() -> Void)? = nil) {
           
           if CommandLine.arguments.contains("--uitesting") {
               return
           }
           
           
           let view = MessageView.viewFromNib(layout: .cardView)
           
           // Theme message elements with the warning style.
           view.configureTheme(theme)
           
           // Add a drop shadow.
           view.configureDropShadow()
           
           // Set message title, body, and icon. Here, we're overriding the default warning
           // image with an emoji character.
           view.configureContent(title: title, body: message, iconText: "")

           // Increase the external margin around the card. In general, the effect of this setting
           // depends on how the given layout is constrained to the layout margins.
           view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
           
           // Reduce the corner radius (applicable to layouts featuring rounded corners).
           let roundingView = (view.backgroundView)
           
           roundingView?.cornerRadius = 10
           
           
           var config = SwiftMessages.Config()
           
           // Slide up from the bottom.
           config.presentationStyle = .bottom
           
           // Display in a window at the specified window level: UIWindow.Level.statusBar
           // displays over the status bar while UIWindow.Level.normal displays under.
           //        config.presentationContext = .window(windowLevel: .statusBar)
           
           // Disable the default auto-hiding behavior.
           if duration == 0
           {
               config.duration = .forever

           }else{
               config.duration = .seconds(seconds: duration)

           }
           
           // Dim the background like a popover view. Hide when the background is tapped.
           config.dimMode = .gray(interactive: true)
           
           // Disable the interactive pan-to-hide gesture.
           config.interactiveHide = false
           
           // Specify a status bar style to if the message is displayed directly under the status bar.
           //        config.preferredStatusBarStyle = .lightContent
           //
           // Specify one or more event listeners to respond to show and hide events.
           config.eventListeners.append() { event in
               if case .didShow = event {
                   didShow?()
               }
               if case .didHide = event {
                   didHide?()
               }
           }
           view.button?.isHidden = true
           
           SwiftMessages.show(config: config, view: view)
           
       }
}

