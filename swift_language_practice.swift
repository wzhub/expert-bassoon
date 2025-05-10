@propertyWrapper struct TwelveOrLess{private var number = 0;var wrappedValue:Int{get{return number}
set{number = min(newValue,12)}}}
struct SmallRectangle{
 private var number = TwelveOrLess()
 private var width:Int{get{return number.wrappedValue}
set{number.wrappedValue = newValue}}
 private var height:Int{
  get{
   return number.wrappedValue
  }
  set{
   number.wrappedValue = newValue
  }
 }
}
struct AnotherSmallRectangle{
 @TwelveOrLess private var width:Int
 @TwelveOrLess var height:Int
}
var rectangle = AnotherSmallRectangle()
print(rectangle.height)
rectangle.height = 10
print(rectangle.height)
rectangle.height = 24
print(rectangle.height)
@propertyWrapper 
struct SmallNumber{
 private var maximum:Int
 private var number:Int
 var wrappedValue:Int{
  get{
   return number
  }
  set{
   number = min(newValue,maximum)
  }
 }
 init(){
  maximum = 12
  number = 0
 }
 init(wrappedValue:Int){
  maximum = 12
  number = min(wrappedValue,maximum)
 }
 init(wrappedValue:Int,maximum:Int){
  self.maximum = maximum
  number = min(wrappedValue,maximum)
 }
}
struct ZeroRectangle{
 @SmallNumber var width:Int
 @SmallNumber var height:Int
}
let zeroRectangle = ZeroRectangle()
print(
 zeroRectangle.width,
 zeroRectangle.height
)
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
 @SmallNumber(wrappedValue:2,maximum:5) var width:Int
 @SmallNumber(wrappedValue:3,maximum:4) var height:Int
}
let narrowRectangle = NarrowRectangle()
print(
 narrowRectangle.width,
 narrowRectangle.height
)
struct MixedRectangle{
 @SmallNumber(maximum:9) var width:Int = 5
 @SmallNumber var height:Int = 10
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
 var wrappedValue:Int{
  return 0
 }
}