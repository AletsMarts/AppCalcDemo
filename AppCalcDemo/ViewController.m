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
@property (weak, nonatomic) IBOutlet UIButton *botonIn;
@property (weak, nonatomic) IBOutlet UIButton *botonDn;
@property (strong, nonatomic) NSNumberFormatter *numberFormatter;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.texto1.text = @"0";
    self.numberFormatter = [[NSNumberFormatter alloc]init];
    self.numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
}

- (IBAction)botonDn:(UIButton *)sender {
    int valorActual = [self.texto1.text intValue];
    valorActual--;
    self.texto1.text = [NSString stringWithFormat:@"%d", valorActual];
}

- (IBAction)botonIn:(UIButton *)sender {
    int valorActual = [self.texto1.text intValue];
    valorActual++;
    self.texto1.text = [NSString stringWithFormat:@"%d",valorActual];
}

-(BOOL)_texto1:(UITextField *)texto1 shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *resultString =[texto1.text stringByReplacingCharactersInRange:range  withString:string];
    
    NSString *regexString = @"^[0-9]*$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Solo hace match con %@", regexString];
    return [predicate evaluateWithObject:resultString];
}
@end
