//
//  Family.swift
//  familyDetails
//
//  Created by Ufuoma Okoro on 23/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import CoreData

//Create class for NSManagedObject
class Family:   NSManagedObject {
    
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var imageName: String
    @NSManaged var age: String
    @NSManaged var gender: String
    @NSManaged var nationality: String
    
}
