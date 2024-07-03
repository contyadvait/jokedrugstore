//
//  GetDrugsView.swift
//  Drug Store (JOKE)
//
//  Created by Milind Contractor on 3/7/24.
//

import SwiftUI

struct GetDrugsView: View {
    @State var warningText: String = "Tap to view warning"
    @State var selectedDrug: String = "Weed"
    @State var amount: Int = 1
    @Binding var drugs: [Drug]
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .symbolRenderingMode(.multicolor)
                Text(warningText)
                    .onTapGesture {
                        withAnimation {
                            if warningText == "Tap to view warning" {
                                warningText = "WARNING: THIS APP IS AN COMPLETE JOKE. PLEASE DO NOT USE IT WITHIN THE REAL WORLD, AS IT IS NOT DESIGNED FOR IT AND IS LARGE DISCOURAGED BY THE CREATORS."
                            } else {
                                warningText = "Tap to view warning"
                            }
                        }
                    }
            }
            HStack {
                Text("Drug:")
                Picker("Drug", selection: $selectedDrug) {
                    ForEach(drugs, id: \.id) { drug in
                        Text("\(drug.name), \(drug.priceLabel)")
                            .tag(drug.name)
                    }
                }
            }
            Text("Buying 1 kg")
            Button {
                drugs[drugs.firstIndex(where: { $0.name == selectedDrug }) ?? 0].amount = drugs[drugs.firstIndex(where: { $0.name == selectedDrug }) ?? 0].amount - Float(amount)
                dismiss()
            } label: {
                Text("Purchase drug! (JOKE)")
            }
        }
        .padding()
    }
}

#Preview {
    GetDrugsView(drugs: .constant([Drug(name: "Weed", description: "Something", amount: 5.0, price: 1.0)]))
}
