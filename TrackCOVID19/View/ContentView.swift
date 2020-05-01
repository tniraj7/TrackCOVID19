import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var trackingListVM = TrackingListViewModel()
    
    init() {
        self.trackingListVM.getTrackingData()
    }
    var body: some View {
        
        NavigationView {
            
            VStack {
                Text("Information of COVID-19 spread statewise in USA ")
                Spacer()
                List(self.trackingListVM.trackings, id: \.id) { tracking in
                    
                    HStack{
                        Text(tracking.state)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.orange)
                            .clipShape(Circle())
                            .font(.custom("", size: 22))
                    }
                    Spacer()
                    VStack(alignment: .center) {
                        
                        Text("\(tracking.total)")
                            .foregroundColor(Color.gray)
                            .font(.custom("", size: 45))
                        
                        HStack(alignment: .center, spacing: 10) {
                            HStack {
                                Text("☠️")
                                Text("\(tracking.death)")
                            }.padding(5)
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .cornerRadius(10)
                            
                            HStack {
                                Text("🏥")
                                Text("\(tracking.hospitalized)")
                            }.padding(5)
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                     
                    Spacer()
                }
                .navigationBarTitle("COVID-19 Tracking")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
