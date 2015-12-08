#import "AddDiaryViewController.h"

@interface AddDiaryViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *detailsTextView;

@end

@implementation AddDiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDetailsTextView];
    

}

- (void)setDetailsTextView {
    [_detailsTextView.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.2] CGColor]];
    [_detailsTextView.layer setBorderWidth:0.5];
    _detailsTextView.layer.cornerRadius = 5;
    _detailsTextView.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
