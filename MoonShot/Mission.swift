import Foundation

struct Mission:Codable,Identifiable {
    
    struct CrewMember:Codable {
        let name:String
        let role:String
    }
    
    let id:Int
    let crew:[CrewMember]
    let launchDate:Date?
    let description:String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image:String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate:String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
