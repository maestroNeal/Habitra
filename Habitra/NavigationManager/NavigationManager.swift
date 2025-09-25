//
//  NavigationManager.swift
//  Habitra
//
//  Created by Rahul Gangwar on 22/09/25.
//
import SwiftUI

@MainActor
final class NavigationManager: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var modal: AnyRoute?
    @Published var transparentModal: AnyRoute?
    
    func push<V: View>(_ view: V) {
        path.append(AnyRoute(view))
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func replaceStack<V: View>(with views: [V]) {
        path = NavigationPath(views.map { AnyRoute($0) })
    }
    
    func present<V: View>(_ view: V) {
        modal = AnyRoute(view)
    }
    
    func dismissModal() {
        modal = nil
    }
    
    func presentTransparent<V: View>(_ view: V) {
        transparentModal = AnyRoute(view)
    }
    
    func dismissTransparent() {
        transparentModal = nil
    }
}
