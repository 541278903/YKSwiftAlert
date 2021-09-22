//
//  YKSwiftAlertCenter.swift
//  YKSwiftAlert
//
//  Created by edward on 2021/9/22.
//

import UIKit


class YKSwiftAlertCenter: NSObject {

    public static func showMessage(message:String)->Void
    {
        
    }
    
    public static func showMessage(message:String, inView:UIView)->Void
    {
        YKSwiftAlertCenter.dissLoading()
        
        if message.count <= 0 {
            return
        }
        
        let isPad:Bool = UI_USER_INTERFACE_IDIOM() == .pad
        let showW:CGFloat = (isPad) ? 200 : 150
        let showH:CGFloat = (isPad) ? 45 : 25
        let spacX:CGFloat = (isPad) ? 10 : 10
        
        let showFont:UIFont = UIFont.systemFont(ofSize: isPad ? 24 : 16)
        let theStringSize:CGSize = message.
    }
    
    public static func showLoading(message:String)->Void
    {
        
    }

    public static func dissLoading()->Void
    {
        
    }
}
