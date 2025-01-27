//
//  ContentView.swift
//  MauiApp1 Watch App
//
//  Created by Timothy May on 1/21/25.
//
/*
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! from MauiApp1")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
 */
/*
import SwiftUI
import Foundation

struct ContentView: View {
    init() {
        print("ContentView initialized") // Console logging
        log("ContentView initialized via Helper") // File logging
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! from MauiApp1")
                .onAppear {
                    print("View appeared")
                    log("View appeared via Helper")
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
*/
 import SwiftUI

 struct ContentView: View {
     @EnvironmentObject var communicationManager: WatchCommunicationManager
     
     var body: some View {
         VStack {
             Text("Watch App")
             Button("Send Status") {
                 communicationManager.handler.sendWatchStatus(.Running)
             }
             
         }
     }
 }
