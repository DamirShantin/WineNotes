//
//  WineCharacteristicsDTO+CoreDataClass.swift
//  WineNotes
//
//  Created by Дамир Шаймуханбетов on 16.06.2026.
//
//

public import Foundation
public import CoreData

public typealias WineCharacteristicsDTOCoreDataClassSet = NSSet

@objc(WineCharacteristicsDTO)
public class WineCharacteristicsDTO: NSManagedObject {

}

public typealias WineCharacteristicsDTOCoreDataPropertiesSet = NSSet

extension WineCharacteristicsDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WineCharacteristicsDTO> {
        return NSFetchRequest<WineCharacteristicsDTO>(entityName: "WineCharacteristicsDTO")
    }

    @NSManaged public var acidity: Int16
    @NSManaged public var dryness: Int16
    @NSManaged public var richness: Int16
    @NSManaged public var density: Int16

}

extension WineCharacteristicsDTO : Identifiable {

}
