//
//  DetailsDirectionsView.swift
//  Coqtails
//
//  Created by Bruno Krolo on 19.05.2024..
//

import SwiftUI

struct DetailsDirectionsView: View {

    let directions: String

    var body: some View {
        VStack {
            Text("Directions:")
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(directions)
                .font(.subheadline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
        }
    }
}
