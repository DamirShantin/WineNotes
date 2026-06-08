
enum OnboardingRoute: Hashable {
    case page2
    case page3
}

enum MainRoute: Hashable{
    case galery(_ val:GaleryRoute)
    case lib(_ val:LibRoute)
    case profile(_ val:ProfileRoute)
    case stat(_ val:StatRoute)
}

enum GaleryRoute: Hashable {
    
}

enum LibRoute: Hashable {
    
}

enum ProfileRoute: Hashable {
    
}

enum StatRoute: Hashable {
    
}
