//
//  main.m
//  MVVMDemo
//
//  Created by evol on 2018/11/14.
//  Copyright © 2018 evol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


//#define MAX 1000000
//int arcs[10][10];//邻接矩阵
//int D[10];//保存最短路径长度
//int p[10][10];//路径
//int final[10];//若final[i] = 1则说明 顶点vi已在集合S中
//int n = 0;//顶点个数
//int v0 = 0;//源点
//int v,w;
//void ShortestPath_DIJ()
//{
//    for (v = 0; v < n; v++) //循环 初始化
//    {
//        final[v] = 0; D[v] = arcs[v0][v];  /** D[10]保存了 v0 到所有点的距离，如果b没有连线就表示无穷大 > MAX */
//        if (D[v] < MAX) {p[v][v0] = 1; p[v][v] = 1;} /** 如果d[v]<max 说明两点是连线 也就是 */
//
//        for (w = 0; w < n; w++) p[v][w] = 0;//设空路径
//    }
//    D[v0] = 0; final[v0]=0; //初始化 v0顶点属于集合S
//    //开始主循环 每次求得v0到某个顶点v的最短路径 并加v到集合S中
//    for (int i = 1; i < n; i++)
//    {
//        int min = MAX;
//        for (w = 0; w < n; w++) // 查找不在S集合 并且最小的点
//        {
//            //我认为的核心过程--选点
//            if (!final[w]) //如果w顶点在V-S中
//            {
//                //这个过程最终选出的点 应该是选出当前V-S中与S有关联边
//                //且权值最小的顶点 书上描述为 当前离V0最近的点
//                if (D[w] < min) {v = w; min = D[w];}
//            }
//        }
//        /** 遍历完成后 v为最小距离的那个点index min为最短距离  第一次遍历*/
//        final[v] = 1; //选出该点后加入到合集S中
//        for (w = 0; w < n; w++)//更新当前最短路径和距离
//        {
//            /*在此循环中 v为当前刚选入集合S中的点
//             则以点V为中间点 考察 d0v+dvw 是否小于 D[w] 如果小于 则更新
//             比如加进点 3 则若要考察 D[5] 是否要更新 就 判断 d(v0-v3) + d(v3-v5) 的和是否小于D[5]
//             arcs[v][w] 是点v 到 遍历的该点的距离
//             */
//            if (!final[w] && (min+arcs[v][w]<D[w]))
//            {
//                D[w] = min + arcs[v][w];
//                // p[w] = p[v];
//                p[w][w] = 1; //p[w] = p[v] +　[w]
//            }
//        }
//    }
//}
