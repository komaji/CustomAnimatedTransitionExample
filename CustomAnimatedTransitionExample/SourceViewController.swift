//
//  SourceViewController.swift
//  CustomAnimatedTransitionExample
//
//  Created by KojimaTatsuya on 2017/07/08.
//  Copyright © 2017年 KojimaTatsuya. All rights reserved.
//

import UIKit

class SourceViewController: UIViewController {
    
    @IBAction func customPushButtonDidTap(_ button: UIButton) {
        let destinationViewController = UIStoryboard(name: String(describing: DestinationViewController.self), bundle: nil).instantiateInitialViewController()!
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    @IBAction func defaultPushButtonDidTap(_ sender: UIButton) {
        let defaultViewController = UIStoryboard(name: String(describing: DefaultViewController.self), bundle: nil).instantiateInitialViewController()!
        navigationController?.pushViewController(defaultViewController, animated: true)
    }
}
