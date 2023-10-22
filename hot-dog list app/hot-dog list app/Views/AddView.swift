//
//  AddView.swift
//  hot-dog list app
//
//  Created by GMAN's macbook on 2023/5/20.
//

import SwiftUI
import UserNotifications

let notificationCenter = UNUserNotificationCenter.current()

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var labelText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State var datePicker = Date() // Declare datePicker property
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add your item here!", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Spacer()
                
                HStack {
                    DatePicker(selection: $datePicker, label: { Text("Notify me at...") }) // Pass the datePicker value to DatePicker
                }
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .heavy))
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                })
            }
            .padding(15)
        }
        .navigationTitle("Add an Item✏️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText, labels: "null")
            
            // Update reminder
            updateReminder()
            
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func updateReminder() {
        // Create notification content
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "Don't forget to check your hot-dog list!"
        
        // Set the reminder time
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: datePicker)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        // Create notification request
        let request = UNNotificationRequest(identifier: "hotDogListReminder", content: content, trigger: trigger)
        
        // Update the reminder
        notificationCenter.add(request) { error in
            if let error = error {
                print("Error updating reminder: \(error)")
            } else {
                print("Reminder updated successfully!")
            }
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Please enter at least 3 characters!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
        }
    }
}
