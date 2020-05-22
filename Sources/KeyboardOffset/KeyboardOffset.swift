import SwiftUI

@available(iOS 13.0, *)
public struct KeyboardOffset: ViewModifier {
    
    @State var keyboardHeight: CGFloat = 0
    @State var keyboardAnimationDuration: Double = 0
    
    public init() {
        
    }
    
    public func body(content: Content) -> some View {
        content
            .padding([.bottom], keyboardHeight)
            .edgesIgnoringSafeArea((keyboardHeight > 0) ? [.bottom] : [])
            .animation(.easeOut(duration: keyboardAnimationDuration))
            .onReceive(
                NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
                    .receive(on: RunLoop.main),
                perform: updateKeyboardHeight
        )
    }
    
    func updateKeyboardHeight(_ notification: Notification) {
        guard let info = notification.userInfo else { return }
        keyboardAnimationDuration = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0.25
        
        guard let keyboardFrame = info[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        if keyboardFrame.origin.y == UIScreen.main.bounds.height {
            keyboardHeight = 0
        } else {
            keyboardHeight = keyboardFrame.height
        }
    }
}

@available(iOS 13.0, *)
extension View {
    public func keyboardOffset() -> some View {
        self.modifier(KeyboardOffset())
    }
}
