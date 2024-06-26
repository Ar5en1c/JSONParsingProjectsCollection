//
//  DetailedNewsVC.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/19/24.
//

import UIKit
import WebKit
import MapKit
import CoreLocation

class DetailedNewsVC: UIViewController {
    
    var newsData: Article?
    var webView: WKWebView!
    var mapView = MKMapView()
    var locationManager: CLLocationManager?
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var newsTimeLabel: UILabel!
    @IBOutlet weak var newsSourceLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    
    @IBOutlet weak var newsWebSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupSegmentControl()
        loadNews()
        setupMapView()
        setupLocationManager()
    }
// MARK: setting up segment controls
    func setupSegmentControl() {
        newsWebSegmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        }
        
    
    //    MARK: handling segment clicks and updating views based on the segment
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
            // Hide map and web view
            mapView.isHidden = true
            webView.isHidden = true
            case 1:
            // Show web view
            if let urlString = newsData?.url, let url = URL(string: urlString) {
                webView.load(URLRequest(url: url))
            }
            mapView.isHidden = true
            webView.isHidden = false
            case 2:
            // Show map view
            print("Map Segment Selected")
            webView.isHidden = true
            mapView.isHidden = false
            default:
                break
            }
        }
}

extension DetailedNewsVC: CLLocationManagerDelegate {
    
    // MARK: checking and asking for authorization if needed
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
            case .notDetermined:
                print("Location authorization not determined")
                locationManager?.requestWhenInUseAuthorization()
            case .restricted, .denied:
                print("Location services restricted or denied")
            case .authorizedWhenInUse, .authorizedAlways:
                locationManager?.startUpdatingLocation()
                mapView.showsUserLocation = true
            @unknown default:
                fatalError("Unknown CLAuthorizationStatus")
            }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
                
        // Update the map's region to center on the user's location
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 400, longitudinalMeters: 400)
        mapView.setRegion(region, animated: true)

        // Add a new pin for the updated location
        let userPin = MKPointAnnotation()
        userPin.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        userPin.title = "Current Location"
        mapView.addAnnotation(userPin)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }
}

extension DetailedNewsVC {
//    MARK: Setting up the Map view
    func setupMapView() {
        mapView = MKMapView(frame: .zero)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: newsWebSegmentControl.bottomAnchor, constant: 8),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        mapView.isHidden = true
    }
//    MARK: Setting up the Web view
    func setupWebView() {
        webView = WKWebView(frame: .zero)
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: newsWebSegmentControl.bottomAnchor, constant: 8),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        webView.isHidden = true
    }
//    MARK: Setting up the Location Manager view
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        }
}


extension DetailedNewsVC {
//    MARK: Loading and assigning the news article data to the view
    func loadNews() {
        guard let newsArticle = newsData else { return }
        newsTitleLabel.text = newsArticle.title
        newsAuthorLabel.text = newsArticle.author
        if let imageURL = newsArticle.urlToImage {
            Task {
                do {
                    try await newsImageView.getImageFromServer(imageURL: imageURL) }
                catch {
                    print(ErrorMessages.errorImgFetchMessage.rawValue)
                }
            }
        }
        newsSourceLabel.text = newsArticle.source.name
        newsDescriptionLabel.text = newsArticle.description
        if let formattedDate = newsArticle.publishedAt.formattedDate() {
            newsTimeLabel.text = formattedDate
        }
    }
}
