//
//  ViewController.m
//  NSUserDefault
//
//  Created by Civet on 2019/5/23.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *writeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    writeBtn.frame = CGRectMake(100, 100, 80, 40);
    [writeBtn setTitle:@"写入文件" forState:UIControlStateNormal];
    [writeBtn addTarget:self action:@selector(pressWrite) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:writeBtn];
    
    UIButton *readBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    readBtn.frame = CGRectMake(100, 200, 80, 40);
    [readBtn setTitle:@"读出文件" forState:UIControlStateNormal];
    [readBtn addTarget:self action:@selector(pressRead) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:readBtn];
    
}

- (void)pressWrite{
    //定义一个用户默认数据对象
    //不需要alloc创建，用户默认数据对象单例模式
    //standardUserDefaults:获取全局唯一的实例对象
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    //存储字符串对象
    //可以将对象存储到内部文件中
    //P1:要存储的对象：id类型
    //P2:对象的名字KEY:NSString类型
    [ud setObject:@"Michael" forKey:@"NAME"];
    //只能存储能够文件化的对象
    NSNumber *num = [NSNumber numberWithInt:100];
    [ud setObject:num forKey:@"NUM"];
//    //不能存储动态创建的对象
//    [ud setObject:self.view forKey:@"VIEW"];
    //存储整形数据
    [ud setInteger:123 forKey:@"INT"];
    //存储BOOL值
    [ud setBool:YES forKey:@"BOOL"];
    //存储浮点型值
    [ud setFloat:1.2222 forKey:@"FLOAT"];
    //创建一个可以文件化的数据
    NSArray *arr = [NSArray arrayWithObjects:@"11",@"22",@"33",@"1223",nil];
    [ud setObject:arr forKey:@"ARRAY"];
}
- (void)pressRead{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    id object = [ud objectForKey:@"NAME"];
    NSString *name = (NSString *)object;
    NSLog(@"name = %@",name);
    
    id object1 = [ud objectForKey:@"NUM"];
    NSNumber *num = (NSNumber *)object1;
    NSLog(@"num = %@",num);
    
    NSInteger iV = [ud integerForKey:@"INT"];
    NSLog(@"iV = %ld",iV);
    
    BOOL bV = [ud boolForKey:@"BOOL"];
    float fV = [ud floatForKey:@"FLOAT"];
    NSLog(@"bV = %d",bV);
    NSLog(@"fV = %f",fV);
    
    NSArray *arr = [ud objectForKey:@"ARRAY"];
    NSLog(@"arr = %@",arr);
    //删除数据
    //[ud removeObjectForKey:@"ARRAY"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
