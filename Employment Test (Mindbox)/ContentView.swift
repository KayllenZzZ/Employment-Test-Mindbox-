//
//  ContentView.swift
//  Employment Test (Mindbox)
//
//  Created by Андрей Чередник on 19.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var radius: String = ""
    @State private var sideA: String = ""
    @State private var sideB: String = ""
    @State private var sideC: String = ""
    @State private var circleArea: String = ""
    @State private var triangleArea: String = ""
    @State private var isTriangleRightAngled: String = ""
    
    var body: some View {
        VStack {
            Form {
                Text("Площадь круга: \(circleArea)")
                TextField("Радиус круга", text: $radius)
                    .keyboardType(.numberPad)
                    .padding()
                Text("Площадь треугольника: \(triangleArea)")
                Text("Прямой угол: \(isTriangleRightAngled)")
                TextField("Сторона A", text: $sideA)
                    .keyboardType(.numberPad)
                    .padding()
                TextField("Сторона B", text: $sideB)
                    .keyboardType(.numberPad)
                    .padding()
                TextField("Сторона C", text: $sideC)
                    .keyboardType(.numberPad)
                    .padding()
                
                Button("Рассчитать", action: calculate)
                
            }
        }
    }
    
    func calculate() {
        let radius: Double = Double(radius) ?? 0
        let sides: [Double] = [Double(sideA) ?? 0, Double(sideB) ?? 0, Double(sideC) ?? 0]
        
        let isTriangle = (sides[0] + sides[1] > sides[2]) && (sides[0] + sides[2] > sides[1]) && (sides[1] + sides[2] > sides[0])
        let areSidesNonZero = (sides[0] != 0 && sides[1] != 0 && sides[2] != 0)
        
        circleArea = "\((radius != 0) ? String(format: "%.1f", Circle(radius: radius).area()) : "Проверьте ввод радиуса")"
        
        if areSidesNonZero {
            if isTriangle {
                triangleArea = String( format: "%.1f", Triangle(sideA: sides[0], sideB: sides[1], sideC: sides[2]).area())
                isTriangleRightAngled = Triangle(sideA: sides[0], sideB: sides[1], sideC: sides[2]).isRightAngled() ? "Да" : "Нет"
            } else {
                triangleArea = "Такого треугольника не существует"
                isTriangleRightAngled = "Такого треугольника не существует"
            }
        } else {
            triangleArea = "Проверте ввод сторон"
            isTriangleRightAngled = "Проверте ввод сторон"
        }
    }
}

protocol Shape {
    func area() -> Double
}

struct Circle: Shape {
    let radius: Double
    
    func area() -> Double {
        return Double.pi * pow(radius, 2)
    }
}

struct Triangle: Shape {
    let sideA: Double
    let sideB: Double
    let sideC: Double
    
    func area() -> Double {
        let s = (sideA + sideB + sideC) / 2
        return sqrt(s * (s - sideA) * (s - sideB) * (s - sideC))
    }
    
    func isRightAngled() -> Bool {
        let sides = [sideA, sideB, sideC].sorted()
        return pow(sides[0], 2) + pow(sides[1], 2) == pow(sides[2], 2)
    }
}


//#Preview {
//    ContentView()
//}
