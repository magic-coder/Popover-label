import UIKit
import Spatial

class AnimationTest:UIView{
   lazy var button:Button = createButton()
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .green
      _ = button
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
extension AnimationTest{
   /**
    * Button
    */
   func createButton() -> Button{
      let btn:Button = Button(type: .system)
      btn.backgroundColor = .gray
      btn.setTitle("Button", for: .normal)
      btn.setTitleColor(.black, for: .normal)
      btn.titleLabel?.textAlignment = .center
      btn.titleLabel?.font =  .systemFont(ofSize: 12)
      //      btn.frame = CGRect(x:100, y:50, width:100, height:50)
      btn.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
      self.addSubview(btn)
      btn.applyConstraint { view in
         let a = Constraint.anchor(view, to: self, align: .centerCenter, alignTo: .centerCenter)
         let s = Constraint.size(view, size: .init(width:100,height:48))
         return (a,s)
      }
      return btn
   }
   @objc func buttonTouched(sender:UIButton) {
      Swift.print("It Works!!!")
//      let to:CGFloat = 0//(UIScreen.main.bounds.height/2) + (button.frame.height/2)
      button.animate(to: .zero, align: .topLeft, alignTo: .topLeft, onComplete: {})
   }
}
class Button:UIButton,ConstraintKind{
   var anchor: AnchorConstraint?
   var size: SizeConstraint?
}
