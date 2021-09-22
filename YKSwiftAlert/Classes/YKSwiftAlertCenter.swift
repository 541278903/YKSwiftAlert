//
//  YKSwiftAlertCenter.swift
//  YKSwiftAlert
//
//  Created by edward on 2021/9/22.
//

import UIKit
import QuartzCore


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
        
        // 删除旧的先
        var beforeView = inView.viewWithTag(YKSwiftAlertCenter.kYK_AlertMessage_Tag())
        if beforeView != nil {
            beforeView!.removeFromSuperview()
            beforeView = nil
        }
        
        let isPad:Bool = UI_USER_INTERFACE_IDIOM() == .pad
        let showW:CGFloat = (isPad) ? 200 : 150
        let showH:CGFloat = (isPad) ? 45 : 25
        let spacX:CGFloat = (isPad) ? 10 : 10
        
        let showFont:UIFont = UIFont.systemFont(ofSize: isPad ? 24 : 16)
        let nsMessage:NSString = NSString(string: message)
        var theStringSize:CGSize = nsMessage.boundingRect(with: CGSize.init(width: showW-spacX*2, height: 1000), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:showFont], context: nil).size
        
        if theStringSize.height<showH {
            theStringSize.height = showH
        }
        
        // 背景
        let showView:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: showW, height: theStringSize.height+spacX*2))
        showView.tag = YKSwiftAlertCenter.kYK_AlertMessage_Tag()
        showView.alpha = 0
        showView.backgroundColor = UIColor.black.withAlphaComponent(0)
        showView.layer.cornerRadius = isPad ? 10 : 7
        showView.layer.masksToBounds = true
        showView.center = CGPoint(x: inView.frame.width/2, y: inView.frame.height/2)
        inView.addSubview(showView)
        
        // 内容
        
        let showLabel:UILabel = UILabel.init(frame: CGRect.init(x: spacX, y: spacX, width: showW - spacX*2, height: theStringSize.height))
        showLabel.textAlignment = .center
        showLabel.numberOfLines = 0
        showLabel.text = message
        showLabel.textColor = .white
        showLabel.backgroundColor = .clear
        showLabel.font = showFont
        showView.addSubview(showLabel)
        
        // 动画
        var tempView:UIView = showView
        
        
    }
    
    public static func showLoading(message:String)->Void
    {
        
    }

    public static func dissLoading()->Void
    {
        
    }
    
    private static func kYK_AlertMessage_Tag()->Int
    {
        return 889
    }
    
    private static func kYK_AlertLoading_Tag()->Int
    {
        return 888
    }
}
