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
        sceneView.autoenablesDefaultLighting = true
        
        sceneView.session.run(configuration)
    }

    @IBAction func addObject(_ sender: Any) {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 0.03)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.position = SCNVector3(0.0, 0.0, -0.3)
        
        sceneView.scene.rootNode.addChildNode(node)
    }
        
    @IBAction func resetSession(_ sender: Any) {
        restart()
    }
    
    func restart() {
        sceneView?.session.pause()
        sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        
        sceneView.session.run(configuration, options: [.removeExistingAnchors, .resetTracking])
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}

