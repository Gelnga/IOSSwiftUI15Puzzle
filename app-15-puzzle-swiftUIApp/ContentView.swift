//
//  ContentView.swift
//  app-15-puzzle-swiftUIApp
//
//  Created by Gleb Engalychev on 13.01.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let brain: GameBrain
    
    @State var gameBoard: [[String]]
    @State var moves: Int
    @Binding var isWin: Bool
//    @State var time = 0
//    var timer: NestedTimer!
    
    init(brain: GameBrain, isWin: Binding<Bool>) {
        self.brain = brain
        _gameBoard = State(initialValue: brain.getGameBoard())
        _moves = State(initialValue: brain.getMoves())
        _isWin = isWin
//        timer = NestedTimer(time: $time, brain: brain)
    }

    var body: some View {
                VStack {
                    NavigationLink(destination: Leaderboard()) {
                        UIButtonNormal(buttonText: "Leaderboard", action: {})
                    }
                    .navigationBarHidden(true)
                    VStack {
                        HStack(alignment: .center, spacing: 0){
                            VStack(alignment: .trailing) {
                                Text("Time: ")
                                Text("Moves: ")
                            }
                            VStack(alignment: .leading) {
                                Text("String(time)")
                                Text(String(moves))
                            }
                        }
                        Button(action: {UndoMove()}) {
                            Text("Undo")
                        }
                        .padding(5)
                        .background(Color(red: 74 / 255, green: 107 / 255, blue: 227 / 255))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                    VStack {
                        Spacer()
                        UIButtonNormal(buttonText: "New game", action: {StartNewGame()})
//                        UIButtonNormal(buttonText: "Save game")
//                        UIButtonNormal(buttonText: "Load game")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                VStack {
                    HStack {
                        GameButton(0, 0, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                        GameButton(0, 1, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                        GameButton(0, 2, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                        GameButton(0, 3, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    HStack {
                        GameButton(1, 0, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                        GameButton(1, 1, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                        GameButton(1, 2, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                        GameButton(1, 3, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    HStack {
                        GameButton(2, 0, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                        GameButton(2, 1, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                        GameButton(2, 2, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                        GameButton(2, 3, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    HStack {
                        GameButton(3, 0, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                        GameButton(3, 1, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                        GameButton(3, 2, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                        GameButton(3, 3, brain, gameBoard: $gameBoard, action: {UpdateUI()})
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .aspectRatio(1, contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(10)
            }
    
    private func StartNewGame() {
        brain.startNewGame()
        UpdateUI()
    }
    
    private func UndoMove() {
        brain.undoMove()
        UpdateUI()
    }
    
    private func GetMove() -> Int {
        return brain.getMoves()
    }
    
    private func UpdateUI() {
        gameBoard = brain.getGameBoard()
        moves = brain.getMoves()
        isWin = brain.isWin()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(brain: GameBrain()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}

