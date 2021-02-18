import XCTest
@testable import iOSTestProject

class iOSTestProjectTests: XCTestCase {
//    func testThatFails() {
//        XCTAssertTrue(false, "This should fail")
//    }
    
    func testHotelDataManager() {
        let dataManager = HotelDataManager()
        
        XCTAssertTrue(dataManager.getHotels().count == 3)
    }
    
    func testCalcHotel() {
        let interactor = HotelInteractor()
        let testResult1 = interactor.getBestHotel(weekDays: 3, weekendDays: 0, isReward: false)
        let testResult2 = interactor.getBestHotel(weekDays: 1, weekendDays: 2, isReward: false)
        let testResult3 = interactor.getBestHotel(weekDays: 2, weekendDays: 1, isReward: true)
        
        XCTAssertTrue(testResult1?.name == "Parque das flores")
        XCTAssertTrue(testResult2?.name == "Jardim Botânico")
        XCTAssertTrue(testResult3?.name == "Mar Atlântico")
    }
}
