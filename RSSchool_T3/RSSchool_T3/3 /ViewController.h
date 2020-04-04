#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property(nonatomic, retain) UITextField *textFieldRed;
@property(nonatomic, retain) UITextField *textFieldGreen;
@property(nonatomic, retain) UITextField *textFieldBlue;
@property(nonatomic, retain) UIView *viewResultColor;
@property(nonatomic, retain) UILabel *labelResultColor;
@end

