//
//  CustomAnimatedTransitioning.swift
//  CustomAnimatedTransitionExample
//
//  Created by KojimaTatsuya on 2017/07/08.
//  Copyright © 2017年 KojimaTatsuya. All rights reserved.
//

import UIKit

class CustomAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    let operation: UINavigationControllerOperation
    
    init(operation: UINavigationControllerOperation) {
        self.operation = operation
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        switch operation {
        case .push:
            guard let sourceView = transitionContext.view(forKey: .from),
                let destinationView = transitionContext.view(forKey: .to) else {
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                    
                    return
            }
            
            let containerView = transitionContext.containerView
            containerView.addSubview(sourceView)
            containerView.insertSubview(destinationView, aboveSubview: sourceView)
            
            sourceView.frame = containerView.bounds
            destinationView.frame = CGRect(
                x: containerView.bounds.width,
                y: containerView.bounds.height / 2.0,
                width: 0.0,
                height: 0.0
            )
            
            UIView.animate(
                withDuration: transitionDuration(using: transitionContext),
                delay: 0.0,
                options: .curveEaseOut,
                animations: {
                    sourceView.frame = CGRect(
                        x: 0.0,
                        y: containerView.bounds.height / 2.0,
                        width: 0.0,
                        height: 0.0
                    )
                    destinationView.frame = containerView.bounds
                },
                completion: { _ in
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                }
            )
        case .pop:
            guard let sourceView = transitionContext.view(forKey: .to),
                let destinationView = transitionContext.view(forKey: .from) else {
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                    
                    return
            }
            
            let containerView = transitionContext.containerView
            containerView.addSubview(destinationView)
            containerView.insertSubview(sourceView, aboveSubview: destinationView)
            
            sourceView.frame = CGRect(
                x: 0.0,
                y: containerView.bounds.height / 2.0,
                width: 0.0,
                height: 0.0
            )
            destinationView.frame = containerView.bounds
            
            UIView.animate(
                withDuration: transitionDuration(using: transitionContext),
                delay: 0.0,
                options: .curveEaseOut,
                animations: {
                    sourceView.frame = containerView.bounds
                    destinationView.frame = CGRect(
                        x: containerView.bounds.width,
                        y: containerView.bounds.height / 2.0,
                        width: 0.0,
                        height: 0.0
                    )
                },
                completion: { _ in
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                }
            )
        default:
            break
        }
    }
    
}
