//
//  ContentView.swift
//  math140
//
//  Created by Adrian on 5/2/22.
//

import SwiftUI

struct CalendarView: View {
    
    var data: [(String, String, Color)]
    
    let items = ["Jan", "Feb", "Mar", "Apr",
                "May", "Jun", "Jul", "Aug",
                "Sep", "Oct", "Nov", "Dec"]

    let squareSize: CGFloat = 74.0
    var body: some View {
        VStack {
            HStack {
                ForEach((0...2), id: \.self) {
                    MonthCapsule(text: items[$0],
                                 subText: data[$0].1,
                                 backgroundColor: data[$0].2)
                }
//                MonthCapsule(text: items[0],
//                            backgroundColor: Color.green)
//                MonthCapsule(text: items[1],
//                            backgroundColor: Color.red)
//                MonthCapsule(text: items[2],
//                            backgroundColor: Color.red)
            }
            
            HStack {
                ForEach((3...5), id: \.self) {
                    MonthCapsule(text: items[$0],
                                 subText: data[$0].1,
                                 backgroundColor: data[$0].2)
                }
            }
            
            HStack {
                ForEach((6...8), id: \.self) {
                    MonthCapsule(text: items[$0],
                                 subText: data[$0].1,
                                 backgroundColor: data[$0].2)
                }
            }
            
            HStack {
                ForEach((9...11), id: \.self) {
                    MonthCapsule(text: items[$0],
                                 subText: data[$0].1,
                                 backgroundColor: data[$0].2)
                }

            }
        }
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarView()
//    }
//}


struct MonthCapsule: View {
    var text: String
    var subText: String
    var backgroundColor: Color
    
    let squareWidth = 75.0
    let squareHeight = 60.0
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundColor(.black)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: squareWidth, height: squareHeight)
                .background(RoundedRectangle(cornerRadius: 30).fill(backgroundColor).shadow(radius: 1))
                
            Text(subText)
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: true)
        }
        .fixedSize()
//        .frame(width: squareWidth, height: squareHeight)
    }
}
