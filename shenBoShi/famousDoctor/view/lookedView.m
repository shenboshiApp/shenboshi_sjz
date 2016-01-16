//
//  lookedView.m
//  shenBoShi
//
//  Created by 开发2 on 16/1/6.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import "lookedView.h"

@implementation lookedView

{
    UITableView * _tableView;
    UIImageView * _bottomView;
    UILabel * topLabel;
    UILabel * bottom;
    UIView * line;
    
    
    
    NSMutableArray *firstNameArray;
    NSMutableArray *nameArray ;
    NSMutableArray *diseaseArray;
    NSMutableArray *dataArray;
    
    
    NSMutableArray *fullNameArray;
    
    
    NSMutableArray *diseaseDetailArray;
    
    
    UILabel *nameLabel;
    UILabel *detailLabel;
    
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        [self createData];
        [self bottomView];
        [self createTableView];
    }
    return self;
}
#pragma mark ---创建数据
-(void)createData
{
    diseaseDetailArray = [NSMutableArray arrayWithObjects:@"肾炎的水肿多失出现在眼险、面部、阴裹等地方。",@"早晨起床后，息者会发现限皮或胜部水肿，劳累后症状加重，休息后减轻。",@"随病情的发展，水肿逐渐出现在双脚躁内侧、双下肢、腰既部等处。",@"尿液呈洗肉水样，呈浓茶色、酱油色或浑浊如淘米水。",@"小便泡沫多，长时间不消失，这是尿液中蛋白质较多的缘故。",@"患者的尿量会出现过多或过少的情况，正常人尿量平均每天为1训毫升，每天4—8次。",@"出现夜尿，正常人在60岁以内，通常不会有夜尿，如年轻人夜尿增加，可能是肾脏功能不良的早期症状。",@"腰部酸痛。若患者出现无明确原因的腰背酸痛，应检查肾脏是否正常。",@"肾炎患者虽然缺乏特异性症状，但早期常常出现疲劳，乏力，腰痛，眼睑、颜面、踝关节浮肿，尿中泡沫增多，尿色异常。",@"急性肾炎和慢性肾肾炎患者的急性发作常常与咽炎、扁桃体炎、上呼吸道及皮肤等感染相关。因此，当患有上述感染性疾病时应检查尿常规。",@"肾病专家指出，约1/3的肾炎患者会出现血压升高，表现为头痛、记忆力减退、睡眠不佳等。因上述症状就医、并且发现血压升高的患者一定要检查尿常规，特别是年轻患者。",@"中度以上的慢性肾功能不全患者常常合并贫血，出现乏力、头晕、面色苍白等症状。贫血的患者如除外血液系统疾病，应注意是否存在慢性肾功能不全。",@"慢性肾功能不全患者早期可能仅仅表现为夜间排尿次数和尿量的增多。健康人如果睡前没有大量饮水.",@"夜间睡眠后应不排尿或仅排尿1次，如果经常夜间排尿2次以上，应到医院检查尿常规和肾脏功能.",@"肾炎的水肿多失出现在眼险、面部、阴裹等地方。",@"早晨起床后，息者会发现限皮或胜部水肿，劳累后症状加重，休息后减轻。",@"随病情的发展，水肿逐渐出现在双脚躁内侧、双下肢、腰既部等处。",@"尿液呈洗肉水样，呈浓茶色、酱油色或浑浊如淘米水。",@"小便泡沫多，长时间不消失，这是尿液中蛋白质较多的缘故。",@"患者的尿量会出现过多或过少的情况，正常人尿量平均每天为1训毫升，每天4—8次。",@"出现夜尿，正常人在60岁以内，通常不会有夜尿，如年轻人夜尿增加，可能是肾脏功能不良的早期症状。",@"腰部酸痛。若患者出现无明确原因的腰背酸痛，应检查肾脏是否正常。",@"肾炎患者虽然缺乏特异性症状，但早期常常出现疲劳，乏力，腰痛，眼睑、颜面、踝关节浮肿，尿中泡沫增多，尿色异常。",@"急性肾炎和慢性肾肾炎患者的急性发作常常与咽炎、扁桃体炎、上呼吸道及皮肤等感染相关。因此，当患有上述感染性疾病时应检查尿常规。",@"肾病专家指出，约1/3的肾炎患者会出现血压升高，表现为头痛、记忆力减退、睡眠不佳等。因上述症状就医、并且发现血压升高的患者一定要检查尿常规，特别是年轻患者。",@"中度以上的慢性肾功能不全患者常常合并贫血，出现乏力、头晕、面色苍白等症状。贫血的患者如除外血液系统疾病，应注意是否存在慢性肾功能不全。",@"慢性肾功能不全患者早期可能仅仅表现为夜间排尿次数和尿量的增多。健康人如果睡前没有大量饮水.",@"夜间睡眠后应不排尿或仅排尿1次，如果经常夜间排尿2次以上，应到医院检查尿常规和肾脏功能.",@"肾炎的水肿多失出现在眼险、面部、阴裹等地方。",@"早晨起床后，息者会发现限皮或胜部水肿，劳累后症状加重，休息后减轻。",@"随病情的发展，水肿逐渐出现在双脚躁内侧、双下肢、腰既部等处。",@"尿液呈洗肉水样，呈浓茶色、酱油色或浑浊如淘米水。",@"小便泡沫多，长时间不消失，这是尿液中蛋白质较多的缘故。",@"患者的尿量会出现过多或过少的情况，正常人尿量平均每天为1训毫升，每天4—8次。",@",出现夜尿，正常人在60岁以内，通常不会有夜尿，如年轻人夜尿增加，可能是肾脏功能不良的早期症状。",@"腰部酸痛。若患者出现无明确原因的腰背酸痛，应检查肾脏是否正常。",@"肾炎患者虽然缺乏特异性症状，但早期常常出现疲劳，乏力，腰痛，眼睑、颜面、踝关节浮肿，尿中泡沫增多，尿色异常。",@"急性肾炎和慢性肾肾炎患者的急性发作常常与咽炎、扁桃体炎、上呼吸道及皮肤等感染相关。因此，当患有上述感染性疾病时应检查尿常规。",@"肾病专家指出，约1/3的肾炎患者会出现血压升高，表现为头痛、记忆力减退、睡眠不佳等。因上述症状就医、并且发现血压升高的患者一定要检查尿常规，特别是年轻患者。",@"中度以上的慢性肾功能不全患者常常合并贫血，出现乏力、头晕、面色苍白等症状。贫血的患者如除外血液系统疾病，应注意是否存在慢性肾功能不全。",@"慢性肾功能不全患者早期可能仅仅表现为夜间排尿次数和尿量的增多。健康人如果睡前没有大量饮水.",@"夜间睡眠后应不排尿或仅排尿1次，如果经常夜间排尿2次以上，应到医院检查尿常规和肾脏功能.", nil];
    
    
    
    diseaseArray = [NSMutableArray arrayWithObjects:@"原发性",@"继发性",@"IgA肾病",@"高血压肾病",@"微小病变性肾病",@"糖尿病肾病",@"间质性肾炎",@"狼疮性肾炎",@"淀粉样变性肾病",@"紫癜性肾炎",@"多囊肾",@"高尿酸肾病",@"急性肾小球肾炎",@"肥胖性肾病",@"急进性肾小球肾炎",@"乙肝病毒相关性肾病",@"局灶节段性肾小球硬化",@"膜性肾病",@"",@"系膜增生性肾小球肾炎",@"膜增生性肾小球肾炎",@"隐匿性肾炎" ,@"原发性",@"继发性",@"IgA肾病",@"高血压肾病",@"微小病变性肾病",@"糖尿病肾病",@"间质性肾炎",@"狼疮性肾炎",@"淀粉样变性肾病",@"紫癜性肾炎",@"多囊肾",@"高尿酸肾病",@"急性肾小球肾炎",@"肥胖性肾病",@"急进性肾小球肾炎",@"乙肝病毒相关性肾病",@"局灶节段性肾小球硬化",@"膜性肾病",@"",@"系膜增生性肾小球肾炎",@"膜增生性肾小球肾炎",@"隐匿性肾炎",@"原发性",@"继发性",@"IgA肾病",@"高血压肾病",@"微小病变性肾病",@"糖尿病肾病",@"间质性肾炎",@"狼疮性肾炎",@"淀粉样变性肾病",@"紫癜性肾炎",@"多囊肾",@"高尿酸肾病",@"急性肾小球肾炎",@"肥胖性肾病",@"急进性肾小球肾炎",@"乙肝病毒相关性肾病",@"局灶节段性肾小球硬化",@"膜性肾病",@"",@"系膜增生性肾小球肾炎",@"膜增生性肾小球肾炎",@"隐匿性肾炎",nil];
    
    
    
    
    firstNameArray = [NSMutableArray arrayWithObjects:@"周",@"吴",@"郑",@"王",@"赵",@"钱",@"孙",@"李",@"刘",@"杨",@"辛",@"张",@"韩", nil];
    nameArray = [NSMutableArray arrayWithObjects:@"经",@"文",@"明",@"太天",@"山",@"飞",@"日",@"照",@"想",@"录",@"升",@"字",@"严",@"轻",@"大",@"的",@"恩",@"特",@"奥",@"很",@"看",@"瑶",@"侃",@"铺",@"挂",@"千",@"穿",@"周",@"散",@"签",@"吃",@"悠",@"嵩",@"灵",@"黛",@"文",@"卿",@"舒",@"征",@"兰",@"歌",@"飞",@"梦",@"琪",@"青",@"磊",@"浩",@"妍",@"妍",@"文",@"哲",@"佳",@"节",@"大",@"山",@"天",@"成",@"玉",@"鹏",@"洋",@"洋",@"小",@"刚", nil];;
    
    fullNameArray = [NSMutableArray array];
    
    int j_array = (int)nameArray.count;
    for (int i = 0; i < 50; i++) {
        
        int number =  arc4random()%(13 - 0  );
        
        int number2 = arc4random()%(j_array -0 );
        
        int number3 = arc4random()%(j_array - 0);
        NSString *string = [NSString stringWithFormat:@"%@%@%@",firstNameArray[number],nameArray[number2],nameArray[number3]];
        
        [fullNameArray addObject:string];
        
    }
}
#pragma mark 创建 tableView
-(void)createTableView{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KDEVICEWIDTH, KDEVICEHEIGHT) style:UITableViewStylePlain];
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[UIColor clearColor];
    [self addSubview:_tableView];
    
    
    
    
}

#pragma mark ---tableView的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 10, KDEVICEHEIGHT - 24, 12)];
        nameLabel.text  = [NSString stringWithFormat:@"%@    %@",fullNameArray[indexPath.row],diseaseArray[indexPath.row]];
        nameLabel.textAlignment = NSTextAlignmentLeft;
        nameLabel.font = [UIFont systemFontOfSize:12];
        
        [cell.contentView addSubview:nameLabel];
        
        detailLabel= [[UILabel alloc] initWithFrame:CGRectMake(12, 31, KDEVICEWIDTH - 24, 41)];
        detailLabel.numberOfLines = 0;
        detailLabel.font = [UIFont systemFontOfSize:12];
        detailLabel.text = diseaseDetailArray[indexPath.row];
        [cell.contentView addSubview:detailLabel];
        
        UIView *lineBreakView = [[UIView alloc] initWithFrame:CGRectMake(12, 71, KDEVICEWIDTH - 24, 1)];
        
        lineBreakView.backgroundColor = RGB(160, 160, 160, 1);
        [cell.contentView addSubview:lineBreakView];
    }
    
    
    cell.backgroundColor=[UIColor clearColor];
    return cell;
    
}


-(void)bottomView
{
    _bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [_bottomView setImage:[UIImage imageNamed:@"background"]];
    [self addSubview:_bottomView];
}

@end
