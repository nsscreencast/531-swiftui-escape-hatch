import SwiftUI
import UIKit
import PlaygroundSupport
import Batteries

struct LoginForm: View {
    enum Field: Hashable {
        case username
        case password
    }

    @State private var username = ""
    @State private var password = ""
    @XFocusState private var focusedField: Field?

    var body: some View {
        Form {
            TextField("Username", text: $username)
                //.focused($focusedField, equals: .username)

            SecureField("Password", text: $password)
                //.focused($focusedField, equals: .password)

            Button("Sign In") {
                if username.isEmpty {
                    focusedField = .username
                } else if password.isEmpty {
                    focusedField = .password
                } else {
                    print("login...")
                }
            }
        }
    }
}

PlaygroundPage.current.liveView = UIHostingController(rootView: LoginForm())
