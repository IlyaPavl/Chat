//
//  SetupProfileView.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import SwiftUI

struct SetupProfileView: View {
    @State private var fullName = ""
    @State private var aboutMe = ""
    @State private var selectedGender: Gender?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Layout.AuthFlow.sectionSpacing) {
                AuthTitleLabel(
                    title: .authSetupProfileLabel,
                    font: Typography.welcomeLogoFont,
                    lineLimit: nil
                )
                .padding(.bottom, Layout.AuthFlow.topInset - Layout.AuthFlow.sectionSpacing)

                AddProfilePhoto()

                FormField(
                    title: .authFullNameLabel,
                    text: $fullName,
                    textContentType: .name
                )

                AboutMeSection(text: $aboutMe)

                GenderPicker(selection: $selectedGender)

                AuthProminentButton(title: .authReadyButtonTitle)
                    .frame(height: Layout.Button.height)
            }
            .padding(.horizontal, Layout.AuthFlow.horizontalInset)
            .padding(.top, Layout.AuthFlow.topInset)
        }
        .scrollIndicators(.hidden)
        .background(Color(.systemBackground))
    }
}

/// Многострочное поле «О себе».
private struct AboutMeSection: View {
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: Layout.AuthFlow.labelToControl) {
            Text(.authAboutMeLabel)
                .font(Typography.commonLabelFont)
                .foregroundStyle(.primary)

            TextField("", text: $text, axis: .vertical)
                .font(Typography.commonLabelFont)
                .lineLimit(3...6)
                .padding(.vertical, Layout.Spacing.s)
                .formFieldBorder(
                    minHeight: Layout.TextView.minHeight,
                    alignment: .topLeading
                )
        }
    }
}

/// Меню выбора пола.
private struct GenderPicker: View {
    @Binding var selection: Gender?

    var body: some View {
        VStack(alignment: .leading, spacing: Layout.AuthFlow.labelToControl) {
            Text(.authGenderLabel)
                .font(Typography.commonLabelFont)
                .foregroundStyle(.primary)

            Menu {
                ForEach(Gender.allCases, id: \.self) { gender in
                    Button {
                        selection = gender
                    } label: {
                        if selection == gender {
                            Label(gender.title, systemImage: "checkmark")
                        } else {
                            Text(gender.title)
                        }
                    }
                }
            } label: {
                HStack {
                    Text(selection?.title ?? .authGenderPlaceholder)
                        .font(Typography.commonLabelFont)
                    Spacer()
                    Image(systemName: "chevron.up.chevron.down")
                        .font(.caption)
                }
                .formFieldBorder()
            }
        }
        .tint(.primary)
    }
}

private enum Gender: CaseIterable, Hashable {
    case male
    case female
    case other

    var title: LocalizedStringResource {
        switch self {
        case .male: .authGenderMale
        case .female: .authGenderFemale
        case .other: .authGenderOther
        }
    }
}

#Preview {
    SetupProfileView()
}
