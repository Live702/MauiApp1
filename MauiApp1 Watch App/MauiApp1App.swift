//
//  MauiApp1App.swift
//  MauiApp1 Watch App
//
//  Created by Timothy May on 1/21/25.
//

/*import SwiftUI

@main
struct MauiApp1_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
*/
import SwiftUI
import WatchConnectivity

@main
struct MauiApp1_Watch_AppApp: App {
    // Create handler as a StateObject to persist through app lifecycle
    @StateObject private var communicationManager = WatchCommunicationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(communicationManager)
        }
    }
}

// Create a manager class to handle communications
class WatchCommunicationManager: NSObject, ObservableObject, WCSessionDelegate {
    public let handler: CommunicationHandler
    
    override init() {
        handler = CommunicationHandler()
        super.init()
        
        // Listen for commands
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleDataFlow),
            name: .DataDidFlow,
            object: nil
        )
    }
    
    @objc private func handleDataFlow(_ notification: Notification) {
        if let commandStatus = notification.object as? CommandStatus {
            handler.processCommand(commandStatus)
        }
    }
    
    // Required WCSessionDelegate methods
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
    func sessionReachabilityDidChange(_ session: WCSession) {}
}
