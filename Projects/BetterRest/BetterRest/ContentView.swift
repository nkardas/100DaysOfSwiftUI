//
//  ContentView.swift
//  BetterRest
//
//  Created by Némo Kardassevitch on 09/11/2024.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    @State private var sleepTime = Date.now
    
    var body: some View {
        VStack {
            NavigationStack {
                Form {
                    Section("When do you want to wake up?", content: {
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .onChange(of: wakeUp) { _, _ in
                                calculateBedtime()
                            }
                    })
                    
                    Section("Desired sleep amount", content: {
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                            .onChange(of: sleepAmount) { _, _ in
                                calculateBedtime()
                            }
                    })
                    
                    Section {
                          Picker("Number of cups", selection: $coffeeAmount) {
                              ForEach(1...20, id: \.self) {
                                  Text("\($0)")
                              }
                          }
                      } header: {
                          Text("Daily coffee intake")
                              .font(.subheadline)
                      }
                      .onChange(of: coffeeAmount) { _, _ in
                          calculateBedtime()
                      }
                }
                .navigationTitle("BetterRest")
                /*.toolbar {
                    Button("Calculate", action: calculateBedtime)
                }
                .alert(alertTitle, isPresented: $showingAlert) {
                    Button("OK") { }
                } message: {
                    Text(alertMessage)
                }*/
            }
            
            VStack {
                Text("Your ideal bedtime is…")
                    .font(.largeTitle)
                Text("\(sleepTime.formatted(date: .omitted, time: .shortened))")
                    .font(.largeTitle)
            }
            .padding()
            .onAppear(perform: calculateBedtime)
        }
    }
    
    func calculateBedtime() {
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was an problem calculating your bedtime"
        }
        
        //showingAlert = true
    }
}

#Preview {
    ContentView()
}
