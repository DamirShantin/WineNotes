//
//  GrapeCountryDTO+CoreDataClass.swift
//  WineNotes
//
//  Created by Дамир Шаймуханбетов on 16.06.2026.
//
//

public import Foundation
public import CoreData

public typealias GrapeCountryDTOCoreDataClassSet = NSSet

@objc(GrapeCountryDTO)
public class GrapeCountryDTO: NSManagedObject {

}

public typealias GrapeCountryDTOCoreDataPropertiesSet = NSSet

extension GrapeCountryDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GrapeCountryDTO> {
        return NSFetchRequest<GrapeCountryDTO>(entityName: "GrapeCountryDTO")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String?
    @NSManaged public var regions: NSSet?

}

// MARK: Generated accessors for regions
extension GrapeCountryDTO {

    @objc(addRegionsObject:)
    @NSManaged public func addToRegions(_ value: GrapeRegionDTO)

    @objc(removeRegionsObject:)
    @NSManaged public func removeFromRegions(_ value: GrapeRegionDTO)

    @objc(addRegions:)
    @NSManaged public func addToRegions(_ values: NSSet)

    @objc(removeRegions:)
    @NSManaged public func removeFromRegions(_ values: NSSet)

}

extension GrapeCountryDTO : Identifiable {

}
