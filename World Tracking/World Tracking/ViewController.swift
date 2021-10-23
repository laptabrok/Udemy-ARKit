//
//  ViewController.swift
//  World Tracking
//
//  Created by Igor Ivanov on 23.10.2021.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        sceneView.session.run(configuration)
    }

    @IBAction func addObject(_ sender: Any) {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 0)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        node.position = SCNVector3(1.0, 0.0, 0.0)
        
        sceneView.scene.rootNode.addChildNode(node)
    }
}

