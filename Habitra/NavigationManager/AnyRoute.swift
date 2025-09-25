//
//  AnyRoute.swift
//  Habitra
//
//  Created by Rahul Gangwar on 22/09/25.
//

import SwiftUI

struct AnyRoute: Hashable, Identifiable {
    let id = UUID()
    let view: AnyView
    
    init<V: View>(_ view: V) {
        self.view = AnyView(view)
    }
    
    static func == (lhs: AnyRoute, rhs: AnyRoute) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
