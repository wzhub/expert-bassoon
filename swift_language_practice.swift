@propertyWrapper struct SmallNumber{private var number:Int;private(set) var projectedValue:Bool;var wrappedValue:Int{get{number}
set{if newValue > 12{number = 12;projectedValue = true}else{number = newValue;projectedValue = false}}};init(){self.number = 0;self.projectedValue = false}};enum Size{case large,small};struct SizedRectangle{@SmallNumber private var width:Int;@SmallNumber private var height:Int;mutating func resize(to size:Size)->Bool{switch size{case .large:width = 100;height = 100;case .small:width = 10;height = 10};return $width || $height}}
func someFunc(){
 @SmallNumber var myNumber:Int
 myNumber = 10
 print(
  myNumber
 )
 myNumber = 24
 print(
  myNumber
 )
}
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
}