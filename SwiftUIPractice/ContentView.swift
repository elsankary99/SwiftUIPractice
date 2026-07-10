//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 10/07/2026.
//

import SwiftUI

struct ContentView: View {
    @State var userArray:[User] = []
    @State var productArray:[Product] = []
    var body: some View {
        ScrollView{
            VStack {
                ForEach(productArray) { product in
                    Text(product.title)
                }
                ForEach(userArray) { product in
                    Text(product.firstName)
                }
            } 
        }
        .padding()
        .task {
            do {
                productArray =  try await DatabaseHelper.getProducts()
                userArray =  try await DatabaseHelper.getUserss()
            } catch {
                print("Error \(error)")
            }
            
        }
    }
}

#Preview {
    ContentView()
}
 
