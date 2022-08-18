//
//  Constants.swift
//  GitUser
//
//  Created by Mhd Hasan Al Janadi on 17/08/2022.
//

import Foundation
import UIKit

struct Constants {
    
    //appDelegate
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    enum StoryBoard : String{
        case Authenticate = "Authenticate"
        case Onboarding = "Onboarding"
        case Main = "Main"
    }
    
    
    // images
    static let LogoImg = "logo"
    static let MenuImg = "Menu"
    static let BackImg = "Back"
    static let Splash0 = "Splash0"
    static let Splash1 = "Splash1"
    static let Splash2 = "Splash2"
    static let Splash3 = "Splash3"
    
    //fonts
    static let PoppinsRegular = "Poppins-Regular"
    static let PoppinsMedium = "Poppins-Medium"
    static let PoppinsSemiBold =  "Poppins-SemiBold"
    static let CoconNextArabicBold =  "CoconNextArabic-Bold"
    static let CoconNextArabicLight =  "CoconNextArabic-Light"
    
    
    //VC Names
    static let NewsDetailsVC = "NewsDetailsVC"
    static let SideMenuVC = "SideMenuVC"
    static let CoverVC = "CoverVC"
    static let NavHomeVC = "NavHome"
    static let HomeVC = "HomeVC"
    static let OnBoardingSplashVC = "OnBoardingSplashVC"
    static let OnBoardingSplash1VC = "OnBoardingSplash1VC"
    static let OnBoardingSplash2VC = "OnBoardingSplash2VC"
    static let SplashVC = "SplashVC"

    //Cells
    static let NewsCell = "NewsCell"
    static let NewsDetailsCell = "NewsDetailsCell"
    
}
