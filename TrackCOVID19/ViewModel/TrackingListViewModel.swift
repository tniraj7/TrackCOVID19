import Foundation

class TrackingListViewModel: ObservableObject {
    
    @Published var trackings = [TrackingViewModel]()
    
    func getTrackingData() {
        WebService().getCOVIDTrackingResult { trackingList  in
            if let trackingList = trackingList {
                DispatchQueue.main.async {
                    self.trackings = trackingList.map(TrackingViewModel.init)
                }
            }
        }
    }
}
