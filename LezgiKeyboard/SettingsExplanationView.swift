//
//  SettingsExplanationView.swift
//  LezgiKeyboard
//
//  Created by Kamran Tadzjibov on 29/11/2022.
//

import SwiftUI

struct SettingsExplanationView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var isFullKeyboard: Bool
    
    func getImageForDevice(name: String) -> String {
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            return "ipad_" + name
        }
        return name
    }
    
    var body: some View {
        return ZStack {
            VStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "x.circle")
//                        .foregroundColor(.black)
                        .font(.largeTitle)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                Spacer()
                ScrollView {
                    VStack(alignment: .leading) {
                        Button("Откройте \"Настройки\"") {
                            guard let settingsUrl = URL(string:
                                                            UIApplication.openSettingsURLString
                            ) else {
                                return
                            }
                            if UIApplication.shared.canOpenURL(settingsUrl) {
                                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                                    print("Settings opened: \(success)")
                                    
                                })
                            }
                        }
                        .padding(.bottom)
                        .padding(.horizontal, 25)
                        Group {
                            Text("1. Выберите «Основные» > «Клавиатура»")
                                .padding(.bottom)
                                .padding(.horizontal, 25)
                            Image(getImageForDevice(name: "menu_keyboard_1"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .border(Color.gray, width: 3.0)
                        }
                        Group {
                            Text("2. Коснитесь «Клавиатуры»")
                                .padding(.vertical)
                                .padding(.horizontal, 25)
                            Image(getImageForDevice(name: "menu_keyboard_2"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .border(Color.gray, width: 3.0)
                        }
                        Group {
                            Text("3. Коснитесь «Новые клавиатуры»")
                                .padding(.vertical)
                                .padding(.horizontal, 25)
                            
                            Image(getImageForDevice(name: "menu_keyboard_3"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .border(Color.gray, width: 3.0)
                        }
                        Group {
                            Text("4. Выберите клавиатуру с названием «Лезгинская Клавиатура»")
                                .padding(.vertical)
                                .padding(.horizontal, 25)
                            Image(getImageForDevice(name: "menu_keyboard_4"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .border(Color.gray, width: 3.0)
                        }
                        if (isFullKeyboard) {
                            Group {
                                Text("5. Коснитесь «Лезги чIал: Вири гьарфар»")
                                    .padding(.vertical)
                                    .padding(.horizontal, 25)
                                Image(getImageForDevice(name: "menu_keyboard_5_1"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .border(Color.gray, width: 3.0)
                                Text("""
Буквы "Ю", "Ы" и "Щ" доступны в этой раскладке как 2-ой вариант:
- чтобы напечатать "Ю" надо нажать и удерживать кнопку "Уь"
- чтобы напечатать "Ы" надо нажать и удерживать кнопку "Ь"
- чтобы напечатать "Ш" надо нажать и удерживать кнопку "Щ
""")
                                .padding(.vertical)
                                .padding(.horizontal, 25)
                            }
                        } else {
                            Group {
                                Text("5. Коснитесь «Лезги чIал»")
                                    .padding(.vertical)
                                    .padding(.horizontal, 25)
                                Image(getImageForDevice(name: "menu_keyboard_5_2"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .border(Color.gray, width: 3.0)
                            }
                        }
                    }
                }
            }
        }
    }
}

//struct SettingsExplanationView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsExplanationView(isFullKeyboard: false)
//    }
//}
