import Foundation
import SwiftUI

struct NavigationView: View {
    @EnvironmentObject var session: Session
//    @EnvironmentObject var dataModel


    var body: some View {
        switch session.showingView {
        case .typePickerView:
            TypePickerView()
        case .calendarView:
            ResultsView(houseType: session.houseType!)
        }
    }
}

enum ShowingView {
    case typePickerView
    case calendarView

}
