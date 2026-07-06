//
//  WineDTO+CoreDataClass.swift
//  WineNotes
//
//  Created by Дамир Шаймуханбетов on 16.06.2026.
//
//

public import Foundation
public import CoreData

public typealias WineDTOCoreDataClassSet = NSSet

@objc(WineDTO)
public class WineDTO: NSManagedObject {

}

public typealias WineDTOCoreDataPropertiesSet = NSSet

extension WineDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WineDTO> {
        return NSFetchRequest<WineDTO>(entityName: "WineDTO")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String?
    @NSManaged public var country: String?
    @NSManaged public var region: String?
    @NSManaged private var typeRaw: String
    @NSManaged private var statusRaw: String
    @NSManaged public var grapes: NSSet
    @NSManaged public var tastings: NSSet
    
    var status: WineStatus{
        get { WineStatus(rawValue: statusRaw) ?? .collection }
        set { statusRaw = newValue.rawValue }
    }
    
    var type: WineType{
        get { WineType(rawValue: typeRaw) ?? .red }
        set { statusRaw = newValue.rawValue }
    }

}

// MARK: Generated accessors for grapes
extension WineDTO {

    @objc(addGrapesObject:)
    @NSManaged public func addToGrapes(_ value: GrapeDTO)

    @objc(removeGrapesObject:)
    @NSManaged public func removeFromGrapes(_ value: GrapeDTO)

    @objc(addGrapes:)
    @NSManaged public func addToGrapes(_ values: NSSet)

    @objc(removeGrapes:)
    @NSManaged public func removeFromGrapes(_ values: NSSet)

}

// MARK: Generated accessors for tastings
extension WineDTO {

    @objc(addTastingsObject:)
    @NSManaged public func addToTastings(_ value: TastingDTO)

    @objc(removeTastingsObject:)
    @NSManaged public func removeFromTastings(_ value: TastingDTO)

    @objc(addTastings:)
    @NSManaged public func addToTastings(_ values: NSSet)

    @objc(removeTastings:)
    @NSManaged public func removeFromTastings(_ values: NSSet)

}

extension WineDTO : Identifiable {

}

