import UIKit
import SwiftUI
import Batteries
import PlaygroundSupport

struct DemoView: View {

    @State var text: String = ""

    var body: some View {
        Form {
            Section {
                TextField("Text Field", text: $text)
                    
            } header: {
                Text("Discover Demo")
                    .padding(.bottom, 20)
            }
        }
    }
}

PlaygroundPage.current.liveView = UIHostingController(rootView: DemoView())

class Dummy: UIView {}

let parent = UIView()
let child = UIView()
parent.addSubview(child)
child.addSubview(Dummy())
print(parent.firstSubview(Dummy.self))
