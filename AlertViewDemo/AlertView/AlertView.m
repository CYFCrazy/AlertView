//
//  AlertView.m
//  JiuAiTou
//
//  Created by Aphy_Cui on 2018/5/7.
//  Copyright © 2018年 深圳万利金融. All rights reserved.
//

#import "AlertView.h"

@interface AlertView()

/**
 按钮数组
 */
@property (nonatomic,strong)NSArray *btnArray;

/**
 按钮颜色数组
 */
@property (nonatomic,strong)NSArray *btnBacColorArray;

/**
 是否显示关闭按钮
 */
@property (nonatomic,assign)BOOL showCloseBtn;

/**
 提示标题
 */
@property (nonatomic,copy)NSString *title;

/**
 提示内容
 */
@property (nonatomic,copy)NSString *detail;

/**
 内容View
 */
@property (nonatomic,strong)UIView *backView;

/**
 关闭按钮
 */
@property (nonatomic,strong)UIButton *closeBtn;

@end

@implementation AlertView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title detail:(NSString *)detail btnArray:(NSArray *)btnArray btnBacColorArray:(NSArray *)btnBacColorArray showCloseBtn:(BOOL)showCloseBtn
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0];
        self.title = title;
        self.btnArray = btnArray;
        self.btnBacColorArray = btnBacColorArray;
        self.detail = detail;
        self.showCloseBtn = showCloseBtn;
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    CGFloat viewHeight = 0;
    CGFloat backViewWidth = self.frame.size.width-70;
    self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.backView.backgroundColor = [UIColor whiteColor];
    self.backView.alpha = 1;
    self.backView.center = self.center;
    self.backView.layer.cornerRadius = 5;
    self.backView.layer.masksToBounds = YES;
    [self addSubview:_backView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = self.title;
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1];
    [self.backView addSubview:titleLabel];
    if (self.title != nil) {
        titleLabel.frame = CGRectMake(0, 0, backViewWidth, 55);
        viewHeight += 55;
    }else{
        titleLabel.frame = CGRectMake(0, 0, backViewWidth, 30);
        viewHeight += 30;
    }
    CGFloat detailLabelHeight = [self layoutStr:self.detail width:backViewWidth-50 fount:13 lineSpace:8];
    viewHeight += detailLabelHeight;
    UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, CGRectGetMaxY(titleLabel.frame), backViewWidth-50, detailLabelHeight)];
    detailLabel.numberOfLines = 0;
    detailLabel.text = self.detail;
    [self setLabelLineSpace:8 andFount:13 andLabel:detailLabel andMaxWidth:backViewWidth-50];
    detailLabel.font = [UIFont systemFontOfSize:13];
    detailLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:102/255.0];
    NSLog(@"%f",detailLabelHeight);
    if (detailLabelHeight < 25) {
        detailLabel.textAlignment = NSTextAlignmentCenter;
    }else{
        detailLabel.textAlignment = NSTextAlignmentJustified;
    }
    [self.backView addSubview:detailLabel];
    
    if (self.btnArray.count != 0) {
        viewHeight += 74;
    }else{
        viewHeight +=30;
    }
    if (self.btnArray.count == 1) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = CGRectMake((backViewWidth-102)/(self.btnArray.count+1), CGRectGetMaxY(detailLabel.frame)+30, 107, 44);
        [btn.titleLabel setFont:[UIFont systemFontOfSize:17]];
        [btn setTitle:self.btnArray[0] forState:(UIControlStateNormal)];
        [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        if (self.btnBacColorArray.count == 0) {
            [btn setBackgroundColor:[UIColor whiteColor]];
        }else{
            [btn setBackgroundColor:self.btnBacColorArray[0]];
        }
        btn.tag = 0;
        [btn addTarget:self action:@selector(itemAction:) forControlEvents:(UIControlEventTouchUpInside)];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        [self.backView addSubview:btn];
        viewHeight +=30;
    }else{
        if (self.btnArray.count == 2) {
            UILabel *horLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(detailLabel.frame)+30, backViewWidth, 0.2)];
            horLineLabel.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
            [self.backView addSubview:horLineLabel];
            
            UILabel *verLineLabel = [[UILabel alloc] initWithFrame:CGRectMake((backViewWidth-1)/2, CGRectGetMaxY(detailLabel.frame)+30, 0.5, 44)];
            verLineLabel.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
            [self.backView addSubview:verLineLabel];
            for (int i = 0 ; i < self.btnArray.count ; i++) {
                UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
                btn.frame = CGRectMake(((backViewWidth-1)/2)*i + 1*i, CGRectGetMaxY(detailLabel.frame)+30.2, ((backViewWidth-1)/2), 43.5);
                [btn.titleLabel setFont:[UIFont systemFontOfSize:17]];
                [btn setTitle:self.btnArray[i] forState:(UIControlStateNormal)];
                if (self.btnBacColorArray.count != 0) {
                    if (i > self.btnBacColorArray.count-1) {
                        [btn setTitleColor:self.btnBacColorArray.lastObject forState:(UIControlStateNormal)];
                    }else{
                        [btn setTitleColor:self.btnBacColorArray[i] forState:(UIControlStateNormal)];
                    }
                }else{
                    [btn setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1] forState:(UIControlStateNormal)];
                }
                [btn setBackgroundColor:[UIColor whiteColor]];
                btn.tag = i;
                [btn addTarget:self action:@selector(itemAction:) forControlEvents:(UIControlEventTouchUpInside)];
                btn.layer.cornerRadius = 5;
                btn.layer.masksToBounds = YES;
                [self.backView addSubview:btn];
            }
        }
    }
    if (self.showCloseBtn) {
        self.closeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.closeBtn.frame = CGRectMake(self.frame.size.width/2-20, CGRectGetMaxY(self.backView.frame)+(viewHeight/2)+40, 40, 40);
        [self.closeBtn setBackgroundImage:[UIImage imageNamed:@"X"] forState:(UIControlStateNormal)];
        [self.closeBtn addTarget:self action:@selector(remove) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:self.closeBtn];
        self.closeBtn.alpha = 0;
    }
    self.backView.bounds = CGRectMake(0, 0, self.frame.size.width-70, viewHeight);
    [self show:viewHeight];
}

//MARK: - 按钮点击事件
-(void)itemAction:(UIButton *)btn{
    self.AlertViewBlock(self, btn.tag, btn.titleLabel.text);
}

//MARK: - 显示
-(void)show:(CGFloat)viewHeight{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.12;
    animation.repeatCount = 1;
    animation.autoreverses = NO;
    // 动画先加速后减速
    animation.timingFunction =
    [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn];
    // 动画终了后不返回初始状态
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:0.8]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:1.0]; // 结束时的倍率
    [self.backView.layer addAnimation:animation forKey:@"transform-layer"];
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.12 animations:^{
        weakSelf.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
        if (self.showCloseBtn) {
            weakSelf.closeBtn.alpha = 1;
        }
    } completion:^(BOOL finished) {
        weakSelf.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
        if (self.showCloseBtn) {
            weakSelf.closeBtn.alpha = 1;
        }
    }];
    
}
//MARK: - 移除
- (void)remove{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.12;
    animation.repeatCount = 1;
    animation.autoreverses = NO;
    animation.timingFunction =
    [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn];
    // 动画终了后不返回初始状态
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:1]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:0.8]; // 结束时的倍率
    [self.backView.layer addAnimation:animation forKey:@"transform-layer"];
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.12 animations:^{
        weakSelf.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0];
        if (self.showCloseBtn) {
            weakSelf.closeBtn.alpha = 0;
        }
    } completion:^(BOOL finished) {
        [weakSelf.backView removeFromSuperview];
        if (self.showCloseBtn) {
            [weakSelf.closeBtn removeFromSuperview];
        }
        [weakSelf removeFromSuperview];
    }];
    
}

//MARK: - 计算字体高度
-(CGFloat)layoutStr:(NSString *)str width:(CGFloat)width fount:(CGFloat)fount lineSpace:(CGFloat)lineSpace
{
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:fount] , NSParagraphStyleAttributeName : paragraphStyle};
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return size.height;
}
//MARK: - 为label设置字体
-(void)setLabelLineSpace:(CGFloat)spacing andFount:(NSInteger)fount andLabel:(UILabel *)label andMaxWidth:(CGFloat)maxWidth{
    NSMutableAttributedString * attributeString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    BOOL isOneLine = label.text.length*11 < maxWidth;
    if (isOneLine) {
        [paragraphStyle setLineSpacing:0];
    }else{
        [paragraphStyle setLineSpacing:spacing];
    }
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
    [attributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fount] range:NSMakeRange(0, [label.text length])];
    [label setAttributedText:attributeString];
    [label sizeToFit];
}

@end
