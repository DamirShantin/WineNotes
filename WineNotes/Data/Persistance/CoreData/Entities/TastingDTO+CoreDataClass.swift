//
//  TastingDTO+CoreDataClass.swift
//  WineNotes
//
//  Created by Дамир Шаймуханбетов on 16.06.2026.
//
//

public import Foundation
public import CoreData

public typealias TastingDTOCoreDataClassSet = NSSet

@objc(TastingDTO)
public class TastingDTO: NSManagedObject {

}

public typealias TastingDTOCoreDataPropertiesSet = NSSet

extension TastingDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TastingDTO> {
        return NSFetchRequest<TastingDTO>(entityName: "TastingDTO")
    }

    @NSManaged public var id: String
    @NSManaged public var year: Int16
    @NSManaged public var date: String?
    @NSManaged private var statusRaw: String
    @NSManaged public var rating: Double
    @NSManaged public var price: String?
    @NSManaged public var shop: String?
    @NSManaged public var desc: String?
    @NSManaged public var characters: WineCharacteristicsDTO?
    
    var status: WineStatus{
        get { WineStatus(rawValue: statusRaw) ?? .collection }
        set { statusRaw = newValue.rawValue }
    }

}

extension TastingDTO : Identifiable {

}
