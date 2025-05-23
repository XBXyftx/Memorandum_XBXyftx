备忘录作品简介

项目名称：Memorandum_XBXyftx（备忘录）

项目作者：薛博璇

项目开源地址：https://github.com/XBXyftx/Memorandum_XBXyftx.git

项目简介：Memorandum_XBXyftx是一款基于HarmonyOS（鸿蒙操作系统）开发的应用程序，旨在为用户提供一个便捷、高效的日常任务管理和提醒工具。通过简洁直观的用户界面和强大的功能，备忘录帮助用户记录、跟踪和完成日常生活中的各种任务和事件。

主要功能:

1.事件记录与管理：用户可以创建、编辑和删除事件，包括作业、会议、提醒等。支持为每个事件添加详细的描述和指定时间戳，如图一所示。

![image](https://github.com/user-attachments/assets/8ee15238-b400-4fb1-859d-48f50e9ae416)

图 1 事件详情页

2.任务完成状态跟踪：用户可以标记事件为完成或未完成，方便跟踪任务进度，如图2所示。应用提供快速切换任务完成状态的功能，如图三所示。

![image](https://github.com/user-attachments/assets/ea417fea-afef-4040-a96f-59c27af487eb)

图 2 事件管理页面


![image](https://github.com/user-attachments/assets/46dac1dd-2801-45e4-9607-2d0c6f381bbe)

图 3 事件快速切换状态功能

3.时间管理：内置日期选择器，允许用户为事件指定具体的时间，如图4所示。支持将选择的时间转换为时间戳字符串，便于持久化存储和排序。

![image](https://github.com/user-attachments/assets/65cc38a2-bf78-4aaf-9b45-40b8d26e01b0)

图 4 日期选择器

4.事件排序与筛选：根据事件的时间戳进行排序，确保用户可以按时间顺序查看事件。未指定时间的事件将被排序在有指定时间的事件之后，如图2所示。

5.数据持久化：

应用使用JSON格式持久化存储事件列表，确保用户数据不会丢失。支持从存储中读取和解析JSON数据，实现数据的快速恢复。

6.界面友好：

应用界面简洁、直观，易于操作。对于已完成和未完成事件有显著的差异进行区分，会在已完成的事件上用红色横线划掉用于表示已完成，如图2所示。

项目结构：

本项目是基于AppStorage应用全局的UI状态存储、PersistentStorage持久化存储UI状态以及相关组件状态管理修饰器进行开发。利用PersistentStorage持久化存储json格式的字符串来实现备忘录事件数据的持久化存储。

本项目在鸿蒙应用项目结构框架的基础上增加了module和util文件夹，如图五所示。

![image](https://github.com/user-attachments/assets/007bda80-881f-4af3-9dd1-f53691ca991b)

图 5 项目结构示意图

module中存放了各个页面的核心功能组件，像是在主页中的待办事项列表，事件详情页的内容展示栏，新建事件的输入框时间选择器等模块。

util文件夹中主要存放的是工具接口和工具函数以及初始化测试用例数据。主要分为两类，一类是针对于代办事件对象Event的工具函数，另一类是对Date对象进行转化处理的工具函数。

对于Event对象的处理主要包含三种，首先是eventList的存储，由于当下V1版的持久化存储并不支持探测对象数组内部发生的改变，所以我采用将对象数组转化为json格式的字符串来进行持久化存储，读取时再转化为对象数组进行使用。其次是对eventList对象数组的常规操作，添加事件、删除事件、查找已完成事件以及查找未完成事件函数。最后就是针对某个Event对象修改完成状态的函数。

其中在解析json字符串时要用try包裹抛出异常，防止程序因解析失败而崩溃闪退。

针对于date对象的处理则较为简单，仅需将传入的date对象转化为“XXXX年XX月XX日”的格式返回即可，同时还要注意在存储和更新date对象时要将其转化为时间戳字符串进行存储，以免持久化失败。

在初始化页面数据以及跳转后的页面刷新功能使用了onPageShow，aboutToAppear等生命周期函数来进行实现，核心组件间的通讯则使用@Link，@State等装饰器来实现，同时也用到了@Watch来监听变化的发生。

未来与展望：
未来我会继续拓展事件分类，多端互联，云同步等功能，逐步完善这个应用。
