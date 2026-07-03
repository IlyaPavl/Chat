//
//  ContactListView.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import SwiftUI

struct ContactListView: View {
    @State private var searchText = ""

    var body: some View {
        ScrollView {}
            .background(Color(.systemBackground))
            .navigationTitle(String(localized: .tabContactTitle))
            .searchable(text: $searchText)
            .onChange(of: searchText) { _, newValue in
                print(newValue)
            }
    }
}

#Preview {
    NavigationStack {
        ContactListView()
    }
}
