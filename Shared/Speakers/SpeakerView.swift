//
//  SpeakerView.swift
//  ios14test
//
//  Created by Pawel Madej on 28/08/2020.
//

import SwiftUI

struct SpeakerView: View {
    var body: some View {
        #if os(iOS)
        Text("speakers")
            .toolbar {
                ToolbarItem {
                    Menu("Select Item") {
                        Button("Select Talks tab") {
                            UIApplication.shared.open(URL(string: "testlink://talks")!, options: [:], completionHandler: nil)
                        }
                        Button("Select Speakers tab") {
                            UIApplication.shared.open(URL(string: "testlink://speakers")!, options: [:], completionHandler: nil)
                        }
                        Button("Select 5th item") {
                            UIApplication.shared.open(URL(string: "testlink://talks/86af4777-aba8-416c-a543-e0a3cc15e708")!, options: [:], completionHandler: nil)
                        }
                        Button("Select 75th item") {
                            UIApplication.shared.open(URL(string: "testlink://talks/9eb06f79-2c0b-4c83-aa9b-845807d21ebe")!, options: [:], completionHandler: nil)
                        }
                    }
                }
            }
        #elseif os(macOS)
        Text("speakers")
            .toolbar {
                Button("Select Talks tab") {
                    NSWorkspace.shared.open(URL(string: "testlink://talks")!)
                }
                Button("Select Speakers tab") {
                    NSWorkspace.shared.open(URL(string: "testlink://speakers")!)
                }
                Button("Select 5th item") {
                    NSWorkspace.shared.open(URL(string: "testlink://talks/86af4777-aba8-416c-a543-e0a3cc15e708")!)
                }
                Button("Select 75th item") {
                    NSWorkspace.shared.open(URL(string: "testlink://talks/9eb06f79-2c0b-4c83-aa9b-845807d21ebe")!)
                }
            }
        #endif
    }
}

struct SpeakerView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerView()
    }
}
