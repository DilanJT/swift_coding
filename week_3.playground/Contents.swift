import UIKit

var greeting = "Hello, playground"

print(greeting)
var sum = 0
while(sum < 10) {
    sum = sum + 1
    if(sum == 3){
        continue
    }
    print(sum)
}

func printName(name: String) {
    print("My name is \(name)")
}

printName(name: "Dilan")

func printAge(outSideName inSideName: Int) {
    print(inSideName)
}

printAge(outSideName: 12)

func getPerson(name: String, age: Int) -> String {
    let temp = "my name is \(name) and age is \(age)"
    return temp
}

print(getPerson(name:"Dilan", age:23))

var num = 1
print(num)

func updateValue(num: inout Int) {
    num += 1
}

updateValue(num: &num)

print(num)

func add(a: Int, b: Int) -> Int{
    return a + b
}

var addFunction: (Int, Int) -> Int = add


let result1 = addFunction(4, 2)

func printResult(function: (Int, Int) -> Int, a: Int, b: Int) {
    let result = function(a, b)
    print(result)
}

printResult(function: add, a: 4, b: 2)

class PersonClass {
    var name: String
    var age: Int
    
    init(name: String) {
        self.name = name
    }
    
    func getPerson() {
        print("My name is \(name) and age is \(age)")
    }
}

struct PersonStruct {
    var name: String
    var age: Int
}

var class1 = PersonClass(name: "Swift")

var struct1 = PersonStruct(name: "Swift struc", age: 22)
