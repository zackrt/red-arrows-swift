//
//  ViewController.swift
//  red-arrow-swift
//
//  Created by zachary toth on 1/28/18.
//  Copyright © 2018 zachary toth. All rights reserved.
//
import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.scene = SCNScene()
        let circleNode = createSphereNode(with: 0.2, color: .red)
        circleNode.position = SCNVector3(0, 0, -1) // 1 meter in front of camera
        sceneView.scene.rootNode.addChildNode(circleNode)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    func createSphereNode(with radius: CGFloat, color: UIColor) -> SCNNode {
        let geometry = SCNSphere(radius: radius)
        geometry.firstMaterial?.diffuse.contents = color
        let sphereNode = SCNNode(geometry: geometry)
        return sphereNode
    }
}
// to add a triangle into UIView
/*
 class TriangleView : UIView {

 override init(frame: CGRect) {
 super.init(frame: frame)
 }

 required init?(coder aDecoder: NSCoder) {
 super.init(coder: aDecoder)
 }

 override func draw(_ rect: CGRect) {

 guard let context = UIGraphicsGetCurrentContext() else { return }

 context.beginPath()
 context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
 context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
 context.addLine(to: CGPoint(x: (rect.maxX / 2.0), y: rect.minY))
 context.closePath()

 context.setFillColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.60)
 context.fillPath()
 }
 }
 */
