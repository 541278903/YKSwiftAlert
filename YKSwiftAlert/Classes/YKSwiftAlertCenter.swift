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
        
        // 删除旧的先
//        UIView *beforeView = [view viewWithTag:[YKAlertCenter kYK_AlertMessage_Tag]];
//        if (beforeView) {
//            [beforeView removeFromSuperview];
//            beforeView = nil;
//        }
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
        
        let showView:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: showW, height: theStringSize.height+spacX*2))
        showView.tag = YKSwiftAlertCenter.kYK_AlertMessage_Tag()
        showView.alpha = 0
        showView.backgroundColor = UIColor.black.withAlphaComponent(0)
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
