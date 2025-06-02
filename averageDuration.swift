let durations = """
60,14
"""
var temporaryString = ""
var durationStringList = [String]()
for eachCharacter in durations + "\n"{
 if eachCharacter == "\n" || eachCharacter == ","{
  if !temporaryString.isEmpty{
   durationStringList.append(temporaryString)
   temporaryString = ""
  }
 }else{
  if eachCharacter != " "{
   temporaryString.append(eachCharacter)
  }
 }
}
var durationIntList = [Int]()
for eachDurationString in durationStringList{
 if let durationIntItem = Int(eachDurationString){
  durationIntList.append(durationIntItem)
 }
}

let averageDuration = durationIntList.reduce(0, +)/durationIntList.count
print(
 Int(averageDuration/60),
 "小时",
 averageDuration % 60,
 "分"
)
