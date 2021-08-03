//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by lei zhang on 2021/8/2.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: DailyScrum.data)
            
            }
        }
    }
}
