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
                        .foregroundColor(.blue)
                    
                    //Draw line
                   Rectangle()
                       .frame(width:400,height: 2)
                    
                    //Family Photo
                    Image("theFamilyArtCol")
                        .resizable()
                        .frame(width: 300, height: 200)
                        .scaledToFit()
                        .border(Color.gray, width: 3)
                    .shadow(radius: 6)
                    
                    //Draw line
                    Rectangle()
                        .frame(width:400,height: 2)
                    
                    
            
                }//VStack for family potrait
                    
                
                VStack {
                    Spacer().frame(height:438)
                    
               
                    
                        if showMenuItem1 {
                            
                            Button(action: {}) {
                                
                                NavigationLink(destination: dataEntryForm()) {
                                
                                MenuItem(icon: "tray.and.arrow.down")
                                .foregroundColor(Color.green)
                                    
                                }
                            }//Button End
                            
                            
                            
                            
                        }//ShowItem1 End
                        
                   
                    
                        if showMenuItem2 {
                            
                            Button(action: {}) {
                                
                                NavigationLink(destination: listFamilyDetails()) {
                                
                                MenuItem(icon: "book")
                                .foregroundColor(Color.blue)
                                
                                }
                        }
                    
                    }//ShowItem2 End
                    
                    
                        if showMenuItem3 {
                            
                            //Button
                            Button(action: {}) {
                                
                                NavigationLink(destination: deleteFamilyDetails()) {
                                
                                MenuItem(icon: "trash")
                                .foregroundColor(Color.black)
                                
                                }
                            }
                            
                        }//ShowItem3 End
                    
                    
                    
                    Text("Menu")
                        .foregroundColor(.blue)
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
            self.showMenuItem3.toggle()
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            withAnimation {
                
                self.showMenuItem2.toggle()
            }
            
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            withAnimation {
                self.showMenuItem1.toggle()
            }
        }
    }//End showMenu
    
    
    
//Menu Items
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
    
    
//Data Input struct
struct dataEntryForm: View {
    
//Property to interact with CoreData
    @Environment(\.managedObjectContext) var managedObejectContext
    @FetchRequest(entity: Family.entity(), sortDescriptors: []) var family: FetchedResults<Family>
    
    
    @ObservedObject var getMember = Member()
       
       @State private var firstName = ""
       @State private var lastName = ""
       @State private var age = ""
       @State private var gender = ""
       @State private var nationality = ""
       @State private var imageFileName = "" //Ensure this is set to lowercase
       
       
       @State private var imageName = ""
       
     let genderSelectArray = ["Male", "Female","Neutral"]
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
                        
                        
                           
                        
                        
                    }//End to Data Input
                    .font(.system(size: 14))
                    .background(Color.white)
                    .cornerRadius(6)
                          
                    .autocapitalization(.words)
                       
                    .padding(.horizontal, 125)
        
                        
                    
                    
                    Button("Save") {
                    
                        self.processFamDetail()
                        self.procImage(inName: self.getMember.firstName)
                        
                        //Save details into Family Entity in CoreData
                        let member = Family(context: self.managedObejectContext)
                            member.firstName = self.getMember.firstName
                            member.lastName = self.getMember.lastName
                            member.age = String(self.getMember.age)
                            member.gender = self.selectedGender
                            member.nationality = self.getMember.nationality
                            member.imageName = self.imageName
                        
                        //Save record to CoreData
                        try? self.managedObejectContext.save()
                        
                        
                        //Reset for
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            
                            self.restFeilds()
                            
                        }
                        
                        
                    }
                        
                    
                        .padding()
                            .frame(width:   200, height: 30)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                    //}
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


//Struct to List Family Details
struct listFamilyDetails: View {
    
    //For interaction with CoreData
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Family.entity(), sortDescriptors: []) var family: FetchedResults<Family>
    
    
    
    var body: some View {
        
        NavigationView {
        
            //List CoreData Family Entity
            List {
            
                ForEach(family, id: \.self) { member in
                
                    VStack(alignment: .leading) {
                        
                        HStack {//Names
                            
                            Text("Firstname: \(member.firstName) - Lastname: \(member.lastName)")
                        }
                        
                        HStack {//Other Details
                            
                            Text("Age: \(member.age), Gender: \(member.gender), Nationality: \(member.nationality)")
                        }
                        
                        
                    }
                
                }//End of ForEach
            
                
            }//End of List
                .navigationBarTitle(Text("Report Details"),displayMode: .inline)
        }//Navigation View End
    }
}


//Struct to edit and Delete
struct deleteFamilyDetails: View {
    
    //Set environment for access tdo CoreData
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Family.entity(), sortDescriptors: []) var family: FetchedResults<Family>
    
    
    
    
    var body: some View {
        
        NavigationView {
            
            List {
        
                    //Loop through CoreData
                    ForEach(family, id: \.self) { member in
                        
                        VStack(alignment: .leading) {
                            
                            HStack {//Names
                                Text("Firstname: \(member.firstName) - Lastname: \(member.lastName)")
                            
                            }
        
                            
                            HStack {
                                
                                Text("Age: \(member.age), Gender: \(member.gender), Nationality: \(member.nationality)")
                                
                            }
                            
                        }//End to Vstack
                        
                        
                        
                    }//End to ForEach
              
                //Delete member in List
                .onDelete(perform: deleteMember(indexSet:))
                
            }//End to List
                
                //Insert Edit Option
                .navigationBarItems(trailing: EditButton())
                
                //Insert Title
                .navigationBarTitle(Text("Details"),displayMode: .inline)
            
        }//End to NavigationView
        
    }
    
    //Function to delete record
    
    func deleteMember(indexSet: IndexSet) {
        
        let source = indexSet.first!
        let familyMember = family[source]
            managedObjectContext.delete(familyMember)
        
        //Update CoreData
        try? managedObjectContext.save()
    }
}

