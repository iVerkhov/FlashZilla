//
//  EditCards.swift
//  FlashZilla
//
//  Created by Игорь Верхов on 24.02.2024.
//

import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var cards = DataManager.load()
    @State private var newPromt = ""
    @State private var newAnswer = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section("Add new card") {
                    TextField("Promt", text: $newPromt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add Card", action: addCard)
                        .disabled(newPromt.count == 0 || newAnswer.count == 0)
                }
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].promt)
                                .font(.largeTitle)
                                .foregroundStyle(.black)
                            Text(cards[index].answer)
                                .font(.title)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
        }
    }
    
    func done() {
        dismiss()
    }
    
    func addCard() {
        let trimmedPromt = newPromt.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard trimmedPromt.isEmpty == false || trimmedAnswer.isEmpty == false else { return }
        
        let newCard = Card(promt: trimmedPromt, answer: trimmedAnswer)
        cards.insert(newCard, at: 0)
        DataManager.save(cards)
        newPromt = ""
        newAnswer = ""
        
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        DataManager.save(cards)
    }
}

#Preview {
    EditCards()
}
