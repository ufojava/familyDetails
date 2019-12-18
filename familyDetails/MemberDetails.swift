//
//  MemberDetails.swift
//  familyDetails
//
//  Created by Ufuoma Okoro on 17/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

//Class to hold member details
import Foundation

class Member:   ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var age = 0
    @Published var gender = ""
    @Published var nationality = ""
    
}
