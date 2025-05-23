@propertyWrapper struct SmallNumber{private var number:Int,maximum:Int;var wrappedValue:Int{get{return number}
set{number = min(newValue,maximum)}};init(){maximum = 12;number = 0};init(wrappedValue:Int){maximum = 12;number = min(wrappedValue,maximum)};init(wrappedValue:Int,maximum:Int){self.maximum = maximum;number = min(wrappedValue,maximum)}};struct ZeroRectangle{@SmallNumber var width:Int;@SmallNumber var height:Int};let zeroRectangle = ZeroRectangle();print(zeroRectangle.width,zeroRectangle.height)
struct UnitRectangle{
 @SmallNumber var width:Int = 1
 @SmallNumber var height:Int = 1
}
let unitRectangle = UnitRectangle()
print(
 unitRectangle.width,
 unitRectangle.height
)
struct NarrowRectangle{
 @SmallNumber(
  wrappedValue:2,
  maximum:5
 ) var width:Int
 @SmallNumber(
  wrappedValue:3,
  maximum:4
 ) var height:Int
}
let narrowRectangle = NarrowRectangle()
print(
 narrowRectangle.width,
 narrowRectangle.height
)
struct MixedRectangle{
 @SmallNumber(maximum:10) var width:Int = 5
 @SmallNumber var height:Int = 9
}
var mixedRectangle = MixedRectangle()
print(
 mixedRectangle.width,
 mixedRectangle.height
)
mixedRectangle.width = 20
mixedRectangle.height = 20
print(
 mixedRectangle.width,
 mixedRectangle.height
)
@propertyWrapper
struct AnotherSmallNumber{
 private var number:Int
 private(set) var projectedValue:Bool
 var wrappedValue:Int{
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
 @AnotherSmallNumber private var width:Int;@AnotherSmallNumber var height:Int
}
var rectangle = SmallRectangle()
print(rectangle.height)
rectangle.height = 10
print(rectangle.height)
rectangle.height = 24
print(rectangle.height)
struct SomeStruct{
 @AnotherSmallNumber var someNumber:Int
}
var someStruct = SomeStruct()
someStruct.someNumber = 5
print(someStruct.$someNumber)
someStruct.someNumber = 55
print(someStruct.$someNumber)
enum Size{
 case small
 case large
}
struct SizedRectangle{
 @AnotherSmallNumber private var width:Int
 @AnotherSmallNumber private var height:Int
 mutating func resize(to size:Size)->Bool{
  switch size{
   case .small:
    width = 10
    height = 10
   case .large:
    width = 100
    height = 100
  }
  return $width || $height
 }
}