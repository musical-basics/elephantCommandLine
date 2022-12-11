//
//  swift
//  ElephantTestingGround
//
//  Created by Lionel Yu on 11/27/22.
//

import Foundation

class Model {
//    static let shared: Model = Model()
    var stringArray: [String] = []
    var activeArray: [Item] = []
    var inactiveArray: [Item] = []
    var savedItems: [Item] = []
    var projectArray: [Project] = []
    var uniqueNumCounter: Int = 0
    
    var completeRate = 3
    var insertArray: [Item] = []

    init() {
        

        activeArray =
        [
            Item(title: "First Item", timeDone: Date(), project: "Piano", uniqueNum: 1, status: "Active"),
            Item(title: "Second Item", timeDone: Date(), project: "Wix", uniqueNum: 2, status: "Active"),
            Item(title: "Third Item", timeDone: Date(), project: "Piano", uniqueNum: 3, status: "Active"),
            Item(title: "Fourth Item", timeDone: Date(), project: "Wix", uniqueNum: 4, status: "Active"),
            Item(title: "Fifth Item", timeDone: Date(), project: "Piano", uniqueNum: 5, status: "Active"),
            Item(title: "Sixth Item", timeDone: Date(), project: "Cleaning", uniqueNum: 6, status: "Active"),
            Item(title: "Seventh Item", timeDone: Date(), project: "Piano", uniqueNum: 7, status: "Active"),
            Item(title: "Eighth Item", timeDone: Date(), project: "None", uniqueNum: 8, status: "Active"),
            Item(title: "Nineth Item", timeDone: Date(), project: "None", uniqueNum: 9, status: "Active")
        ]
        
        inactiveArray =
        [
            Item(title: "Tenth Item", timeDone: Date(), project: "None", uniqueNum: 10, status: "Inact"),
            Item(title: "Eleventh Item", timeDone: Date(), project: "None", uniqueNum: 11, status: "Inact"),
            Item(title: "Twelveth Item", timeDone: Date(), project: "Piano", uniqueNum: 12, status: "Inact"),
            Item(title: "Thirteenth Item", timeDone: Date(), project: "None", uniqueNum: 13, status: "Inact"),
            Item(title: "Fourteenth Item", timeDone: Date(), project: "Piano", uniqueNum: 14, status: "Inact"),
            Item(title: "Fifteenth Item", timeDone: Date(), project: "Piano", uniqueNum: 15, status: "Inact")
        ]
        
        projectArray = 
        [
            Project(name: "None", completed: false, priority: 100000, cycle: false, deadline: nil),
            Project(name: "Piano", completed: false, priority: 3, cycle: false, deadline: nil),
            Project(name: "Cleaning", completed: false, priority: 3, cycle: true, deadline: nil),
            Project(name: "Wix", completed: false, priority: 3, cycle: true, deadline: nil)
        ]
        
        uniqueNumCounter = activeArray.count + inactiveArray.count
        
    }
    
    func addNextItem() {
        for indx in projectArray {
            let filteredActiveArray = activeArray.filter({ $0.project == indx.name})
            let filteredInactiveArray = inactiveArray.filter({ $0.project == indx.name})
            
            var indexHighest: Float = 0
            
            if filteredActiveArray.count == 0 {
                indexHighest = 0
            } else {
                let levelCheck = activeArray.firstIndex { $0.project == indx.name }
                indexHighest = Float(levelCheck!)
            }
            
            let level = (Float(activeArray.count) / Float(indx.priority)) * Float(filteredActiveArray.count)
            let finalLevel = Float(activeArray.count) - level
            
            if filteredActiveArray.count >= indx.priority || filteredInactiveArray.count == 0 || indexHighest >= finalLevel {
                print("Nothing was added for \(indx.name) with priority \(indx.priority)")
            } else {
                let currentIndex = inactiveArray.firstIndex { $0.uniqueNum == filteredInactiveArray[0].uniqueNum }
                inactiveArray[currentIndex!].status = "Active"
                let itemAdded = inactiveArray[currentIndex!]
                activeArray.append(itemAdded)
                inactiveArray.remove(at: currentIndex!)
                print("we added item \(itemAdded.title) from project \(indx.name) with priority \(indx.priority)")
            }
            
        }

    }
    
    
    func completeItem(uniqueNumba: Int) {
        let currentIndex = activeArray.firstIndex { $0.uniqueNum == uniqueNumba }
        
    // add duplicate item to end if cycle
        let currentProject = activeArray[currentIndex!].project
        if activeArray[currentIndex!].checkCycle(projectName: currentProject) {
            activeArray[currentIndex!].status = "Inactive"
            inactiveArray.append(activeArray[currentIndex!])
        }
        activeArray[currentIndex!].status = "Done"
        activeArray[currentIndex!].timeDone = Date()
        savedItems.append(activeArray[currentIndex!])
        activeArray.remove(at: currentIndex!)
//        print(activeArray[currentIndex!].title)
//        print(activeArray[currentIndex!].timeDone)
    }
    
    func checkTimeDone(uniqueNumba: Int) {
        let currentIndex = savedItems.firstIndex { $0.uniqueNum == uniqueNumba }
        print(savedItems[currentIndex!].timeDone)
        
    }
    
    func insertProject(deadline: Date, proj: Project) {
        var tempArray: [Item] = []
        for everyItem in inactiveArray {
            if everyItem.project == proj.name {
                tempArray.append(everyItem)
            }
        }
        
        let timeToCompletion = CalendarHelper().numberOfDaysBetween(Date(), and: deadline) - 1
        print(timeToCompletion)
        let totalTasksUntilComp = timeToCompletion * completeRate
        print(totalTasksUntilComp)

        let numbTasksProject = tempArray.count
//        let firstItemInsert = totalTasksUntilComp / numbTasksProject
//        print(firstItemInsert)
//        let secondItemInsert = (totalTasksUntilComp / numbTasksProject) * 2
//        print(secondItemInsert)

        var tempCounter = 1
        for insertItem in tempArray {
            var newItem = insertItem
            let insertIndx = totalTasksUntilComp / numbTasksProject * tempCounter
            if insertIndx < activeArray.count {
                newItem.status = "Active"
                activeArray.insert(newItem, at: insertIndx)
                tempCounter += 1
                print(insertIndx)
            } else {
                print("no more")
            }
        }

    }
    
    func connectLevel(proj: String) {
        let lastIndx = activeArray.lastIndex { $0.project == proj }
        var tempArray: [Item] = []
        for everyItem in inactiveArray {
            if everyItem.project == proj {
                tempArray.append(everyItem)
            }
        }
        var tempCounter = 1
        for insertItem in tempArray {
            var newItem = insertItem
            let insertIndx = lastIndx! + (completeRate * tempCounter)
            if insertIndx < activeArray.count {
                newItem.status = "Active"
                activeArray.insert(newItem, at: insertIndx)
                tempCounter += 1
                print(insertIndx)
            } else {
                print("no more")
            }
        }
    }
    
    
    func splitAndKick(currentItem: Item) {
        let currentProject = currentItem.project
        activeArray[0].status = "Complete"
        activeArray.remove(at: 0)
        
        var tempItem = currentItem
        tempItem.uniqueNum = uniqueNumCounter + 1

        for tempNum in 1...activeArray.count {
            let currentCounter = tempNum - 1
            let nextItem: Item
            if activeArray[currentCounter].project == currentProject {
                nextItem = activeArray[currentCounter]
                activeArray[currentCounter] = tempItem
                tempItem = nextItem
            }
            
            inactiveArray.insert(tempItem, at: 0)
            
        }
    }
    
    
    func deleteAndQuicken(chosenItem: Item) {
        let currentProject = chosenItem.project

        let indexOfChosen = activeArray.firstIndex { $0.uniqueNum == chosenItem.uniqueNum }

        activeArray[indexOfChosen!].status = "Discarded"
        savedItems.append(chosenItem)

        let totalProjArray = activeArray.filter({ $0.project == currentProject})

        let totalProjArrayMinusChosen = totalProjArray.filter({ $0.uniqueNum != chosenItem.uniqueNum})
//        print(totalProjArrayMinusChosen)

        var newCounter = 0

        for tempNum in 1...activeArray.count {
            let currentCounter = tempNum - 1
            if (activeArray[currentCounter].project == currentProject) && (newCounter < totalProjArrayMinusChosen.count) {
                activeArray[currentCounter] = totalProjArrayMinusChosen[newCounter]
                newCounter += 1
            } else if (activeArray[currentCounter].project == currentProject) && (newCounter == totalProjArrayMinusChosen.count) {
                activeArray.remove(at: currentCounter)
                break
            }
        }

    }
    
    

    
    
    func discardProject(proj: String) {
        let changeMeArray = activeArray.filter({ $0.project == proj})
        for countMe in changeMeArray {
            var tempItem = countMe
            tempItem.status = "Active then Discarded"
            savedItems.append(tempItem)
        }

        let newFilteredArray = activeArray.filter({ $0.project != proj})
        activeArray = newFilteredArray

        let changeMeArray2 = inactiveArray.filter({ $0.project == proj})
        for countMe in changeMeArray2 {
            var tempItem = countMe
            tempItem.status = "Inact then Discarded"
            savedItems.append(tempItem)
        }


        let newFilteredArray2 = inactiveArray.filter({ $0.project != proj})
        inactiveArray = newFilteredArray2
        
        projectArray = projectArray.filter({ $0.name != proj})
    }
    
    
    
    
    
    
}


