//
//  CircularProgress.swift
//  Lazyless
//
//  Created by Luiz Sena on 12/09/22.
//

import UIKit

class CircularProgressView: UIView {

    fileprivate var progressLayer = CAShapeLayer()
    fileprivate var trackLayer = CAShapeLayer()
    fileprivate var didConfigureLabel = false
    fileprivate var rounded: Bool
    fileprivate var filled: Bool
    fileprivate let lineWidth: CGFloat?

    var delegate: NextLevelDelegate?

    var timeToFill = 5.3

    var progressColor = UIColor.white {
        didSet{
            DispatchQueue.main.async { [weak self] in
                if let self {
                    self.progressLayer.strokeColor = self.progressColor.cgColor
                }
            }

        }
    }

    var trackColor = UIColor.white {
        didSet{
            DispatchQueue.main.async { [weak self] in
                if let self {
                    self.trackLayer.strokeColor = self.trackColor.cgColor
                }
            }

        }
    }

    var progress: CGFloat {
        didSet {
            var pathMoved = progress - oldValue
            if pathMoved < 0 {
                pathMoved = 0 - pathMoved
            }
            DispatchQueue.main.async { [weak self] in
                if let self {
                    self.setProgress(duration: self.timeToFill * Double(pathMoved), from: oldValue, to: self.progress)
                }
            }


        }
    }

    init(frame: CGRect, lineWidth: CGFloat?, rounded: Bool) {


        progress = 0

        if lineWidth == nil {
            self.filled = true
            self.rounded = false
        }else{
            if rounded{
                self.rounded = true
            }else{
                self.rounded = false
            }
            self.filled = false
        }
        self.lineWidth = lineWidth

        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("YEY")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        createProgressView()
    }

    fileprivate func createProgressView(){

        self.backgroundColor = .clear
//        self.layer.borderColor = UIColor.green.cgColor
//        self.layer.borderWidth = 1

//        let circularPath = UIBezierPath(
//            arcCenter: center,
//            radius: frame.width / 2,
//            startAngle: CGFloat(0.75*CGFloat.pi),
//            endAngle: CGFloat(CGFloat.pi/4),
//            clockwise: true
//        )

        let circularPath = UIBezierPath(
            ovalIn: .init(
                origin: .zero,
                size: .init(
                    width: self.bounds.width,
                    height: self.bounds.height
                )
            )
        )

        // MARK: - Track Layer
        trackLayer.path = circularPath.cgPath
        // sempre que estamos criando layers, precisamos setar esses dois valores
        trackLayer.bounds = circularPath.bounds
        trackLayer.position = CGPoint(
            x: self.bounds.width / 2,
            y: self.bounds.height * 1.05 / 2
        )
        trackLayer.fillColor = .none
        trackLayer.strokeColor = trackColor.cgColor
        if filled {
            trackLayer.lineCap = .butt
            trackLayer.lineWidth = frame.width
        }else{
            trackLayer.lineWidth = lineWidth!
            trackLayer.lineCap = .round
        }
        trackLayer.strokeEnd = 1
        layer.addSublayer(trackLayer)

        // MARK: - Progress Layer
        progressLayer.path = circularPath.cgPath
        
        // sempre que estamos criando layers, precisamos setar esses dois valores
        progressLayer.bounds = circularPath.bounds
        progressLayer.position = CGPoint(
            x: self.bounds.width / 2,
            y: self.bounds.height * 1.05 / 2
        )

        progressLayer.fillColor = .none
        progressLayer.strokeColor = progressColor.cgColor
        if filled {
            progressLayer.lineCap = .butt
            progressLayer.lineWidth = frame.width
        }else{
            progressLayer.lineWidth = lineWidth!
        }
        progressLayer.strokeEnd = 0
        if rounded{
            progressLayer.lineCap = .round
        }
        
        progressLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(rotationAngle: -.pi/2))
        trackLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(rotationAngle: -.pi/2))
        
        layer.addSublayer(progressLayer)
    }

    func setProgress(duration: TimeInterval = 3, from oldProgress: CGFloat, to newProgress: CGFloat) -> Void {

        progressLayer.strokeEnd = newProgress

        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = oldProgress
        animation.toValue = newProgress
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false

        progressLayer.add(animation, forKey: "animationProgress")

        if self.progress >= 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration + 1) { [weak self] in
                // delegate?.nextLevel()
                self?.progress = 0
                let shakeFeedback: UINotificationFeedbackGenerator = UINotificationFeedbackGenerator()
                shakeFeedback.notificationOccurred(.success)

                // Fazer delegate pra atualizar heartLevel la na maincontroller (preguicaModel.heartLevel)
                self!.delegate?.nextLevel(levelUp: 1)
            }
        }
    }
}
