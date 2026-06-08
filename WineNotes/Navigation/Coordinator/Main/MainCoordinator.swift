

import SwiftUI

@Observable
final class MainCoordinator {
    var path = NavigationPath()
    var selectedTab: Tab = .galery
    
    private weak var app: AppCoordinator?
    
    var galery:  GaleryCoordinator!
    var lib:     LibCoordinator!
    var profile: ProfileCoordinator!
    var stat:    StatCoordinator!
    
    init(app: AppCoordinator){
        self.app = app
        galery =  GaleryCoordinator(app: self)
        lib =     LibCoordinator(app: self)
        profile = ProfileCoordinator(app: self)
        stat =    StatCoordinator(app: self)
    }
    
    func push(_ route: MainRoute) { path.append(route) } 
    func pop() { if !path.isEmpty { path.removeLast() } }
    func popToRoot() { path = NavigationPath() }
    
    func onboarding(){
        app?.showOnboarding()
    }
}
