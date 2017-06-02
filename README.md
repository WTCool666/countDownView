Count Down View
====
# introduce
####a cool custom count down view<br>
![null](https://github.com/WTCool666/countDownView/blob/master/video.gif)<br>

# Usage 
#### first step
```Objective-C
#import "CountDownView.h"
```

#### the secend step
```Objective-C
/**
if your Main.Storyboard has redView,You can do the following initialization
*/
CountDownView * countDownView=[[CountDownView alloc] initWithFrame:CGRectMake(0, 0, self.redView.bounds.size.width, self.redView.bounds.size.height)];
```

#### the third step
```Objective-C
/**
You must give maxMinute assignment，Otherwise the calibration will not display
*/
countDownView.maxMinute=60;
```

#### the fourth step
```Objective-C
/**
You must also give currentMinute assignment, otherwise also scale will not display
*/
countDownView.currentMinute=55;
```

#### end
```Objective-C
/**
add countDownView into redView
*/
[self.redView addSubview:countDownView];
```
