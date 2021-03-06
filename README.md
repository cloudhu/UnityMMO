# UnityMMO
很多东西不好在工作项目上尝试(比如 ECS),所以就有了本项目,我打算利用业余时间从头制作一个 3D-MMO 游戏,大部分功能虽然都多少接触过,但我想换个做法,不然就不好玩了.前端的玩法系统用 c#,界面用 lua 开发.后端用 skynet.  
详细的设计和进度见：[Wiki](https://github.com/liuhaopen/UnityMMO/wiki/%E5%BC%80%E5%8F%91%E7%AC%94%E8%AE%B0 "Wiki")  

# Usage
克隆本项目: git clone https://github.com/liuhaopen/UnityMMO.git --recurse  
前端:  
下载下来后整个目录就是 Unity 的项目目录,用 Unity 打开,运行 main.unity 场景即可进入游戏的登录界面  
注:由于游戏资源过大且经常变更(每个版本的资源都会保存在 .git 文件夹里, clone 就要好久了),所以放到另外的项目管理,可在 [UnityMMO-Resource](https://github.com/liuhaopen/UnityMMO-Resource/tree/master/Assets/AssetBundleRes "UnityMMO-Resource") 下载里面的文件并把 Assets/AssetBundleRes 及其 meta 文件复制到本项目的 Assets 目录里(注:有些插件因为版权问题就没上传了,从其中的 download-page 见购买链接)  
后端:  
)安装虚拟机,我使用的是 CentOS7,然后设置整个项目目录为虚拟机的共享目录, cd到 Server 目录,先编译 skynet:[skynet 主页](https://github.com/cloudwu/skynet "skynet 主页")  
)在虚拟机安装 mysql 并导入 Server/data/ 里的两个数据库文件  
)运行: ./run.sh 跑起服务端  

# Status & Prerequisites
```
Unity version: 2019.1.4f1
Platforms    : 
client for Windows and Android(should also support iOS, but I have not tried);  
server only for Linux;
```

# Recent GIF
19.07.03：初步实现了自动寻路去找 npc 对话和打怪两种任务：    
![image](https://github.com/liuhaopen/ReadmeResources/blob/master/UnityMMO/auto_talk_and_fight.gif)     
19.07.10：增加一个副本场景：    
![image](https://github.com/liuhaopen/ReadmeResources/blob/master/UnityMMO/change_scene.gif)     
19.07.31：初步完成背包和 GM 系统      
19.08.11：初步完成基于 action 组件的技能系统,见 Server/lualib/Action及 FightMgr,Hurt 和 PickTarget.lua          
19.08.13：完成复活流程      