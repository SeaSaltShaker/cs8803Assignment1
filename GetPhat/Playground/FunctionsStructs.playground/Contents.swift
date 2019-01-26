class Cat:Animal {
    var name:String?
}

struct Dog:Animal {
    var name:String?
}

class Animal {
    var age:Int?
}



let yellowCat = Cat()
yellowCat.name = "Whiskers"
yellowCat.age = 3

print(yellowCat.name)


var yellowDog = Dog()

yellowDog.name = "Bruno"

print(yellowDog.name as Any)

let yellowStrayCat = yellowCat
yellowStrayCat.name = "Smokey"
print(yellowStrayCat.name as Any)
print(yellowCat.name as Any)


var yellowStrayDog = yellowDog
yellowStrayDog.name = "Max"
print(yellowStrayDog.name)
print(yellowDog.name)
