//
//  ViewController.m
//  HW5OC
//
//  Created by Mac on 25.01.2024.
//

#import "ViewController.h"
#import "Loader.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextView *resultTextView;
@property (nonatomic, strong) UIButton *nextScreenButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resultTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 50, 300, 400)];
    self.resultTextView.editable = NO;
    [self.view addSubview:self.resultTextView];
    
    // Создаем и настраиваем кнопку
    self.nextScreenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextScreenButton.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 120, CGRectGetHeight(self.view.frame) - 60, 100, 40);
    [self.nextScreenButton setTitle:@"Далее" forState:UIControlStateNormal];
    [self.nextScreenButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.nextScreenButton addTarget:self action:@selector(goToNextScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextScreenButton];
    
    self.loader = [Loader new];
    [self performLoadingGetRequest];
}

- (void)goToNextScreen {
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void)performLoadingGetRequest {
    [self.loader performGetRequestForUrl:@"https://postman-echo.com/get" arguments:@{@"key1":@"val1",@"key2":@"val2"} comletion:^(NSDictionary *dict, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                self.resultTextView.text = [NSString stringWithFormat:@"Error: %@", error.localizedDescription];
                return;
            }
            self.resultTextView.text = [NSString stringWithFormat:@"%@", dict];
        });
    }];
}

- (void)performLoadingPostRequest {
    [self.loader performPostRequestForUrl:@"https://postman-echo.com/post" arguments:@{@"key1":@"val1",@"key2":@"val2"} comletion:^(NSDictionary *dict, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"%@", error);
                return;
            }
            NSLog(@"%@", dict);
        });
    }];
}

@end
