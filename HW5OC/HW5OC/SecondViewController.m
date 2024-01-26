//
//  SecondViewController.m
//  HW5OC
//
//  Created by Mac on 26.01.2024.
//

#import "SecondViewController.h"
#import "Loader.h"

@interface SecondViewController ()

@property (nonatomic, strong) UITextField *textField1;
@property (nonatomic, strong) UITextField *textField2;
@property (nonatomic, strong) UITextView *resultTextView;
@property (nonatomic, strong) UIButton *submitButton;
@property (nonatomic, strong) Loader *loader;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField1 = [[UITextField alloc] initWithFrame:CGRectMake(20, 70, 200, 30)];
    self.textField1.borderStyle = UITextBorderStyleRoundedRect;
    self.textField1.placeholder = @"Значение для ключа 1";
    [self.view addSubview:self.textField1];
    
    self.textField2 = [[UITextField alloc] initWithFrame:CGRectMake(20, 120, 200, 30)];
    self.textField2.borderStyle = UITextBorderStyleRoundedRect;
    self.textField2.placeholder = @"Значение для ключа 2";
    [self.view addSubview:self.textField2];
    
    self.resultTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 170, 300, 400)];
    [self.view addSubview:self.resultTextView];
    
    self.submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.submitButton.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 120, CGRectGetHeight(self.view.frame) - 60, 100, 40);
    [self.submitButton setTitle:@"Запрос" forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.submitButton addTarget:self action:@selector(submitData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.submitButton];
    
    self.loader = [Loader new];
}

- (void)submitData {
    NSDictionary *arguments = @{
        @"key1": self.textField1.text,
        @"key2": self.textField2.text
    };
    
    [self.loader performPostRequestForUrl:@"https://postman-echo.com/post" arguments:arguments comletion:^(NSDictionary *dict, NSError *error) {
           dispatch_async(dispatch_get_main_queue(), ^{
               if (error) {
                   self.resultTextView.text = [NSString stringWithFormat:@"Error: %@", error.localizedDescription];
                   return;
               }
               self.resultTextView.text = [NSString stringWithFormat:@"%@", dict];
           });
       }];
}

@end
