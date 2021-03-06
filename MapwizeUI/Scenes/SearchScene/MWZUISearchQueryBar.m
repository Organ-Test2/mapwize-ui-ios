#import "MWZUISearchQueryBar.h"

@implementation MWZUISearchQueryBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self initialize];
    return self;
}

- (void) initialize {
    self.clipsToBounds = NO;
    self.layer.cornerRadius = 10;
    self.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 0.5;
    
    NSBundle* bundle = [NSBundle bundleForClass:self.class];
    UIImage* backImage = [UIImage imageNamed:@"back" inBundle:bundle compatibleWithTraitCollection:nil];
    
    self.backButton = [[UIButton alloc] init];
    self.backButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setImage:backImage forState:UIControlStateNormal];
    [self addSubview:self.backButton];
    
    [[NSLayoutConstraint constraintWithItem:self.backButton
                                  attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeLeft
                                 multiplier:1.0f
                                   constant:8.0f] setActive:YES];
    
    [[NSLayoutConstraint constraintWithItem:self.backButton
                                  attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeTop
                                 multiplier:1.0f
                                   constant:8.0f] setActive:YES];
    
    [[NSLayoutConstraint constraintWithItem:self.backButton
                                  attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeBottom
                                 multiplier:1.0f
                                   constant:-8.0f] setActive:YES];
    
    [[NSLayoutConstraint constraintWithItem:self.backButton
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1.0f
                                   constant:32.f] setActive:YES];
    
    [[NSLayoutConstraint constraintWithItem:self.backButton
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1.0f
                                   constant:32.f] setActive:YES];
    
    self.backButton.contentEdgeInsets = UIEdgeInsetsMake(4.0f, 4.0f, 4.0f, 4.0f);
    
    self.clearButton = [[UIButton alloc] init];
    self.clearButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.clearButton setImage:backImage forState:UIControlStateNormal];
    [self.clearButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    self.clearButton.contentEdgeInsets = UIEdgeInsetsMake(6.0f, 6.0f, 6.0f, 6.0f);
    self.clearButton.alpha = 0.0f;
    [self addSubview:self.clearButton];
    [[NSLayoutConstraint constraintWithItem:self.clearButton
                                  attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeRight
                                 multiplier:1.0f
                                   constant:-8.0f] setActive:YES];
    
    [[NSLayoutConstraint constraintWithItem:self.clearButton
                                  attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeTop
                                 multiplier:1.0f
                                   constant:8.0f] setActive:YES];
    
    [[NSLayoutConstraint constraintWithItem:self.clearButton
                                  attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeBottom
                                 multiplier:1.0f
                                   constant:-8.0f] setActive:YES];
    
    [[NSLayoutConstraint constraintWithItem:self.clearButton
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1.0f
                                   constant:32.f] setActive:YES];
    
    [[NSLayoutConstraint constraintWithItem:self.clearButton
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1.0f
                                   constant:32.f] setActive:YES];
    
    self.searchTextField = [[UITextField alloc] init];
    self.searchTextField.translatesAutoresizingMaskIntoConstraints = NO;
    //self.searchTextField.textColor = [UIColor lightGrayColor];
    self.searchTextField.placeholder = NSLocalizedString(@"Search", "");
    self.searchTextField.delegate = self;
    [self.searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:self.searchTextField];
    [[NSLayoutConstraint constraintWithItem:self.searchTextField
                                  attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.clearButton
                                  attribute:NSLayoutAttributeLeft
                                 multiplier:1.0f
                                   constant:-8.0f] setActive:YES];
    
    [[NSLayoutConstraint constraintWithItem:self.searchTextField
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1.0f
                                   constant:32.f] setActive:YES];
    
    [[NSLayoutConstraint constraintWithItem:self.searchTextField
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.0f
                                   constant:0.0f] setActive:YES];
    
    [[NSLayoutConstraint constraintWithItem:self.searchTextField
                                  attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.backButton
                                  attribute:NSLayoutAttributeRight
                                 multiplier:1.0f
                                   constant:8.0f] setActive:YES];
    
}

- (void) backClick {
    [_delegate didTapOnBackButton];
}

#pragma mark TextFieldDelegate

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    
}

- (void) textFieldDidChange:(UITextField*) textField {
    [_delegate searchQueryDidChange:textField.text];
}

@end
