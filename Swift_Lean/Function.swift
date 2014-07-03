//
//  Function.swift
//  Swift_Lean
//
//  Created by Leslie on 14-7-2.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

import UIKit

class Function: NSObject {
    
    
    
    func  hansu(){
        
        
        
        //使用函数类型 
        //在swift中您可以像任何其他类型一样的使用函数类型。例如，你可以定义一个常量或变量为一个函数类型，并为变量指定一个对应的函数：
        
        
        var mathFunction: (Int, Int) -> Int = addTwoInts
        //可以解读为："定义一个名为mathFunction变量，该变量的类型为'一个函数，它接受两个Int值，并返回一个Int值。'设置这个新的变量来引用名为addTwoInts函数。"
        
        //现在你可以使用mathFunction来调用指定的函数：
        println("Result: \(mathFunction(2,3))")  // prints "Result: 5"
        
        //具有相同匹配类型的不同函数可以被赋给同一个变量，和非函数类型一样：
        mathFunction = multiplyTwoInts
        println("Result: \(mathFunction(2, 3))")
        // prints "Result: 6"
        
        //与其他类型一样,当你给函数赋一个常量或者变量时，你可以让Swift去推断函数的类型。   
        let anotherMathFunction = addTwoInts
        // anotherMathFunction is inferred to be of type (Int, Int) -> Int
        
        
        
        //作为型参类型的函数类型调用
        printMathResult(addTwoInts, a:3, b:5)
        // prints "Result: 8"
       
        
        
        
          //作为返回类型的函数类型
        var currentValue = 3
        let moveNearerToZero = chooseStepFunction(currentValue > 0)
        
        
        
        println("Counting to zero:")
        // Counting to zero:
        while currentValue != 0 {
            println("\(currentValue)... ")
            currentValue = moveNearerToZero(currentValue)
        } 
        println("zero!")
        
            
        
        //调用潜逃函数
        while currentValue != 0 {
            println("\(currentValue)... ")
            currentValue = moveNearerToZero(currentValue)
        }
        println("zero!")
        
    }
   
    
    /**
    *  sayHello 函数名
    *
    *  @param String pesonName 参数名 及类型
    *
    *  @return 返回值类型
    */
    func sayHello(personName: String) ->String{
        let greeting = "Hello" + personName + "!"
        
        return greeting
    }
    
    
    //多输入形参
    
    //函数可以有多个输入形参，把它们写到函数的括号内，并用逗号加以分隔。下面这个函数设置了一个半开区间的开始和结束索引，用来计算在范围内有多少元素：
    func halfOpenRangeLength(start: Int,end: Int) -> Int{
        return end - start
    }
    
    
    //无形参函数
    //函数并没有要求一定要定义的输入形参。下面就是一个没有输入形参的函数，任何时候调用时它总是返回相同的String消息：
    func sayHelloWorld() -> String {
        return "hello, world"
    }
    
    //无返回值的函数
    //函数不需要定义一个返回类型。这里有一个版本的sayHello函数，称为waveGoodbye，它会打印自己的String值而不是返回它：
    func sayGoodbye(personName: String) {
        println("Goodbye, \(personName)!")
    }
    
    
    
    func printAndCount(stringToPrint: String) -> Int {
        println(stringToPrint)
        return countElements(stringToPrint)
    }
    
    func printWithoutCounting(stringToPrint: String) {
        printAndCount(stringToPrint)
    }
    
    //多返回值函数
    func count(string:String) ->(vowels: Int, consonants: Int, Others: Int){
        
        var vowels = 0, consonants = 0, others = 0
        for character in string{
            
            switch String(character).lowercaseString {
                
            case "a", "e", "i", "o", "u":
                ++vowels
            case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m","n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
                ++consonants
                
            default:
                ++others
            }
            
        }
        return (vowels, consonants, others)
        
    }
    
    
    //外部形参名
    func join(string s1: String, toString s2: String, withJoiner joiner: String)-> String {
        return s1 + joiner + s2
    }
    
    // 外部参数名称速记
    func containsCharacter( # string: String,  characterToFind: Character) -> Bool {
        for character in string {
            if character == characterToFind {
                return true
            }
        }
        return false
    }
    
    
    
    
    //可变形参
    //一个可变形参可接受零个或多个指定类型的值。当函数被调用时，你可以使用可变形参来指定--形参可以用来传递任意数量的输入值。可通过在形参的类型名后边插入三个点符号（...）来编写可变形参。
    //递至可变形参的值在函数主体内是以适当类型的数组存在的。例如,一个可变参数的名称为numbers和类型为Double...在函数体内就作为名为numbers类型为Double[]的常量数组。
    //下边示例为任何长度的数字列表计算算术平均值：
    func arithmeticMean (numbers: Double...) -> Double{
        
        var total: Double = 0
        for number in numbers{
            total += number
        }
        return total / Double(numbers.count)
    }
    
    
    //在参数名称前用关键字var定义变量参数：
    func alignRight(var string: String, count: Int, pad: Character) -> String {
        let amountToPad = count - countElements(string)
        for _ in 1...amountToPad {
            string = pad + string
        }
        return string
    }
    
    

    
    //每一个函数都有特定的函数类型，由函数的形参类型和返回类型组成。例如：
    func addTwoInts(a: Int, b: Int) -> Int {
        return a + b
    }
    func multiplyTwoInts(a: Int, b: Int) -> Int {
        return a * b
    }
    
    
      //作为形参类型的函数类型


    func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
        println("Result: \(mathFunction(a, b))")
    }



    
    
    //作为返回类型的函数类型
    
    func stepForward(input: Int) -> Int{
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int{
        return input - 1
    }

    //这里有一个chooseStepFunction函数，它的返回类型是"函数类型(Int) -> Int"。chooseStepFunction基于名为backwards的布尔形参返回stepBackward或stepForward函数:
    func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
        return backwards ? stepBackward : stepForward
    }
    
    
    //嵌套函数
    func chooseStepFunction2(backwards: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { return input + 1 }
        func stepBackward(input: Int) -> Int { return input - 1 }
        return backwards ? stepBackward : stepForward
    }
    
    
    
    
    
}
