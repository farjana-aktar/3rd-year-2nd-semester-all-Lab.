#include<bits/stdc++.h>
#include<graphics.h>

using namespace std;

int main()
{
    int gd=DETECT, gm;
    initgraph(&gd, &gm, "");

    setcolor(GREEN);
    rectangle(50,50,350,230);
    setfillstyle(SOLID_FILL, GREEN);
    floodfill(51,51, GREEN);

    setcolor(RED);
    circle(200,140,60);
    setfillstyle(SOLID_FILL, RED);
    floodfill(201,141, RED);

    setcolor(WHITE);
    rectangle(40,40,50,430);
    setfillstyle(SOLID_FILL, WHITE);
    floodfill(41,41, WHITE);

    getchar();
    closegraph();
    return 0;
}
