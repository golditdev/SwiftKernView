
import UIKit

open class KernButton: UIButton {
    @IBInspectable open var characterSpacing:CGFloat = 1 {
        didSet {
            configureButton()
        }
    }
    
    func setButtonTitleColor(_ titleColor: UIColor) {
        self.setTitleColor(titleColor, for: .normal)
        
        configureButton()
    }
    
    private func configureButton() {
        let attributedString = NSMutableAttributedString(string: self.titleLabel?.text ?? "")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.font, value: (self.titleLabel?.font)!, range: NSRange(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: (self.titleLabel?.textColor)!, range: NSRange(location: 0, length: attributedString.length))
        
        self.titleLabel?.attributedText = attributedString
    }
}
