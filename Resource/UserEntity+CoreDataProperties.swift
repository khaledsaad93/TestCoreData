//
//  UserEntity+CoreDataProperties.swift
//  TestPod
//
//  Created by Khaled Mahmoud Saad on 08/11/2021.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: String?

}

extension UserEntity : Identifiable {

}
