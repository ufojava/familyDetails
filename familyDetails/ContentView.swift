//
//  ContentView.swift
//  familyDetails
//
//  Created by Ufuoma Okoro on 17/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //Set Menu Items to false
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false
    
    
    
    var body: some View {
        
        NavigationView {
        
            
                //Set background for menu
            ZStack(alignment: .top) {
            
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                
                 
                VStack {
                    Spacer().frame(height:100)
                    
                    Text("THE FAMILY")
                    .font(.headline)
                    
                    //Family Photo
                    Image("theFamilyArtCol")
                        .resizable()
                        .frame(width: 300, height: 200)
                        .scaledToFit()
                        .border(Color.gray)
                    .shadow(radius: 6)
                    
                    
            
                }//VStack for family potrait
                    
                
                VStack {
                    Spacer().frame(height:438)
                    
               
                    
                        if showMenuItem1 {
                        MenuItem(icon: "tray.and.arrow.down")
                            .foregroundColor(Color.green)
                            
                        }
                        
                      
                        
                   
                    
                    if showMenuItem2 {
                        MenuItem(icon: "book")
                            .foregroundColor(Color.blue)
                    }
                    
                    if showMenuItem3 {
                        MenuItem(icon: "trash")
                            .foregroundColor(Color.black)
                    }
                    
                    
                    
                    Text("Menu")
                    //Main Button
                    Button(action: {
                        
                        //Show menu
                        self.showMenu()
                        
                    }) {
                        
                        
                        //Text("Main Menu")
                         Image(systemName: "plus.square")
                            .resizable()
                            .frame(width:70, height:70)
                            .foregroundColor(Color.red)
                            
                        
                        
                    }//Button Main Menu End
                    
                        
                        
                    
                    
                }
                                
                    
                    .navigationBarTitle(Text("Home 🏚"))
                }
        
            
            
        }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
//Function to show Menu
    func showMenu() {
        
        //Animation
        withAnimation {
            self.showMenuItem2.toggle()
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            withAnimation {
                
                self.showMenuItem1.toggle()
            }
            
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            withAnimation {
                self.showMenuItem3.toggle()
            }
        }
    }
    
//Menu Item
    struct MenuItem: View {
        
        var icon: String
        var body: some View {
            
            ZStack {
                
                Image(systemName: icon)
                    .resizable()
                    .frame(width:50, height:50)

                
                
            }
            
        }
    }
    
    

struct dataEntryForm: View {
    
    @ObservedObject var getMember = Member()
       
       @State private var firstName = ""
       @State private var lastName = ""
       @State private var age = ""
       @State private var gender = ""
       @State private var nationality = ""
       @State private var imageFileName = "" //Ensure this is set to lowercase
       
       
       @State private var imageName = ""
       
     let genderSelectArray = ["Male", "Female","Non Gender"]
       @State private var selectedGender = "Male"
       
       
       func processFamDetail() {
           
           
               
               getMember.firstName = self.firstName
               getMember.lastName = self.lastName
               getMember.age = Int(self.age)!
               getMember.gender = self.gender
               getMember.nationality = self.nationality
           
       
          
       }
       
       func restFeilds() {
           
           self.firstName = ""
           self.lastName = ""
           self.age = ""
           self.gender = ""
           self.nationality = ""
           
       }
       

       func procImage(inName: String) {
           
     
           
           let imageConvertToLowercase = inName.lowercased()

           if getMember.firstName.lowercased() == imageConvertToLowercase {
               
               if (UIImage(named: imageConvertToLowercase) != nil) {
               
               imageName = imageConvertToLowercase
               
           } else {
               
               imageName = "blank"
           }
           
           }
       }
    
    
    
    var body: some View {
        
        
        NavigationView {
            
                
            
            //ZStack to get the background in
                ZStack {
                    
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                
                    VStack {
                    
                       
                        Form {
                    
                            Section { //Section Data Input
                
                                TextField("Enter your firstname",text: $firstName)
                                TextField("Enter your lastname",text: $lastName)
                                TextField("Enter your age",text: $age)
                                TextField("Enter you nationality",text: $nationality)
                
                                //Picker for Gender
                                Picker("Gender", selection: $selectedGender) {
                                
                                
                                    ForEach(genderSelectArray,id: \.self) {option in
                                        Text(option)
                                    
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                        
                        
                
                        }//End of Form
                        
                           
                        
                        
                    }//End to Data Input
                    .font(.system(size: 14))
                    .background(Color.white)
                    .cornerRadius(6)
                          
                    .autocapitalization(.words)
                       
                    .padding(.horizontal, 125)
        
                        
                    
                    
                    Button(action: {
                    
                        self.processFamDetail()
                        self.procImage(inName: self.getMember.firstName)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            
                            self.restFeilds()
                            
                        }
                        
                        
                    }) {
                        
                        
                        Text("Display Details")
                        .padding()
                            .frame(width:   200, height: 30)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                    }
                        Spacer().frame(height:  10)
                        
                        VStack {
                    
                        ZStack {
                            
                            
                            Rectangle()
                                
                                .fill(Color.white)
                              
                                 .cornerRadius(10)
                                .padding(.horizontal,127)
                                .padding(.vertical, 1)
                                
                            
                    
                                List {
                        
                    
                                        Text("Firstname: \(getMember.firstName)")
                                        Text("Lastname: \(getMember.lastName)")
                                        Text("Age: \(getMember.age)")
                                        Text("Gender: \(self.selectedGender)")
                                        Text("Nationality: \(getMember.nationality)")
                                    
                                    
                                    Image(imageName)
                                        .resizable()
                                        .frame(width: 40, height: 60)
                                        .scaledToFill()
                        
                    
                                }.font(.system(size: 14))
                                    .padding(.horizontal, 155)
                                     .padding(.vertical, 20)
            
                    }//End of ZStack
                       
                         
                                
                            
                            
                        } //End of second VStack
                       
                    
                
                        
                        
                        
            
                    
                .navigationBarTitle(Text("Family Member"))
                
                }.padding()
            
                }//End of ZStack
                
            }
        }
        
        
    }
    
}

