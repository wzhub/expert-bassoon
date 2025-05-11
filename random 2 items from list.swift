let todo = """

"""
var todoList = [String]()
var lineItem = String()
for eachCharacter in todo + "\n"{
 if eachCharacter == "\n"{
  todoList.append(lineItem)
  lineItem = String()
 }else{
  lineItem.append(eachCharacter)
 }
}
var randomItemIndex0 = Int(),randomItem0 = String(),randomItemIndex1 = Int(),randomItem1 = String()
if let randomItem = todoList.randomElement(){
 if let randomItemIndex = todoList.firstIndex(of:randomItem){
  randomItemIndex0 = randomItemIndex
 }
 randomItem0 = randomItem
}
if let randomItem = todoList.randomElement(){
 if let randomItemIndex = todoList.firstIndex(of:randomItem){
  randomItemIndex1 = randomItemIndex
 }
 randomItem1 = randomItem
}
if randomItemIndex0 < randomItemIndex1{
 print("")
 print(randomItem0)
 print("")
 print(randomItem1)
 print("")
}else{
 print("")
 print(randomItem1)
 print("")
 print(randomItem0)
 print("")
}
