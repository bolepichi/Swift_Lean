//
//  MainViewController.swift
//  Swift_Lean
//
//  Created by Taagoo'iMac on 14-7-1.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {

    

    
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        array()
        
        dictionary()
        
     
        println(sayHello("Anna"))
        
        println(sayHello("Brian"))
        
        
        //当一个函数调用时它的返回值可以忽略不计：
        
        printAndCount("hello, world")
        // prints "hello, world" and returns a value of 12
        printWithoutCounting("hello, world")
        
        

        // Do any additional setup after loading the view.
    }
    
    //数组
    func array() {
        
        //数组
        
        var shoppingList = ["Eggs","Milk"]
        println("The shopping list contains \(shoppingList.count) items.")
        
        
        //isEmpty 判空
        
        if shoppingList.isEmpty {
            println("The shopping list is empty.")
        } else {
            println("The shopping list is not empty.")
        }
        
        //append 添加新的数据项
        shoppingList.append("Flour")
        
        
        // += 添加数据项
        shoppingList += "Baking Powder"
        
        // += 直接添加拥有相同类型数据的数组
        shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
        
        
        //使用下标回去数组中的数据项
        var firstItem = shoppingList[0]
        
        
        //利用下标直接改变
        shoppingList[0] = "Six eggs"
        
        
        //利用下标批量修改
        shoppingList[4...6] = ["Bananas","Apples"]
        
        
        //调用数组的insert(atIndex:)方法来在某个具体索引值之前添加数据项
        shoppingList.insert("Maple Syrup", atIndex:0)
        
        
        //类似的我们可以使用removeAtIndex方法来移除数组中的某一项。这个方法把数组在特定索引值中存储的数据项移除并且返回这个被移除的数据项（我们不需要的时候就可以无视它）:
        let mapleSyrup = shoppingList.removeAtIndex(0)
        
        //数据项被移除后数组中的空出项会被自动填补，所以现在索引值为0的数据项的值再次等于"Six eggs":
        
        firstItem = shoppingList[0]
        // firstItem 现在等于 "Six eggs"
        
        
        
        //移除数组最后一向
        let apples = shoppingList.removeLast()
        
        
        
        
        /*----------------数组的遍历-----------*/
        
        for item in shoppingList{
            println(item)
        }
        
        
        //同时需要每个数据项的值和索引值     enumerate遍历
        
        for (index, value) in enumerate(shoppingList){
            println("Item \(index+1) : \(value)")
        }
        
        
        
        
        /*-------------创建并且构造一个数组-----------*/
        
        //使用构造语法创建一个由特定数据类型构成的空数组
        
        var someInts = Int[]()
        println("someInts is of tyoe Int[] with \(someInts.count) items.")
        
        
        //如果代码上下文提供了类型信息：
        someInts.append(3)
        // someInts 现在包含一个INT值
        someInts = []
        // someInts 现在是空数组，但是仍然是Int[]类型的。
        
        
        // 创建特定长度，默认值的数组
        var threeDoubles = Double[](count: 3, repeatedValue:0.0)
        
        
        //因为类型推断的存在，我们使用这种构造方法的时候不需要特别指定数组中存储的数据类型，因为类型可以从默认值推断出来
        var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)
        
        
        //我们可以使用加法操作符（+）来组合两种已存在的相同类型数组
        var sixDoubles = threeDoubles + anotherThreeDoubles
        
        
        
        //您可以使用此计数函数来对任意字符串进行字符计数，以检索一个包含三个指定Int值的元素统计总数：
        let total = count("some arbitrary string!")
        println("\(total.vowels) vowels and \(total.consonants) consonants")
        // prints "6 vowels and 13 consonants"
        
        
        //调用外部形参名函数
        join(string: "小白", toString: "小黑", withJoiner: "小黄")

        
        
    }
    
    //字典
    func dictionary() {
        
        
        //创建字典
        
        var airports: Dictionary<String, String> = ["TYO": "Tokyo", "DUB": "Dublin"]
        
        
        //如果我们使用字面语句构造字典就不用把类型定义清楚
        
        //var airports = ["TYO": "Tokyo", "DUB": "Dublin"]
        
        
        /*------------读取和修改字典---------*/
        
        println("The dictionary of airoorts contains \(airports.count) items.")
        
        
        //使可以使用一个合适类型的key作为下标索引，并且分配新的合适类型的值：
        airports["LHR"] = "London" // airports 字典现在有三个数据项

        
        
        // 使用下标语法改变特定键对应的值：
        airports["LHR"] = "London Heathrow" // "LHR"对应的值 被改为 "London Heathrow
        
        
        
        //updateValue(forKey:)函数会返回包含一个字典值类型的可选值。举例来说：对于存储String值的字典，这个函数会返回一个String?或者“可选 String”类型的值。如果值存在，则这个可选值值等于被替换的值，否则将会是nil。
        
        if let oldValue = airports.updateValue("Dublin Internation", forKey:"DUB"){
            println("The old value for DUB was \(oldValue).")
        }
        
        // 打印出 "The old value for DUB was Dublin."（dub原值是dublin）
        
        
       
        
        //我们也可以使用下标语法来在字典中检索特定键对应的值。由于使用一个没有值的键这种情况是有可能发生的，可选 类型返回这个键存在的相关值，否则就返回nil：
        
        if let airportName = airports["DUB"] {
            println("The name of the airport is \(airportName).")
        } else {
            println("That airport is not in the airports dictionary.")
        }
           // 打印 "The name of the airport is Dublin INTernation."（机场的名字是都柏林国际）
     
        
        
        
        
        
        //移除一个键值对
        airports["APL"] = "Apple Internation"
        airports["APL"] = nil
        
        //removeValueForKey
        
        if let removedValue = airports.removeValueForKey("DUB"){
            
            println("The removed airpport's name is \(removedValue)")
            
        } else {
            
            println("The airports dictionary does not contain a value for DUB.")
            
        }
        
        
        /*--------------字典遍历-------------*/
        
        //每一个字典中的数据项都由(key, value)元组形式返回
        for (airportCode, airportName) in airports {
            println("\(airportCode): \(airportName)")
        }
        
    
        //可以通过访问他的keys或者values属性（都是可遍历集合）检索一个字典的键或者值：
        
        for airportCode in airports.keys {
            
            println("Airport code: \(airportCode)")
        }
        // Airport code: TYO
        // Airport code: LHR
        
        
        for airportName in airports.values {
            println("Airport name: \(airportName)")
        }
        // Airport name: Tokyo
        // Airport name: London Heathrow
        
        
        
        //如果我们只是需要使用某个字典的键集合或者值集合来作为某个接受Array实例 API 的参数，可以直接使用keys或者values属性直接构造一个新数组：
        let airportCodes = Array(airports.keys)
        // airportCodes is ["TYO", "LHR"]
        
        let airportNames = Array(airports.values)
        
        //注意： Swift 的字典类型是无序集合类型。其中字典键，值，键值对在遍历的时候会重新排列，而且其中顺序是不固定的。
        
        
        
        
        /*-----------创建一个空字典---------*/
        var namesOfIntegers = Dictionary<Int, String>()
        
        
        
        //如果上文已经提供信息类型
        namesOfIntegers[16] = "sixteen"
        
        namesOfIntegers = [:]
        
        
        
        /*

        集合的可变性
        数组和字典都是在单个集合中存储可变值。如果我们创建一个数组或者字典并且把它分配成一个变量，这个集合将会是可变的。这意味着我们可以在创建之后添加更多或移除已存在的数据项来改变这个集合的大小。与此相反，如果我们把数组或字典分配成常量，那么他就是不可变的，它的大小不能被改变。
        
        对字典来说，不可变性也意味着我们不能替换其中任何现有键所对应的值。不可变字典的内容在被首次设定之后不能更改。 不可变行对数组来说有一点不同，当然我们不能试着改变任何不可变数组的大小，但是我们可以重新设定相对现存索引所对应的值。这使得 Swift 数组在大小被固定的时候依然可以做的很棒。
        
        */
        
    }
    
    //
    
    
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
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
