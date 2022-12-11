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
Item(title: "Insert 1 Item", timeDone: Date(), project: "Wix", uniqueNum: 16, status: "Inact"),
Item(title: "Insert 2 Item", timeDone: Date(), project: "Wix", uniqueNum: 17, status: "Inact"),
Item(title: "Insert 3 Item", timeDone: Date(), project: "Wix", uniqueNum: 18, status: "Inact"),
Item(title: "Insert 4 Item", timeDone: Date(), project: "Wix", uniqueNum: 19, status: "Inact"),
Item(title: "Insert 5 Item", timeDone: Date(), project: "Wix", uniqueNum: 20, status: "Inact")
]

var completeRate = 4
var currentDeadline = Date()
    
    


//if let dt = startDate.date, let later = Calendar.current.date(byAdding: .day, value: 6, to: dt) {
//    model.activeArray[0].timeDone = later
//    currentDeadline = later
//
//}
let currentDeadline2 = Calendar.current.date(byAdding: .day, value: 6, to: Date())
print(currentDeadline2)
let insertMe = Project(name: "Wix", completed: false, priority: 4, cycle: false, deadline: currentDeadline2)

func insertProject(deadline: Date, project: Project) {
    
    
    let timeToCompletion = CalendarHelper().numberOfDaysBetween(Date(), and: deadline) - 1
    print(timeToCompletion)
    let totalTasksUntilComp = timeToCompletion * completeRate
    print(totalTasksUntilComp)

    let numbTasksProject = insertArray.count
    let firstItemInsert = totalTasksUntilComp / numbTasksProject
    print(firstItemInsert)
    let secondItemInsert = (totalTasksUntilComp / numbTasksProject) * 2
    print(secondItemInsert)

    var tempCounter = 1
    for insertItem in insertArray {
        let insertIndx = totalTasksUntilComp / numbTasksProject * tempCounter
        if insertIndx < model.activeArray.count {
            model.activeArray.insert(insertItem, at: insertIndx)
            tempCounter += 1
            print(insertIndx)
        } else {
            print("no more")
        }
    }

}





print(model.activeArray)







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
    print("fired")
    print(Date())
}

//RunLoop.main.run()









//let todayStartOfDay = Calendar.current.startOfDay(for: Date())
//let todayEndOfDay = Calendar.current.date(byAdding: DateComponents(day: 1), to: todayStartOfDay)?.addingTimeInterval(-1)
//
//print(todayStartOfDay)
//print(todayEndOfDay!)

