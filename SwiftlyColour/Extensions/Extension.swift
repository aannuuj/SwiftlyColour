//
//  Extension.swift
//  SwiftlyColour
//
//  Created by Hariom Palkar on 09/12/20.
//

import Foundation
import SwiftUI

//MARK: copy the code to pasteboard

func copyString(textToCopy: String) {
    let pasteBoard = NSPasteboard.general
    pasteBoard.clearContents()
    pasteBoard.setString(textToCopy, forType: .string)
}

//MARK: hex to color

func hexToColor (hexString:String) -> NSColor {
    var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return NSColor.gray
    }
    
    let scanner = Scanner(string: hexString)
    var color: UInt64 = 0
    scanner.scanHexInt64(&color)
    return NSColor(
        red: CGFloat((color & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((color & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(color & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

//MARK:hex code to string

func hexToString(hexString: String) -> String {
    var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if hexString.hasPrefix("#") {
        cString.remove(at: cString.startIndex)
    }
    let scanner = Scanner(string: hexString)
    var color: UInt64 = 0
    scanner.scanHexInt64(&color)
    
    let mask = 0x000000FF
    
    let r = Int(color >> 16) & mask
    let g = Int(color >> 8) & mask
    let b = Int(color) & mask
    
    let red   = String(format: "%.2f", Float(r) / 255.0)
    let green = String(format: "%.2f", Float(g) / 255.0)
    let blue  = String(format: "%.2f", Float(b) / 255.0)
    let floatValue = (red: red, green: green, blue: blue, alpha: 1.0)
    
    
    let stringValue = "UIColor\(floatValue)"
    return stringValue
}

//MARK: RGB to color
func RGBToColor(r: String, g: String, b: String , a : String) -> NSColor {
    
    let red   = CGFloat( Float(r) ?? 0 / 255.0)
    let green = CGFloat(Float(g) ?? 0 / 255.0)
    let blue  = CGFloat(Float(b) ?? 0 / 255.0)
    let alpha = CGFloat(Float(a) ?? 1.0 / 255.0)
    
    guard red > 1.01 || green > 1.01 || blue > 1.01  || alpha > 1.01 else {
        return NSColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
    }
    
    return NSColor(red: red,
                   green: green,
                   blue: blue,
                   alpha: CGFloat(alpha))
}

//MARK: RGB to string

func RGBToString(r: String, g: String, b: String , a : String) -> String {
    
    
    let rv = Float(r) ?? 0
    let redValue = rv/255
    
    let gv = Float(g) ?? 0
    let greenValue = gv/255
    
    
    let bv = Float(b) ?? 0
    guard bv < 256 , rv  < 256, gv  < 256 else {
        return "Enter RGB value less than 255"
    }
    
    let blueValue = bv/255
    let av = Float(a) ?? 1.0
    
    let red   = String(format: "%.2f", Float(redValue) )
    let green = String(format: "%.2f", Float(greenValue))
    let blue  = String(format: "%.2f", Float(blueValue))
    
    let floatValue = (red: red, green: green, blue: blue, alpha: av)
    
    
    let stringValue = "UIColor\(floatValue)"
    return stringValue
}



