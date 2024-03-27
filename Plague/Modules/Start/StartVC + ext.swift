import UIKit

extension StartViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            let placeholderString: String!
            switch textField.tag {
            case 1:
                placeholderString = "10"
            case 2:
                placeholderString = "3"
            default:
                placeholderString = "2"
            }
            
            textField.attributedPlaceholder = NSAttributedString(
                string: placeholderString,
                attributes: [
                    NSAttributedString.Key.foregroundColor: brownishColor!,
                    NSAttributedString.Key.font: title3AndAHalfFont
                ]
            )
        }
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength: Int!
        switch textField.tag {
        case 1:
            maxLength = 3
        default:
            maxLength = 1
        }
        
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
}
