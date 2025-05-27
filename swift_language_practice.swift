@propertyWrapper
struct SmallNumber {
    private var number: Int
    private let maximum: Int

    var wrappedValue: Int {
        get { number }
        set { number = min(newValue, maximum) }
    }

    init(wrappedValue: Int, maximum: Int = 12) {
        self.maximum = maximum
        self.number = min(wrappedValue, maximum)
    }
}

struct MixedRectangle {
    @SmallNumber(maximum: 10) var width = 5
    @SmallNumber var height = 9
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.width, mixedRectangle.height)

mixedRectangle.width = 20
mixedRectangle.height = 20
print(mixedRectangle.width, mixedRectangle.height)
@propertyWrapper struct AnotherSmallNumber{
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
 @AnotherSmallNumber var someNumber:Int
}
var someStruct = SomeStruct()
someStruct.someNumber = 5
print(someStruct.$someNumber)
someStruct.someNumber = 55
print(someStruct.$someNumber)
enum Size{
 case large
 case small
}
struct SizedRectangle{
 @AnotherSmallNumber private var width:Int
 @AnotherSmallNumber private var height:Int
 mutating func resize(to size:Size)->Bool{
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