//
//  GrapeRegionDTO+CoreDataClass.swift
//  WineNotes
//
//  Created by Дамир Шаймуханбетов on 16.06.2026.
//
//

public import Foundation
public import CoreData

public typealias GrapeRegionDTOCoreDataClassSet = NSSet

@objc(GrapeRegionDTO)
public class GrapeRegionDTO: NSManagedObject {

}

public typealias GrapeRegionDTOCoreDataPropertiesSet = NSSet

extension GrapeRegionDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GrapeRegionDTO> {
        return NSFetchRequest<GrapeRegionDTO>(entityName: "GrapeRegionDTO")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var note: String?
    @NSManaged public var knownAs: String?

}

extension GrapeRegionDTO : Identifiable {
    func convert() -> GrapeRegion{
        return GrapeRegion(id: id, name: name, note: note, knownAs: knownAs)
    }

}
