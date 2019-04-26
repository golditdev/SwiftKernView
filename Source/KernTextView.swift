
import UIKit

class KernTextView: UITextView {

    @IBInspectable open var characterSpacing:CGFloat = 1 {
        didSet {
            configureLabel()
        }
    }
    
    func setLabelFont(_ font: UIFont) {
        self.font = font
        configureLabel()
    }
    
    private func configureLabel() {
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.font, value: self.font!, range: NSRange(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.textColor ?? UIColor.black, range: NSRange(location: 0, length: attributedString.length))
        
        self.attributedText = attributedString
    }
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0) {
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: self.text!)
        }
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpacing
        
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: attributedString.length))
        
        self.attributedText = attributedString
    }
}
