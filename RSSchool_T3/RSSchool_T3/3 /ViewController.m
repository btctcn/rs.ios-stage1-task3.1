#import "ViewController.h"

@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *mainView = [UIView new];
    self.textFieldRed = [UITextField new];
    self.textFieldGreen = [UITextField new];
    self.textFieldBlue = [UITextField new];
    
    self.textFieldRed.delegate = self;
    self.textFieldGreen.delegate = self;
    self.textFieldBlue.delegate = self;
    
    UIButton *buttonProcess = [UIButton new];
    UILabel *labelRed = [UILabel new];
    UILabel *labelGreen = [UILabel new];
    UILabel *labelBlue = [UILabel new];
    self.labelResultColor = [UILabel new];
    self.viewResultColor = [UIView new];
    
    mainView.accessibilityIdentifier = @"mainView";
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    buttonProcess.accessibilityIdentifier = @"buttonProcess";
    labelRed.accessibilityIdentifier = @"labelRed";
    labelGreen.accessibilityIdentifier = @"labelGreen";
    labelBlue.accessibilityIdentifier = @"labelBlue";
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    
    self.labelResultColor.text = @"Color";
    CGColorRef color = [UIColor colorWithRed:0.8 green:0.8 blue:0.8  alpha:0.5].CGColor;
    self.textFieldRed.layer.borderColor = color;
    self.textFieldGreen.layer.borderColor = color;
    self.textFieldBlue.layer.borderColor = color;
    
    self.textFieldRed.layer.borderWidth = 1;
    self.textFieldGreen.layer.borderWidth = 1;
    self.textFieldBlue.layer.borderWidth = 1;
    
    self.textFieldRed.layer.cornerRadius = 4;
    self.textFieldGreen.layer.cornerRadius = 4;
    self.textFieldBlue.layer.cornerRadius = 4;
    
    labelRed.text = @"RED";
    labelGreen.text = @"GREEN";
    labelBlue.text = @"BLUE";
    [buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [buttonProcess setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    
    [buttonProcess addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.textFieldRed.placeholder = @"0..255";
    self.textFieldGreen.placeholder = @"0..255";
    self.textFieldBlue.placeholder = @"0..255";
    
    mainView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray<UIView*> *labels = @[self.labelResultColor, labelRed, labelGreen, labelBlue];
    NSArray *textFields = @[
        self.textFieldRed,
        self.textFieldGreen,
        self.textFieldBlue];
    
    NSMutableArray *allViews = [NSMutableArray arrayWithArray:labels];
    [allViews addObjectsFromArray:textFields];
    [allViews addObjectsFromArray:@[self.viewResultColor, buttonProcess]];
    for(UIView *view in allViews){
        view.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    [self.view addSubview:mainView];
    
    [mainView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0].active = YES;
    [mainView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0].active = YES;
    [mainView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0].active = YES;
    [mainView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0].active = YES;
    
    [mainView addSubview:self.textFieldRed];
    [mainView addSubview:self.textFieldGreen];
    [mainView addSubview:self.textFieldBlue];
    [mainView addSubview:buttonProcess];
    [mainView addSubview:labelRed];
    [mainView addSubview:labelGreen];
    [mainView addSubview:labelBlue];
    [mainView addSubview:self.labelResultColor];
    [mainView addSubview:self.viewResultColor];
    
    for(UIView *view in allViews){
        [view.heightAnchor constraintEqualToConstant:40].active = YES;
    }
    
    for(int i = 0; i < labels.count; i++){
        if(!i){
            [labels[i].leadingAnchor constraintEqualToAnchor:mainView.leadingAnchor constant:20].active = YES;
            [labels[i].topAnchor constraintEqualToAnchor:mainView.topAnchor constant:60].active = YES;
            [labels[i].widthAnchor constraintEqualToConstant:100].active = YES;
            continue;
        }
        
        [labels[i].widthAnchor constraintEqualToConstant:60].active = YES;
        [labels[i].leadingAnchor constraintEqualToAnchor:labels[i-1].leadingAnchor constant:0].active = YES;
        [labels[i].topAnchor constraintEqualToAnchor:labels[i-1].topAnchor constant:60].active = YES;
    }
    
    [self.textFieldGreen.bottomAnchor constraintEqualToAnchor:labelGreen.bottomAnchor constant:0].active = YES;
    [self.textFieldRed.bottomAnchor constraintEqualToAnchor:labelRed.bottomAnchor constant:0].active = YES;
    [self.textFieldBlue.bottomAnchor constraintEqualToAnchor:labelBlue.bottomAnchor constant:0].active = YES;
    
    [self.textFieldGreen.leadingAnchor constraintEqualToAnchor:labelGreen.trailingAnchor constant:20].active = YES;
    [self.textFieldRed.leadingAnchor constraintEqualToAnchor:self.textFieldGreen.leadingAnchor constant:0].active = YES;
    [self.textFieldBlue.leadingAnchor constraintEqualToAnchor:self.textFieldGreen.leadingAnchor constant:0].active = YES;
    
    [self.textFieldGreen.trailingAnchor constraintEqualToAnchor:mainView.trailingAnchor constant:-20].active = YES;
    [self.textFieldRed.trailingAnchor constraintEqualToAnchor:mainView.trailingAnchor constant:-20].active = YES;
    [self.textFieldBlue.trailingAnchor constraintEqualToAnchor:mainView.trailingAnchor constant:-20].active = YES;
    
    [self.viewResultColor.bottomAnchor constraintEqualToAnchor:self.labelResultColor.bottomAnchor constant:0].active = YES;
    [self.viewResultColor.leadingAnchor constraintEqualToAnchor:self.labelResultColor.trailingAnchor constant:20].active = YES;
    [self.viewResultColor.trailingAnchor constraintEqualToAnchor:mainView.trailingAnchor constant:-20].active = YES;
    
    [buttonProcess.centerXAnchor constraintEqualToAnchor:mainView.centerXAnchor constant:0].active = YES;
    [buttonProcess.widthAnchor constraintEqualToConstant:100].active = YES;
    [buttonProcess.topAnchor constraintEqualToAnchor:labelBlue.bottomAnchor constant:20].active = YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.labelResultColor.text = @"Color";
}

-(void) buttonAction:(UIButton *)sender{
    NSString *redStr = self.textFieldRed.text;
    NSString *greenStr = self.textFieldGreen.text;
    NSString *blueStr = self.textFieldBlue.text;
    NSMutableString *all = redStr.mutableCopy;
    [all appendString:greenStr];
    [all appendString:blueStr];
    
    [self.textFieldRed resignFirstResponder];
    [self.textFieldGreen resignFirstResponder];
    [self.textFieldBlue resignFirstResponder];
    
    self.textFieldRed.text = @"";
    self.textFieldGreen.text = @"";
    self.textFieldBlue.text = @"";
    
    if(redStr.length && greenStr.length && blueStr.length){
        NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        if ([all rangeOfCharacterFromSet:notDigits].location == NSNotFound)
        {
            int red = redStr.intValue;
            int green = greenStr.intValue;
            int blue = blueStr.intValue;
            if(red >=0 && red <= 255 && green >= 0 && green <= 255 && blue >= 0 && blue <= 255){
                
                self.labelResultColor.text = [NSString stringWithFormat:@"0x%02X%02X%02X", red, green, blue];
                
                self.viewResultColor.backgroundColor = [UIColor colorWithRed:(float)red/255 green:(float)green/255 blue:(float)blue/255 alpha:1];
                return;
            }
        }
    }
    
    self.labelResultColor.text = @"Error";
    self.viewResultColor.backgroundColor = UIColor.clearColor;
}
@end
