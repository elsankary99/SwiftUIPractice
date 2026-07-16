//
//  NetflixHomeView.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 14/07/2026.
//

import SwiftUI
import SwiftfulUI

struct NetflixHomeView: View {
    var onSelectPressed: ((FilterModel) -> Void)? = nil
    @State var selectedFilter: FilterModel? = nil
    @State private var fullHeaderSize: CGSize = .zero

    @State private var heroProduct: Product? = nil
    @State private var currentUSer: User? = nil
    @State private var row: [ProductRow] = []
    
    @State private var scrollviewOffset: CGFloat = 0

    var body: some View {
        ZStack(alignment: .top) {
            Color.netflitBlack.ignoresSafeArea()
            
            ZStack {
                LinearGradient(
                    colors: [
                        Color.netflixDarkGray.opacity(1),
                        Color.netflixDarkGray.opacity(0),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                LinearGradient(
                    colors: [
                        Color.netflixDarkRed.opacity(0.5),
                        Color.netflixDarkRed.opacity(0),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            }
            .frame(maxHeight: max(10, (400 + (scrollviewOffset * 0.75))))
            .opacity(scrollviewOffset < -250 ? 0 : 1)
            .animation(.easeInOut, value: scrollviewOffset)
            ScrollViewWithOnScrollChanged(
                .vertical,
                showsIndicators: false,
                content: {
                    VStack {
                        Rectangle()
                            .opacity(0)
                            .frame(height: fullHeaderSize.height)

                        if let heroProduct {
                            NetflixHeroCell(
                                imageName: heroProduct.firstImage,
                                isNetflixFilm: true,
                                title: heroProduct.title,
                                onBackgroundPressed: nil,
                                onPlayPressed: nil,
                                onListPressed: nil
                            )
                            .padding(24)
                        }
                        recentlyProducts
                    }
                }
            ) { offset in
                scrollviewOffset = min(0,offset.y)
                print("offset.y: \(offset.y)")
            }

            VStack {
                header
                    .padding()
                if scrollviewOffset > -20 {
                    NetflixFilterBarView(
                        onXmarkPressed: {
                            selectedFilter = nil
                        },
                        onSelectPressed: { filter in
                            selectedFilter = filter
                        },
                        selectedFilter: selectedFilter
                    )
                    .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
            .background(
                ZStack{
                    if scrollviewOffset < -70 {
                       Rectangle()
                            .fill(Color.clear)
                            .background(.ultraThinMaterial)
                            .brightness(-0.2)
                            .ignoresSafeArea()
                        
                    }
                }
            )
            .animation(.smooth, value: scrollviewOffset)
            .readingFrame { frame in
                if fullHeaderSize == .zero {
                    fullHeaderSize = frame.size
                    print("\(fullHeaderSize.height)")
                }
            }

        }
        .toolbarVisibility(.hidden, for: .navigationBar)
        .task {
            await getData()
        }
    }
    private func getData() async {
        //        guard products.isEmpty else { return }
        do {
            currentUSer = try await DatabaseHelper.getUserss().first
            let products = try await DatabaseHelper.getProducts()
            heroProduct = products.first
            var rows: [ProductRow] = []
            let brands = Set(products.map({ $0.brand }))
            for brand in brands {
                if let brand {
                    //                let brandProducts = products.filter({$0.brand == brand})
                    let productRow = ProductRow(
                        title: brand.uppercased(),
                        products: products
                    )
                    rows.append(productRow)
                }
            }
            row = rows

        } catch {
            print("Error \(error)")
        }
    }
}

#Preview {
    NetflixHomeView()
}

extension NetflixHomeView {
    var header: some View {
        HStack(spacing: 0) {
            Text("For You")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {

                    }
                Image(systemName: "magnifyingglass")
                    .onTapGesture {

                    }
            }
            .font(.title2)

        }
        .foregroundStyle(.netflitWhite)

    }

    var recentlyProducts: some View {
        VStack(spacing: 20) {
            ForEach(Array(row.enumerated()), id: \.offset) {
                rowIndex,
                rowProduct in
                VStack(alignment: .leading, spacing: 5) {
                    Text(rowProduct.title)
                        .foregroundStyle(.netflitWhite)
                        .padding(.leading, 10)
                    ScrollView(
                        .horizontal,
                        content: {
                            LazyHStack {
                                ForEach(
                                    Array(rowProduct.products.enumerated()),
                                    id: \.offset
                                ) { index, product in
                                    NetflixMoviCell(

                                        imageName: product.firstImage,
                                        title: product.title,
                                        isRecentlyAdded: product.recentlyAdded,
                                        topTenRanking: rowIndex == 2
                                            ? index + 1 : nil
                                    )
                                }
                            }
                            .padding(.leading, 10)
                        }
                    )
                    .scrollIndicators(.hidden)
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}
