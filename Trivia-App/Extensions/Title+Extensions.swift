//  Title+Extensions.swift
//  Trivia-App
//  Created by Leonardo Oliveira on 20/03/24.

import SwiftUI
import Foundation

extension Text {
    func defaultTitle()-> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color.mainColor)
    }
}
