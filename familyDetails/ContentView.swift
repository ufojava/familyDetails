//
//  ContentView.swift
//  familyDetails
//
//  Created by Ufuoma Okoro on 17/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var getMember = Member()
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var age = ""
    @State private var gender = ""
    @State private var nationality = ""
    @State private var picFileName = "" //Ensure this is set to lowercase
    
    @State private var famMembers = ["Ufuoma","Bethany","Victoria"]
    
    @State private var imageName = ""
    
    
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
        
        if inName == "Ufuoma" {
            
            imageName = "ufuoma"
                
        } else if inName == "Bethany" {
           imageName = "bethany"
            
            
        } else if inName == "Victoria" {
            
            imageName = "victoria"
            
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
                
                
                
                    Section { //Section Data Input
            
                        TextField("Enter your firstname",text: $firstName)
                        TextField("Enter your lastname",text: $lastName)
                        TextField("Enter your age",text: $age)
                        TextField("Enter your gender",text: $gender)
                        TextField("Enter you nationality",text: $nationality)
                        
                        
                    
                    
                    }//End to Data Input
                .font(.system(size: 14))
                .background(Color.white)
                .cornerRadius(6)
                      
                .autocapitalization(.words)
                   
                .padding(.horizontal, 120)
    
                    Spacer().frame(height:  40)
                
                Button(action: {
                
                    self.processFamDetail()
                    self.procImage(inName: self.getMember.firstName)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        
                        self.restFeilds()
                        
                    }
                    
                    
                }) {
                    
                    
                    Text("Click Here to update")
                    .padding()
                        .frame(width:   200, height: 30)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
                    Spacer().frame(height:  10)
                    
                    VStack {
                
                    ZStack {
                        
                        
                        Rectangle()
                            
                            .fill(Color.white)
                          
                             .cornerRadius(10)
                            .padding(.horizontal,130)
                            .padding(.vertical, 70)
                            
                          
                
                            List {
                    
                
                                    Text("Firstname: \(getMember.firstName)")
                                    Text("Lastname: \(getMember.lastName)")
                                    Text("Age: \(getMember.age)")
                                    Text("Gender: \(getMember.gender)")
                                    Text("Nationality: \(getMember.nationality)")
                                Image(imageName)
                                    .resizable()
                                    .frame(width: 50, height: 70)
                                    .scaledToFill()
                    
                
                            }.font(.system(size: 14))
                                .padding(.horizontal, 155)
                                 .padding(.vertical, 90)
        
                }//End of ZStack
                   
                     
                            
                        
                        
                    } //End of second VStack
                   
                
            
                    
                    
                    
        
                
            .navigationBarTitle(Text("Family Member"))
            
            }.padding()
        
            }//End of ZStack
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


