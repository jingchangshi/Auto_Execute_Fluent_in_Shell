# 使用Shell脚本和Fluent脚本自动化工作

## 说明

+ `Fluent`软件可以记录软件操作过程，写入`Journal`文件。这个特性可以用来实现宏操作。
+ `Shell`脚本可以将`Fluent`作为一个命令执行，加上命令行参数即可自动化执行某些操作。
+ 现在常用这种方式重复导出`Fluent`中的某些数据至文件。

## 应用实例

`Fluent`运行过程中似乎不会计算Q判据并存储该变量在数据文件中。后期我们想得到每个`dat`文件中的Q判据数据，并存入文件，以便对一系列Q判据文件作`POD`分析。当然，这要求所有的`dat`文件以相同的格式命名。

执行步骤如下
+ 图形化打开`Fluent`软件，打开`Write to journal`
+ 完整执行一遍计算并导出Q判据的过程
+ 通过菜单栏退出`Fluent`
+ 此时得到`journal`文件，记录所需`Fluent`的操作
+ 编写`Shell`脚本文件，迭代所有的`dat`文件，重复执行`journal`文件里的操作
+ 得到所需的一系列Q判据数据文件

对`Fluent`数据文件的说明
+ `cas`文件命名为`roundjet.cas`
+ `dat`文件命名格式为`roundjet-0.0XXXXX.dat`
+ `X`代表阿拉伯数字`0-9`
+ 每个`dat`文件之间间隔`10`，即第`1`个文件是`15000`，第`2`个文件是`15010`

## 代码

共有两个文件
+ `run.jou`是`Fluent`的`journal`文件，记录了`Fluent`操作
+ `run.sh`是`Shell`脚本文件，自动化替换需要操作的`dat`文件以及输出文件名
+ 见[Github](https://github.com/desperadoshi/Auto_Execute_Fluent_in_Shell)

