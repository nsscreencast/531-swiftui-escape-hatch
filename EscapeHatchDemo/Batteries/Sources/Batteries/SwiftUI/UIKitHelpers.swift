import UIKit

extension UIApplication {
    public func findKeyWindow() -> UIWindow? {
        connectedScenes
            .lazy
            .compactMap { $0 as? UIWindowScene }
            .compactMap(\.keyWindow)
            .first
    }
}

extension UIView {
    public func firstSubview<V: UIView>(_: V.Type = V.self, where predicate: @escaping (V) -> Bool = { _ in true }) -> V? {
        if let view = self as? V, predicate(view) {
            return view
        }

        return subviews
            .lazy
            .compactMap { $0.firstSubview(where: predicate) }
            .first
    }

    public func findSwiftUIViewHost() -> UIView? {
        guard let s = superview else {
            return nil
        }
        if NSStringFromClass(type(of: s)).contains("ViewHost") {
            return s
        } else {
            return superview?.findSwiftUIViewHost()
        }
    }
}
