
import SwiftUI

enum WindowCase {
    case onboarding
    case main
}

@Observable
final class AppCoordinator{
    var selectedWindow: WindowCase = .main
    var isOnboarded: Bool
    var isRegistred: Bool
    
    init(){
        if UserDefaults.standard.value(forKey: "isRegistred") == nil  { UserDefaults.standard.set(false, forKey: "isRegistred") }
        if UserDefaults.standard.value(forKey: "isOnborded") == nil { UserDefaults.standard.set(false, forKey: "isOnborded")}
        
        self.isOnboarded = UserDefaults.standard.bool(forKey: "isOnborded")
        self.isRegistred = UserDefaults.standard.bool(forKey: "isRegistred")
        checkWindowCase()
    }
    
    
    //MARK: - Onboarding
    func showOnboarding(){
        self.selectedWindow = .onboarding
        UserDefaults.standard.set(false, forKey: "isOnborded")
        isOnboarded = false
    }
    
    func finishOnboarding(){
        self.selectedWindow = .main
        UserDefaults.standard.set(true, forKey: "isOnborded")
        isOnboarded = true
        checkWindowCase()
    }
    
    //MARK: - Main
    func showMain(){
        self.selectedWindow = .main
    }
    
    private func checkWindowCase(){
        if isOnboarded {
            selectedWindow = .main
        } else {
            selectedWindow = .onboarding
        }
        
    }
    
}
