#include<bits/stdc++.h>
#include<graphics.h>
#define M_PI 3.1415962

using namespace std;

void koch_curve(int x1, int y1, int x2, int y2, int iteration)
{
    float angle = (60*M_PI)/180;

    int x3 = (2*x1 + x2)/3;
    int y3 = (2*y1 + y2)/3;

    int x4 = (x1 + 2*x2)/3;
    int y4 = (y1 + 2*y2)/3;

    int x = x3 + (x4-x3)*cos(angle) + (y4-y3)*sin(angle);
    int y = y3 - (x4-x3)*sin(angle) + (y4-y3)*cos(angle);

    if(iteration>0)
    {
        koch_curve(x1, y1, x3, y3, iteration-1);
        koch_curve(x3, y3, x, y, iteration-1);
        koch_curve(x, y, x4, y4, iteration-1);
        koch_curve(x4, y4, x2, y2, iteration-1);
    }
    else
    {
        line(x1, y1, x3, y3);
        line(x3, y3, x, y);
        line(x, y, x4, y4);
        line(x4, y4, x2, y2);
    }
    delay(1);
}

int main()
{
    int gd = DETECT, gm;
    initgraph(&gd, &gm, "");

    int iteration;
    cout << "Enter the number of iteration : ";
    cin >> iteration;

    int x1 = 100, y1 = 200, x2 = 400, y2 = 200, x3 = 250, y3 = 450;

    cleardevice();
    setcolor(YELLOW);

    koch_curve(x1, y1, x2, y2, iteration);
    koch_curve(x2, y2, x3, y3, iteration);
    koch_curve(x3, y3, x1, y1, iteration);

    getch();
    closegraph();
    return 0;
}
