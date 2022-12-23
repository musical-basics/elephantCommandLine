import Foundation



//var insertArray: [Item] = []


let model = Model()


// Figure out how to convert date object

//insertArray = model.inactiveArray

let datePicked = Date(timeIntervalSince1970: 900000000)
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss Z"
//if let dt = dateFormatter.date(from: "07-28-1989 06:15:30 +0300")
//{
//    print(dt)
//}

let timeZone = TimeZone.current
//print(timeZone)

let startDate = DateComponents(calendar: Calendar.current, year: 2022, month: 9, day: 1)
//print(type(of: startDate.date))
//let now = DateComponents
//print(now.date)
//print(model.activeArray[0].timeDone)

//model.activeArray[0].timeDone = startDate.date!

//print(model.activeArray[0].timeDone)



let insertArray = [
Item(title: "Insert 1 Item", timeDone: Date(), project: "Terrible", uniqueNum: 16, status: "Inact"),
Item(title: "Insert 2 Item", timeDone: Date(), project: "Terrible", uniqueNum: 17, status: "Inact"),
Item(title: "Insert 3 Item", timeDone: Date(), project: "Terrible", uniqueNum: 18, status: "Inact"),
Item(title: "Insert 4 Item", timeDone: Date(), project: "Terrible", uniqueNum: 19, status: "Inact"),
Item(title: "Insert 5 Item", timeDone: Date(), project: "Terrible", uniqueNum: 20, status: "Inact")
]

model.inactiveArray = model.inactiveArray + insertArray

//print(model.inactiveArray)

var completeRate = 3
var currentDeadline = Date()
    
    


//if let dt = startDate.date, let later = Calendar.current.date(byAdding: .day, value: 6, to: dt) {
//    model.activeArray[0].timeDone = later
//    currentDeadline = later
//
//}
let currentDeadline2 = Calendar.current.date(byAdding: .day, value: 6, to: Date())
let insertMe = Project(name: "Terrible", completed: false, priority: 4, cycle: false, deadline: currentDeadline2)
model.projectArray.append(insertMe)

//model.insertProject(deadline: currentDeadline2!, proj: insertMe)

//for rando in model.projectArray {
//    print(rando.name)
//}

//slot as many items in as possible

//model.connectLevel(proj: insertMe)

//let thisLevel = model.activeArray.lastIndex { $0.project == insertMe.name }
//print(thisLevel)


//func connectLevel(proj: Project) {
//    let lastIndx = model.activeArray.lastIndex { $0.project == proj.name }
//    var tempArray: [Item] = []
//    for everyItem in model.inactiveArray {
//        if everyItem.project == proj.name {
//            tempArray.append(everyItem)
//        }
//    }
//
//    let numbTasksProject = tempArray.count
//
//    var tempCounter = 1
//    for insertItem in tempArray {
//        var newItem = insertItem
//        let insertIndx = lastIndx! + (completeRate * tempCounter)
//        if insertIndx < model.activeArray.count {
//            newItem.status = "Active"
//            model.activeArray.insert(newItem, at: insertIndx)
//            tempCounter += 1
//            print(insertIndx)
//        } else {
//            print("no more")
//        }
//    }
//}





//split and kick

//var currentItem = model.activeArray[0]
//var currentProject = currentItem.project

//model.activeArray[0].status = "Complete"
//model.activeArray.remove(at: 0)

//print(model.activeArray[0])

//var tempFilterArray = model.activeArray.filter({ $0.project == currentProject})
//print(tempFilterArray)

//let totalNumber = model.activeArray.count
//
//for tempNum in 1...model.activeArray.count {
//    let currentCounter = tempNum - 1
//    let nextItem: Item
//    if model.activeArray[currentCounter].project == currentProject {
//        nextItem = model.activeArray[currentCounter]
//        model.activeArray[currentCounter] = currentItem
//        currentItem = nextItem
//    }
//
//    model.inactiveArray.insert(currentItem, at: 0)
//
//}


//func splitAndKick(currentItem: Item) {
//    let currentProject = currentItem.project
//    model.activeArray[0].status = "Complete"
//    model.activeArray.remove(at: 0)
//
//    var tempItem = currentItem
//    tempItem.uniqueNum = model.uniqueNumCounter + 1
//
//    for tempNum in 1...model.activeArray.count {
//        let currentCounter = tempNum - 1
//        let nextItem: Item
//        if model.activeArray[currentCounter].project == currentProject {
//            nextItem = model.activeArray[currentCounter]
//            model.activeArray[currentCounter] = tempItem
//            tempItem = nextItem
//        }
//
//        model.inactiveArray.insert(tempItem, at: 0)
//
//    }
//}


let myItem = model.activeArray[0]
//model.splitAndKick(currentItem: myItem)
//
//
//model.connectLevel(proj: "Piano")
//
//print(model.activeArray)



//delete project

let refProject = "Piano"


//func discardProject(proj: String) {
//    let changeMeArray = model.activeArray.filter({ $0.project == proj})
//    for countMe in changeMeArray {
//        var tempItem = countMe
//        tempItem.status = "Active then Discarded"
//        model.savedItems.append(tempItem)
//    }
//
//    let newFilteredArray = model.activeArray.filter({ $0.project != proj})
//    model.activeArray = newFilteredArray
//
//    let changeMeArray2 = model.inactiveArray.filter({ $0.project == proj})
//    for countMe in changeMeArray2 {
//        var tempItem = countMe
//        tempItem.status = "Inact then Discarded"
//        model.savedItems.append(tempItem)
//    }
//
//
//    let newFilteredArray2 = model.inactiveArray.filter({ $0.project != proj})
//    model.inactiveArray = newFilteredArray2
//
//    model.projectArray = model.projectArray.filter({ $0.name != proj})
//}

//model.discardProject(proj: "Piano")
//for numbaaa in model.projectArray {
//    print(numbaaa.name)
//}





//delete and quicken

//let chosenItem = model.activeArray[4]
//
//let currentProject = chosenItem.project
//
//let indexOfChosen = model.activeArray.firstIndex { $0.uniqueNum == chosenItem.uniqueNum }
//
//model.activeArray[indexOfChosen!].status = "Discarded"
//model.savedItems.append(chosenItem)
//
//let totalProjArray = model.activeArray.filter({ $0.project == currentProject})
//
//let totalProjArrayMinusChosen = totalProjArray.filter({ $0.uniqueNum != chosenItem.uniqueNum})
//print(totalProjArrayMinusChosen)
////print(totalProjArray.count)
////print(model.activeArray)
//var newCounter = 0
//
//for tempNum in 1...model.activeArray.count {
//    let currentCounter = tempNum - 1
//    if (model.activeArray[currentCounter].project == currentProject) && (newCounter < totalProjArrayMinusChosen.count) {
//        model.activeArray[currentCounter] = totalProjArrayMinusChosen[newCounter]
//        newCounter += 1
//    } else if (model.activeArray[currentCounter].project == currentProject) && (newCounter == totalProjArrayMinusChosen.count) {
//        model.activeArray.remove(at: currentCounter)
//        break
//    }
//}



//func deleteAndQuicken(chosenItem: Item) {
//    let currentProject = chosenItem.project
//
//    let indexOfChosen = model.activeArray.firstIndex { $0.uniqueNum == chosenItem.uniqueNum }
//
//    model.activeArray[indexOfChosen!].status = "Discarded"
//    model.savedItems.append(chosenItem)
//
//    let totalProjArray = model.activeArray.filter({ $0.project == currentProject})
//
//    let totalProjArrayMinusChosen = totalProjArray.filter({ $0.uniqueNum != chosenItem.uniqueNum})
//    print(totalProjArrayMinusChosen)
//    //print(totalProjArray.count)
//    //print(model.activeArray)
//    var newCounter = 0
//
//    for tempNum in 1...model.activeArray.count {
//        let currentCounter = tempNum - 1
//        if (model.activeArray[currentCounter].project == currentProject) && (newCounter < totalProjArrayMinusChosen.count) {
//            model.activeArray[currentCounter] = totalProjArrayMinusChosen[newCounter]
//            newCounter += 1
//        } else if (model.activeArray[currentCounter].project == currentProject) && (newCounter == totalProjArrayMinusChosen.count) {
//            model.activeArray.remove(at: currentCounter)
//            break
//        }
//    }
//
//}

let anItem = model.activeArray[2]
model.deleteAndQuicken(chosenItem: anItem)


print(model.activeArray)

















//let reverseArray = Array(model.activeArray.reversed())
//print(reverseArray)

//for tempNum in 1...reverseArray.count {
//    let currentCounter = tempNum - 1
//    let currentItem: Item = Item(title: "Discarded", timeDone: Date(), project: <#T##String#>, uniqueNum: <#T##Int#>, status: <#T##String#>)
//    let nextItem: Item
//    if model.activeArray[currentCounter].project == currentProject {
//        nextItem = model.activeArray[currentCounter]
//        model.activeArray[currentCounter] = currentItem
//
//    }
//
//
//}






//for tempNum in 1...model.activeArray.count {
//    let currentCounter = tempNum - 1
//    if model.activeArray[currentCounter].project == refProject {
//        model.activeArray.remove(at: currentCounter)
//    }
//}






//for indx in model.projectArray {
//    let filteredActiveArray = model.activeArray.filter({ $0.project == indx.name})
//    let filteredInactiveArray = model.inactiveArray.filter({ $0.project == indx.name})
//
//    var indexHighest: Float = 0
//
//    if filteredActiveArray.count == 0 {
//        indexHighest = 0
//    } else {
//        let levelCheck = model.activeArray.firstIndex { $0.project == indx.name }
//        indexHighest = Float(levelCheck!)
//    }
//
//    let level = (Float(model.activeArray.count) / Float(indx.priority)) * Float(filteredActiveArray.count)
//    let finalLevel = Float(model.activeArray.count) - level
//
//    if filteredActiveArray.count >= indx.priority || filteredInactiveArray.count == 0 || indexHighest >= finalLevel {
//        print("Nothing was added for \(indx.name) with priority \(indx.priority)")
//    } else {
//        let currentIndex = model.inactiveArray.firstIndex { $0.uniqueNum == filteredInactiveArray[0].uniqueNum }
//        model.inactiveArray[currentIndex!].status = "Active"
//        let itemAdded = model.inactiveArray[currentIndex!]
//        model.activeArray.append(itemAdded)
//        model.inactiveArray.remove(at: currentIndex!)
//        print("we added item \(itemAdded.title) from project \(indx.name) with priority \(indx.priority)")
//
//    }
//
//
//}

//model.addNextItem()

//func completeItem(uniqueNumba: Int) {
//    let currentIndex = model.activeArray.firstIndex { $0.uniqueNum == uniqueNumba }
//
//// add duplicate item to end if cycle
//    let currentProject = model.activeArray[currentIndex!].project
//    if model.activeArray[currentIndex!].checkCycle(projectName: currentProject) {
//        model.activeArray.append(model.activeArray[currentIndex!])
//    }
//    model.activeArray[currentIndex!].status = "Done"
//    model.savedItems.append(model.activeArray[currentIndex!])
//    model.activeArray.remove(at: currentIndex!)
//
//}

let tempNum = model.activeArray[0].uniqueNum
model.completeItem(uniqueNumba: tempNum)


let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
    model.checkTimeDone(uniqueNumba: tempNum)
//    print("fired")
//    print(Date())
}

//RunLoop.main.run()









//let todayStartOfDay = Calendar.current.startOfDay(for: Date())
//let todayEndOfDay = Calendar.current.date(byAdding: DateComponents(day: 1), to: todayStartOfDay)?.addingTimeInterval(-1)
//
//print(todayStartOfDay)
//print(todayEndOfDay!)

