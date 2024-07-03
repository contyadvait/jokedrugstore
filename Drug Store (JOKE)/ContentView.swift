//
//  ContentView.swift
//  Drug Store (JOKE)
//
//  Created by Milind Contractor on 3/7/24.
//

// Thank you collin WEE for the inspiration

import SwiftUI
import Forever


struct ContentView: View {
    @State var showWarning = true
    @State var warningText: String = "Tap to view warning"
    @State var usingForRealLife = false
    @State var lawEnforcement = false
    @State var getdrugs = false
    @Environment(\.dismiss) var dismiss
    @Forever("drugs") var drugs: [Drug] = [Drug(name: "Weed", description: "something you can smoke", amount: 10.0, price: 100.0)]
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Home")
                        .font(.system(size: 40))
                        .fontWidth(.expanded)
                        .bold()
                    Spacer()
                }
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
                    Spacer()
                }
                Button {
                    getdrugs = true
                } label: {
                    Text("Order drug (JOKE)")
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .fullScreenCover(isPresented: $showWarning) {
                    VStack {
                        HStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 40))
                            Text("WARNING")
                                .font(.system(size: 40))
                                .fontWidth(.expanded)
                        }
                        Text("This app is an joke. Using this for external real-life applications could lead to severe consequences. This is highly discouragesd by the creators and hence please do not do this. We will not be liable for any issues caused for using this app in a real life context.")
                        Toggle("I am not going to use this for real life applications", isOn: $usingForRealLife)
                            .tint(.red)
                        
                        Toggle("I understand that I will be liable for all issues that I cause with law enforcement due to this app", isOn: $lawEnforcement)
                            .tint(.red)
                        Button {
                            dismiss()
                        } label: {
                            Text("Continue using application")
                        }
                        .disabled(!usingForRealLife || !lawEnforcement)
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                        Button {
                            exit(0)
                        } label: {
                            Text("Quit application")
                        }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.bordered)
                        .tint(.red)
                    }
                    .padding()
                }
                .fullScreenCover(isPresented: $getdrugs) {
                    GetDrugsView(drugs: $drugs)
                }
            }
            if drugs != [] {
                HStack {
                    Text("Available drugs")
                        .font(.system(size: 40))
                        .fontWidth(.expanded)
                        .bold()
                    Spacer()
                }
                ForEach(drugs, id: \.id) { drug in
                    Text("*\(drug.amountLabel)* **\(drug.name)** at \(drug.priceLabel)")
                    Text("Description: \(drug.description)")
                }
            } else {
                Text("No drugs available")
            }
        }
        .padding(10)
    }
}

#Preview {
    ContentView()
}
