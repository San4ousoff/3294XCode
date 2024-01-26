//
//  ViewController.m
//  HW6OC
//
//  Created by Mac on 26.01.2024.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *xTextField;
@property (nonatomic, strong) UITextField *yTextField;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UIButton *loadButton;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *navigateToSecondVCButton;

@end

@implementation ViewController

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
    [self.saveButton addTarget:self action:@selector(saveRobotToUserDefaults) forControlEvents:UIControlEventTouchUpInside];
    [ConstraintManager setupConstraintForView:self.saveButton verticalMultiplier:0.75 horizontalMultiplier:1.0 inView:self.view];

    self.loadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loadButton setTitle:@"Load Robot" forState:UIControlStateNormal];
    [self.loadButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.loadButton addTarget:self action:@selector(loadRobotFromUserDefaults) forControlEvents:UIControlEventTouchUpInside];
    [ConstraintManager setupConstraintForView:self.loadButton verticalMultiplier:0.9 horizontalMultiplier:1.0 inView:self.view];

    // Создание и размещение поля "textView"
    self.textView = [[UITextView alloc] init];
    [self.textView.widthAnchor constraintEqualToConstant:textViewWidth].active = YES;
    [self.textView.heightAnchor constraintEqualToConstant:textViewHeight].active = YES;
    [ConstraintManager setupConstraintForView:self.textView verticalMultiplier:1.3 horizontalMultiplier:1.0 inView:self.view];

    // Создание и размещение кнопки "Go to Second View"
    self.navigateToSecondVCButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.navigateToSecondVCButton setTitle:@"Go to Second View" forState:UIControlStateNormal];
    [self.navigateToSecondVCButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [self.navigateToSecondVCButton addTarget:self action:@selector(navigateToSecondViewController) forControlEvents:UIControlEventTouchUpInside];
    [ConstraintManager setupConstraintForView:self.navigateToSecondVCButton verticalMultiplier:1.9 horizontalMultiplier:1.4 inView:self.view];
}

- (void)saveRobotToUserDefaults {
    NSInteger x = [self.xTextField.text integerValue];
    NSInteger y = [self.yTextField.text integerValue];
    NSString *name = self.nameTextField.text;

    Robot *robot = [[Robot alloc] initWithX:x y:y name:name];

    NSError *error = nil;
    NSData *robotData;

    robotData = [NSKeyedArchiver archivedDataWithRootObject:robot requiringSecureCoding:YES error:&error];
    
    if (robotData) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:robotData forKey:@"savedRobot"];
        [defaults synchronize];
        self.textView.text = @"Robot saved to UserDefaults!";
    } else {
        NSLog(@"Failed to archive robot: %@", error);
    }
}

- (void)loadRobotFromUserDefaults {
    // Загружаем объект Robot из UserDefaults и выводим его в текстовое поле
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *robotData = [defaults objectForKey:@"savedRobot"];
    if (robotData) {
        NSError *error = nil;
        Robot *loadedRobot = [NSKeyedUnarchiver unarchivedObjectOfClass:[Robot class] fromData:robotData error:&error];
        if (error) {
            // Обработка ошибки при загрузке
            NSLog(@"Error loading robot: %@", error);
        } else {
            self.textView.text = [NSString stringWithFormat:@"Robot data loaded: X:%ld, Y:%ld, Name:%@", (long)loadedRobot.x, (long)loadedRobot.y, loadedRobot.name];
        }
    } else {
        self.textView.text = @"No robot data found in UserDefaults";
    }
}

- (void)navigateToSecondViewController {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end

