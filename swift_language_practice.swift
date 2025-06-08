@propertyWrapper struct SmallNumber{private var number:Int;private(set) var projectedValue:Bool;var wrappedValue:Int{get{number}
set{if newValue > 12{number = 12;projectedValue = true}else{number = newValue;projectedValue = false}}};init(){self.number = 0;self.projectedValue = false}};func someFunc(){@SmallNumber var myNumber:Int
myNumber = 10
print(
 myNumber
)
myNumber = 24
print(
 myNumber
)}
struct SomeStructure{
 static let storedTypeProperty:String = "some value"
 static private var computedTypeProperty:Int{
  return 0
 }
}
enum SomeEnumeration{
 static private let storedTypeProperty:String = "some value"
 static var computedTypeProperty:Int{
  return 1
 }
}
class SomeClass{
 static private let storedTypeProperty:String = "some value"
 static var computedTypeProperty:Int{
  return 2
 }
 class var overridableComputedTypeProperty:Int{
  return 3
 }
}
print(
 SomeStructure.storedTypeProperty
)
print(
 SomeEnumeration.computedTypeProperty
)
print(
 SomeClass.computedTypeProperty
)
struct AudioChannel{
 static private let thresholdLevel = 10
}