import UIKit

class InputField: UITextField {
    
    convenience init(tag: Int, _ placeholder: String) {
        self.init()
        configure(tag, placeholder)
    }
    
    func configure(_ fieldTag: Int, _ placeHolder: String) {
        backgroundColor = .clear
        textColor = brownishColor
        font = title3AndAHalfFont
        textAlignment = .right
        attributedPlaceholder = NSAttributedString(
            string: placeHolder,
            attributes: [
                NSAttributedString.Key.foregroundColor: brownishColor!,
                NSAttributedString.Key.font: title3AndAHalfFont
            ]
        )
        keyboardType = .numberPad
        tag = fieldTag
        layer.cornerRadius = 8
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 2, dy: 0)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 2, dy: 0)
    }
}
