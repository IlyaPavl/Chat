//
//  AddProfilePhoto.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import SwiftUI

struct AddProfilePhoto: View {
    var body: some View {
        let photoSize = Layout.AuthFlow.Profile.profilePhotoSize
        let buttonSize = Layout.AuthFlow.Profile.addProfilePhotoButtonSize

        HStack(spacing: Layout.Spacing.s) {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.brown)
                .frame(width: photoSize, height: photoSize)
                .clipShape(Circle())

            Button {
                
            } label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: buttonSize, height: buttonSize)
                    .foregroundStyle(.brown)
            }
            .tint(.brown)
        }
        .frame(maxWidth: .infinity)
    }
}
