//
//  Enumeration.swift
//  Swift_Lean
//
//  Created by Taagoo'iMac on 14-7-3.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

import UIKit

class Enumeration: NSObject {
    
    
    //枚举
    
    //指南针四个方向的一个例子
    enum CompassPoint{
        case North
        case South
        case East
        case West
    }
    
    
    //注意： 不像 C 和 Objective-C 一样，Swift 的枚举成员在被创建时不会被赋予一个默认的整数值。在上面的CompassPoints例子中，North，South，East和West不是隐式得等于0，1，2和3。相反的，这些不同的枚举成员在CompassPoint的一种显示定义中拥有各自不同的值。
    
    
    
    //多个成员值可以出现在同一行上，用逗号隔开：
    enum Planet {
        case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Nepturn
    }
    
    
    //关联值（Associated Values）
    //“定义一个名为Barcode的枚举类型，它可以是UPCA的一个关联值（Int，Int，Int），或者QRCode的一个字符串类型（String）关联值。”
    enum Barcode {
        case UPCA(Int, Int, Int)
        case QRCode(String)
    }
    
    
    //原始值（Raw Values）
    //在关联值小节的条形码例子中演示了一个枚举的成员如何声明它们存储不同类型的关联值。作为关联值的替代，枚举成员可以被默认值（称为原始值）预先填充，其中这些原始值具有相同的类型。
    
    //这里是一个枚举成员存储原始 ASCII 值的例子：
    enum ASCIIControlCharacter: Character {
        case Tab = "\t"
        case LineFeed = "\n"
        case CarriageReturn = "\r"
    }
    
    //注意，原始值和关联值是不相同的。当你开始在你的代码中定义枚举的时候原始值是被预先填充的值，像上述三个 ASCII 码。对于一个特定的枚举成员，它的原始值始终是相同的。关联值是当你在创建一个基于枚举成员的新常量或变量时才会被设置，并且每次当你这么做得时候，它的值可以是不同的。

    
    //原始值可以是字符串，字符，或者任何整型值或浮点型值。每个原始值在它的枚举声明中必须是唯一的。当整型值被用于原始值，如果其他枚举成员没有值时，它们会自动递增。
    enum Planet1: Int {
        case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
    }
    
   
    
    func meiju() {
        
        //每个枚举定义了一个全新的类型。像 Swift 中其他类型一样，它们的名字（例如CompassPoint和Planet）必须以一个大写字母开头。给枚举类型起一个单数名字而不是复数名字，以便于读起来更加容易理解：
        var directionToHead = CompassPoint.West
        
        // directionToHead的类型被推断当它被CompassPoint的一个可能值初始化。一旦directionToHead被声明为一个CompassPoint，你可以使用更短的点（.）语法将其设置为另一个CompassPoint的值：
        directionToHead = .East
        
        
        
        //匹配枚举值和Switch语句
        
        directionToHead = .South
        
        switch directionToHead {
       
        case .North:
            println("Lots of planets have a north")
        case .South:
            println("Watch out for penguins")
        case .East:
            println("Where the sun rises")
        case .West:
            println("Where the skies are blue")
            
       
        }
        
        
        let somePlanet = Planet.Earth
        
        switch somePlanet {
        case .Earth:
            println("Mostly harmless")
        default:
            println("Not a safe place for humans")
        } 
        // prints "Mostly harmless”
        
        
        
        //枚举关联数值调用
        
        //可以使用任何一种条码类型创建新的条码，如：
        var productBarcode = Barcode.UPCA(8, 85909_51226, 3)

        //同一个商品可以被分配给一个不同类型的条形码，如：
        productBarcode = .QRCode("ABCDEFGHIJKLMNOP")
        
        
        
        //你可以在switch的case分支代码中提取每个关联值作为一个常量（用let前缀）或者作为一个变量（用var前缀）来使用
        switch productBarcode {
        case .UPCA(let numberSystem, let identifier, let check):
            println("UPC-A with value of \(numberSystem), \(identifier), \(check).")
        case .QRCode(let productCode):
            println("QR code with value of \(productCode).")
        }
        
        
        
       // 如果一个枚举成员的所有关联值被提取为常量，或者它们全部被提取为变量，为了简洁，你可以只放置一个var或者let标注在成员名称前：
        
        switch productBarcode {
        case let .UPCA(numberSystem, identifier, check):
            println("UPC-A with value of \(numberSystem), \(identifier), \(check).")
        case let .QRCode(productCode):
            println("QR code with value of \(productCode).")
        }
        // prints "QR code with value of ABCDEFGHIJKLMNOP."
        
        
        
        
       // 使用枚举成员的toRaw方法可以访问该枚举成员的原始值：
        let earthsOrder = Planet1.Earth.toRaw()
        
        //使用枚举的fromRaw方法来试图找到具有特定原始值的枚举成员。这个例子通过原始值7识别Uranus：
        let possiblePlanet = Planet1.fromRaw(7)
        // possiblePlanet is of type Planet? and equals Planet.Uranus
        
        
        //如果你试图寻找一个位置为9的行星，通过fromRaw返回的可选Planet值将是nil：
        let positionToFind = 9
        if let somePlanet = Planet1.fromRaw(positionToFind) {
            switch somePlanet {
            case .Earth:
                println("Mostly harmless")
            default:
                println("Not a safe place for humans")
            }
        } else {
            println("There isn't a planet at position \(positionToFind)")
        } 
        // prints "There isn't a planet at position 9
        
    }
    
    
    
    
    
   
    
    
    
    
    
}
