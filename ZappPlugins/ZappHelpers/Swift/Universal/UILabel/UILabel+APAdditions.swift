//
//  UIView+APAdditions.swift
//  ZappPlugins
//
//  Created by Guy Kogus on 24/08/2017.
//  Copyright © 2017 Applicaster Ltd. All rights reserved.
//

import UIKit

public extension UILabel {

    /**
     Helper function to set label color
     
     - parameter key: The label key inside the dictionary to look for.
     - parameter dictionary: styles dictionary.
     */
    @objc func setColor(key:String, from dictionary:[String : Any]?) {
        if let dictionary = dictionary,
            let argbString = dictionary[key] as? String,
            !argbString.isEmptyOrWhitespace() {
            let color = UIColor(argbHexString: argbString)
            self.textColor = color
        }
    }
    
    /**
     Helper function to set label font and size
     
     - parameter fontNameKey: The font key inside the dictionary to look for.
     - parameter fontSizeKey: The font size.
     - parameter dictionary: styles dictionary.
     */
    @objc func setFont(fontNameKey:String, fontSizeKey:String, from dictionary:[String : Any]?) {
        var font = UIFont.systemFont(ofSize: 10)
        if let dictionary = dictionary,
            let fontName = dictionary[fontNameKey] as? String,
            let fontSizeString = dictionary[fontSizeKey] as? String,
            let fontSize = CGFloat(fontSizeString),
            let tempFont = UIFont(name: fontName, size: fontSize) {
            font = tempFont
        }
        self.font = font
    }
}
