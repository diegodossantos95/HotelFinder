//
//  HotelInteractor.swift
//  iOSTestProject
//
//  Created by dos Santos, Diego on 18/02/21.
//  Copyright © 2021 ThoughtWorks. All rights reserved.
//

import Foundation

struct HotelInteractor {
    private let dataManager = HotelDataManager()
    
    func getBestHotel(weekDays: Int, weekendDays: Int, isReward: Bool) -> Hotel? {
        let hotels = dataManager.getHotels()
        var cheapHotel = hotels.first
        
        for hotel in hotels {
            let hotelCalc = self.calcHotel(hotel: hotel, weekDays: weekDays, weekendDays: weekendDays, isReward: isReward)
            let cheapHotelCalc = self.calcHotel(hotel: cheapHotel ?? hotel, weekDays: weekDays, weekendDays: weekendDays, isReward: isReward)
            
            if hotelCalc < cheapHotelCalc {
                cheapHotel = hotel
            } else if hotelCalc == cheapHotelCalc,
                      hotel.rating > cheapHotel?.rating ?? 0 {
                cheapHotel = hotel
            }
        }

        return cheapHotel
    }
    
    private func calcHotel(hotel: Hotel, weekDays: Int, weekendDays: Int, isReward: Bool) -> Double {
        if isReward {
            return (Double(weekDays) * hotel.priceWeekReward) + (Double(weekendDays) * hotel.priceWeekendReward)
        } else {
            return (Double(weekDays) * hotel.priceWeek) + (Double(weekendDays) * hotel.priceWeekend)
        }
    }
}
