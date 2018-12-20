//
//  ViewController.m
//  blockDemo
//
//  Created by liuyujia on 2018/12/20.
//  Copyright © 2018 liuyujia. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"


typedef UIViewController *(^ViewControllerHandler) (void);

@interface ViewController ()
@property (nonatomic, strong) NSMutableDictionary *blockDicM;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.blockDicM = [NSMutableDictionary new];
    
    [self registerWithTitle:@"keyOne" handler:^UIViewController *{
        UIViewController *vc1 = [UIViewController new];
        return vc1;
    }];
    
    [self registerWithTitle:@"keyTwo" handler:^UIViewController *{
        DetailViewController *vc1 = [DetailViewController new];
        return vc1;
    }];
    
    [self registerWithTitle:@"keyThree" handler:^UIViewController *{
        UIViewController *vc1 = [UIViewController new];
        return vc1;
    }];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 50, 50)];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)action:(UIButton *)sender{
    ///转化成ViewControllerHandler 然后调用后面加上双括号()
    UIViewController *vc = ((ViewControllerHandler)self.blockDicM[@"keyTwo"])();

    [self.navigationController pushViewController:vc animated:YES];
}

///设置一个含有hander
-(void)registerWithTitle:(NSString *)title handler:(ViewControllerHandler)handler{
    
    [self.blockDicM setObject:handler forKey:title];
    
    
}


@end
