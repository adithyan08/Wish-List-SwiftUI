//
//  showToastAlert.swift
//  WishList
//
//  Created by adithyan na on 9/6/25.
//

import SwiftUI

struct showToastAlert: View {
    let message: String
      let icon: String?
      let backgroundColor: Color

      var body: some View {
          HStack {
              if let icon = icon {
                  Image(systemName: icon)
                      .foregroundColor(.white)
              }
              Text(message)
                  .foregroundColor(.white)
                  .bold()
          }
          .padding()
          .background(backgroundColor)
          .cornerRadius(12)
          .shadow(radius: 4)
          .padding(.horizontal, 16)
      }
  }

#Preview {
    showToastAlert(message: "erroe", icon: "xmark.circle", backgroundColor: .black)
}
