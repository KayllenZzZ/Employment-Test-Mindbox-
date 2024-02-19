//
//  Employment_Test__Mindbox_Tests.swift
//  Employment Test (Mindbox)Tests
//
//  Created by Андрей Чередник on 19.02.2024.
//

import XCTest
@testable import Employment_Test__Mindbox_

final class Employment_Test__Mindbox_Tests: XCTestCase {
    
    func testCircleArea() {
        let circle = Circle(radius: 5)
        XCTAssertEqual(circle.area(), 78.5, accuracy: 0.1, "Площадь круга вычислена неверно")
    }
    
    func testTriangleArea() {
        let triangle = Triangle(sideA: 3, sideB: 4, sideC: 5)
        XCTAssertEqual(triangle.area(), 6.0, accuracy: 0.1, "Площадь треугольника вичислена неверно")
    }
    
    func testRightAngledTriangle() {
        let rightTriangle = Triangle(sideA: 3, sideB: 4, sideC: 5)
        print(XCTAssertTrue(rightTriangle.isRightAngled(), "Угол определился как непрямой"))
        
        let nonRightTriangle = Triangle(sideA: 2, sideB: 3, sideC: 4)
        XCTAssertFalse(nonRightTriangle.isRightAngled(), "Угол определился как непрямой")
    }

}

