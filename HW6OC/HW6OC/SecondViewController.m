//
//  SecondViewController.m
//  HW6OC
//
//  Created by Mac on 26.01.2024.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) UITextField *xTextField;
@property (nonatomic, strong) UITextField *yTextField;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UIButton *loadButton;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    // Установка размеров для текстовых полей
        CGFloat textFieldWidth = 150;
        CGFloat textFieldHeight = 30;
    // Установка размеров для textView
        CGFloat textViewWidth = 200;
        CGFloat textViewHeight = 200;
       
    // Создание и размещение текстовых полей
    self.xTextField = [[UITextField alloc] init];
    [self.xTextField.widthAnchor constraintEqualToConstant:textFieldWidth].active = YES;
    [self.xTextField.heightAnchor constraintEqualToConstant:textFieldHeight].active = YES;
    self.xTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.xTextField.placeholder = @"X";
    [ConstraintManager setupConstraintForView:self.xTextField verticalMultiplier:0.3 horizontalMultiplier:1.0 inView:self.view];

    self.yTextField = [[UITextField alloc] init];
    [self.yTextField.widthAnchor constraintEqualToConstant:textFieldWidth].active = YES;
    [self.yTextField.heightAnchor constraintEqualToConstant:textFieldHeight].active = YES;
    self.yTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.yTextField.placeholder = @"Y";
    [ConstraintManager setupConstraintForView:self.yTextField verticalMultiplier:0.45 horizontalMultiplier:1.0 inView:self.view];

    self.nameTextField = [[UITextField alloc] init];
    [self.nameTextField.widthAnchor constraintEqualToConstant:textFieldWidth].active = YES;
    [self.nameTextField.heightAnchor constraintEqualToConstant:textFieldHeight].active = YES;
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.nameTextField.placeholder = @"Name";
    [ConstraintManager setupConstraintForView:self.nameTextField verticalMultiplier:0.6 horizontalMultiplier:1.0 inView:self.view];

    // Создание и размещение кнопок "Save Robot" и "Load Robot"
    self.saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.saveButton setTitle:@"Save Robot" forState:UIControlStateNormal];
    [self.saveButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.saveButton addTarget:self action:@selector(saveRobotToFile) forControlEvents:UIControlEventTouchUpInside];
    [ConstraintManager setupConstraintForView:self.saveButton verticalMultiplier:0.75 horizontalMultiplier:1.0 inView:self.view];

    self.loadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loadButton setTitle:@"Load Robot" forState:UIControlStateNormal];
    [self.loadButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.loadButton addTarget:self action:@selector(loadRobotFromFile) forControlEvents:UIControlEventTouchUpInside];
    [ConstraintManager setupConstraintForView:self.loadButton verticalMultiplier:0.9 horizontalMultiplier:1.0 inView:self.view];

    // Создание и размещение поля "textView"
    self.textView = [[UITextView alloc] init];
    [self.textView.widthAnchor constraintEqualToConstant:textViewWidth].active = YES;
    [self.textView.heightAnchor constraintEqualToConstant:textViewHeight].active = YES;
    [ConstraintManager setupConstraintForView:self.textView verticalMultiplier:1.3 horizontalMultiplier:1.0 inView:self.view];
}

- (void)saveRobotToFile {
    NSInteger x = [self.xTextField.text integerValue];
    NSInteger y = [self.yTextField.text integerValue];
    NSString *name = self.nameTextField.text;

    Robot *robot = [[Robot alloc] initWithX:x y:y name:name];

    NSData *robotData;
    NSError *error = nil;

    robotData = [NSKeyedArchiver archivedDataWithRootObject:robot requiringSecureCoding:YES error:&error];
  
    if (robotData) {
        NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        NSURL *url = [NSURL fileURLWithPath:[documentsDirectory stringByAppendingPathComponent:[name stringByAppendingString:@".robot"]]];
        NSLog(@"Created file at path: %@", url.path);
        BOOL success = [robotData writeToURL:url options:NSDataWritingAtomic error:&error];
        if (success) {
            self.textView.text = [NSString stringWithFormat:@"Created file for robot: %@", name];
        } else {
            self.textView.text = [NSString stringWithFormat:@"Failed to create file for robot: %@", name];
        }
    } else {
        self.textView.text = [NSString stringWithFormat:@"Failed to archive robot: %@", error];
    }
}

- (void)loadRobotFromFile {
    NSString *name = self.nameTextField.text;
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[name stringByAppendingString:@".robot"]];

    NSData *robotData = [NSData dataWithContentsOfFile:filePath];
    if (robotData) {
        NSError *error = nil;
        Robot *loadedRobot;
        loadedRobot = [NSKeyedUnarchiver unarchivedObjectOfClass:[Robot class] fromData:robotData error:&error];
         
        if (loadedRobot) {
            self.textView.text = [NSString stringWithFormat:@"Loaded robot data: X:%ld, Y:%ld, Name:%@", (long)loadedRobot.x, (long)loadedRobot.y, loadedRobot.name];
        } else {
            self.textView.text = [NSString stringWithFormat:@"Failed to load robot data: %@", error];
        }
    } else {
        self.textView.text = [NSString stringWithFormat:@"No file found for robot: %@", name];
    }
}

    @end
