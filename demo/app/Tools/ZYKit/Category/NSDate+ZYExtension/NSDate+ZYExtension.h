//
//  NSDate+ZYExtension.h
//  ZYKit
//
//  Created by 张祎 on 4/15/16.
//  Copyright © 2016 张祎. All rights reserved.
//
/*
 版本1.0 2016.4.5
 版本1.1 2016.10.9
 版本2.0 2019.7.9
 */
#import <Foundation/Foundation.h>

@interface NSDate (ZYExtension)


/** 获取北京时间 */
@property(nonatomic, strong, readonly) NSDate *beiJingDate;
/** 获取年 */
@property(nonatomic, assign, readonly) NSInteger year;
/** 获取月 */
@property(nonatomic, assign, readonly) NSInteger month;
/** 获取日 */
@property(nonatomic, assign, readonly) NSInteger day;
/** 获取时 */
@property(nonatomic, assign, readonly) NSInteger hour;
/** 获取分 */
@property(nonatomic, assign, readonly) NSInteger minute;
/** 获取秒 */
@property(nonatomic, assign, readonly) NSInteger second;
/** 获取星期 1为周日 1为周一 2为周二 ... 7为周六 */
@property (nonatomic, assign, readonly) NSUInteger week;
/** 获取星期的字符串形式 星期一, 星期二, 星期三 ... */
@property (nonatomic, strong, readonly) NSString * weekString;
/** 获取年月日 例: 2018-05-08 */
@property(nonatomic, strong, readonly) NSString *ymd;
/** 是否是今天 */
@property(nonatomic, assign, readonly) BOOL isToday;
/** 是否为周六和周日 */
@property (nonatomic, assign, readonly) BOOL isWeekDay;
/** 时间间隔 例: 1小时前 */
@property (nonatomic, assign, readonly) NSString *timeRangeString;
/** 当前月份有多少天 */
@property (assign, nonatomic) NSInteger dayCount;

/**
 * 获取指定格式的日期字符串
 *
 * @param formatterString 日期格式 (例:@"yyyy-MM-dd HH:mm:ss")
 * @return 日期字符串
 */
- (NSString *)ymdWithFormatterString:(NSString *)formatterString;

/**
 * 根据字符串和格式获取日期
 *
 * @param string 字符串
 * @param formatterString 字符串格式 (例:@"yyyy-MM-dd HH:mm:ss")
 * @return NSDate *
 */
+ (NSDate *)dateWithString:(NSString *)string formatterString:(NSString *)formatterString;

/**
 * 保持当前月日任意年的日期
 *
 * @param year 某一年
 * @return 日期
 */
- (NSDate *)anyYear:(NSInteger)year;

/**
 * 保持当前年日任意月的日期
 *
 * @param month 某一月
 * @return 日期
 */
- (NSDate *)anyMonth:(NSInteger)month;

/**
 * 保持当前年月某一日的日期
 *
 * @param day 某一日
 * @return 日期
 */
- (NSDate *)anyDay:(NSInteger)day;

- (NSDate *)monthByIndex:(NSInteger)month;


/**
 * 获取根据index改变年月日后的日期
 *
 * @param year 年偏移量
 * @param month 月偏移量
 * @param day 日偏移量
 * @return 日期
 */
- (NSDate *)dateWithYearMonthDayIndexByYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

/**
 * 比较两个日期大小，不含时分秒的比较，需要的话，改动实现中的farmatter格式即可
 * date1大于date2 为-1 相等为0 否则为1
 *
 * @param date1 时间1
 * @param date2 时间2
 */
- (int)compareDate:(NSString*)date1 withDate:(NSString*)date2;

@end
