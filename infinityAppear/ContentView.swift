//
//  ContentView.swift
//  infinityAppear
//
//  Created by a1 on 2024/10/07.
//

import SwiftUI

struct ContentView: View {
    let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var body: some View {
        ZStack {
            List (array, id: \.self) { ary in
                ButtonArea()
            }
            .refreshable {
                print("refreshable")
            }
        }
    }
}


struct ButtonArea: View {
    @State private var flag = false
    var body: some View {
        Button(action: {
            print("pushed")
            flag = true
        }) {
            Image("icon_download").padding()
        }.sheet(isPresented: $flag, onDismiss: {
            print("dismiss")
            flag = false
        }) {
            AudioPlayView()
        }
    }
}

struct AudioPlayView: View {
    var body: some View {
        ZStack {
            Text("Hello, World!")
        }
        .onAppear {
            print("onAppear")
        }
        .onDisappear {
            print("onDisappear")
        }
    }
}

#Preview {
    ContentView()
}
