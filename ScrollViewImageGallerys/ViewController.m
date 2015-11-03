//
//  ViewController.m
//  ScrollViewImageGallerys
//
//  Created by Alex on 2015-11-02.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "ViewController.h"
#import "ZoomViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *images;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.delegate = self;
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night.jpg"]];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse.jpg"]];
    
    self.images = @[imageView1, imageView2, imageView3];
    
    imageView1.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    imageView2.frame = CGRectMake(imageView1.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    imageView3.frame = CGRectMake(imageView1.frame.size.width + imageView2.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);

    [self.scrollView addSubview:imageView1];
    [self.scrollView addSubview:imageView2];
    [self.scrollView addSubview:imageView3];
    
    self.scrollView.contentSize = CGSizeMake(imageView1.frame.size.width + imageView2.frame.size.width + imageView3.frame.size.width, self.view.frame.size.height);
    
    
}

- (IBAction)tapForSegue:(UITapGestureRecognizer *)sender {
    
    
    CGPoint tapLocation = [sender locationInView:self.scrollView];
    // divide view
    int index = tapLocation.x / self.view.frame.size.width;
    
    UIImageView *imageView = self.images[index];
    UIImage *image = imageView.image;
    
    [self performSegueWithIdentifier:@"zoomDetail" sender:image];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ZoomViewController *zvc = [segue destinationViewController];
    
    zvc.currentImage = sender;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f/%f = %d",self.scrollView.contentOffset.x, self.scrollView.frame.size.width, (int)(self.scrollView.contentOffset.x / self.scrollView.frame.size.width));
    self.pageControl.currentPage = (int)(self.scrollView.contentOffset.x / self.scrollView.frame.size.width);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end