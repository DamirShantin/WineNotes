
import SwiftUI


// convert Binding<T?> in Binding<T> with default value
extension Binding {
    func replacingNil<T>(with defaultValue: T) -> Binding<T> where Value == T? {
        Binding<T>(
            get: { self.wrappedValue ?? defaultValue },
            set: { self.wrappedValue = $0 }
        )
    }
}

