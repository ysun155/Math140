//
//  Data.swift
//  math140
//
//  Created by Adrian on 5/17/22.
//

import Foundation
import SwiftUI

//class DataModel {

func openCSV(fileName:String, fileType: String)-> String!{
    guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
        else {
            return nil
    }
    do {
        let contents = try String(contentsOfFile: filepath, encoding: .utf8)

        return contents
    } catch {
        print("File Read Error for file \(filepath)")
        return nil
    }
}

func parseCSV(type: String, year: String) -> [(String, String, String, String)]{

    let dataString: String! = openCSV(fileName: "forecastData", fileType: "csv")
    var items: [(String, String, String, String)] = []
    let lines: [String] = dataString.components(separatedBy: NSCharacterSet.newlines) as [String]

     print("initiated")
    for line in lines {
       var values: [String] = []
       if line != "" {
           if line.range(of: "\"") != nil {
               var textToScan:String = line
               var value:String?
               var textScanner:Scanner = Scanner(string: textToScan)
            while !textScanner.isAtEnd {
                   if (textScanner.string as NSString).substring(to: 1) == "\"" {


                       textScanner.currentIndex = textScanner.string.index(after: textScanner.currentIndex)

                       value = textScanner.scanUpToString("\"")
                       textScanner.currentIndex = textScanner.string.index(after: textScanner.currentIndex)
                   } else {
                       value = textScanner.scanUpToString(",")
                   }

                    values.append(value! as String)

                if !textScanner.isAtEnd{
                        let indexPlusOne = textScanner.string.index(after: textScanner.currentIndex)

                    textToScan = String(textScanner.string[indexPlusOne...])
                    } else {
                        textToScan = ""
                    }
                    textScanner = Scanner(string: textToScan)
               }

               // For a line without double quotes, we can simply separate the string
               // by using the delimiter (e.g. comma)
           } else  {
               values = line.components(separatedBy: ",")
           }

//           let month = Int(values[2].suffix(2))!
           // Put the values into the tuple and add it to the items array
           let item = (values[2], values[3], values[4], values[5])
           if (type==values[1] && year==values[2].prefix(4)) {
               items.append(item)
//               print(item.0)
           }
//           print(item.0)
//           print(item.1)
//           print(item.2)
        }
    }
//    print(items)
    return items

}

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}

func processCSVData(data: [(String, String, String, String)]) -> [(String, String, Color)] {
    let d = data
    
    var reg: [Int] = []
    for i in d {
        reg.append(Int(i.1)!)
    }

    
    var newD: [(String, String, Color)] = []
    for i in 0..<d.count {
        let month = d[i].0
        let rangeStr = "$" + (d[i].3)[0] + "."  + (d[i].3)[1] + "-" + (d[i].2)[0] + "."  + (d[i].2)[1] + "k"
        
        var color = Color.green
        if Int(d[i].1)! < reg.sorted()[4] {
//            print(Int(d[i].2)!, reg.sorted()[4])
            color = Color.green
        } else if Int(d[i].1)! < reg.sorted()[8] {
            color = Color.orange
        } else {
            color = Color.red
        }
        
        newD.append((month, rangeStr, color))
    }
    
    return newD
}

