//
//  PickHouseTypeView.swift
//  math140
//
//  Created by Adrian on 5/17/22.
//

import SwiftUI



struct TypePickerView: View {
    @EnvironmentObject var session: Session

    @State var pickedItem = [false, false, false]
    
    func pickNewItem(idx: Int) {
        for i in 0..<pickedItem.count {
            if i == idx {
                pickedItem[i] = true
            } else {
                pickedItem[i] = false
            }
        }
    }
    
    
    var body: some View {
        VStack (spacing: 48) {
            
            Text("Choose type")
                .font(.largeTitle.bold())
            
            
//            Spacer()

            VStack {
                HStack {
                    TypePickerCapsule(text: "1 bed",
                                      picked: pickedItem[0])
                        .onTapGesture {
                            session.houseType = "1bed"
                            pickNewItem(idx: 0)
                            session.showingView = .calendarView
                        }
                    TypePickerCapsule(text: "2 bed",
                                      picked: pickedItem[1])
                        .onTapGesture {
                            session.houseType = "2bed"
                            pickNewItem(idx: 1)
                            session.showingView = .calendarView
                        }
                }
                HStack {
                    TypePickerCapsule(text: "3 bed",
                                      picked: pickedItem[2])
                        .onTapGesture {
                            session.houseType = "3bed"
                            pickNewItem(idx: 2)
                            session.showingView = .calendarView
                        }
                    Rectangle()
                        .fill(Color.black.opacity(0.0))
                        .frame(width: 125, height: 105)
                }
            }
            
//            Spacer()
//
//            Button {} label: {
//                btnView
//            }


        }
        .padding(.vertical, 28).padding(.bottom, 48)

    }
    
//    var btnView: some View {
//        Text("Next")
//            .foregroundColor(Color.white)
//            .fixedSize(horizontal: false, vertical: true)
//            .multilineTextAlignment(.center)
//            .padding()
//            .padding(.horizontal, 24)
//            .background(RoundedRectangle(cornerRadius: 25).fill(Color.blue).shadow(radius: 1))
//    }
}



struct TypePickerCapsule: View {
    var text: String
    var picked = false
    
    let squareWidth = 125.0
    let squareHeight = 95.0
    
    var body: some View {
        Text(text)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
            .padding()
            .font(.title)
            .frame(width: squareWidth, height: squareHeight)
            .foregroundColor(picked ? .black : .gray)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(picked ? .blue : .gray, lineWidth: 3)
            )
    }
}

struct HouseTypePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TypePickerView()
    }
}
