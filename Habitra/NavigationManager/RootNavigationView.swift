//
//  RootNavigationView.swift
//  Habitra
//
//  Created by Rahul Gangwar on 22/09/25.
//

import SwiftUI

struct RootNavigationView<Root: View>: View {
    @StateObject private var navigator = NavigationManager()
    let root: Root
    
    init(@ViewBuilder root: () -> Root) {
        self.root = root()
    }
    
    var body: some View {
        NavigationStack(path: $navigator.path) {
            root
                .navigationDestination(for: AnyRoute.self) { route in
                    route.view
                }
        }
        .sheet(item: $navigator.modal) { route in
            route.view
        }
        .fullScreenCover(item: $navigator.transparentModal) { route in
            ZStack {
                Color.black.opacity(0.5)
                route.view
            }
            .ignoresSafeArea()
        }
        .environmentObject(navigator)
    }
}
