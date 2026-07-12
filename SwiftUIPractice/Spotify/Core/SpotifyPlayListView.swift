//
//  SpotifyPlayListView.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 12/07/2026.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlayListView: View {
    @Environment(\.router) private var router
    var product: Product = Product.mock
    var user: User = User.mock
    @State private var products: [Product] = []
    @State private var showAppbar: Bool = false
     var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView {
                LazyVStack {
//                    GeometryReader { proxy in
//                        
//                    }
                    SpotifyPlayListHeaderCell(
                        title: product.title,
                        subTitle: product.description,
                        imageName: product.firstImage,
                    )
                    .readingFrame { frame in
                         showAppbar = frame.maxY < 150
                    }
                    
                    
                    PlayListDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category,
                        onAddToPlayListPressed: nil,
                        onDownloadPressed: nil,
                        onSharedPressed: nil,
                        onEllipsisPressed: nil,
                        onShuffledPressed: nil,
                        onPlayPressed: nil
                    )
                    
                    productsRowView
                    
                }
            }
            .scrollIndicators(.hidden)
            
    
            //=====
            ZStack {
                Text(product.title)
                    .font(.headline)
                    .bold()
                    .padding(.vertical,20)
                    .frame(maxWidth: .infinity)
                    .background(.spotifyBlack)
                    .opacity(showAppbar ? 1 : 0)
                    .offset(y:showAppbar ? 0: -50)
                   
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .padding(10)
                    .background(.spotifyGray.opacity(showAppbar ? 0.001 : 0.7))
                    .clipShape(.circle)
                    .onTapGesture {
                        router.dismissScreen()
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading, 16)
            }
            .foregroundStyle(.spotifyWhite)
            .frame(maxHeight: .infinity,alignment: .top)
            .animation(.smooth(duration: 0.2), value: showAppbar)

            
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
        .task {
            await getData()
        }
    }
    
    private func goToSpotifyPlayListView(product: Product) {
         router.showScreen(.push) { _ in
            SpotifyPlayListView( product: product, user: user)
        }
    }
    private func getData() async {
        do {
             products = try await DatabaseHelper.getProducts()
        } catch {
            print("Error \(error)")
        }
    }
}

#Preview {
    RouterView { _ in
        SpotifyPlayListView( product: Product.mock)
    }
    
}

extension SpotifyPlayListView {
    var productsRowView : some View {
//        LazyVStack {
            ForEach(products) { product in
                SongsRowView(
                    imageSize: 50,
                    imageName: product.firstImage,
                    title: product.title,
                    subtitle: product.brand,
                    onCellPressed: {
                        goToSpotifyPlayListView(product: product)
                    },
                    onELlipsisPressed: nil
                )
                .padding(.leading, 12)
//            }
        }
    }
}
