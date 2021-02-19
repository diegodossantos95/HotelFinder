import SwiftUI

struct ContentView: View {
    private let interactor = HotelInteractor()
    @State private var checkInDate = Date()
    @State private var checkOutDate = Date()
    @State private var isRewardClient = false
    @State private var hotel: Hotel?

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
                    self.hotel = self.getBestHotel(checkInDate: checkInDate, checkOutDate: checkOutDate, isReward: isRewardClient)
                }
                
                if let hotel = self.hotel {
                    Text(hotel.name)
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
        guard checkInDate <= checkOutDate else {
            return (0,0)
        }
        var weekend = 0
        var week = 0
        var date = checkInDate
        
        repeat {
            if Calendar.current.isDateInWeekend(date) {
                weekend +=  1
            } else {
                week += 1
            }
            date = Calendar.current.date(byAdding: .day, value: 1, to: date) ?? date
        } while date <= checkOutDate
        
        return (week,weekend)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
