//
//  SQLite-Bridge.h
//  multV
//
//  Created by s20151104683 on 17/6/22.
//  Copyright © 2017年 s20151104683. All rights reserved.
//

#ifndef SQLite_Bridge_h
#define SQLite_Bridge_h
#import "sqlite.h"
#import "ViewController.h"

@interface ViewController ()
{
    sqlite3 *_sqldb;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self OpenDb];
    [self createTable];
    [self insertData];
    [self FindData];
}


//打开数据库

-(void)OpenDb{
    
    NSArray *arrs= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //创建数据库，如果数据库存在就直接打开，不存在就创建打开
    NSString *path=[arrs lastObject] ;
    NSString *documentpath= [path stringByAppendingPathComponent:@"sql.db"];
    int reslut= sqlite3_open([documentpath UTF8String], &_sqldb);
    if(reslut==SQLITE_OK){
        NSLog(@"数据库已被打开");
    }
    
}
//通过数据库实例创建表
-(void)createTable{
    //不带参数的sql语句
    const char* sql="create table if not exists t_person (id integer primary key autoincrement,name text,age integer);";
    char *error;
    //sqlite3_exec可以执行一切不带参数的SQL语句。如果是带参数最好不用，防止SQL注入漏洞攻击
    int resutl= sqlite3_exec(_sqldb, sql, NULL, NULL, &error);
    if(resutl==SQLITE_OK){
        NSLog(@"创建表成功");
    }
    else{
        NSLog(@"创建表失败－－》%s",error);
    }
}

//插入数据
-(void)insertData{
    //带参数的SQL语句 "?"是带参数的占位符
    const char * sql="insert into t_person(name,age) values(?,?);";
    sqlite3_stmt *stmp;
    //在执行SQL语句之前检查SQL语句语法,-1代表字符串的长度
    int result= sqlite3_prepare_v2(_sqldb, sql, -1, &stmp, NULL);
    if(result==SQLITE_OK){
        NSLog(@"插入SQL语句语法没有问题");
        //绑定参数,插入的参数的下标是从1开始
        sqlite3_bind_text(stmp, 1, "gcb", -1, NULL);
        sqlite3_bind_int(stmp, 2, 12);
        
        //执行参参数的SQL语句，不能有exec
        int result=sqlite3_step(stmp);
        //插入进行判断,要用sqLite_Done来判断
        if(result==SQLITE_DONE){
            NSLog(@"插入成功");
        }
        else{
            NSLog(@"插入失败") ;
        }
        
    }
    else{
        NSLog(@"插入SQL语句有问题");
    }
}

-(void)FindData{
    char *sql="select id,name,age from t_person";
    //查询做好用step执行
    sqlite3_stmt *stmt;
    //检查SQL语句的语法问题
    int result= sqlite3_prepare_v2(_sqldb, sql, -1, &stmt, NULL);
    if(result==SQLITE_OK){
        while (sqlite3_step(stmt)==SQLITE_ROW) {
            //查询的列是0开始 插入的列从1开始
            //  int xh＝sqlite3_column_int(stmt, 0);
            int xh=sqlite3_column_int(stmt, 0);
            char * name=(char *)sqlite3_column_text(stmt, 1);
            int age=sqlite3_column_int(stmt, 2);
            NSLog(@"xh=%i-->name=%s-->age=%i",xh,name,age);
            
            
            
        }
    }
    else{
        NSLog(@"查询SQL语法有误");
    }
    
}


#endif /* SQLite_Bridge_h */
