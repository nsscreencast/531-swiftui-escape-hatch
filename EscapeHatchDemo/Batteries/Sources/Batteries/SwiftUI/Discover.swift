import UIKit
import SwiftUI

extension View {
    public func discover<V: UIView>(
        _: V.Type,
        tag: Int = .random(in: (.min)...(.max)),
        completion: @escaping (V) -> Void) -> some View {
        overlay(
            DiscoverView(tag: tag)
                .frame(width: 0, height: 0)
                .onAppear() {
                    DispatchQueue.main.async {
                        guard
                            let keyWindow = UIApplication.shared.findKeyWindow(),
                            let discoverView = keyWindow.viewWithTag(tag),
                            let viewHost = discoverView.findSwiftUIViewHost()
                        else {
                            return
                        }

                        if let foundView = findView(V.self, host: viewHost) {
                            completion(foundView)
                        }
                    }
                }
        )
    }

    private func findView<V: UIView>(_: V.Type, host: UIView) -> V? {
        // find the index of host in the superview's subviews array
        // walk backward, searching the tree looking for the view
        guard let superview = host.superview,
              let index = superview.subviews.firstIndex(of: host) else {
            return nil
        }

        let branches = superview.subviews[0..<index].reversed()
        return branches.lazy.compactMap { $0.firstSubview(V.self) }.first
    }
}

fileprivate struct DiscoverView: UIViewRepresentable {
    let tag: Int

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.tag = tag
        view.accessibilityLabel = "Discover View"
        view.isUserInteractionEnabled = false
        view.frame = .zero
        view.backgroundColor = .clear
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
