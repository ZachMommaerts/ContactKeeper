//
//  ContentView.swift
//  ContactKeeper
//
//  Created by Zach Mommaerts on 11/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var contacts = [Int]()
    var body: some View {
        NavigationView {
            List(contacts, id: \.self) { contact in
                
            }
            .navigationTitle("Contact Keeper")
            .toolbar{
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
