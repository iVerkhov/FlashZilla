//
//  CardView.swift
//  FlashZilla
//
//  Created by Игорь Верхов on 23.02.2024.
//

import SwiftUI

struct CardView: View {
    let card: Card
    var removal: ((Bool) -> Void)? = nil
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    accessibilityDifferentiateWithoutColor 
                    ? .white
                    : .white
                        .opacity(1 - Double(abs(offset.width / 50)))
                )
                .background(
                    accessibilityDifferentiateWithoutColor
                    ? nil
                    : RoundedRectangle(cornerRadius: 25)
                        .fill(using: offset)
                )
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            VStack {
                if accessibilityVoiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.promt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                } else {
                    Text(card.promt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(offset.width / 5.0))
        .offset(x: offset.width * 5)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged{ gesture in
                    offset = gesture.translation
                }
                .onEnded{ _ in
                    if abs(offset.width) > 100 {
                        if offset.width > 0 {
                            removal?(false)
                        } else {
                            removal?(true)
                            offset = .zero
                        }
                    } else {
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.bouncy, value: offset)
    }
}

extension Shape {
    func fill(using offset: CGSize) -> some View {
        switch offset.width {
        case 0:     self.fill(.white)
        case ..<0:  self.fill(.red)
        default:    self.fill(.green)
        }
    }
}

#Preview {
    CardView(card: .example)
}
