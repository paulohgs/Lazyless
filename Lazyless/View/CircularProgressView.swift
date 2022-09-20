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



    var timeToFill = 5.3



    var progressColor = UIColor.white {
        didSet{
            progressLayer.strokeColor = progressColor.cgColor
        }
    }

    var trackColor = UIColor.white {
        didSet{
            trackLayer.strokeColor = trackColor.cgColor
        }
    }


    var progress: Float {
        didSet{
            var pathMoved = progress - oldValue
            if pathMoved < 0{
                pathMoved = 0 - pathMoved
            }

            setProgress(duration: timeToFill * Double(pathMoved), to: progress)
        }
    }

    fileprivate func createProgressView(){
//    startAngle: CGFloat(0.75*CGFloat.pi),
//    endAngle: CGFloat(CGFloat.pi/4),
        self.backgroundColor = .clear
        self.layer.cornerRadius = frame.size.width / 2
        let circularPath = UIBezierPath(
            arcCenter: center,
            radius: frame.width / 2,
            startAngle: CGFloat(0),
            endAngle: CGFloat(2*CGFloat.pi),
            clockwise: true
        )
        trackLayer.fillColor = UIColor.blue.cgColor


        trackLayer.path = circularPath.cgPath
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

        progressLayer.path = circularPath.cgPath
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
        layer.addSublayer(progressLayer)

    }





    func trackColorToProgressColor() -> Void{
        trackColor = progressColor
        trackColor = UIColor(
            red: progressColor.cgColor.components![0],
            green: progressColor.cgColor.components![1],
            blue: progressColor.cgColor.components![2],
            alpha: 0.2
        )
    }



    func setProgress(duration: TimeInterval = 3, to newProgress: Float) -> Void{
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration

        animation.fromValue = progressLayer.strokeEnd
        animation.toValue = newProgress

        progressLayer.strokeEnd = CGFloat(newProgress)

        progressLayer.add(animation, forKey: "animationProgress")

    }



    override init(frame: CGRect){
        progress = 0
        rounded = true
        filled = false
        lineWidth = 15
        super.init(frame: frame)
        filled = false
        createProgressView()
    }

    required init?(coder: NSCoder) {
        progress = 0
        rounded = true
        filled = false
        lineWidth = 15
        super.init(coder: coder)
        createProgressView()

    }


    init(frame: CGRect, lineWidth: CGFloat?, rounded: Bool) {


        progress = 0

        if lineWidth == nil{
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
        createProgressView()

    }

}
