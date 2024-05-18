//
//  TextfieldCancelButton.swift
//  BaseClientTest
//
//  Created by Bruno Krolo on 14.05.2024..
//

import SwiftUI

struct TextFieldCancelButton: View {

    let action: (() -> Void)?

    var body: some View {
        Button {
            action?()
        } label: {
            Circle()
                .opacity(0.15)
                .foregroundStyle(.gray)
                .overlay {
                    Image("searchcancel", bundle: nil)
                }
        }
    }

}
