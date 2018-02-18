//
//  ViewController.swift
//  Solar System
//
//  Created by Serhii Pianykh on 2017-10-15.
//  Copyright © 2017 Serhii Pianykh. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let earth = SCNNode()
        earth.geometry = SCNSphere(radius: 0.2)
        earth.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "earth")
        earth.geometry?.firstMaterial?.specular.contents = #imageLiteral(resourceName: "earth_specular")
        earth.geometry?.firstMaterial?.emission.contents = #imageLiteral(resourceName: "earth_clouds")
        earth.geometry?.firstMaterial?.normal.contents = #imageLiteral(resourceName: "earth_normal")
        
        earth.position = SCNVector3(0, 0, -1)
        self.sceneView.scene.rootNode.addChildNode(earth)
        
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8)
        
        let forever = SCNAction.repeatForever(action)
        
        earth.runAction(forever)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

