//
//  ContentView.swift
//  LezgiKeyboard
//
//  Created by Kamran Tadzjibov on 26/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State var showingSheet = false
    @State var isFullKeyboard = false
    @State var testInput: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Как использовать?").font(.system(.largeTitle, design: .rounded))
                    .padding(.vertical)
                    .padding(.horizontal, 25)
                
                Text("Выберите клавиатуру которую хотите использовать и следуйте инструкциям")
                    .padding(.horizontal, 25)
                
                Text("После завершения протестируйте выбранную клавиатуру в поле ниже")
                    .padding(.vertical)
                    .padding(.horizontal, 25)
                TextField("Напечатайте здесь что-нибудь...", text: $testInput)
                    .padding(.horizontal, 25)
                    .padding(.bottom)
                
                Button {
                    isFullKeyboard = true
                    withAnimation { showingSheet.toggle() }
                } label: {
                    Image("keyboard_viri_harfar")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.horizontal, 50)
                .padding(.bottom, 25)
                .sheet(isPresented: $showingSheet) {
                    SettingsExplanationView(isFullKeyboard: $isFullKeyboard)
                        .zIndex(1)
                        .transition(.move(edge: .bottom))
                }
                
                Button {
                    isFullKeyboard = false
                    withAnimation { showingSheet.toggle() }
                } label: {
                    Image("keyboard")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.horizontal, 50)
                .padding(.bottom, 70)
                .sheet(isPresented: $showingSheet) {
                    SettingsExplanationView(isFullKeyboard: $isFullKeyboard)
                        .zIndex(1)
                        .transition(.move(edge: .bottom))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
