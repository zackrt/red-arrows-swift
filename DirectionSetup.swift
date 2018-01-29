import SceneKit
import ARKit
import CoreLocation
import MapKit

class ViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate, LocationServiceDelegate {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    var steps: [MKRouteStep] = []
    var destinationLocation: CLLocationCoordinate2D!
    var locationService = LocationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationService.delegate = self
        var navService = NavigationService()
        
        self.destinationLocation = CLLocationCoordinate2D(latitude: 40.737512, longitude: -73.980767)
        var request = MKDirectionsRequest()
        
        if destinationLocation != nil {
            navService.getDirections(destinationLocation: destinationLocation, request: request) { steps in
                for step in steps {
                    self.steps.append(step)
                }
            }
        }
    }
}
