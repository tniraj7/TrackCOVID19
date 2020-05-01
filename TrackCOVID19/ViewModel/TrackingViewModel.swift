import Foundation

struct TrackingViewModel {
    
    var tracking: Tracking
    
    init(tracking: Tracking) {
        self.tracking = tracking
    }
    
    var id: UUID = UUID()
    
    var state: String {
        return self.tracking.state
    }
    
    var total: Int {
        return self.tracking.total
    }
    
    var positive: Int {
        return self.tracking.positive
    }
    
    var death: Int {
        return self.tracking.death
    }
    
    var hospitalized: Int {
        return self.tracking.hospitalized ?? 0
    }
}

