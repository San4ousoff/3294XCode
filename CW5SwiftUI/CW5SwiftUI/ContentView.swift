//
//  ContentView.swift
//  CW5SwiftUI
//
//  Created by Mac on 14.12.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var anotherColor = AnotherColor()
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//            Text("Разноцветные квадраты")
//            Text("Разноцветные круги")
            Text("Светофор")
            HStack {
//                Squares()
//                Squares()
//                Squares()
//                Circles()
//                Circles()
//                Circles()
                Squares(anotherColor: anotherColor)
            }
            Button("Сменить цвет", action: {
                switch anotherColor.color {
                case .red: anotherColor.color = .yellow
                case .yellow: anotherColor.color = .green
                case .green: anotherColor.color = .red
                }
            }).padding(.all, 5)
            
        }
//            .padding()
    }
}

struct Square: View {
    var body: some View {
        Rectangle().frame(width: 35, height: 35)
    }
}

//struct Squares: View {
//    var body: some View {
//        VStack {
//            Square().foregroundStyle(.red)
//            Square().foregroundStyle(.yellow)
//            Square().foregroundStyle(.green)
//        }
//    }
//}

struct Squares: View {
    @ObservedObject var anotherColor = AnotherColor()
    var body: some View {
        switch anotherColor.color {
        case .red: VStack {
                Square().foregroundColor(.red)
                Square().foregroundColor(.white)
                Square().foregroundColor(.white)
            }
        case .green: VStack {
            Square().foregroundColor(.white)
            Square().foregroundColor(.white)
            Square().foregroundColor(.green)
        }
        case .yellow: VStack {
            Square().foregroundColor(.white)
            Square().foregroundColor(.yellow)
            Square().foregroundColor(.white)
        }
    }
    }
}

enum TrafficLight {
    case red, yellow, green
}

class AnotherColor: ObservableObject {
    @Published var color: TrafficLight = .red
}


struct OneCircle: View {
    var body: some View {
        Circle().frame(width: 35, height: 35)
    }
}

struct Circles: View {
    var body: some View {
        VStack {
            OneCircle().foregroundStyle(.red)
            OneCircle().foregroundStyle(.yellow)
            OneCircle().foregroundStyle(.green)
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(anotherColor: AnotherColor())
    }
}


//#Preview {
//    ContentView()
//}
