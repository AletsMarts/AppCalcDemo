//
//  ViewController.m
//  AppCalcDemo
//
//  Created by Guest User on 11/10/24.
//

#import "ViewController.h"

@interface ViewController (){
    int i;
}
@property (weak, nonatomic) IBOutlet UITextField *texto1;
@property (weak, nonatomic) IBOutlet UIStepper *stepper1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    i = 1;
    
    [_stepper1 setTransform:CGAffineTransformMakeRotation(-M_PI_2)];
    
    [_stepper1 setTransform:CGAffineTransformScale(_stepper1.transform, 0.5, 0.5)];
}
- (IBAction)stepper1:(UIStepper *)sender {
        [_texto1 setText:[NSString stringWithFormat:@"%d",
                          (int)_stepper1.value]];
}
- (IBAction)botonDn:(UIButton *)sender {
    i --;
    _texto1.text = [NSString stringWithFormat:@"%d",i];
}


@end
