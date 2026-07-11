//
//  SpotifyHomeView.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 11/07/2026.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category = .all
    @State private var products: [Product] = []
    @State private var users: [User] = []
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()

            ScrollView {

                LazyVStack(spacing: 10, pinnedViews: .sectionHeaders) {
                    Section {
                        VStack (spacing: 10){
                            reccentSection
                                .padding(.horizontal, 12)
                                .padding(.bottom, 10)
                                 
                            if let product = products.first {
                                newReleaseSection(product: product)
                                    .padding(.horizontal, 12)
                                    .padding(.bottom, 10)
                              
                            }
                            ForEach(productRows) { row in
                                VStack (alignment: .leading, spacing:14) {
                                    Text(row.title)
                                        .foregroundStyle(.spotifyWhite)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    
                                    ScrollView (.horizontal) {
                                        HStack {
                                            ForEach(row.products) { product in
                                                SpotifyImageTitleCell(
                                                    imageName: product.firstImage,
                                                    title: product.title
                                                )
                                            }
                                        }
                                    }
                                    .scrollIndicators(.hidden)
                                }
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding(.horizontal, 12)
                                .padding(.bottom, 10)
                            }
                        }
                    } header: {
                        header
                    }

                }
                .padding(.top, 8)

            }
            .scrollIndicators(.hidden)
            .clipped()

        }
        .toolbarVisibility(.hidden, for: .navigationBar)
        .task {
            await getData()
        }
    }

    private func getData() async {
        do {
            currentUser = try await DatabaseHelper.getUserss().first
            products = try await DatabaseHelper.getProducts()
            
            var rows: [ProductRow] = []
            let brands =  Set(products.map({$0.brand}))
            for brand in brands {
                if let brand {
//                let brandProducts = products.filter({$0.brand == brand})
                let productRow = ProductRow(title: brand.uppercased(), products: products)
                    rows.append(productRow)
                }
            }
            
            productRows = rows
            
        } catch {
            print("Error \(error)")
        }
    }
    
    
}

#Preview {
    SpotifyHomeView()
}

extension SpotifyHomeView {
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)

                        .background(Color.spotifyWhite)
                        .clipShape(.circle)
                        .onTapGesture {
                            // Add Logic
                        }
                }
            }
            .frame(width: 35, height: 35)

            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            isSelected: selectedCategory == category,
                            title: category.rawValue.uppercased()
                        )
                        .animation(.interactiveSpring, value: selectedCategory)
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .scrollIndicators(.hidden)

        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(Color.spotifyBlack)

    }
    
    var reccentSection: some View {
        NonLazyVGrid(
            columns: 2,
            alignment: .center,
            spacing: 10,
            items: Array(
                products.prefix(
                    10
                )
            )
        ) { product in
           if let product {
                SpotifyRecentsCell(
                    imageName: product.firstImage,
                    title: product.title
                )
            }
        }
    }
    
    func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subHeadline: product.category,
            title: product.title,
            subTitle: product.description,
            onAddToPlayListPressed: nil,
            onPlayPressed: nil
        )
    }
}
