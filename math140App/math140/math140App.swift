//
//  math140App.swift
//  math140
//
//  Created by Adrian on 5/2/22.
//

import SwiftUI

@main
struct math140App: App {
    @StateObject private var session = Session()

    var body: some Scene {
        WindowGroup {
            if (session.showingView == .typePickerView) {
                TypePickerView().environmentObject(session)
            } else {
                ResultsView(houseType: session.houseType!).environmentObject(session)
            }
        }
    }
}
