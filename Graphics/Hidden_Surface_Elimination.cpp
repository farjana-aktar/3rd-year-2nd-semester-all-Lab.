#include<bits/stdc++.h>
#include<graphics.h>

using namespace std;

void circle()
{
    setcolor(RED);
    circle(100, 100, 80);
    setfillstyle(SOLID_FILL, RED);
    floodfill(100, 100, RED);
}

void rectangle()
{
    setcolor(GREEN);
    rectangle(100, 100, 250, 250);
    setfillstyle(SOLID_FILL, GREEN);
    floodfill(101,101, GREEN);
}

void triangle()
{
    setcolor(BLUE);
    line(120, 250, 250, 120);
    line(120, 250, 300, 300);
    line(250, 120, 300, 300);

    setfillstyle(SOLID_FILL, BLUE);
    floodfill(260, 260, BLUE);
}

int main()
{
    int gd = DETECT, gm;
    initgraph(&gd, &gm, "");


    string sequence;
    cin >> sequence;

    for(auto x : sequence)
    {
        if(x == 'c') circle();
        else if(x == 'r') rectangle();
        else triangle();
    }

    getch();
    closegraph();
    return 0;
}
