import SwiftUI

struct ContentView: View {
    private let interactor = HotelInteractor()
    @State private var checkInDate = Date()
    @State private var checkOutDate = Date()
    @State private var isRewardClient = false

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Check in date")
                DatePicker(
                    "",
                    selection: $checkInDate,
                    displayedComponents: .date
                ).labelsHidden()

                Text("Check out date")
                DatePicker(
                    "",
                    selection: $checkOutDate,
                    displayedComponents: .date
                ).labelsHidden()

                Text("Reward client?")
                Toggle(
                    "",
                    isOn: $isRewardClient
                ).labelsHidden()

                Button("Best hotel") {
                    self.getBestHotel(checkInDate: checkInDate, checkOutDate: checkOutDate, isReward: isRewardClient)
                }
            }.padding(16)
        }
    }
}

extension ContentView {
    private func getBestHotel(checkInDate: Date, checkOutDate: Date, isReward: Bool) -> Hotel? {
        let days = self.getDays(checkInDate: checkInDate, checkOutDate: checkOutDate)
        return interactor.getBestHotel(weekDays: days.0, weekendDays: days.1, isReward: isReward)
    }
    
    private func getDays(checkInDate: Date, checkOutDate: Date) -> (Int, Int) {
        
        return (0,0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
