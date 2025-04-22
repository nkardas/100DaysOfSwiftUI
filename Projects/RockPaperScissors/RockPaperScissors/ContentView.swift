//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Némo Kardassevitch on 08/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["🪨","📄","✂️"]
    @State private var appChoice = Int.random(in: 0...2)
    @State private var playerWin = Bool.random()
    @State private var playerChoice = 0
    @State private var isWinning = true
    @State private var showingResult = false
    @State private var showingFinalResult = false
    @State private var score = 0
    @State private var numberTry = 0
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("App chose")
                    .font(.title2)
                    .foregroundColor(.white)
                Text(moves[appChoice])
                    .font(.system(size: 120))
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(60)
                   
                Spacer()
                Spacer()
                Spacer()
                
                Text("Choose your next move")
                    .font(.title)
                    .foregroundColor(.white)
                Text("in order to")
                    .font(.title)
                    .foregroundColor(.white)
                if playerWin {
                    Text("WIN")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                } else {
                    Text("LOSE")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                
                Spacer()
                VStack(spacing: 20) {
                    Button(action: {
                        playerChoice = 0
                        numberTry += 1
                        move() }) {
                            Text("🪨")
                                .font(.system(size: 100))
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(15)
                        }
                    HStack(spacing: 20) {
                        Button(action: {
                            playerChoice = 1
                            numberTry += 1
                            move() }) {
                                Text("📄")
                                    .font(.system(size: 100))
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(15)
                            }
                        
                        Button(action: {
                            playerChoice = 2
                            numberTry += 1
                            move() }) {
                                Text("✂️")
                                    .font(.system(size: 100))
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(15)
                            }
                    }
                }
            }
            .alert(scoreTitle, isPresented: $showingResult) {
                Button("Continue", action: nextRound)
            } message: {
                Text("Your score is \(score)")
            }
            .padding()
            .alert(scoreTitle, isPresented: $showingFinalResult) {
                Button("Start Again", action: restart)
            } message: {
                Text("Your final score is \(score)")
            }
            .padding()
            
            Spacer()
            Spacer()
        }
    }
    
    func restart() {
        appChoice = Int.random(in: 0...2)
        playerWin = Bool.random()
        numberTry = 0
        score = 0
    }
    
    func nextRound() {
        playerWin.toggle()
        appChoice = Int.random(in: 0...2)
    }
    
    func move() {
        numberTry < 10 ? makeMove() : makeFinalMove()
    }
    
    func makeMove() {
        playerIsWinning(playerMove: playerChoice, appMove: appChoice)
        if playerWin == isWinning && appChoice != playerChoice {
            scoreTitle = "Well play!"
            score += 1
        } else {
            scoreTitle = "Oops..."
        }
        
        showingResult = true
        
    }
    
    func makeFinalMove() {
        playerIsWinning(playerMove: playerChoice, appMove: appChoice)
        if playerWin == isWinning && appChoice != playerChoice {
            scoreTitle = "Well play!"
            score += 1
        } else {
            scoreTitle = "Oops..."
        }
        
        showingFinalResult = true
        
    }
    
    func playerIsWinning(playerMove: Int, appMove: Int) {
        switch (appMove, playerMove) {
        case (0, 1), (1, 2), (2, 0):
            isWinning = true
        default:
            isWinning = false
        }
    }
}

#Preview {
    ContentView()
}
