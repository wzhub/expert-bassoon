@propertyWrapper struct SmallNumber{
 private var number:Int;private(set) var projectedValue:Bool;var wrappedValue:Int{
  get{
   return number
  }
  set{
   if newValue > 12{ 
    number = 12
    projectedValue = true
   }else{
    number = newValue
    projectedValue = false
   }
  }
 }
 init(){
  self.number = 0
  self.projectedValue = false
 }
}
struct SmallRectangle{
 @SmallNumber private var width:Int;@SmallNumber var height:Int
}
var rectangle = SmallRectangle()
print(
 rectangle.height
)
rectangle.height = 10
print(
 rectangle.height
)
rectangle.height = 24
print(
 rectangle.height
)
struct SomeStruct{
 @SmallNumber var someNumber:Int
}
var someStruct = SomeStruct()
someStruct.someNumber = 5
print(
 someStruct.$someNumber
)
someStruct.someNumber = 55
print(
 someStruct.$someNumber
)
enum Size{
 case large
 case small
}
struct SizedRectangle{
 @SmallNumber private var width:Int
 @SmallNumber private var height:Int
 mutating func resize(
  to size:Size
 )->Bool{
  switch size{
   case .large:
    width = 100
    height = 100
   case .small:
    width = 10
    height = 10
  }
  return $width || $height
 }
}
func someFunction(){
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
 static private let storedTypeProperty = "some value"
 static private var computedTypeProperty:Int{
  return 0
 }
}