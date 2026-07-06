//
//  GrapeDTO+CoreDataClass.swift
//  WineNotes
//
//  Created by Дамир Шаймуханбетов on 16.06.2026.
//
//

public import Foundation
public import CoreData

public typealias GrapeDTOCoreDataClassSet = NSSet

@objc(GrapeDTO)
public class GrapeDTO: NSManagedObject {

}

public typealias GrapeDTOCoreDataPropertiesSet = NSSet

extension GrapeDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GrapeDTO> {
        return NSFetchRequest<GrapeDTO>(entityName: "GrapeDTO")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String?
    @NSManaged public var latin: String?
    @NSManaged private var colorRaw: String
    @NSManaged public var origin: String?
    @NSManaged public var aliases: NSObject?
    @NSManaged public var aromas: String?
    @NSManaged public var desc: String?
    @NSManaged public var countries: GrapeCountryDTO?
    
    var color: GrapeColor {
        get {GrapeColor(rawValue: colorRaw) ?? .red}
        set { colorRaw = newValue.rawValue }
    }

}

extension GrapeDTO : Identifiable {

}
