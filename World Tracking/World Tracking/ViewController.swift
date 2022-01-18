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
//        node.geometry = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 0.03)
//        node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
//        node.geometry = SCNCone(topRadius: 0.3, bottomRadius: 0.5, height: 0.3) // Cone
//        node.geometry = SCNCone(topRadius: 0.2, bottomRadius: 0.2, height: 0.3) // Cone as cylinder
//        node.geometry = SCNCylinder(radius: 0.2, height: 0.5)
//        node.geometry = SCNSphere(radius: 0.5)
//        node.geometry = SCNTube(innerRadius: 0.1, outerRadius: 0.3, height: 1.0)
//        node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.1)
        node.geometry = SCNPlane(width: 1.5, height: 1.0)
        node.geometry = SCNPyramid(width: 0.5, height: 1.0, length: <#T##CGFloat#>)
        
        
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.position = SCNVector3(0.0, 0.0, -1.5)
        node.rotation = SCNVector4(x: 1.0, y: 0, z: 0, w: Float(Double.pi/2.0))
        
//        let transform = SCNNode()
//        transform.rotation = SCNVector4(x: 1.0, y: 0, z: 0, w: Float(Double.pi/2.0))
//        transform.addChildNode(node)
        
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

