//
//  HotelDataManager.swift
//  iOSTestProject
//
//  Created by dos Santos, Diego on 18/02/21.
//

import Foundation

struct HotelDataManager {
    private let hotels: [Hotel]
    
    init() {
        hotels = [Hotel(name: "Parque das flores", rating: 3, priceWeekend: 90.0, priceWeekendReward: 80.0, priceWeek: 110.0, priceWeekReward: 80.0),
                  Hotel(name: "Jardim Botânico", rating: 4, priceWeekend: 60.0, priceWeekendReward: 50.0, priceWeek: 160.0, priceWeekReward: 110.0),
                  Hotel(name: "Mar Atlântico", rating: 5, priceWeekend: 150.0, priceWeekendReward: 40.0, priceWeek: 220.0, priceWeekReward: 100.0)]
    }
    
    func getHotels() -> [Hotel] {
        return hotels
    }
}
