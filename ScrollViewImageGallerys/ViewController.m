//
//  ViewController.m
//  ScrollViewImageGallerys
//
//  Created by Alex on 2015-11-02.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.delegate = self;
    
    UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night.jpg"]];
    UIImageView *image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse.jpg"]];
    
    image1.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    image2.frame = CGRectMake(image1.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    image3.frame = CGRectMake(image1.frame.size.width + image2.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self.scrollView addSubview:image1];
    [self.scrollView addSubview:image2];
    [self.scrollView addSubview:image3];
    
    self.scrollView.contentSize = CGSizeMake(image1.frame.size.width + image2.frame.size.width + image3.frame.size.width, self.view.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end