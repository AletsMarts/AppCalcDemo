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
@property (weak, nonatomic) IBOutlet UITextField *texto2;
@property (weak, nonatomic) IBOutlet UITextField *texto3;


@property (weak, nonatomic) IBOutlet UIButton *botonIn;
@property (weak, nonatomic) IBOutlet UIButton *botonDn;
@property (weak, nonatomic) IBOutlet UIButton *botonInM;
@property (weak, nonatomic) IBOutlet UIButton *botonDnM;
@property (weak, nonatomic) IBOutlet UITextField *botonInA;
@property (weak, nonatomic) IBOutlet UIButton *botonDnA;

@property (strong, nonatomic) NSNumberFormatter *numberFormatter;
@property (strong,nonatomic) NSArray *operaciones;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerOperaciones;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerOP;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.texto1.text = @"0";
    self.numberFormatter = [[NSNumberFormatter alloc]init];
    self.numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    //PICKERVIEW
    NSArray *operaciones = @[@"+",@"-", @"*", @"/"];
    
    NSArray *meses = @[@"Enero", @"Febrero", @"Marzo", @"Abril", @"Mayo", @"Junio", @"Julio", @"Agosto", @"Septiembre", @"Octubre", @"Noviembre", @"Diciembre"];

}
//PickerView
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.operaciones.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
 {
    return self.operaciones[row];

}

//Acciones al seleccionar una operación

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *operacionSeleccionada = self.operaciones[row];
    // Aquí puedes realizar alguna acción con la operación seleccionada, como mostrar un mensaje o realizar un cálculo
    NSLog(@"Operación seleccionada: %@", operacionSeleccionada);
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
- (IBAction)botonInM:(UIButton *)sender {
    int valorActual = [self.texto2.text intValue];
    valorActual++;
    self.texto2.text = [NSString stringWithFormat:@"%d", valorActual];
}

- (IBAction)botonDnM:(UIButton *)sender {
    int valorActual = [self.texto2.text intValue];
    valorActual--;
    self.texto2.text = [NSString stringWithFormat:@"%d", valorActual];
}

- (IBAction)botonInA:(UIButton *)sender {
    int valorActual = [self.texto3.text intValue];
    valorActual++;
    self.texto3.text = [NSString stringWithFormat:@"%d",valorActual];
}
- (IBAction)botonDnA:(UIButton *)sender {
    int valorActual = [self.texto3.text intValue];
    valorActual--;
    self.texto3.text = [NSString stringWithFormat:@"%d", valorActual];
}


-(BOOL)_texto1:(UITextField *)texto1 shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *resultString =[texto1.text stringByReplacingCharactersInRange:range  withString:string];
    
    NSString *regexString = @"^[0-9]*$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"Solo hace match con %@", regexString];
    return [predicate evaluateWithObject:resultString];
}


@end
