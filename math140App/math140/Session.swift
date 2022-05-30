import SwiftUI

class Session: ObservableObject {
    @Published var houseType: String?
    @Published var showingView: ShowingView = .typePickerView
}

