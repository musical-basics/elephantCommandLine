import Foundation


var completeRate = 5
var insertArray: [Item] = []


let model = Model()


// Figure out how to convert date object

insertArray = model.inactiveArray

let datePicked = Date(timeIntervalSince1970: 900000000)
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss Z"
if let dt = dateFormatter.date(from: "07-28-1989 06:15:30 +0300")
{
    print(dt)
}

let timeZone = TimeZone.current
print(timeZone)



let now = Date()

let dtFormatter3 = DateFormatter()
dtFormatter3.dateStyle = .full
dtFormatter3.timeStyle = .full
//print(dtFormatter.locale ?? "N/A")
dtFormatter3.locale = Locale(identifier: "en_GB")
dtFormatter3.setLocalizedDateFormatFromTemplate("dd-MM-yyyy")

let formattedDateTime = dtFormatter3.string(from: now)

//print(formattedDateTime)

let dtFormatter2 = DateFormatter()
dtFormatter2.dateFormat = "dd-MM-yyyy HH:mm:ss Z"

