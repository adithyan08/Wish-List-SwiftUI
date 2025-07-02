//
//  WishListApp.swift
//  WishList
//
//  Created by adithyan na on 8/6/25.
//

import SwiftUI
import SwiftData
@main
struct WishListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Model.self)
        }
    }
}
