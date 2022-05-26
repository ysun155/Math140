//
//  ContentView.swift
//  math140
//
//  Created by Adrian on 5/2/22.
//

import SwiftUI

struct CalendarView: View {
    let items = ["Jan", "Feb", "Mar", "Apr",
                "May", "Jun", "Jul", "Aug",
                "Sep", "Oct", "Nov", "Dec"]

    let squareSize: CGFloat = 74.0
    var body: some View {
        VStack {
            HStack {
                MonthCapsule(text: items[0],
                            backgroundColor: Color.green)
                MonthCapsule(text: items[1],
                            backgroundColor: Color.red)
                MonthCapsule(text: items[2],
                            backgroundColor: Color.red)
            }
            
            HStack {
                MonthCapsule(text: items[3],
                            backgroundColor: Color.green)
                MonthCapsule(text: items[4],
                            backgroundColor: Color.orange)
                MonthCapsule(text: items[5],
                            backgroundColor: Color.green)
            }
            
            HStack {
                MonthCapsule(text: items[6],
                            backgroundColor: Color.green)
                MonthCapsule(text: items[7],
                            backgroundColor: Color.red)
                MonthCapsule(text: items[8],
                            backgroundColor: Color.green)
            }
            
            HStack {
                MonthCapsule(text: items[9],
                            backgroundColor: Color.green)
                MonthCapsule(text: items[10],
                            backgroundColor: Color.green)
                MonthCapsule(text: items[11],
                            backgroundColor: Color.green)

            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}


struct MonthCapsule: View {
    var text: String
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
                
            Text("$1225")
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: true)
        }
        .fixedSize()
//        .frame(width: squareWidth, height: squareHeight)
    }
}
