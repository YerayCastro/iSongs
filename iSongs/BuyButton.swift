//
//  BuyButton.swift
//  iSongs
//
//  Created by Yery Castro on 22/5/24.
//

import SwiftUI

struct BuySongButton: View {
    let urlString: String
    let price: Double?
    let currency: String
    
    var body: some View {
        if let price = price {
            BuyButton(urlString: urlString,
                      price: price,
                      currency: currency)
        } else {
            Text("ALBUM ONLY")
                .font(.footnote)
                .foregroundStyle(.gray)
        }
    }
}

struct BuyButton: View {
    let urlString: String
    let price: Double?
    let currency: String
    
    var body: some View {
        if let url = URL(string: urlString), let priceText = formattedPrice() {
            Link(destination: url) {
                Text(priceText)
            }
            .buttonStyle(BuyButtonStyle())
        }
    }
    
    func formattedPrice() -> String? {
        guard let price = price else {
            return nil
        }
        let formatted = NumberFormatter()
        formatted.numberStyle = .currency
        formatted.currencyCode = currency
        let priceString = formatted.string(from: NSNumber(value: price))
        return priceString ?? ""
    }
}

#Preview {
    
    let example = Album.example()
    return BuyButton(urlString: example.collectionViewURL,
                     price: example.collectionPrice,
                     currency: example.currency)
}
