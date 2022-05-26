//
//  MonthlyResultsView.swift
//  math140
//
//  Created by Adrian on 5/17/22.
//

import SwiftUI

struct MonthlyResultsView: View {
    @State var projYear = 2022
    let houseType = "1 bed"
    var body: some View {
        
        VStack (spacing: 48) {

            
            Text("Projected \(houseType) rent")
                .font(.title.bold())
                .multilineTextAlignment(.center)
                .padding(.horizontal)
//            Spacer()
            
            VStack {
                
                Text("\(String(projYear).filter("0123456789.".contains))")
                    .fontWeight(.regular)
            
                HStack {
                    
                    // shows up to 2020
                    if projYear > 2021 {
                        Button{
                            projYear -= 1
                        } label: {
                            Image(systemName: "chevron.left").imageScale(.large)
                                .padding()
                        }
                    } else {
                        Image(systemName: "chevron.left").imageScale(.large)
                            .padding()
                            .foregroundColor(Color.black.opacity(0.0))
                    }

                    CalendarView()
                    
                    // shows up to 2025
                    if projYear < 2024 {
                        Button{
                            projYear += 1
                        } label: {
                            Image(systemName: "chevron.right").imageScale(.large)
                                .padding()
                        }
                    }
                    else {
                        Image(systemName: "chevron.left").imageScale(.large)
                            .padding()
                            .foregroundColor(Color.black.opacity(0.0))
                    }
                    
                }

            }
//            Spacer()
            
            Button {} label: {
                btnView
            }
        }
        .padding(.vertical, 36)
    }
    
    var btnView: some View {
        Text("Next")
            .foregroundColor(Color.white)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
            .padding()
            .padding(.horizontal, 24)
            .background(RoundedRectangle(cornerRadius: 25).fill(Color.blue).shadow(radius: 1))
    }
}

struct MonthlyResultsView_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyResultsView()
    }
}
