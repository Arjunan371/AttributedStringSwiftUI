//
//  ContentView.swift
//  AttributedStringSwiftUI
//
//  Created by Arjunan on 18/04/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewM: viewModel = viewModel()
    let link = "[Duck Duck Go](https://duckduckgo.com)"
    let markdownLink = try? AttributedString(markdown: "[DuckOut](https://duckduckgo.com)")
    var body: some View {
        VStack(spacing: 12) {
            Text(attributedString + message1 + message2)
            Divider()
            Text(message)
            Divider()
            Text(message3)
            Divider()
            Text(message4)
            Divider()
            Text(message5)
            Divider()
            Text(message6)
            Divider()
            Text(message7)
            Divider()
            Text(message8)
            Divider()
            Text(.init(link))
            Divider()
            Text(markdownLink ?? attributedString)
            Link("Visit Our Site", destination: URL(string: "https://www.example.com")!)
                .environment(\.openURL, OpenURLAction { url in
                    print("Open \(url)")
                    return .handled
                })
        }
        .padding()
    }
    var attributedString: AttributedString {
   //     var attributedString = AttributedString("The first month of your subscription is free.")
        guard let attributedString = try? AttributedString(markdown: "**Thank you!** Please visit our [website](https://example.com)") else { return "" }

//        guard let range = attributedString.range(of: " your") else {return ""}
//        attributedString[range].foregroundColor = .red
        return attributedString
    }
    
    var message1: AttributedString {
        var result = AttributedString("Hello")
        result.font = .largeTitle
        result.foregroundColor = .white
        result.backgroundColor = .red
        return result
    }

    var message2: AttributedString {
        var result = AttributedString("World!")
        result.font = .largeTitle
        result.foregroundColor = .white
        result.backgroundColor = .blue
        return result
    }
    
    var message: AttributedString {
        var result = AttributedString("Testing 1 2 3!")
        result.font = .largeTitle
        result.foregroundColor = .white
        result.backgroundColor = .blue
        result.underlineStyle = Text.LineStyle(pattern: .solid, color: .white)
        return result
    }
    var message3: AttributedString {
        let string = "The letters go up and down"
        var result = AttributedString()

        for (index, letter) in string.enumerated() {
            var letterString = AttributedString(String(letter))
            letterString.baselineOffset = sin(Double(index)) * 5
            result += letterString
        }

        result.font = .largeTitle
        return result
    }
    
    var message4: AttributedString {
        var data = AttributedString("Learn Swift")
        data.font = .largeTitle
        var result = AttributedString(" here")
        result.font = .largeTitle
        result.link = URL(string: "https://www.hackingwithswift.com")
        return data + result
    }
    
    var message5: AttributedString {
        var password = AttributedString("abCayer-muQai")
        password.accessibilitySpeechSpellsOutCharacters = false
        return "Your password is: " + password
    }
    
    var message6: AttributedString {
        var result = Date.now.formatted(.dateTime.weekday(.wide).day().month(.wide).attributed)
        result.foregroundColor = Color.green

        let weekday = AttributeContainer.dateField(.weekday)
        let weekdayStyling = AttributeContainer.foregroundColor(.primary)
        result.replaceAttributes(weekday, with: weekdayStyling)

        return result
    }
    
    var message7: AttributedString {
        var components = PersonNameComponents()
        components.givenName = "Taylor"
        components.familyName = "Swift"

        var result = components.formatted(.name(style: .long).attributed)

        let familyNameStyling = AttributeContainer.font(.headline)
        let familyName = AttributeContainer.personNameComponent(.familyName)
        result.replaceAttributes(familyName, with: familyNameStyling)

        return result
    }
    var message8: AttributedString {
        var amount = Measurement(value: 200, unit: UnitLength.feet)
        var result = amount.formatted(.measurement(width: .wide).attributed)

        let distanceStyling = AttributeContainer.font(.title)
        let distance = AttributeContainer.measurement(.value)
        result.replaceAttributes(distance, with: distanceStyling)

        return result
    }
    
}

#Preview {
    ContentView()
}
class viewModel: ObservableObject {
    init() {

    }
}

extension String {
    
}
