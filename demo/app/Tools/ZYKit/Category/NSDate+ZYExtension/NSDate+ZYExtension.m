//
//  NSDate+ZYExtension.m
//  ZYKit
//
//  Created by 张祎 on 4/15/16.
//  Copyright © 2016 张祎. All rights reserved.
//

#import "NSDate+ZYExtension.h"

@implementation NSDate (ZYExtension)

/**
 北京时间
 */
- (NSDate *)beiJingDate{
    return (NSDate *)[self dateByAddingTimeInterval:60 * 60 * 8];
}

/**
 年
 */
- (NSInteger)year{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy";
    return [[formatter stringFromDate:self] integerValue];
}

/**
 月
 */
- (NSInteger)month{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"MM";
    return [[formatter stringFromDate:self] integerValue];
}

/**
 日
 */
- (NSInteger)day{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"dd";
    return [[formatter stringFromDate:self] integerValue];
}

/**
 时
 */
- (NSInteger)hour{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"HH";
    return [[formatter stringFromDate:self] integerValue];
}

/**
 分
 */
- (NSInteger)minute{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"mm";
    return [[formatter stringFromDate:self] integerValue];
}

/**
 秒
 */
- (NSInteger)second{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"ss";
    return [[formatter stringFromDate:self] integerValue];
}

- (NSUInteger)week {
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:self];
}

- (NSString *)weekString {
    NSArray *arr = @[@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
    return arr[self.week - 1];
}



/**
 年月日
 */
- (NSString *)ymd{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter stringFromDate:self];
}

/**
 是否是今天
 */
- (BOOL)isToday{
    
    NSDate *date = [NSDate date];
    if (self.year == date.year && self.month == date.month && self.day == date.day) {
        return YES;
    }else{
        return NO;
    }
}

- (BOOL)isWeekDay {
    if (self.week == 1 || self.week == 7) {
        return YES;
    } else {
        return NO;
    }
}

- (NSString *)timeRangeString {
    return @"";
}

- (NSInteger)dayCount {
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
}


/**
 获取指定格式的日期字符串
 
 @param formatterString 日期格式 (例:@"yyyy-MM-dd HH:mm:ss")
 
 @return 日期字符串
 */
- (NSString *)ymdWithFormatterString:(NSString *)formatterString{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = formatterString;
    return [formatter stringFromDate:self];
}

/**
 根据字符串获取日期
 
 @param string 表示日期的字符串 (例:@"2016-01-01")
 
 @return 日期字符串
 */
+ (NSDate *)dateFromString:(NSString *)string {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter dateFromString:string];
}

+ (NSDate *)dateWithString:(NSString *)string formatterString:(NSString *)formatterString {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formatterString;
    return [formatter dateFromString:string];
}

/**
 获取当前日期之前或之后的某一年
 
 @param index 索引 (例: 1为明年 -1为去年)
 
 @return 日期
 */
- (NSDate *)anyYear:(NSInteger)year {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compontents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    compontents.year = year;
    return [calendar dateFromComponents:compontents];
}

/**
 获取当前日期之前或之后的某一月
 
 @param index 索引 (例: 1为下个月 -1为上个月)
 
 @return 日期
 */
- (NSDate *)anyMonth:(NSInteger)month {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compontents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    compontents.month = month;
    return [calendar dateFromComponents:compontents];
}
/**
 获取当前日期之前或之后的某一日
 
 @param index 索引 (例: 1为明天 -1为昨天)
 
 @return 日期
 */
- (NSDate *)anyDay:(NSInteger)day {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compontents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    compontents.day = day;
    return [calendar dateFromComponents:compontents];
}

- (NSDate *)monthByIndex:(NSInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compontents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    compontents.month += month;
    compontents.day = 1;
    return [calendar dateFromComponents:compontents];
}

- (NSDate *)dateWithYearMonthDayIndexByYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compontents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    compontents.year += year;
    compontents.month += month;
    compontents.day += day;
    return [calendar dateFromComponents:compontents];
}


- (int)compareDate:(NSString*)date1 withDate:(NSString*)date2{

    int ci;
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate*dt1 = [df dateFromString:date1];
    NSDate*dt2 = [df dateFromString:date2];

    NSComparisonResult result = [dt1 compare:dt2];
    switch(result){
        //date02比date01大
        case NSOrderedAscending:
            ci = 1;
            break;
        //date02比date01小
        case NSOrderedDescending:
            ci = -1;
            break;
        //date02=date01
        case NSOrderedSame:
            ci = 0;
            break;
        default:
            break;

    }

    return ci;
}

@end
