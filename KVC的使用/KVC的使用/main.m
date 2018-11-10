//
//  main.m
//  KVC的使用
//
//  Created by 汪大强 on 2018/9/30.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZPerson.h"
#import "LZDog.h"

/*
 KVC: Key Value Coding（简直编码）
 
 forKey和forKeyPath:
    1> forKeyPath 包含了所有 forKey的功能
    2> forKeyPath 进行内部的点语法，层层访问内部的属性
    3> 注意：key值一定要在属性中找到（key和value一一对应）
 
 开发中不建议使用setValuesForKeysWithDictionary
    1> 字典中的key值必须在模型的属性中找到
    2> 如果模型中带有模型，setValuesForKeysWithDictionary不好使
 应用场景：简单的字典转模型 ---> 框架（MJExtension）
 
 */

 /*常规赋值*/
void normalSetValue() {
    LZPerson *person = [[LZPerson alloc] init];
   
    person.name = @"李哲";
    person.age = 18;
    
    NSLog(@"%@ %zd", person.name, person.age);
}
 /* 利用KVC简单赋值 */
void kvcSetValue() {
     LZPerson *person = [[LZPerson alloc] init];
    
    [person setValue:@"LZ" forKey:@"name"];
    [person setValue:@"18" forKey:@"age"];
    [person setValue:@"20" forKey:@"money"]; // 自动类型转换
    
    NSLog(@"%@ %zd  %.2f", person.name, person.age, person.money);
}

void kvcValue() {
    LZPerson *person = [[LZPerson alloc] init];
    person.dog = [LZDog new];
    person.dog.name = @"糖宝";
    

    [person.dog setValue:@"小花" forKey:@"name"];
//    [person.dog setValue:@"小花" forKeyPath:@"name"];
    [person setValue:@"乐乐" forKeyPath:@"dog.name"];
    
    NSLog(@"%@", person.dog.name);
    
}

// 利用KVC修改类的私有成员变量（UIPageControl）
void kvcValue2() {
    LZPerson *person = [[LZPerson alloc] init];
//    person->_height
    // 利用KVC修改类的私有成员变量
    [person setValue:@"1.8" forKeyPath:@"_height"]; // 下划线不写也可以
    
    [person printHeight];
}

// 字典转模型(注意：字典中的key值不能多于模型的属性值)
void kvcValue3 () {
    NSDictionary *dict = @{
                           @"name":@"李哲",
                           @"money":@100.0,
                           @"dog":@{
                                   @"name":@"糖宝",
                                   @"price":@10000.0
                                   },
                           @"books":@[
                                   @{@"name":@"快速开发", @"price":@199},
                                   @{@"name":@"快开发", @"price":@1999},
                                   @{@"name":@"快速开", @"price":@1999},
                                   ]
                           };
    LZPerson *person = [[LZPerson alloc] initWithDict:dict];
    NSLog(@"%@", person.dog.class);
    NSLog(@"%@", [person description]);
}

// 取值操作
void getValue() {
    LZPerson *person = [[LZPerson alloc] init];
    person.name = @"李哲";
    person.money = 229988;
    
    // 利用KVC取值
    NSLog(@"name === %@   moneyd ==== %.2f", [person valueForKeyPath:@"name"], [[person valueForKey:@"money"] floatValue]);
}

// 模型转字典
void modelTurnDict() {
    LZPerson *person = [[LZPerson alloc] init];
    person.name = @"李哲";
    person.money = 23847565;
    
    NSDictionary *dict = [person dictionaryWithValuesForKeys:@[@"name", @"money"]];
    NSLog(@"dict ==== %@", dict);
}

// 取出数组中所有对象的某个属性值
void getModelValueInArray() {
    LZPerson *person1 = [[LZPerson alloc] init];
    person1.name = @"李哲";
    person1.money = 1233445;
    
    LZPerson *person2 = [[LZPerson alloc] init];
    person2.name = @"汪大强";
    person2.money = 3344556;
    
    LZPerson *person3 = [[LZPerson alloc] init];
    person3.name = @"lz";
    person3.money = 3543565;
    
    NSArray *allPerson = @[person1, person2, person3];
    
    NSArray *allPersonName = [allPerson valueForKeyPath:@"name"];
    NSLog(@"allpersonname === %@", allPersonName);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 常规赋值
        //normalSetValue();
        // KVC 赋值
        //kvcSetValue();
        // 综合赋值
        //kvcValue();
        
//        kvcValue2();
        
        // 字典转模型
//        kvcValue3();
        
        // 取值
        getValue();
        
        // 模型转字典
        modelTurnDict();
        
       
        
    }
    return 0;
}


